<?php

namespace App\Services;

use App\Interfaces\FileReader;

class TextFileReader implements FileReader
{
    //usando a interface FileReader para pegar o conteudo do text file
    //strategy pattern
    public function getContents($file)
    {
        return file_get_contents($file);
    }
}