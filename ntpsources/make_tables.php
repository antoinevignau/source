<?php

/* this generetes the data tables used by NinjaTracker+ */

function output_values($label, $arr, $prefix = 'dw', $bounds = 16, $padding = 24)
{
    $str = str_pad($label, $padding) . '= *'."\n";
    $i = 0;
    foreach($arr as $e)
    {
        if($i === $bounds)
        {
            $str .= "\n";
            $i = 0;
        }
        
        if($i === 0)
        {
            $str .= str_repeat(' ', $padding).$prefix.' ';
        }
        else
        {
            $str .= ',';
        }

        $str .= $e;
        $i++;
    }
    return $str;
}



/* volume conversion table  ------------------------------------------------------------------- */

$volumes = [];
for($i = 0; $i <= 64; $i++)
{
    $volumes[] = min(255, $i * 4);
}
$volumes[] = 255;

echo output_values('volume_lookup', $volumes)."\n\n";




/* Finetune Table ----------------------------------------------------------------------------
 *
 * Protracker MODs store durations (aka periods).
 * Note sliding modify the duration (add/subtract).
 * For the tracker player on the GS, we want one table of words so that we can map each duration to an ensoniq freq hi/lo setting.
 *
 * The formula to convert an Amiga duration into ensoniq freq hi/lo registers is:
 * 
 * Amiga:
 * The sample rate in Hertz can calculated as:
 *     7093789.2 / (period * 2)    for a PAL Amiga
 *     7159090.5 / (period * 2)    for a NTSC Amiga
 * The period is what is stored in the MOD for the note.
 * Taken from here taken from ftp://ftp.modland.com/pub/documents/format_documentation/Protracker%202.3A%20&%20miscellaneous%20info%20(.mod).txt
 * 
 * IIGS:
 * The formula for IIGS sound from IIGS Technote 37: http://www.1000bit.it/support/manuali/apple/technotes/iigs/tn.iigs.037.html
 *     freqOffset = ((32*Sample rate in Hertz)/1645)
 *
 * Example:
 * period = 214;
 * amiga_freq = 7093789.2 / (period * 2);
 * gs_frequency_old = floor(32 / 1645 * (1 / (($period - 2) * 2.79365E-07)));  // Ninjatracker
 * gs_frequence_new = round((32 * amiga_freq) / 1645);                         // Ninjatracker+
 *
 *
 * These are original Protracker values for the duration and every possible finetune.
 * Taken from the file pt.c out of http://ftp.kameli.net/pub/fit/once_upon/once_upon-src.zip
*/
$pt_durations_finetune = [
    [   // tuning 0
        1712,1616,1525,1440,1357,1281,1209,1141,1077,1017, 961, 907, /* octave 0 */
         856, 808, 762, 720, 678, 640, 604, 570, 538, 508, 480, 453, /* octave 1 */
         428, 404, 381, 360, 339, 320, 302, 285, 269, 254, 240, 226, /* octave 2 */
         214, 202, 190, 180, 170, 160, 151, 143, 135, 127, 120, 113, /* octave 3 */
         107, 101,  95,  90,  85,  80,  76,  71,  67,  64,  60,  57, /* octave 4 */
          53,  50,  47,  45,  42,  40,  37,  35,  33,  31,  30,  28, /* octave 5 */
    ],
    
    [   // tuning 1
        1700,1604,1514,1429,1349,1273,1202,1134,1070,1010,954,900,
        850,802,757,715,674,637,601,567,535,505,477,450,
        425,401,379,357,337,318,300,284,268,253,239,225,
        213,201,189,179,169,159,150,142,134,126,119,113,
        106,100,94,89,84,79,75,70,66,63,59,56,
        53,50,47,44,42,39,37,35,33,31,29,28,28
    ],
    
    [   // tuning 2
        1688,1593,1503,1419,1339,1264,1193,1126,1063,1003,947,894,
        844,796,752,709,670,632,597,563,532,502,474,447,
        422,398,376,355,335,316,298,282,266,251,237,224,
        211,199,188,177,167,158,149,141,133,125,118,112,
        106,100,94,88,83,79,74,70,66,62,59,55,
        53,50,47,44,41,39,37,35,33,31,29,28,28
    ],
    
    [   // tuning 3
        1676,1582,1493,1409,1330,1255,1185,1118,1055,996,940,887,
        838,791,746,704,665,628,592,559,528,498,470,444,
        419,395,373,352,332,314,296,280,264,249,235,222,
        209,198,187,176,166,157,148,140,132,125,118,111,
        105,99,93,88,83,78,74,70,66,62,59,55,
        52,49,46,44,41,39,37,34,32,31,29,27,27
    ],
    
    [   // tuning 4
        1664,1570,1482,1399,1320,1246,1176,1110,1048,989,933,881,
        832,785,741,699,660,623,588,555,524,495,467,441,
        416,392,370,350,330,312,294,278,262,247,233,220,
        208,196,185,175,165,156,147,139,131,124,117,110,
        104,98,92,87,82,78,73,69,65,62,58,55,
        52,49,46,43,41,39,36,34,32,31,29,27,27
    ],
    
    [   // tuning 5
        1652,1559,1471,1389,1311,1237,1168,1102,1040,982,927,875,
        826,779,736,694,655,619,584,551,520,491,463,437,
        413,390,368,347,328,309,292,276,260,245,232,219,
        206,195,184,174,164,155,146,138,130,123,116,109,
        103,97,92,87,82,77,73,69,65,61,58,54,
        51,48,46,43,41,38,36,34,32,30,29,27,27
    ],
    
    [   // tuning 6
        1640,1548,1461,1379,1301,1228,1159,1094,1033,975,920,868,
        820,774,730,689,651,614,580,547,516,487,460,434,
        410,387,365,345,325,307,290,274,258,244,230,217,
        205,193,183,172,163,154,145,137,129,122,115,109,
        102,96,91,86,81,77,72,68,64,61,57,54,
        51,48,45,43,40,38,36,34,32,30,28,27,27
    ],
    
    [   // tuning 7
        1628,1536,1450,1368,1292,1219,1151,1086,1025,968,913,862,
        814,768,725,684,646,610,575,543,513,484,457,431,
        407,384,363,342,323,305,288,272,256,242,228,216,
        204,192,181,171,161,152,144,136,128,121,114,108,
        102,96,90,85,80,76,72,68,64,60,57,54,
        51,48,45,42,40,38,36,34,32,30,28,27,27
    ],
               
    [   // tuning -8
        1814,1712,1616,1525,1439,1358,1282,1210,1142,1078,1018,960,
        907,856,808,762,720,678,640,604,570,538,508,480,
        453,428,404,381,360,339,320,302,285,269,254,240,
        226,214,202,190,180,170,160,151,143,135,127,120,
        113,106,100,95,90,85,80,75,71,67,63,60,
        56,53,50,47,44,42,40,37,35,33,31,30,30
    ],
    
    [   // tuning -7
        1800,1699,1603,1513,1428,1348,1272,1201,1133,1070,1010,953,
        900,850,802,757,715,675,636,601,567,535,505,477,
        450,425,401,379,357,337,318,300,284,268,253,238,
        225,212,200,189,179,169,159,150,142,134,126,119,
        112,106,100,94,89,84,79,75,71,67,63,59,
        56,53,50,47,44,42,39,37,35,33,31,30,30
    ],
    
    [   // tuning -6
        1788,1687,1592,1503,1409,1339,1264,1193,1126,1063,1003,947,
        894,844,796,752,709,670,632,597,563,532,502,474,
        447,422,398,376,355,335,316,298,282,266,251,237,
        223,211,199,188,177,167,158,149,141,133,125,118,
        111,105,99,93,88,83,78,74,70,66,62,59,
        56,52,49,46,44,41,39,37,35,33,31,29,29
    ],
    
    [   // tuning -5
        1774,1674,1580,1491,1408,1328,1254,1184,1117,1054,995,939,
        887,838,791,746,704,665,628,592,559,528,498,470,
        444,419,395,373,352,332,314,296,280,264,249,235,
        222,209,198,187,176,166,157,148,140,132,125,118,
        111,104,98,93,88,83,78,74,69,66,62,58,
        56,52,49,46,44,41,39,37,34,33,31,29,29
    ],
    
    [   // tuning -4
        1762,1663,1569,1481,1398,1320,1245,1175,1109,1047,988,933,
        881,832,785,741,699,660,623,588,555,524,494,467,
        441,416,392,370,350,330,312,294,278,262,247,233,
        220,208,196,185,175,165,156,147,139,131,123,117,
        110,104,98,92,87,82,77,73,69,65,61,58,
        55,52,49,46,43,41,38,36,34,32,30,29,29
    ],
    
    [   // tuning -3
        1750,1651,1559,1471,1388,1311,1237,1167,1102,1040,982,927,
        875,826,779,736,694,655,619,584,551,520,491,463,
        437,413,390,368,347,328,309,292,276,260,245,232,
        219,206,195,184,174,164,155,146,138,130,123,116,
        109,103,97,92,87,82,77,73,69,65,61,58,
        55,51,48,46,43,41,38,36,34,32,30,29,29
    ],
               
    [   // tuning -2
        1736,1638,1546,1459,1377,1300,1227,1158,1093,1032,974,919,
        868,820,774,730,689,651,614,580,547,516,487,460,
        434,410,387,365,345,325,307,290,274,258,244,230,
        217,205,193,183,172,163,154,145,137,129,122,115,
        108,102,96,92,86,82,77,72,68,64,61,57,
        54,51,48,46,43,40,38,36,34,32,30,28,28
    ],
               
    [   // tuning -1
        1724,1627,1535,1449,1368,1291,1219,1150,1086,1025,967,913,
        862,814,768,725,684,646,610,575,543,513,484,457,
        431,407,384,363,342,323,305,288,272,256,242,228,
        216,203,192,181,171,161,152,144,136,128,121,114,
        108,102,96,91,85,81,76,72,68,64,60,57,
        54,51,48,45,42,40,38,36,34,32,30,28,28
    ],
];

