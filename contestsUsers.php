<?php
require_once "common/utils.php";
require_once "common/sql.php";
require_once "common/Login.php";

Utils::init();
Utils::setContentType("json");

$userId = -1;
//Login::checkLogin($userId);
//Login::canAccess();
$pdo = Sql::$pdo;

if ($_SERVER['REQUEST_METHOD'] === 'GET' && (!isset($_GET["delete"]) || $_GET["delete"] == "false")) {
	die();
} else if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	$json = json_decode(file_get_contents("php://input"));

	$check = sql::getFields("contestsUsers", [], [["key" => "contestId", "value" => $json->contestId], ["key" => "userId", "value" => $json->userId]]);

	if (!empty($check)) {
		Response::sendResponse("INCORRECT_DATA", "ALREADY_EXISTS");
		die();
	}

	sql::insertFields("contestsUsers", [["key" => "contestId", "value" => $json->contestId], ["key" => "userId", "value" => $json->userId]]);

	Response::sendResponse("OK");
} else if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET["delete"]) && $_GET["delete"] == "true") {
	$contestId = sql::getFields("contestsUsers", ["contestId"], [["key" => "contestsUsersId", "value" => $_GET["id"]]])[0]["contestId"];
	$users = sql::getFields("contestsUsers", ["contestId"], [["key" => "contestId", "value" => $contestId]]);
	if (count($users) <= 1) {
		Response::sendResponse("INCORRECT_DATA", "AT_LEAST_ONE_OWNER_REQUIRED");
		die();
	}
	sql::removeFields("contestsUsers", [["key" => "contestsUsersId", "value" => $_GET["id"]]]);
} else if ($_SERVER['REQUEST_METHOD'] === 'PUT') { }
