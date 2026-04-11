<?php

require_once(__DIR__ . DIRECTORY_SEPARATOR . 'ntpconverter_lib.php');

/* the command line class to run the converter */

class run_converter
{
    public function parse_commandline()
    {
        if(isset($_SERVER['argv'][1]))
        {
            $mod_arg = $_SERVER['argv'][1];
            if(!file_exists($mod_arg))
            {
                throw new Exception(sprintf('Unable to find MOD file %s', $mod_arg));
            }
        }
        else
        {
            throw new Exception('Please specify a MOD file!');
        }

        if(strtoupper(substr($mod_arg,-4)) === '.MOD')
        {
            $name = substr($mod_arg, 0, -4);
        }
        else
        {
            $name = $mod_arg;
        }

        $this->path_source_mod = $mod_arg;
        $this->path_output_ntp = $name . '.ntp';
    }

    public function run()
    {
        $return_code = 0;

        try {
            $this->parse_commandline();

            $ntconverter = new ntpconverter($this->path_source_mod, $this->path_output_ntp);
            $result = $ntconverter->convert();
    
            if($result['success'] === false)
            {
                throw new Exception($result['message']);
            }
        }
        catch(Exception $ex)
        {
            echo 'UNABLE TO CONVERT:' . PHP_EOL . $ex->getMessage(). PHP_EOL;
            $return_code = 255;
        }
        
        return $return_code;
    }
}

$ntconverter = new run_converter();
exit($ntconverter->run());