/* find the highest and lowest duration */
$max_duration = 0;
$min_duration = 999999;
foreach($pt_durations_finetune as $octave)
{
    foreach($octave as $duration)
    {
        $max_duration = max($max_duration, $duration);
        $min_duration = min($min_duration, $duration);
    }
}

/* for every value of duration, calculate a value for the GS freq hi and lo DOC registers */
$frequencies = [];
for($duration = $max_duration; $duration >= $min_duration; $duration--)
{
    /* Ninjatracker */
    //$gs_frequency = floor(32 / 1645 * (1 / (($duration - 2) * 2.79365E-07)));
    /* Ninjatrackerplus */
    $amiga_freq = 7093789.2 / ($duration * 2);
    $gs_frequency = round((32 * $amiga_freq) / 1645);

    $durations[] = $duration;
    $frequencies[] = $gs_frequency;
}

echo str_pad('max_finetune_ptr', 24) . '= '.(count($frequencies) * 2 - 2)."\n";
echo output_values('freq_finetune', $frequencies)."\n\n";

/* for every finetuned set of octaves, find the duration of each note in the frequency table
so that we have, for every note, a pointer into the frequency table */

echo str_pad('note_freq_ptrs', 24) . '= *'."\n";
foreach($pt_durations_finetune as $finetune_index => $octave)
{
    $ptr_into_freq = [0]; /* note 0 is only a dummy */
    
    foreach($octave as $duration)
    {
        $pos = array_search($duration, $durations);
        if($pos === false)
        {
            die('Duration (period) not found: '.$duration);
        }

        $ptr = $pos * 2;
        $ptr_into_freq[] = $ptr;
    }
    
    $label = 'note_freq_ptrs_'.dechex($finetune_index);
    echo output_values($label, $ptr_into_freq)."\n";

    $labels[$finetune_index] = $label;
}
echo str_pad('max_freq_ptr', 24) . '= '.(count($ptr_into_freq) * 2 - 2)."\n";

