<?php

/**
 * Convert MOD files to NinjaTracker+ format.
 * 
 * by Jesse Blue / Ninjaforce
 *
 * 
 * July 29, 2018 - Initial release
 **/

/* the converter class, can be used on its own */

class ntpconverter
{
    private $path_source_mod;        /* path to the MOD file that should be converted */
    private $path_output_ntp;        /* path to the resulting ninjatracker+ (.ntp) file */

    private $rotate_loops;           /* true if loops that do not have ideal size should be rotated */

    private $mod_data;               /* the binary file data of the MOD */
    private $max_number_instruments; /* how many instruments this MOD has at max */
    private $no_of_tracks;           /* how many tracks this MOD uses */
    private $max_pat_cnt;            /* number of patterns (blocks) that the MOD has */
    private $ptr_instnumb;           /* pointer to where instruments are in a MOD */
    private $mod_headlen;            /* length of the MOD header */
    private $ptr_songp_start;        /* pointer to where the Songinfo is, which block should be played after another */
    private $ptr_songp_end;          /* pointer to where the Songinfo ends */
    private $length_of_one_pattern;  /* how many bytes form a pattern in this MOD */
    private $length_of_all_patterns; /* how many bytes form all patterns in this MOD, combined */
    private $pattern_order;          /* array of pattern numbers that defines the order in which to play the patterns */

    private $instrument_information; /* array of instrument information from the MOD */
    private $instrument_data;        /* array of MOD instrument data */
    private $instrument_data_gs;     /* array of converted sample data */
    private $instrument_map;         /* array of which MOD instrument maps to which NT instrument */
    private $instrument_types;       /* array with type of gs instrument: 0 = not looped, 1 = looped, 2 = the loop itself */
    private $instrument_volume_gs;   /* array with volume of gs instrument */
    private $instrument_finetune_gs; /* array with finetune values of gs instrument */
    private $instrument_is_splitted; /* array of booleans about which MOD instrument is split into two */

    private $doc_ptrs;               /* array of pointers to where the GS instrument are placed in the DOC */
    private $doc_sizes;              /* array of size values that can be used by the DOC to play the instrument */

    private $ntp_notes;              /* array of ntp pattern data bytes */

    private $instrument_errors;      /* array of errors when converting instruments */
    private $pattern_errors;         /* array of errors when converting patterns */

    private static $ptr_first_instrument = 20;       /* pointer to where the MOD has its first instrument */
    private static $length_instrument_info = 30;     /* length of an instrument information block in the MOD */
    private static $offset_instrument_length = 22;   /* offset in instrument information block to the length of the instrument */
    private static $offset_instrument_finetune = 24; /* offset in instrument information block to the finetune value */
    private static $offset_instrument_volume = 25;   /* offset in instrument information block to the volume */
    private static $offset_instrument_rep_ptr = 26;  /* offset in instrument information block to the repeat pointer within the instrument */
    private static $offset_instrument_rep_len = 28;  /* offset in instrument information block to the length of the repeat */
    private static $ptr_mod_type = 1080;             /* pointer to where the MOD identifier code is */

    private static $ptr_by_type = [
        'old' => [ /* old trackers have up to 15 instruments */
            'max_number_instruments' => 15,
            'ptr_instnumb' => 950-480,
            'mod_headlen' => 1080-480,
            'ptr_songp_start' => 952-480,
            'ptr_songp_end' => 1080-480,
        ],
        'normal' => [ /* normal trackers have up to 31 instruments */
            'max_number_instruments' => 31,
            'ptr_instnumb' => 950,
            'mod_headlen' => 1084,
            'ptr_songp_start' => 952,
            'ptr_songp_end' => 1080,
        ],
    ];
    private static $length_of_note = 4;              /* 4 bytes represent a note in a mod */
    private static $number_of_lines_in_pattern = 64; /* there are always 64 lines in a pattern */
    private static $max_ntp_instruments = 255;       /* there may be only a limited number of instruments in an ntp */
    private static $number_of_stopper_bytes = 8;     /* at the end of every instrument in DOC ram, add some 0 bytes to make the ensoniq stop playing */
    private static $optimal_small_loop_length = 512; /* a comfortable length if the instrument is a small loop */

