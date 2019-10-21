<?php
function mb_ucfirst($string, $encoding = "utf8")
{
    $strlen = mb_strlen($string, $encoding);
    $firstChar = mb_substr($string, 0, 1, $encoding);
    $then = mb_substr($string, 1, $strlen - 1, $encoding);
    return mb_strtoupper($firstChar, $encoding) . $then;
}

require_once "common/utils.php";
require_once "common/sql.php";
require_once "common/Login.php";


Utils::init();

if (($handle = fopen("allPlayers.csv", "r")) !== FALSE) {
    while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
        $countryId = Sql::getFields("countries", ["countryId"], [["key" => "name", "value" => $data[2]]]);
        if ($countryId) {
            if (empty(sql::getFields("players", [], [["key" => "name", "value" => $data[0]], ["key" => "surname", "value" => mb_convert_case($data[1], MB_CASE_TITLE, "UTF-8")], ["key" => "countryId", "value" => $countryId[0]["countryId"]]]))) {
                Sql::insertFields("players", [["key" => "name", "value" => $data[0]], ["key" => "surname", "value" => mb_convert_case($data[1], MB_CASE_TITLE, "UTF-8")], ["key" => "countryId", "value" => $countryId[0]["countryId"]]]);
            } else {
                //echo $data[0] . " " . $data[1] . "<br>";
            }
        }
        else{
            echo "country: " . $data[2] . "<br>";
        }
    }
    fclose($handle);
}