echo str_pad('note_freq_ptrs_offset', 24) . '= *'."\n";
foreach($pt_durations_finetune as $finetune_index => $octave)
{
    echo str_repeat(' ', 24) . 'dw '.$labels[$finetune_index].'-note_freq_ptrs'."\n";
}
echo "\n";

/*
Nostalgia - The original Basic program from 1994

 1  REM Make Finetune Table for Soundsmith Player
 5  DIM A(3 * 12),B(3 * 12),C(3 * 12)
 7  PRINT  CHR$ (4)"opendeath": PRINT  CHR$ (4)"writedeath"
 10  DATA 858,808,762,720,678,640,604,570,538,508,480,453
 20  DATA 428,404,381,360,339,320,302,285,269,254,240,226
 30  DATA 214,202,190,180,170,160,151,143,135,127,120,113
 35  FOR I = 1 TO 36: READ A(I): NEXT 
 40 K = 1:D = A(1): PRINT " dw ";
 50 C = C + 1
 55  REM (D+4) oder (D-2)
 70 X =  INT (32 / 1645 * (1 / ((D + 4) * 2.79365E - 07))): PRINT X;: IF C < 12 THEN  PRINT ",";: GOTO 90
 80 C = 0: PRINT : PRINT " dw ";
 90  IF K < 37 THEN  IF D = A(K) THEN B(K) = D2:C(K) = X:K = K + 1
 100 D2 = D2 + 2:D = D - 1
 110  IF D > 90 THEN 50
 115 C = 12: FOR I = 1 TO 36:C = C + 1: IF C > 11 THEN C = 0: PRINT : PRINT " dw ";
 116  PRINT B(I);: IF C < 11 THEN  PRINT ",";
 117  NEXT 
 118 C = 12: FOR I = 1 TO 36:C = C + 1: IF C > 11 THEN C = 0: PRINT : PRINT " dw ";
 119  PRINT C(I);: IF C < 11 THEN  PRINT ",";
 120  NEXT 
 130  PRINT  CHR$ (4)"close"
*/


/* --------------------------------------------------------------------------------------------------------------------- */

