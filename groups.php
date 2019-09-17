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

if ($_SERVER['REQUEST_METHOD'] === 'GET' && (!isset($_GET["delete"]) || $_GET["delete"] == "false")) {

	if(isset($_GET["phaseId"])){
		$phaseId = $_GET["phaseId"];

		$query = "SELECT * FROM groups where phaseId=:p1";

		$groups = Sql::$pdo->prepare($query);
		$groups ->bindParam(':p1', $phaseId);
		$groups->execute();
		$groups = $groups->fetchAll(PDO::FETCH_ASSOC);

	}

	else if(isset($_GET["id"])){
		$query = "SELECT * FROM groups where groupId = :p1";
		$groups = Sql::$pdo->prepare($query);
		$groups ->bindParam(':p1', $_GET["id"]);
		$groups->execute();
		$groups = $groups->fetchAll(PDO::FETCH_ASSOC);
	}
	
	else{
		$query = "SELECT * FROM groups";
		$groups = Sql::$pdo->prepare($query);
		$groups->execute();
		$groups = $groups->fetchAll(PDO::FETCH_ASSOC);
	}

	//if(count($groups) == 0)Response::sendResponse("EMPTY");

	$groupList = [];
	foreach($groups as $group){
		$team = Sql::$pdo->prepare("SELECT * from groupData WHERE groupId=:p1");
		$team ->bindParam(':p1', $group["groupId"]);
		$team->execute();
		$team = $team->fetchAll(PDO::FETCH_ASSOC); 
		$group["teams"] = $team;
		$groupList[] = $group;
	}

	$json = json_encode($groupList);

	print $json;
}

else if($_SERVER['REQUEST_METHOD'] === 'POST'){
	$jsonData = json_decode(file_get_contents("php://input"));
	$parameters = array_values((array)$jsonData);

	Utils::validateJSON($jsonData, "group.json");

	$query = "INSERT INTO groups (name, phaseId) VALUES (?,?)";
	$add = Sql::$pdo->prepare($query);
	$add->execute($parameters);
	
	Response::sendResponse("OK");
}

else if($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET["delete"]) && $_GET["delete"] == "true"){
	$query = "DELETE FROM groups where groupId = ? and name is not null";
	$del = Sql::$pdo->prepare($query);

	$del->execute(array_values((array)$_GET["id"]));
	if($del->rowcount() == 0){
		Response::sendResponse("NOT_FOUND");
		die();
	}
	Response::sendResponse("OK");
}

else if($_SERVER['REQUEST_METHOD'] === 'PUT'){
	$json = json_decode(file_get_contents('php://input'));
	//do zrobienia
}