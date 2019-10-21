<?php
require_once "common/utils.php";
require_once "common/sql.php";
require_once "common/Login.php";

Utils::init();
Utils::setContentType("json");

$userId = -1;
//zanim usuniesz popraw zmianę hasła
//Login::checkLogin($userId);
//Login::canAccess();
$pdo = Sql::$pdo;

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
	Login::checkLogin($userId);
	Login::canAccess();

	if(isset($_GET["userId"]) && $_GET["userId"] == $userId){
		$users = sql::getFields("users", ["userId", "login", "firstName", "lastName", "email"], [["key" => "userId", "value" => $userId]])[0];
	}
	else{
		$users = sql::getFields("users", ["userId", "login"], []);
	}

	$json = json_encode($users);

	print $json;
} else if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	$jsonData = json_decode(file_get_contents("php://input"));
	$parameters = array_values((array) $jsonData);
	Response::sendResponse("NOT_ALLOWED");
} else if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
	$jsonData = json_decode(file_get_contents("php://input"));
	$query = "DELETE FROM phases where phaseId = ?";
	Response::sendResponse("NOT_ALLOWED");
} else if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
	$json = json_decode(file_get_contents('php://input'));
	if (isset($json->recoveryHash) && isset($json->password) && isset($json->repeatPassword)) {
		$expireQuery = Sql::getFields("users", ["recoveryHashExpire"], [["key" => "recoveryHash", "value" => $json->recoveryHash]]);
		if (empty($expireQuery)) {
			Response::sendResponse("INCORRECT_DATA", "Expired");
		}
		$expire = $expireQuery[0]["recoveryHashExpire"];
		if (Utils::getDate() < $expire) {
			if($json->password == $json->repeatPassword &&  $json->password != md5("") && strlen($json->password) > 0){
				Sql::updateFields("users", [["key" => "password", "value" => md5($json->password)]], [["key" => "recoveryHash", "value" => $json->recoveryHash]]);
				Sql::updateFields("users", [["key" => "recoveryHashExpire", "value" => null]], [["key" => "recoveryHash", "value" => $json->recoveryHash]]);
				Sql::updateFields("users", [["key" => "recoveryHash", "value" => null]], [["key" => "recoveryHash", "value" => $json->recoveryHash]]);
				Response::sendResponse("SUCCESS");
			}
			else{
				Response::sendResponse("INCORRECT_DATA");
			}
		}
	}
}
