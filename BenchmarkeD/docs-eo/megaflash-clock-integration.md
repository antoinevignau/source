# BenchmarkeD Clock Integration — MegaFlash Support

Review and implementation plan for high-resolution benchmark timing on Apple IIc systems with MegaFlash.

## Purpose

BenchmarkeD measures disk throughput (KB/s) by dividing transfer size by elapsed time. **Clock integration** here means **elapsed-time measurement**, not NTP sync or wall-clock display.

## Current Architecture (v2)

| Build | Target | High-res timing | Fallback |
|-------|--------|-----------------|----------|
| `BenchmarkeD.s` | Apple IIgs, GS/OS | Brutal Timer slot card (`$C080`–`$C08F`) | `_ReadTimeHex` / `_ConvSeconds` (1 s) |
| `8enchmarkeD.s` | 8-bit ProDOS (`BemarkeD.System`) | Brutal Timer | ProDOS `GET_TIME` (broken delta path) |
| `debug.s` | 8-bit debug variant | Same as above | Same |

### Brutal Timer path

1. User sets slot 1–7 via menu (0 = disabled).
2. `printDATEFROM` resets and starts Timer 2 at ~1 MHz (`FREQ_A2F0`).
3. `printDATETO` stops Timer 2.
4. `calcSPEED`: `seconds = valTIMER / 1_023_000`.

### Software clock fallback

16-bit GS/OS path works at 1-second resolution. The 8-bit path had `csNOBT` zeroing `seconds` with the ProDOS delta logic commented out — effectively broken without Brutal Timer.

## MegaFlash — Two Different “Clocks”

MegaFlash (Apple IIc / IIc+ internal expansion) is **not** a Brutal Timer replacement at the ProDOS RTC layer alone.

### 1. ProDOS real-time clock

- Firmware installs a clock driver at `$BF06` when online.
- Updates `$BF90`–`$BF93` (classic) or `$BF8E`–`$BF93` (ProDOS 2.5+).
- ProDOS 2.5 adds **4 ms** resolution in `$BF8E`.
- NTP keeps wall time accurate; suitable for display, marginal for fast benchmarks.

### 2. High-resolution Pico timers (benchmark-grade)

| Command | Value | Purpose |
|---------|-------|---------|
| `CMD_RESETTIMER_US` | `$40` | Start µs timer |
| `CMD_GETTIMER_US` | `$41` | Read elapsed µs (32-bit) |
| `CMD_RESETTIMER_MS` | `$42` | Start ms timer |
| `CMD_GETTIMER_MS` | `$43` | Read elapsed ms |

I/O at fixed **`$C0C0`–`$C0C3`** (`cmdreg` / `paramreg`). MegaFlash’s own `slotrom.s` speedtest uses the µs timer for block-read profiling.

**This API is the correct MegaFlash equivalent of Brutal Timer.**

## Platform Fit

| | Brutal Timer | MegaFlash |
|--|--------------|-----------|
| Hardware | II slot card | IIc/IIc+ internal |
| I/O | `$C080` + slot×16 | `$C0C0`–`$C0C3` |
| Resolution | ~1 µs @ 1 MHz T2 | ~1 µs (Pico) |
| `BenchmarkeD.s` (IIgs) | Yes | No hardware |

MegaFlash support targets **`8enchmarkeD.s`** and **`debug.s`** only.

## Implementation Design

### Timer modes

```
TIMER_NONE      = 0   ; ProDOS software clock
TIMER_BRUTAL    = 1   ; Brutal Timer (theSLOT 1–7)
TIMER_MEGAFLASH = 2   ; MegaFlash µs timer (auto-detect)
```

Priority: **Brutal Timer slot overrides MegaFlash** when user sets a non-zero slot.

### New modules

- `MegaFlashTimer.equ` — I/O addresses, commands, mode constants, `REF_1US`
- `MegaFlashTimer8.s` — detect, `mfExecute`, `resetMFTimer`, `readMFTimer`, `initMegaFlash`

### Integration points

| Routine | MegaFlash behaviour |
|---------|---------------------|
| Startup | `initMegaFlash` — signature detect via `CMD_GETDEVINFO` |
| `printDATEFROM` | `CMD_RESETTIMER_US` when mode = MegaFlash |
| `printDATETO` | `CMD_GETTIMER_US` → `valTIMER` |
| `calcSPEED` | `valTIMER / 1_000_000` |
| `csNOBT` | Fixed ProDOS delta; 6-byte snapshot on ProDOS 2.5+ |

### ProDOS fallback fix

- Snapshot full time after `GET_TIME` (`$BF8E`–`$BF93` on ProDOS ≥ `$25`).
- Compute elapsed time in 4 ms ticks or seconds; minimum 1 second if zero to avoid divide-by-zero.

## Design Notes

- **Overhead**: MegaFlash timer read involves Pico command latency; negligible for multi-second disk tests.
- **Interrupt immunity**: Pico timers run outside 6502 interrupt masking — advantage over GS/OS toolbox timing.
- **Counter width**: 32-bit µs counter wraps after ~71 minutes — sufficient for all current tests.
- **IIgs build**: `BenchmarkeD.s` unchanged unless an IIc port is added.

## References

- MegaFlash API: `MegaFlash/docs/MegaFlash-AppleII-API.md` §3.3
- Brutal Timer protocol: `brutaltimer/README.MD`
- MegaFlash clock driver: `MegaFlash/firmware/megaflash.s` (`clockdriverimpl`)

## Related Files

| File | Role |
|------|------|
| `MegaFlashTimer.equ` | Shared equates |
| `MegaFlashTimer8.s` | 8-bit driver |
| `8enchmarkeD.s` | Primary integration |
| `debug.s` | Debug variant integration |
| `docs/SESSION_LOG.md` | Ongoing change log |
