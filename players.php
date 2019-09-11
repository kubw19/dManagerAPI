<?php
require_once "common/utils.php";
require_once "common/sql.php";
require_once "common/Login.php";

Utils::init();
Utils::setContentType("json");

$userId = null;
Login::checkLogin($userId);
Login::canAccess();
$pdo = Sql::$pdo;

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
	if(isset($_GET["countryId"])){
		$query = "SELECT * FROM players WHERE countryId=:p1";
		$players = $pdo->prepare($query);
		$players -> bindParam(":p1", $_GET["countryId"]);
	}
	else{
		$query = "SELECT * FROM players";
		$players = $pdo->prepare($query);
	}

	$players->execute();
	$players = $players->fetchAll(PDO::FETCH_ASSOC);

	$json = json_encode($players);

	print $json;
}

else if($_SERVER['REQUEST_METHOD'] === 'POST'){
	$jsonData = json_decode(file_get_contents("php://input"));
	$parameters = array_values((array)$jsonData);
	Response::sendResponse("NOT_ALLOWED");
}

else if($_SERVER['REQUEST_METHOD'] === 'DELETE'){
	$jsonData = json_decode(file_get_contents("php://input"));
	$query = "DELETE FROM phases where phaseId = ?";
	Response::sendResponse("NOT_ALLOWED");
}

else if($_SERVER['REQUEST_METHOD'] === 'PUT'){
	$json = json_decode(file_get_contents('php://input'));
	Response::sendResponse("NOT_ALLOWED");
}