$str = 'āžşšķūņrūķīš';

$tab   = array("UTF-8", "ASCII", "Windows-1252", "ISO-8859-15", "ISO-8859-1", "ISO-8859-6", "CP1256");
$chain = "";
foreach ($tab as $i) {
    foreach ($tab as $j) {
        $chain .= " $i$j " . iconv($i, "$j//TRANSLIT", "$str") . '<br>';
    }
}
echo $chain;