    private static $mod_types = [ /* mapping for ID in MOD => number of tracks */
        'M.K.' => 4,
        '2CHN' => 2,
        '5CHN' => 5,
        '6CHN' => 6,
        '7CHN' => 7,
        '8CHN' => 8,
        '9CHN' => 9,
        '01CH' => 1,
        '02CH' => 2,
        '03CH' => 3,
        '04CH' => 4,
        '05CH' => 5,
        '06CH' => 6,
        '07CH' => 7,
        '08CH' => 8,
        '09CH' => 9,
        '10CH' => 10,
        '11CH' => 11,
        '12CH' => 12,
        '13CH' => 13,
        '14CH' => 14,
        '15CH' => 14,
        '01CN' => 1,
        '02CN' => 2,
        '03CN' => 3,
        '04CN' => 4,
        '05CN' => 5,
        '06CN' => 6,
        '07CN' => 7,
        '08CN' => 8,
        '09CN' => 9,
        '10CN' => 10,
        '11CN' => 11,
        '12CN' => 12,
        '13CN' => 13,
        '14CN' => 14,
        '15CN' => 14,
        'FLT4' => 4,
        'FLT8' => 8,
    ];

    private static $doc_page_boundaries = [ /* instruments in the DOC need to be aligned to this number of pages */
        1,
        2,
        4,
        8,
        16,
        32,
        64,
        128,
    ];

    private static $doc_register_sizes = [ /* the doc wavetable size register is set according to the wave size */
        0b0,
        0b001001,
        0b010010,
        0b011011,
        0b100100,
        0b101101,
        0b110110,
        0b111111,
    ];

    private static $optimal_instrument_lengths = [
        256,
        512,
        1024,
        2048,
        4096,
        8192,
        16384,
        32768,
    ];

    private static $mod_notes = [ /* music notes that are possible in the MOD */
       1712,1616,1525,1440,1357,1281,1209,1141,1077,1017, 961, 907, /* c2-b2 */
        856, 808, 762, 720, 678, 640, 604, 570, 538, 508, 480, 453, /* c3-b3 */
        428, 404, 381, 360, 339, 320, 302, 285, 269, 254, 240, 226, /* c4-b4 */
        214, 202, 190, 180, 170, 160, 151, 143, 135, 127, 120, 113, /* c5-b5 */
        107, 101,  95,  90,  85,  80,  76,  71,  67,  64,  60,  57, /* c6-b6 */
         53,  50,  47,  45,  42,  40,  37,  35,  33,  31,  30,  28, /* c7-b7 */
    ];

    private static $doc_stereo_defaults = [
        1, 0,
        0, 1,
        1, 0,
        0, 1,
        1, 0,
        0, 1,
        1, 0,
        0, 1,
    ];

    /* ---- helper methods ---- */

    private function get_mod_file_byte($position)
    {
        return ord(substr($this->mod_data, $position, 1));
    }

    private function get_amiga_word($position)
    {
        return 256 * $this->get_mod_file_byte($position) + $this->get_mod_file_byte($position + 1);
    }

    private function word_to_gs_str($word)
    {
        $hi_byte = ($word & 0xff00) >> 8;
        $lo_byte = $word & 0x00ff;

        return chr($lo_byte) . chr($hi_byte);
    }

    private function get_smaller_length($length)
    {
        foreach(array_reverse(self::$doc_page_boundaries) as $page_boundary)
        {
            $byte_length = $page_boundary * 256;
            if($byte_length < $length)
            {
                return $byte_length;
            }
        }

        return $length;
    }

    /* ---- main program code ---- */

    public function __construct($path_source_mod, $path_output_ntp)
    {
        $this->path_source_mod = $path_source_mod;
        $this->path_output_ntp = $path_output_ntp;

        $this->instrument_errors = [];
        $this->pattern_errors = [];
    }

    private function detect_mod_and_number_of_tracks()
    {
        /* find out if old or normal and how many tracks there are */
        $str_type = substr($this->mod_data, self::$ptr_mod_type, 4);
        if(isset(self::$mod_types[$str_type]))
        {
            $old_or_normal = 'normal';
            $this->no_of_tracks = self::$mod_types[$str_type];
        }
        else
        {
            $old_or_normal = 'old';
            $this->no_of_tracks = 4;
        }

        /* set values, depending on old or normal */
        $this->max_number_instruments = self::$ptr_by_type[$old_or_normal]['max_number_instruments'];
        $this->ptr_instnumb = self::$ptr_by_type[$old_or_normal]['ptr_instnumb'];
        $this->mod_headlen = self::$ptr_by_type[$old_or_normal]['mod_headlen'];
        $this->ptr_songp_start = self::$ptr_by_type[$old_or_normal]['ptr_songp_start'];
        $this->ptr_songp_end = self::$ptr_by_type[$old_or_normal]['ptr_songp_end'];
    }

