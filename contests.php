<?php
require_once "common/utils.php";
require_once "common/sql.php";

Utils::init();
Utils::setContentType("json");

//Utils::canAccess();

$pdo = Sql::$pdo;

if ($_SERVER['REQUEST_METHOD'] === 'GET' && (!isset($_GET["delete"]) || $_GET["delete"] == "false")) {

	if(isset($_GET["id"])){
		$contestId = $_GET["id"];
		$query = "  
						SELECT contests.contestId, contests.name as contestName, contests.finished, contests.date, 
						s.name as stadiumName, s.icon as stadiumIcon FROM contests 
						JOIN stadiums s on s.stadiumId=contests.stadiumId
						WHERE contests.contestId = :p1
						ORDER BY contests.date DESC
					";

		$contests = $pdo->prepare($query);
		$contests ->bindParam(':p1', $contestId);
		$contests->execute();
		$contests = $contests->fetchAll(PDO::FETCH_ASSOC);
	}

	else{

		$query = "  
					SELECT contests.contestId, contests.name as contestName, contests.finished, contests.date, 
					s.name as stadiumName, s.icon as stadiumIcon FROM contests 
					JOIN stadiums s on s.stadiumId=contests.stadiumId
					ORDER BY contests.date DESC
				";

		$contests = $pdo->prepare($query);
		$contests->execute();
		$contests = $contests->fetchAll(PDO::FETCH_ASSOC);

	}

	foreach($contests as $contest){
		$shootKings = $pdo->prepare("Select sk.playerId, sk.name, sk.surname, sk.country, sk.goals from shootKings sk where contestId = :p1");
		$shootKings ->bindParam(':p1', $contest["contestId"]);
		$shootKings->execute();
		$shootKings = $shootKings->fetchAll(PDO::FETCH_ASSOC);
		if(count($shootKings) != 1) $shootKings = NULL;       
		$contest["shootKing"] = $shootKings;
		$contestList[] = $contest;
	}

	$json = json_encode($contestList);

	print $json;
}

else if($_SERVER['REQUEST_METHOD'] === 'POST'){
	$jsonData = json_decode(file_get_contents("php://input"));
	$data = array_values((array)$jsonData);
	$query = "INSERT INTO contests (name, date, stadiumId, finished) VALUES (?,?,?,?)";

	Utils::validateJSON($jsonData, "contest.php");
	
	$data = array_map(function ($v) { return is_bool($v) ? (int) $v : $v; }, $data);
;	$pdo->prepare($query)->execute($data);	
}

else if($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET["delete"]) && $_GET["delete"] == "true"){	
	$query = "DELETE FROM contests where contestId = ?";	

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
