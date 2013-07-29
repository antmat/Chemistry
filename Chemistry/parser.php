<?php
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
	0 => array(),
	1 => array(),
	2 => array(),
	3 => array(),
	4 => array(),
	5 => array(),
	6 => array(),
	7 => array(),
	8 => array(),
	9 => array(),
	10 => array(),
	11 => array(),
	12 => array(),
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
foreach($data as $cnt => $line)
{
	$parsedData[$cnt % 13][] = trim($line);
}
$nameDefinitions = "/*names*/\n[NSArray arrayWithObjects:\n@\"\",\n";
foreach($parsedData[0] as $line)
{
	$nameDefinitions .= '@"'.trim(preg_replace("/###/ui", "", $line))."\",\n";
}
$nameDefinitions .= "nil];\n";
$periodDefinitions = "/*periods*/\n[NSArray arrayWithObjects:\n
echo $nameDefinitions;