    private function detect_number_of_patterns()
    {
        $max_pat_cnt = 0;
        for($pos = $this->ptr_songp_start; $pos < $this->ptr_songp_end; $pos++)
        {
            $byte = $this->get_mod_file_byte($pos);
            $max_pat_cnt = max($byte, $max_pat_cnt);
        }
        $max_pat_cnt++; /* add 1 because pattern 0 is also a pattern */

        $this->max_pat_cnt = $max_pat_cnt;
    }

    private function calc_pattern_length()
    {
        $this->length_of_one_pattern = $this->no_of_tracks * self::$length_of_note * self::$number_of_lines_in_pattern;

        $this->length_of_all_patterns = $this->length_of_one_pattern * $this->max_pat_cnt;
    }

    private function get_pattern_order()
    {
        $pattern_order_length = $this->get_mod_file_byte($this->ptr_instnumb); /* length of pattern order */
        $this->pattern_order = [];

        for($i = 0; $i < $pattern_order_length; $i++)
        {
            $ptr_mod = $this->ptr_instnumb + 2 + $i;
            $byte = $this->get_mod_file_byte($ptr_mod);

            $this->pattern_order[] = $byte;
        }
    }

    private function extract_instrument_information($instrument_number)
    {
        /* instrument numbers run from 1 to 15 or 1 to 31 */
        $ptr = self::$ptr_first_instrument + ($instrument_number - 1) * self::$length_instrument_info;

        $instrument_name = '';
        for($i = 0; $i < self::$length_instrument_info; $i++)
        {
            $byte = $this->get_mod_file_byte($ptr + $i);
            if($byte === 0)
            {
                break;
            }
            
            $instrument_name .= chr($byte);
        }

        $instrument_length = $this->get_amiga_word($ptr + self::$offset_instrument_length) * 2; /* given in words, transform to bytes */
        $instrument_volume = $this->get_mod_file_byte($ptr + self::$offset_instrument_volume);
        $instrument_finetune = (15 & $this->get_mod_file_byte($ptr + self::$offset_instrument_finetune)); /* lower nibble only */
        $instrument_rep_ptr = $this->get_amiga_word($ptr + self::$offset_instrument_rep_ptr) * 2; /* given in words, transform to bytes */
        $instrument_rep_len = $this->get_amiga_word($ptr + self::$offset_instrument_rep_len) * 2; /* given in words, transform to bytes */

        return [
            'name' => $instrument_name,
            'length' => $instrument_length,
            'finetune' => $instrument_finetune,
            'volume' => $instrument_volume,
            'rep_ptr' => $instrument_rep_ptr,
            'rep_len' => $instrument_rep_len,
        ];
    }

    private function extract_all_instrument_information()
    {
        $this->instrument_information = [];

        for($i = 1; $i <= $this->max_number_instruments; $i++)
        {
            $this->instrument_information[$i] = $this->extract_instrument_information($i);
        }
    }

    private function extract_instrument_data($instrument_number)
    {
        /* calculcate the pointer in the MOD where the instrument begins */
        $ptr = $this->mod_headlen + $this->length_of_all_patterns;

        for($i = 1; $i < $instrument_number; $i++)
        {
            $ptr += $this->instrument_information[$i]['length'];
        }

        /* get instrument data */
        $instrument_data = [];
        for($i = $ptr; $i < $ptr + $this->instrument_information[$instrument_number]['length']; $i++)
        {
            $instrument_data[] = $this->get_mod_file_byte($i);
        }
        return $instrument_data;
    }

    private function extract_all_instrument_data()
    {
        $this->instrument_data = [];

        for($i = 1; $i <= $this->max_number_instruments; $i++)
        {
            if($this->instrument_information[$i]['length'] > 0)
            {
                $this->instrument_data[$i] = $this->extract_instrument_data($i);
            }
        }
    }

    private function convert_instrument_bytes($mod_instrument_number, $offset, $length)
    {
        $instrument_data_gs = [];

        for($i = $offset; $i < $offset + $length; $i++)
        {
            $byte = $this->instrument_data[$mod_instrument_number][$i];

            /* shift waveform, the GS has 128 for silence, the Amiga has 0 */
            $ensoniq_byte = 255 & ($byte + 128);

            /* make sure we do not have a 0 in the wave, which would stop the ensoniq from playing */
            if($ensoniq_byte === 0)
            {
                $ensoniq_byte = 1;
            }

            $instrument_data_gs[] = $ensoniq_byte;
        }

        return $instrument_data_gs;
    }

    private function add_stopper_bytes_if_needed($instrument_data)
    {
        $instrument_has_optimal_size = in_array(count($instrument_data), self::$optimal_instrument_lengths);

        if(!$instrument_has_optimal_size)
        {
            /* add stopper bytes */
            for($i = 0; $i < self::$number_of_stopper_bytes; $i++)
            {
                $instrument_data[] = 0;
            }
        }
        
        return [$instrument_has_optimal_size, $instrument_data];
    }

