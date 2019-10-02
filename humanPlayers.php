<?php
require_once "common/utils.php";
require_once "common/sql.php";
require_once "common/Login.php";

Utils::init();
Utils::setContentType("json");

$userId = null;
//Login::checkLogin($userId);
//Login::canAccess();
$pdo = Sql::$pdo;

if ($_SERVER['REQUEST_METHOD'] === 'GET' && (!isset($_GET["delete"]) || $_GET["delete"] == "false")) {

	if(isset($_GET["contestId"])){
		$query = "SELECT hp.humanPlayerId, u.firstName, u.lastName, c.name, u.login, u.userId, c.countryId FROM humanPlayers hp JOIN countries c on c.countryId = hp.countryId JOIN users u on hp.userId = u.userId WHERE hp.contestId = :p1";
		$players = $pdo->prepare($query);
		$players -> bindParam(":p1", $_GET["contestId"]);
	}
	else{
		die();
	}

	$players->execute();
	$players = $players->fetchAll(PDO::FETCH_ASSOC);

	$json = json_encode($players);

	print $json;
}

else if($_SERVER['REQUEST_METHOD'] === 'POST'){
	$json = json_decode(file_get_contents('php://input'));

	$p = Sql::$pdo->prepare("SELECT c.countryId FROM countries c WHERE ((SELECT 1 from humanPlayers where contestId = :p1 and countryId = c.countryId)) is null  limit 1");
	$p->bindParam(':p1', $json->contestId);
	$p->execute();
	$p = $p->fetchAll(PDO::FETCH_ASSOC)[0]["countryId"];

	@$json->countryId = $json->countryId ?: $p;

	$s = sql::getFields("humanPlayers", [], [["key" => "contestId", "value" => $json->contestId], ["key" => "countryId", "value" => $json->countryId]]);
	$d = sql::getFields("humanPlayers", [], [["key" => "contestId", "value" => $json->contestId], ["key" => "userId", "value" => $json->userId]]);

	
	if(!empty($s) || !empty($d)){
		Response::sendResponse("INCORRECT_DATA", "ALREADY_EXISTS");
		die();
	}

	sql::insertFields("humanPlayers", [["key" => "countryId", "value"=> $json->countryId], ["key" => "contestId", "value" => $json->contestId], ["key" => "userId", "value" => $json->userId]]);
	Response::sendResponse("OK");
}

else if($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET["delete"]) && $_GET["delete"] == "true"){	
	$query = "DELETE FROM humanPlayers where humanPlayerId = ?";	

	$del = $pdo->prepare($query);

	$del->execute(array_values((array)$_GET["id"]));
	if($del->rowcount() == 0){
		Response::sendResponse("NOT_FOUND");
		die();
	}
	Response::sendResponse("OK");
}

else if($_SERVER['REQUEST_METHOD'] === 'PUT'){
	$json = json_decode(file_get_contents('php://input'));
	if(isset($json->contestId) && isset($json->userId) && isset($json->countryId)){
		$s = sql::getFields("humanPlayers", [], [["key" => "contestId", "value" => $json->contestId], ["key" => "countryId", "value" => $json->countryId]]);
		if(!empty($s)){
			Response::sendResponse("INCORRECT_DATA", "ALREADY_EXISTS");
			die();
		}
		sql::updateFields("humanPlayers", [["key" => "countryId", "value"=> $json->countryId]], [["key" => "contestId", "value" => $json->contestId], ["key" => "userId", "value" => $json->userId]]);
		Response::sendResponse("SUCCESS");

	}
	else{
		Response::sendResponse("INCORRECT_DATA");
	}
}
	