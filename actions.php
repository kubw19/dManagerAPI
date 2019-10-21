<?php
require_once "common/utils.php";
require_once "common/sql.php";
require_once "common/Login.php";

Utils::init();
Utils::setContentType("json");

$userId = -1;
Login::checkLogin($userId);
Login::canAccess();
$pdo = Sql::$pdo;

if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
    $json = json_decode(file_get_contents("php://input"));
    if(!isset($json ->action) || empty($json->action)){
        die();
    }
    $action = $json->action;

    switch($action){
        case "logout":
        Login::logout($json->sessionId);
        break;
    }
}
else {
    Response::sendResponse("NOT_ALLOWED");
}