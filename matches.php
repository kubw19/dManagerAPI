<?php
require_once "common/utils.php";
require_once "common/sql.php";

Utils::init();
Utils::setContentType("json");

if ($_SERVER['REQUEST_METHOD'] === 'GET' && (!isset($_GET["delete"]) || $_GET["delete"] == "false")) {

	if(isset($_GET["groupId"])){
		$groupId = $_GET["groupId"];

		$query = "SELECT * FROM matchesTable where groupId=:p1 order by matchId DESC";
		$matches = $pdo->prepare($query);
		$matches ->bindParam(':p1', $groupId);
		$matches->execute();
		$matches = $matches->fetchAll(PDO::FETCH_ASSOC);

	}
	
	else if(isset($_GET["matchId"])){
		$matchId = $_GET["matchId"];

		$query = "SELECT * FROM matchesTable where matchId=:p1 order by matchId DESC";
		$matches = $pdo->prepare($query);
		$matches ->bindParam(':p1', $matchId);
		$matches->execute();
		$matches = $matches->fetchAll(PDO::FETCH_ASSOC);

	}

	else if(isset($_GET["group"]) && $_GET["group"] == 0 && isset($_GET["phaseId"]) ){
		$query = "SELECT groupId FROM groups WHERE phaseId = :p1";
		$groupId = $pdo->prepare($query);
		$groupId ->bindParam(':p1', $_GET["phaseId"]);
		$groupId->execute();
		$groupId = $groupId->fetch()[0];

		$query = "SELECT * FROM matchesTable where groupId=:p1 order by matchId DESC";
		$matches = $pdo->prepare($query);
		$matches ->bindParam(':p1', $groupId);
		$matches->execute();
		$matches = $matches->fetchAll(PDO::FETCH_ASSOC);
	}

	else{
		$query = "SELECT * FROM matchesTable order by matchId DESC";
		$matches = $pdo->prepare($query);
		$matches->execute();
		$matches = $matches->fetchAll(PDO::FETCH_ASSOC);
	}

	if(count($matches) == 0){
		Response::sendResponse("EMPTY");
		die();
	}

	foreach($matches as $match){
		//goals
			$query = "SELECT * FROM goals where matchId=:p1 and countryId=:p2";
			$goals = $pdo->prepare($query);
			$goals ->bindParam(':p1', $match["matchId"]);
			$goals ->bindParam(':p2', $match["c1Id"]);
			$goals->execute();
			$goals = $goals->fetchAll(PDO::FETCH_ASSOC);
			$match["goalsT1"] = $goals;

			$query = "SELECT * FROM goals where matchId=:p1 and countryId=:p2";
			$goals = $pdo->prepare($query);
			$goals ->bindParam(':p1', $match["matchId"]);
			$goals ->bindParam(':p2', $match["c2Id"]);
			$goals->execute();
			$goals = $goals->fetchAll(PDO::FETCH_ASSOC);
			$match["goalsT2"] = $goals;

		//injuries
			$query = "SELECT * FROM injuries where matchId=:p1 and countryId=:p2";
			$injuries = $pdo->prepare($query);
			$injuries ->bindParam(':p1', $match["matchId"]);
			$injuries ->bindParam(':p2', $match["c1Id"]);
			$injuries->execute();
			$injuries = $injuries->fetchAll(PDO::FETCH_ASSOC);
			$match["injuriesT1"] = $injuries;

			$query = "SELECT * FROM injuries where matchId=:p1 and countryId=:p2";
			$injuries = $pdo->prepare($query);
			$injuries ->bindParam(':p1', $match["matchId"]);
			$injuries ->bindParam(':p2', $match["c2Id"]);
			$injuries->execute();
			$injuries = $injuries->fetchAll(PDO::FETCH_ASSOC);
			$match["injuriesT2"] = $injuries;

		//red cards
			$query = "SELECT * FROM reds where matchId=:p1 and countryId=:p2";
			$reds = $pdo->prepare($query);
			$reds ->bindParam(':p1', $match["matchId"]);
			$reds ->bindParam(':p2', $match["c1Id"]);
			$reds->execute();
			$reds = $reds->fetchAll(PDO::FETCH_ASSOC);
			$match["redsT1"] = $reds;

			$query = "SELECT * FROM reds where matchId=:p1 and countryId=:p2";
			$reds = $pdo->prepare($query);
			$reds ->bindParam(':p1', $match["matchId"]);
			$reds ->bindParam(':p2', $match["c2Id"]);
			$reds->execute();
			$reds = $reds->fetchAll(PDO::FETCH_ASSOC);
			$match["redsT2"] = $reds;
			
		//yellow cards
			$query = "SELECT * FROM yellows where matchId=:p1 and countryId=:p2";
			$yellows = $pdo->prepare($query);
			$yellows ->bindParam(':p1', $match["matchId"]);
			$yellows ->bindParam(':p2', $match["c1Id"]);
			$yellows->execute();
			$yellows = $yellows->fetchAll(PDO::FETCH_ASSOC);
			$match["yellowsT1"] = $yellows;

			$query = "SELECT * FROM yellows where matchId=:p1 and countryId=:p2";
			$yellows = $pdo->prepare($query);
			$yellows ->bindParam(':p1', $match["matchId"]);
			$yellows ->bindParam(':p2', $match["c2Id"]);
			$yellows->execute();
			$yellows = $yellows->fetchAll(PDO::FETCH_ASSOC);
			$match["yellowsT2"] = $yellows;			

		$matchList[] = $match;
	}

	$json = json_encode($matchList);

	print $json;
}