    private function optimize_loop($instrument_data_gs)
    {
        $instrument_size_gs = count($instrument_data_gs);
        $instrument_has_optimal_size = in_array($instrument_size_gs, self::$optimal_instrument_lengths);

        /* if the loop has not an ideal length, and is very short, copy the loop to improve sound quality */
        if(!$instrument_has_optimal_size && $instrument_size_gs < self::$optimal_small_loop_length)
        {
            $number_of_stopper_bytes = self::$number_of_stopper_bytes;

            /* edge case: if the loop fits exactly n times into the optimal length */
            $factor = self::$optimal_small_loop_length / $instrument_size_gs;
            if($factor == floor($factor))
            {
                $instrument_has_optimal_size = true;
                $number_of_stopper_bytes = 0;
            }
            
            $loop_data_gs = $instrument_data_gs;
            while(count($instrument_data_gs) + count($loop_data_gs) <= self::$optimal_small_loop_length - $number_of_stopper_bytes)
            {
                $instrument_data_gs = array_merge($instrument_data_gs, $loop_data_gs);
            }
        }

        return $instrument_data_gs;
    }

    private function convert_instrument_data($mod_instrument_number, $offset, $length, $loop = false)
    {
        $instrument_data_gs = $this->convert_instrument_bytes($mod_instrument_number, $offset, $length);

        if($loop)
        {
            $instrument_data_gs = $this->optimize_loop($instrument_data_gs);
        }

        return $this->add_stopper_bytes_if_needed($instrument_data_gs);
    }

    private function add_gs_instrument($mod_instrument_number, $instrument_data_gs, $instrument_type, $optimal_instrument_size)
    {
        $index = 1 + count($this->instrument_data_gs);

        $this->instrument_data_gs[$index] = $instrument_data_gs;
        
        /* Add mapping.
           Because we maybe split looped instruments into two for the GS version,
           we need to map which MOD instrument is which NT instrument.
           But for the mapping, we only need the first instrument.
           Because if the instrument consists of a head and a loop, the head
           is always first and loop is second.
        */
        if(!isset($this->instrument_map[$mod_instrument_number]))
        {
            $this->instrument_map[$mod_instrument_number] = $index;
        }

        $this->instrument_types[$index] = $instrument_type + ($optimal_instrument_size ? 4 : 0);
        $this->instrument_volume_gs[$index] = $this->instrument_information[$mod_instrument_number]['volume'];
        $this->instrument_finetune_gs[$index] = $this->instrument_information[$mod_instrument_number]['finetune'];
    }

    private function find_closest_zero_crossing($instrument_data_gs_loop)
    {
        $ptr = false;
        $min_diff = 1000;
        foreach($instrument_data_gs_loop as $ptr => $byte)
        {
            if($min_diff > abs($byte - 128))
            {
                $min_diff = abs($byte - 128);
                $min_ptr = $ptr;
            }
        }
        return $min_ptr;
    }

    private function rotate_loop($i, $rep_ptr, $rep_len)
    {
        $instrument_data_gs_head = $this->convert_instrument_bytes($i, 0, $rep_ptr);
        $instrument_data_gs_loop = $this->convert_instrument_bytes($i, $rep_ptr, $rep_len);

        $position = $this->find_closest_zero_crossing($instrument_data_gs_loop);

        $instrument_data_gs_head_new = array_merge(
            $instrument_data_gs_head,                           /* keep head */
            array_slice($instrument_data_gs_loop, 0, $position) /* add beginning of loop */
        );

        $instrument_data_gs_loop_new = array_merge(
            array_slice($instrument_data_gs_loop, $position),   /* start loop from position to the end */
            array_slice($instrument_data_gs_loop, 0, $position) /* add start of loop from beginning to position */
        );

        $instrument_data_gs_loop_new = $this->optimize_loop($instrument_data_gs_loop_new);

        list($head_has_optimal_size, $instrument_head) = $this->add_stopper_bytes_if_needed($instrument_data_gs_head_new);
        list($loop_has_optimal_size, $instrument_loop) = $this->add_stopper_bytes_if_needed($instrument_data_gs_loop_new);

        return [$head_has_optimal_size, $instrument_head, $loop_has_optimal_size, $instrument_loop];
    }

