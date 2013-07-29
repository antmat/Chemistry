<?php

    function formatAsArray($str, $wrapper = '')
    {
        $str = preg_replace('/\+/u', '', $str);
        $ret = '[NSArray arrayWithObjects:';
        if($str != '')
        {
            $ret .= "@$wrapper";
        }
        else
        {
            return $ret."nil]";
        }
        return $ret.preg_replace("/,\s*/u","$wrapper, @$wrapper",$str)."$wrapper, nil]";
    }

    function formatAsArrayWithNumbers($str)
    {
        return formatAsArray($str);
    }

    function formatAsArrayWithStrings($str)
    {
        return formatAsArray($str, '"');
    }

    function formatAsNumber($str, $defaultValue=0)
    {
        if($str == '')
        {
            $str = $defaultValue;
        }
        return "@".$str;
    }
    function formatAsString($str)
    {
        return '@"'.$str.'"';
    }

    function formatNames($str)
    {
        $str = preg_replace("/###\s*/u", "", $str);
        return formatAsString($str);
    }
    function formatPronouncableNames($str)
    {
        return formatAsArrayWithStrings($str);
    }
    function formatNumbers($str)
    {
        return "";
    }
    function formatPeriods($str)
    {
        return formatAsNumber($str);
    }
    function formatGroups($str)
    {
        return formatAsNumber($str);
    }
    function formatSubgroups($str)
    {
        if($str == "A")
        {
            $str = 1;
        }
        if($str == "B")
        {
            $str = 2;
        }
        if($str == "Ac")
        {
            $str = 3;
        }
        if($str == "La")
        {
            $str = 3;
        }

        return formatAsNumber($str);
    }
    function formatElConfigurations($str)
    {
        return formatAsString($str);
    }
    function formatOxNumbers($str)
    {
        return formatAsArrayWithNumbers($str);
    }
    function formatValencies($str)
    {
        return formatAsArrayWithNumbers($str);
    }
    function formatMasses($str)
    {
        return formatAsNumber($str);
    }
    function formatRadiuses($str)
    {
        return formatAsNumber($str);
    }
    function formatElectronegativities($str)
    {
        return formatAsNumber($str);
    }
    function formatPotentials($str)
    {
        return formatAsNumber($str);
    }
    $data = file('./properties.txt');
    $cnt = 0;

    /*
     $names = array();
     $pronouncableNames = array();
     $numbers = array();
     $periods = array();
     $groups = array();
     $subgroups = array();
     $elConfigurations = array();
     $oxNumbers = array();
     $valencies = array();
     $masses = array();
     $radiuses = array();
     $electronegativities = array();
     $potentials = array();
     */


    $parsedData = array(
                        'names' => array(),
                        'pronouncableNames' => array(),
                        'numbers' => array(),
                        'periods' => array(),
                        'groups' => array(),
                        'subgroups' => array(),
                        'elConfigurations' => array(),
                        'oxNumbers' => array(),
                        'valencies' => array(),
                        'masses' => array(),
                        'radiuses' => array(),
                        'electronegativities' => array(),
                        'potentials' => array(),
                        );
    /*
     * ### символ
     * названия в падежах
     * номер в таблицах
     * номер периода
     * номер группы
     * подгруппа (A, B, Ac, La)
     * конфигурация внешнего электронного слоя
     * возможные СО
     * валентности
     * атомная масса
     * атомный радиус в пм
     * ЭО
     * минимальный из потенциалов для элемента (положение в ряду напряжений)
     * */

    $keys = array_keys($parsedData);
    foreach($data as $cnt => $line)
    {
        $parsedData[$keys[$cnt % 13]][] = trim($line);
    }
    foreach($parsedData as $key => $data)
    {
        if($key == 'numbers')
        {
            continue;
        }
        $definitions = "/*$key*/\n[NSArray arrayWithObjects:\n";
        $fun = "format".mb_strtoupper(mb_substr($key,0,1)).mb_substr($key,1);
        foreach($data as $line)
        {
            $line = trim($line);
            $line = preg_replace("/@/u", "", $line);
            $definitions .= $fun($line).",\n";
        }
        $definitions .= "nil];\n";
        echo $definitions;
    }