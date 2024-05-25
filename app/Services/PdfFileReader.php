<?php

namespace App\Services;

use App\Interfaces\FileReader;
use Smalot\PdfParser\Parser;

class PdfFileReader implements FileReader
{
    //usando a interface FileReader para pegar o conteudo do text file
    //strategy pattern
    public function getContents($file)
    {
        $parser = new Parser;
        $contents = $parser->parseFile($file);
        return $contents->getText();
    }
}