    private function convert_instruments()
    {
        $this->instrument_data_gs = [];
        $this->instrument_map = [];
        $this->instrument_errors = [];

        for($i = 1; $i <= $this->max_number_instruments; $i++)
        {
            $length = $this->instrument_information[$i]['length'];

            if($length === 0)
            {
                /* No instrument, skip */
                continue;
            }

            $rep_ptr = $this->instrument_information[$i]['rep_ptr'];
            $rep_len = $this->instrument_information[$i]['rep_len'];

            $instrument_is_splitted = false;

            if($rep_len < 3)
            {
                /* instrument is not looped */
                list($instrument_has_optimal_size, $instrument_data_gs_sample) = $this->convert_instrument_data($i, 0, $length);
                $this->add_gs_instrument($i, $instrument_data_gs_sample, 0, $instrument_has_optimal_size);
            }
            else
            {
                /* instrument is looped */
                if($rep_ptr > 2)
                {
                    /* instrument consists of a head and a loop, save each as individual instrument */
                    list($head_has_optimal_size, $instrument_data_gs_head) = $this->convert_instrument_data($i, 0, $rep_ptr, false);
                    list($loop_has_optimal_size, $instrument_data_gs_loop) = $this->convert_instrument_data($i, $rep_ptr, $rep_len, true);

                    if(!$loop_has_optimal_size && $this->rotate_loop)
                    {
                        /* if the loop has not an optimal size, the player has to use swap mode */
                        /* but in order to minimize the swap mode bug (see Apple IIGS Technote #11), rotate loop */
                        list(
                            $head_has_optimal_size, $instrument_data_gs_head, 
                            $loop_has_optimal_size, $instrument_data_gs_loop
                        ) = $this->rotate_loop($i, $rep_ptr, $rep_len);
                    }
                        
                    $this->add_gs_instrument($i, $instrument_data_gs_head, 2, $head_has_optimal_size);
                    $this->add_gs_instrument($i, $instrument_data_gs_loop, 3, $loop_has_optimal_size);

                    $instrument_is_splitted = true;
                }
                else
                {
                    /* instrument consists only of a loop */
                    list($instrument_has_optimal_size, $instrument_data_gs_loop) = $this->convert_instrument_data($i, $rep_ptr, $rep_len, true);
                    $this->add_gs_instrument($i, $instrument_data_gs_loop, 1, $instrument_has_optimal_size);
                }
            }

            $this->instrument_is_splitted[$i] = $instrument_is_splitted;
        }
    }

    private function check_interrupt_instrument()
    {
        /* Rare edge case:
         *
         * Make sure that the first 256 of the DOC ram are filled with non-zeros.
         * Otherwise, the interrupt timer cannot work.
         * 
         * Since the largest instrument will be placed to this address, this is
         * extremely unlikely to happen.
         * 
         * But if it does, we add a dummy 256 byte silent instrument.
         */
        $max_gs_instrument_length = 0;
        foreach($this->instrument_data_gs as $index => $instrument_data_gs)
        {
            $max_gs_instrument_length = max($max_gs_instrument_length, count($instrument_data_gs));
        }

        if($max_gs_instrument_length < 256)
        {
            $mod_instrument_number = 10000;
            $instrument_data_gs = array_fill(0, 256, 128); /* array with 256 elements with value of 128 (silence) */
            $instrument_type = 1;
            $optimal_instrument_size = true;
            $this->add_gs_instrument($mod_instrument_number, $instrument_data_gs, $instrument_type, $optimal_instrument_size);
        }
    }

    private function check_instruments()
    {
        if(count($this->instrument_data_gs) > self::$max_ntp_instruments)
        {
            $this->instrument_errors[] = 'Too many instruments:';
            $this->instrument_errors[] = sprintf('- Ninjatracker only allows up to %s instruments.', self::$max_ntp_instruments);

            $number_of_instruments = count($this->instrument_data);
            if($number_of_instruments > self::$max_ntp_instruments)
            {
                $this->instrument_errors[] = sprintf('- The MOD already has %s instruments.', $number_of_instruments);
            }
            else
            {
                $this->instrument_errors[] = sprintf('- The MOD has %s instruments.', $number_of_instruments);
            }

            $number_splitted = 0;
            foreach($this->instrument_is_splitted as $index => $is_splitted)
            {
                $number_splitted += $is_splitted ? 1 : 0;
            }

            if($number_splitted > 0)
            {
                $this->instrument_errors[] = sprintf('- Because of looped instruments, the converter creates %s additional instrument%s.', 
                    $number_splitted,
                    ($number_splitted != 1) ? 's' : ''
                );
            }

            $this->instrument_errors[] = '- Consider getting rid of instruments or try removing instrument loop headers.';
        }
    }
    