else if($_SERVER['REQUEST_METHOD'] === 'POST'){
	$json = json_decode(file_get_contents("php://input"));
	
	Utils::validateJSON($json, "match.json");
	
	$parameters = array_map(function ($v) { return is_bool($v) ? (int) $v : $v; }, (array)$json);
	
	if($parameters["team1"] == $parameters["team2"]){
		Response::sendResponse("INCORRECT_DATA", "Teams cannot be the same");
		die();
	}
	
	$query = "Select humanPlayerId from humanPlayers WHERE countryId=:d1";
	$d1 = $pdo->prepare($query);
	$d1 ->bindParam(':d1', $json->team1);
	$d1->execute();
	$d1 = $d1->fetch();

	$query = "Select humanPlayerId from humanPlayers WHERE countryId=:d2";
	$d2 = $pdo->prepare($query);
	$d2 ->bindParam(':d2', $json->team2);
	$d2->execute();
	$d2 = $d2->fetch();	

	$query = "INSERT INTO matches (t1, t2, p1, p2, groupId, played) VALUES (:t1, :t2, :p1, :p2, :gid, :played)";
	$match = $pdo->prepare($query);
	$match -> bindParam(":t1", $parameters["team1"]);
	$match -> bindParam(":t2", $parameters["team2"]);
	$match -> bindParam(":p1", $d1[0]);
	$match -> bindParam(":p2", $d2[0]);
	$match -> bindParam(":gid", $parameters["groupId"]);
	$match -> bindParam(":played", $parameters["played"]);
	$match -> execute();

	Response::sendResponse("OK");
}

else if($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET["delete"]) && $_GET["delete"] == "true"){

	if(isset($_GET["statistics"]) && $_GET["statistics"] == "true"){
		$query = "DELETE FROM statistics where statisticId = ?";
	}
	else{
			$query = "DELETE FROM matches where matchId = ?";
	}

	$del = $pdo->prepare($query);

	$del->execute(array_values((array)$_GET["id"]));
	if($del->rowcount() == 0){
		Response::sendResponse("NOT_FOUND");
		die();
	}
	Response::sendResponse("OK");
}

else if($_SERVER['REQUEST_METHOD'] === 'PUT'){

	$jsonData = json_decode(file_get_contents("php://input"));	

	if(isset($jsonData->played)){
		$parameters = array_values(array_map(function ($v) { return is_bool($v) ? (int) $v : $v; }, (array)$jsonData));
		$query = "UPDATE matches SET played=? WHERE matchID=?";
		$add = $pdo->prepare($query);
		$add->execute($parameters);
	}
	else{
		$parameters = array_values((array)$jsonData);
		$query = "INSERT INTO statistics (playerId, matchId, type) VALUES (?,?,?)";
		$add = $pdo->prepare($query);
		$add->execute($parameters);
	}
	Response::sendResponse("SUCCESS");
}