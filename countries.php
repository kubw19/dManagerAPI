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

if ($_SERVER['REQUEST_METHOD'] === 'GET') {

	if(isset($_GET["contestId"])){
		$query = "SELECT hp.contestId, c.countryId, hp.humanPlayerId, u.userId, c.name as country, u.login FROM countries c JOIN humanPlayers hp on hp.countryId=c.countryId JOIN users u ON hp.userId=u.userId WHERE hp.contestId = :p1";
		$countries = $pdo->prepare($query);
		$countries -> bindParam(":p1", $_GET["contestId"]);
	}
	else{
		$query = "SELECT * FROM countries";
		$countries = $pdo->prepare($query);
	}

	$countries->execute();
	$countries = $countries->fetchAll(PDO::FETCH_ASSOC);

	$json = json_encode($countries);

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
	//do zrobienia
	Response::sendResponse("NOT_ALLOWED");
}