    private function sort_by_size($a, $b)
    {
        list($length_a, $page_size_a, $align_boundary_a) = $a;
        list($length_b, $page_size_b, $align_boundary_b) = $b;

        if($page_size_a === $page_size_b)
        {
            return 0;
        }

        return ($page_size_a < $page_size_b) ? 1 : -1;
    }
    
    private function sort_instruments_by_size()
    {
        /* sort instruments by size, descending */
        $sizes = [];
        foreach($this->instrument_data_gs as $instrument_number_gs => $instrument_data_gs)
        {
            $length = count($instrument_data_gs);
            $page_size = ceil($length / 256); /* how many pages does our instrument need? */
            $align_boundary = 0;
            foreach(self::$doc_page_boundaries as $page_limit)
            {
                if($page_size <= $page_limit)
                {
                    $align_boundary = $page_limit;
                    break;
                }
            }
            $sizes[$instrument_number_gs] = [$length, $page_size, $align_boundary];
        }

        uasort($sizes, [$this, 'sort_by_size']);

        return $sizes;
    }

    private function get_instrument_error($instrument_number_gs, $error)
    {
        /* from the GS instrument number, find the MOD instrument number */
        $instrument_map_reverse = array_flip($this->instrument_map);

        if(isset($instrument_map_reverse[$instrument_number_gs]))
        {
            $instrument_number_mod = $instrument_map_reverse[$instrument_number_gs];
        }
        else
        {
            $instrument_number_mod = $instrument_map_reverse[$instrument_number_gs - 1];
        }

        /* Give a hint about making the instrument smaller */
        $sizehint = '';
        switch($this->instrument_types[$instrument_number_gs])
        {
            default:
            case 0:
            case 4:
                $length = $this->instrument_information[$instrument_number_mod]['length'];
                $sizehint = 'consider reducing the size from %s to %s bytes';
                break;
            case 2:
            case 6:
                $length = count($this->instrument_data_gs[$instrument_number_gs]);
                $sizehint = 'consider reducing the loop header from %s to %s bytes or removing it';
                break;
            case 1:
            case 3:
            case 5:
            case 7:
                $length = count($this->instrument_data_gs[$instrument_number_gs]);
                $sizehint = 'consider reducing the loop from %s to %s bytes';
                break;
        }

        $smaller_length = $this->get_smaller_length($length);
        if($smaller_length < $length)
        {
            $sizehint = ' - ' . sprintf($sizehint, $length, $smaller_length);
        }

        return sprintf('Instrument %s: %s%s.', str_pad($instrument_number_mod, 2, '0', STR_PAD_LEFT), $error, $sizehint);
    }

    private function put_instruments_in_docwave()
    {   
        /* for each page (a 256 byte block), we mark if it is used or not; init with 0 */
        $doc_pages = array_fill(0, 256, 0);
        
        /* loop over instruments */
        $sorted_sizes = $this->sort_instruments_by_size();
        foreach($sorted_sizes as $instrument_number_gs => $arr_size)
        {
            list($length, $page_size, $my_align_boundary) = $arr_size;

            /* Depending on the size of an instrument, find the matching alignment.
               For example, an instrument with length of 423 takes up 2 pages (=512 bytes) and therefore needs to be aligned on 512 bytes.
             */
            $align_boundary = 0;
            foreach(self::$doc_page_boundaries as $i => $page_limit)
            {
                if($page_size <= $page_limit)
                {
                    $align_boundary = $page_limit;
                    $doc_register_size = self::$doc_register_sizes[$i];
                    break;
                }
            }

            /* If we don't find a matching alignment, it means that the instrument is larger than 32k and the DOC can't play that */
            if($align_boundary === 0)
            {
                $error = 'Too large (must be < 32k)';
                $this->instrument_errors[] = $this->get_instrument_error($instrument_number_gs, $error);
                continue;
            }

            /* find a free slot in the DOC ram */
            $step_size = $align_boundary;
            $page_start = -1;
            for($i = 0; $i < 256; $i += $step_size)
            {
                if($doc_pages[$i] === 0)
                {
                    /* we found a free slot */
                    $page_start = $i;
                    break;
                }
            }

            if($page_start === -1)
            {
                $error = 'Too large';
                $this->instrument_errors[] = $this->get_instrument_error($instrument_number_gs, $error);
                continue;
            }

            /* record where we place the instrument */
            $this->doc_ptrs[$instrument_number_gs] = $page_start;

            /* record the size of the instrument as the doc needs it */
            $this->doc_sizes[$instrument_number_gs] = $doc_register_size;

            /* mark DOC ram as occupied */
            for($i = $page_start; $i < $page_start + $page_size; $i++)
            {
                $doc_pages[$i] = 1;
            }
        }
    }