/* waveforms for vibrato and tremolo */

$table_length = 2 * 64 * 16;
$offset_sine_tbl = 0;
$offset_ramp_tbl = $offset_sine_tbl + $table_length;
$offset_square_tbl = $offset_ramp_tbl + $table_length;
echo str_pad('waveforms', 24).'dw '.$offset_sine_tbl.','.$offset_ramp_tbl.','.$offset_square_tbl.','.$offset_square_tbl.' ;random=square in protracker!'."\n\n";

$max_x = 64;

/* sine waveforms for vibrato and tremolo */

echo str_pad('sine_tbl', 24).'= *'."\n";
for($amplitude = 0; $amplitude < 16; $amplitude++)
{
    $list = [];
    for($x = 0; $x < $max_x; $x++)
    {
        $y = 2 * ((int) round($amplitude * sin($x / $max_x * 2 * M_PI)));

        $word = ($y >= 0) ? $y : (65536 + $y);
        $word_str = $word < 10 ? $word : '$'.dechex($word);
        $list[] = $word_str;
    }
    
    echo str_repeat(' ', 24).'dw '.implode(',', $list)."\n";
}
echo "\n";

/* ramp down waveforms for vibrato and tremolo */

echo str_pad('ramp_tbl', 24).'= *'."\n";
for($amplitude = 0; $amplitude < 16; $amplitude++)
{
    $list = [];
    for($x = 0; $x < $max_x; $x++)
    {
        $y = 2 * (round($amplitude * ($max_x / 2 - $x) / ($max_x / 2)));

        $word = abs(($y >= 0) ? $y : (65536 + $y));
        $word_str = $word < 10 ? $word : '$'.dechex($word);
        $list[] = $word_str;
    }
    
    echo str_repeat(' ', 24).'dw '.implode(',', $list)."\n";
}
echo "\n";

/* square waveforms for vibrato and tremolo */

echo str_pad('square_tbl', 24).'= *'."\n";
for($amplitude = 0; $amplitude < 16; $amplitude++)
{
    $list = [];
    for($x = 0; $x < $max_x; $x++)
    {
        $y = 2 * $amplitude * ($x < ($max_x / 2) ? 1 : -1);

        $word = ($y >= 0) ? $y : (65536 + $y);
        $word_str = $word < 10 ? $word : '$'.dechex($word);
        $list[] = $word_str;
    }
    
    echo str_repeat(' ', 24).'dw '.implode(',', $list)."\n";
}
echo "\n";


/* --------------------------------------------------------------------------------------------------------------------- */


/* pattern break pointers */

$pointers = [];
for($i = 0; $i <= 255; $i++)
{
    $h = str_pad(dechex($i), 2, '0', STR_PAD_LEFT);
    $x = hexdec(substr($h,0,1));
    $y = hexdec(substr($h,1,1));

    if($x <= 6 && $y <= 9)
    {
        $p = $x * 10 + $y;
        if($x === 6 && $y >= 4)
        {
            $p = 0; /* only values from 00 to 63 needed */
        }
        $pointers[] = $p;
    }
    else
    {
        $pointers[] = 0;
    }
}

echo output_values('pattern_break_ptrs', $pointers, 'dfb')."\n\n";


/* --------------------------------------------------------------------------------------------------------------------- */

/* beats per minute
 *
 * The value of 125 means a 50 Hz interrupt.
 * The value of 150 means a 60 Hz interrupt.
 * 
 * According to the formula in the IIGS hardware reference:
 * output_freq = SR / (2 ^ (17 + RES)) * FHL
 * with: SR = 894886 Hz / (OSC + 2)
 * 
 * In our case, the interrupt uses a 256 byte wave, so RES = 0.
 * We have 32 oscillators enabled, so OSC = 32.
 * Our interrupt should be by default 50 Hz, so FHL = 249.
 * 
 * Now we need values for every parameter of the set speed command.
 */

$factor = 34 * 131072 / 894886; /* from the formula above */

$values = [];
for($bpm_value = 32; $bpm_value <= 255; $bpm_value++)
{
    $output_freq = $bpm_value * 50 / 125;

    $FHL = $factor * $output_freq;

    $values[] = round($FHL);
}

echo output_values('bpm_to_freq', $values)."\n\n";


/* --------------------------------------------------------------------------------------------------------------------- */

/* quick lookup tables for registers */

foreach([32 => 'freqhi', 64 => 'vol', 128 => 'ptr', 160 => 'ctl', 192 => 'siz'] as $start => $label_part)
{
    $values = [];
    for($i = 0; $i < 30; $i += 2)
    {
        $values[] = $start + $i;
    }

    echo output_values('reg_tbl_'.$label_part, $values)."\n";
}

echo "\n";