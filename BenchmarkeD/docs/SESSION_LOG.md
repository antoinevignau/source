# BenchmarkeD Session Log

Chronological record of development sessions and changes.

---

## 2026-06-23 — MegaFlash timer integration

### Context

Review of clock integration in BenchmarkeD identified that MegaFlash (Apple IIc/IIc+) exposes high-resolution Pico timers (`CMD_RESETTIMER_US` / `CMD_GETTIMER_US` at `$C0C0`) suitable for benchmark timing, distinct from its ProDOS RTC/NTP wall clock.

Documentation added under `docs-eo/megaflash-clock-integration.md`.

### Changes

| File | Change |
|------|--------|
| `docs-eo/megaflash-clock-integration.md` | **New** — architecture review and MegaFlash integration design |
| `docs/SESSION_LOG.md` | **New** — this session log |
| `MegaFlashTimer.equ` | **New** — I/O equates, command codes, timer mode constants |
| `MegaFlashTimer8.s` | **New** — detect, init, reset/read µs timer |
| `8enchmarkeD.s` | Timer mode dispatch, MegaFlash auto-detect, ProDOS fallback fix, v2.1 intro |
| `debug.s` | Same integration as `8enchmarkeD.s` |

### Behaviour

- At cold start, MegaFlash is detected via `CMD_GETDEVINFO` signature (`$88`, `$74`).
- When detected and Brutal Timer slot is 0, `TIMER_MEGAFLASH` is selected automatically.
- User Brutal Timer slot (menu 4) overrides MegaFlash when non-zero.
- `calcSPEED` uses `/ 1_000_000` for MegaFlash µs timers, `/ 1_023_000` for Brutal Timer.
- ProDOS software-clock fallback computes a real delta (ProDOS 2.5+: 4 ms ticks; classic: second-of-day).
- Menu intro shows `M` for MegaFlash timer or slot digit for Brutal Timer.

### Not changed

- `BenchmarkeD.s` (IIgs GS/OS) — no MegaFlash hardware on IIgs.

---

## 2026-06-23 — Build verification

Built all targets with `merlin32` v1.1.10 (cloned to `~/Documents/GitHub/merlin32`, macro library `Library/`):

| Command | Output | Result |
|---------|--------|--------|
| `merlin32 -V Library 8enchmarkeD.s` | `BemarkeD.System` | OK |
| `merlin32 -V Library debug.s` | `Debug.System` | OK |
| `merlin32 -V Library make_BenchmarkeD.s` | `BenchmarkeD` | OK |

---

## 2026-06-23 — v2.1 distribution disks

Created `v2.1/` from `v2.0/` ProDOS images, updated with rebuilt binaries via Cadius `REPLACEFILE`:

| Image | Updated files |
|-------|----------------|
| `v2.1/BenchmarkeD_800K.po` | `BenchmarkeD` (S16+), `BemarkeD.System`, `Debug.System` |
| `v2.1/BenchmarkeD_32M.po` | `BenchmarkeD` (S16+), `BEMARKED.SYS`, `Debug.System` |

Also corrected `_FileInformation.txt` types (S16 `$B3`, SYS `$FF`, aux `$2000`).