    private function optimize_instruments()
    {
        /* try to convert instruments using rotated loops */
        $this->rotate_loop = false;
        $this->convert_instruments();
        $this->check_interrupt_instrument();
        $this->check_instruments();
        $this->put_instruments_in_docwave();
        if(count($this->instrument_errors) === 0)
        {
            return;
        }

        /* try to convert instruments without using rotated loops */
        $this->rotate_loop = false;
        $this->convert_instruments();
        $this->check_interrupt_instrument();
        $this->check_instruments();
        $this->put_instruments_in_docwave();
    }

    private function convert_period($period)
    {
        if($period == 0)
        {
            return 0; /* no note */
        }

        $key_mod_note = array_search($period, self::$mod_notes);
        if($key_mod_note === false)
        {
            throw new Exception(sprintf('Unable to convert note period value of %s.', $period));
        }

        return $key_mod_note + 1;
    }

    private function convert_instrument_number($mod_instrument_number)
    {
        if($mod_instrument_number === 0)
        {
            return 0; /* no instrument */
        }

        if(isset($this->instrument_map[$mod_instrument_number]))
        {
            return $this->instrument_map[$mod_instrument_number];
        }

        throw new Exception(sprintf('Instrument %s not found!', $mod_instrument_number));
    }

    private function convert_mod_note($ptr_to_note)
    {
        /* 4 bytes are one note/effect */
        $word0 = $this->get_amiga_word($ptr_to_note);
        $word1 = $this->get_amiga_word($ptr_to_note + 2);

        /* extract mod data */
        $mod_period = $word0 & 0x0fff;
        $mod_instrument_number = (($word0 & 0xf000) >> 8) + (($word1 & 0xf000) >> 12);
        $mod_effect_number = ($word1 & 0x0f00) >> 8;
        $mod_effect_value = ($word1 & 0x00ff);

        /* convert to gs */
        $gs_note_index = $this->convert_period($mod_period);
        $gs_instrument_number = $this->convert_instrument_number($mod_instrument_number);
        $gs_effect_number = $mod_effect_number;
        $gs_effect_value = $mod_effect_value;

        return [$gs_note_index, $gs_instrument_number, $gs_effect_number, $gs_effect_value];
    }

    private function add_note_to_ntp(array $note_data)
    {
        list($gs_note_index, $gs_instrument_number, $gs_effect_number, $gs_effect_value) = $note_data;

        /* sanity checks */
        if($gs_note_index > 255)
        {
            throw new Exception('NinjaTracker+ does not allow a note value > 255!');
        }
        if($gs_instrument_number > self::$max_ntp_instruments)
        {
            throw new Exception(sprintf('NinjaTracker+ does not allow more than %s instruments!', self::$max_ntp_instruments));
        }
        if($gs_effect_number > 15)
        {
            throw new Exception('NinjaTracker+ does not allow effect numbers > 15!');
        }
        if($gs_effect_value > 255)
        {
            throw new Exception('NinjaTracker+ does not allow effect values > 255!');
        }

        $this->ntp_notes[] = $gs_note_index;
        $this->ntp_notes[] = $gs_instrument_number;
        $this->ntp_notes[] = $gs_effect_number;
        $this->ntp_notes[] = $gs_effect_value;
    }

    private function convert_pattern($pattern_number)
    {
        $pattern_len = $this->no_of_tracks * self::$number_of_lines_in_pattern * self::$length_of_note;
        $pattern_offset = $this->mod_headlen + $pattern_len * $pattern_number;
        
        try {
            for($line = 0; $line < self::$number_of_lines_in_pattern; $line++)
            {
                $line_offset = $line * $this->no_of_tracks * self::$length_of_note;
    
                for($track = 0; $track < $this->no_of_tracks; $track++)
                {
                    $track_offset = $track * self::$length_of_note;
    
                    $ptr = $pattern_offset + $line_offset + $track_offset;
    
                    $ntp_note_data = $this->convert_mod_note($ptr);
                    $this->add_note_to_ntp($ntp_note_data);
                }
            }
        } catch(Exception $ex)
        {
            $this->pattern_errors[] = sprintf('Error in pattern %s, line %s, track %s: %s',
                str_pad($pattern_number, 2, '0', STR_PAD_LEFT),
                str_pad($line, 2, '0', STR_PAD_LEFT),
                str_pad($track + 1, 2, '0', STR_PAD_LEFT),
                $ex->getMessage()
            );
        }
    }

    private function convert_patterns()
    {
        for($pattern_number = 0; $pattern_number < $this->max_pat_cnt; $pattern_number++)
        {
            $this->convert_pattern($pattern_number);
        }
    }

