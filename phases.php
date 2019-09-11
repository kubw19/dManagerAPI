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

	if(isset($_GET["contestId"])){
		$contestId = $_GET["contestId"];

		$query = "SELECT * FROM phases where contestId=:p1 ORDER BY phaseId DESC";

		$phases = $pdo->prepare($query);
		$phases ->bindParam(':p1', $contestId);
		$phases->execute();
		$phases = $phases->fetchAll(PDO::FETCH_ASSOC);

	}
	else if (isset($_GET["id"])){
		$query = "SELECT * FROM phases where phaseId = :p1";
		$phases = $pdo->prepare($query);
		$phases ->bindParam(':p1', $_GET["id"]);
		$phases->execute();
		$phases = $phases->fetchAll(PDO::FETCH_ASSOC);
	}
	
	else{
		$query = "SELECT * FROM phases ORDER BY phaseId DESC";
		$phases = $pdo->prepare($query);
		$phases->execute();
		$phases = $phases->fetchAll(PDO::FETCH_ASSOC);
	}

	foreach($phases as $phase){
		if($phase["groupPhase"] == 0){
			$query = "SELECT groupId FROM groups WHERE phaseId=:p1";
			$group = $pdo->prepare($query);
			$group ->bindParam(':p1', $phase["phaseId"]);
			$group->execute();
			$group = $group->fetch();
			$phase["groupId"] = $group["groupId"];
		}
		$phaseList[] = $phase;
	}

	$json = json_encode($phaseList);

	print $json;
}

else if($_SERVER['REQUEST_METHOD'] === 'POST'){
	$jsonData = json_decode(file_get_contents("php://input"));
	$parameters = array_values((array)$jsonData);

	Utils::validateJSON($jsonData, "phase.json");
	
	$parameters = array_map(function ($v) { return is_bool($v) ? (int) $v : $v; }, $parameters);

	$query = "INSERT INTO phases (name, contestId, groupPhase) VALUES (?,?,?)";
	$add = $pdo->prepare($query);
	$add->execute($parameters);
	if($parameters[2] == 0){
		$id = $pdo->lastInsertId();
		$query = "INSERT INTO groups (name, phaseId) VALUES(null, :p1)";
		$add = $pdo->prepare($query);
		$add->bindParam(':p1', $id);
		$add->execute();
	}
}

else if($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET["delete"]) && $_GET["delete"] == "true"){
	$query = "DELETE FROM phases where phaseId = ?";
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
	//do zrobienia
}