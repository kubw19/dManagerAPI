<?php
require_once "common/utils.php";
require_once "common/sql.php";
require_once "common/Login.php";

Utils::init();
Utils::setContentType("json");
$pdo = Sql::$pdo;

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $information = new stdClass();
    $version = json_decode(file_get_contents("./version.json"))->number;
    $information->version = $version;
    print_r(json_encode($information));
}
else {
    Response::sendResponse("NOT_ALLOWED");
}