    private function save_ntp()
    {
        /* identifier */
        $str = 'nfc!';

        /* version */
        $str .= chr(0);

        /* number of tracks */
        $str .= chr($this->no_of_tracks);

        /* number of instruments */
        $str .= chr(count($this->instrument_data_gs));

        /* number of patterns */
        $str .= chr($this->max_pat_cnt);

        /* number of pattern order */
        $str .= chr(count($this->pattern_order));

        /* n bytes: output channel (0-7) for every track */
        for($track_number = 1; $track_number <= $this->no_of_tracks; $track_number++)
        {
            $str .= chr(self::$doc_stereo_defaults[$track_number - 1]);
        }

        /* instrument data */
        for($instrument_number_gs = 1; $instrument_number_gs <= count($this->instrument_data_gs); $instrument_number_gs++)
        {
            $str .= chr($this->instrument_types[$instrument_number_gs]);
            $str .= $this->word_to_gs_str(count($this->instrument_data_gs[$instrument_number_gs]));
            $str .= chr($this->instrument_volume_gs[$instrument_number_gs]);
            $str .= chr($this->instrument_finetune_gs[$instrument_number_gs]);
            $str .= chr($this->doc_ptrs[$instrument_number_gs]);
            $str .= chr($this->doc_sizes[$instrument_number_gs]);

            /*echo "num ".$instrument_number_gs;
            echo ", type=".$this->instrument_types[$instrument_number_gs];
            echo ", len=".count($this->instrument_data_gs[$instrument_number_gs]);
            echo ", vol=".$this->instrument_volume_gs[$instrument_number_gs];
            echo ", finetune=".$this->instrument_finetune_gs[$instrument_number_gs];
            echo ", docptr=$".dechex($this->doc_ptrs[$instrument_number_gs]);
            echo ", docsiz=%".decbin($this->doc_sizes[$instrument_number_gs]);
            echo "\n";*/
        }

        /* add pattern order */
        foreach($this->pattern_order as $byte)
        {
            $str .= chr($byte);
        }

        /* add pattern data */
        foreach($this->ntp_notes as $byte)
        {
            $str .= chr($byte);
        }

        /* add instrument data */
        foreach($this->instrument_data_gs as $instrument_data_gs)
        {
            foreach($instrument_data_gs as $byte)
            {
                $str .= chr($byte);
            }
        }

        file_put_contents($this->path_output_ntp, $str);
    }

    private function load_mod()
    {
        $this->mod_data = file_get_contents($this->path_source_mod);

        if($this->mod_data === false)
        {
            throw new Exception(sprintf('Unable to load MOD %s', $this->path_source_mod), self::FATAL_ERROR);
        }
    }

    private function check_no_errors_occurred()
    {
        $no_errors = empty($this->instrument_errors) && empty($this->pattern_errors);
        if($no_errors)
        {
            return true;
        }

        $show_max_pattern_errors = 10;
        $number_of_pattern_errors = count($this->pattern_errors);

        $all_errors = $this->instrument_errors;

        $all_errors = array_merge($all_errors, array_slice($this->pattern_errors, 0, $show_max_pattern_errors));

        if($number_of_pattern_errors > $show_max_pattern_errors)
        {
            $all_errors[] = sprintf('... (%s more pattern errors)', $number_of_pattern_errors - $show_max_pattern_errors);
        }
        
        throw new Exception(implode($all_errors, PHP_EOL));
    }

    private function list_instruments()
    {
        $instrument_map_reverse = array_flip($this->instrument_map);
        foreach($this->instrument_data_gs as $index => $data)
        {
            echo $index.(isset($instrument_map_reverse[$index]) ? ' ('.$instrument_map_reverse[$index].')' : '')."\n";
            echo "len=".count($data)."\n";
            echo "typ=".$this->instrument_types[$index]."\n";
            echo "\n";
        }
    }

    public function convert()
    {
        try {
            /* load mod */
            $this->load_mod();

            /* read basic information from mod */
            $this->detect_mod_and_number_of_tracks();
            $this->detect_number_of_patterns();
            $this->calc_pattern_length();
            $this->get_pattern_order();

            /* convert instruments */
            $this->extract_all_instrument_information();
            $this->extract_all_instrument_data();
            $this->optimize_instruments();

            /* convert patterns */
            $this->convert_patterns();

            /* save, if there are no errors */
            if($this->check_no_errors_occurred())
            {
                $this->save_ntp();
            }

            $result = ['success' => true];
        }
        catch(Exception $ex)
        {
            $result = ['success' => false, 'message' => $ex->getMessage(). PHP_EOL];
        }

        return $result;
    }
}
