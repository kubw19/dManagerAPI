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

if ($_SERVER['REQUEST_METHOD'] === 'GET' && (!isset($_GET["delete"]) || $_GET["delete"] == "false")) {

	if (isset($_GET["id"])) {
		$contestId = $_GET["id"];
		$query = "  
					SELECT 
						(SELECT count(*) from matchesTable where contestId = contests.contestId) 
						matchesCount,
						contests.contestId, 
						contests.name as contestName, 
						contests.finished, 
						contests.date, 
						s.name as stadiumName, 
						s.icon as stadiumIcon 
					FROM 
						contests 
					JOIN 
						stadiums s 
					ON
						 s.stadiumId=contests.stadiumId
					JOIN 
						contestsUsers cu 
					ON 
						contests.contestId = cu.contestId 
					AND 
						cu.userId = :p1
					WHERE 
						(SELECT count(*) from contestsUsers cu2 where cu2.contestId = contests.contestId AND cu2.userId = :p1) != 0
					AND
						contests.contestId = :p2
					ORDER BY 
						contests.date DESC
				";

		$contests = $pdo->prepare($query);
		$contests->bindParam(':p1', $userId);
		$contests->bindParam(':p2', $contestId);
		$contests->execute();
		$contests = $contests->fetchAll(PDO::FETCH_ASSOC);
	} else {
		file_put_contents("asdasd.txt", $userId);
		$query = "  
					SELECT (SELECT count(*) from matchesTable where contestId = contests.contestId) matchesCount, contests.contestId, contests.name as contestName, contests.finished, contests.date, 
					s.name as stadiumName, s.icon as stadiumIcon FROM contests 
					JOIN stadiums s on s.stadiumId=contests.stadiumId
                    where (SELECT count(*) from contestsUsers cu2 where cu2.contestId = contests.contestId AND cu2.userId = :p1) != 0
					ORDER BY contests.date DESC
				";

		$contests = $pdo->prepare($query);
		$contests->bindParam(':p1', $userId);
		$contests->execute();
		$contests = $contests->fetchAll(PDO::FETCH_ASSOC);
	}
	$contestList = [];
	foreach ($contests as $contest) {
		$shootKings = $pdo->prepare("Select sk.playerId, sk.name, sk.surname, sk.country, sk.goals from shootKings sk where contestId = :p1");
		$shootKings->bindParam(':p1', $contest["contestId"]);
		$shootKings->execute();
		$shootKings = $shootKings->fetchAll(PDO::FETCH_ASSOC);
		if (count($shootKings) != 1) $shootKings = NULL;
		$contest["shootKing"] = $shootKings;
		$contest["users"] = sql::getFields("contestsUsersView", ["contestsUsersId", "login", "lastName"], [["key" => "contestId", "value" => $contest["contestId"]], ["key" => "relation", "value" => 0]]);
		$contestList[] = $contest;
	}

	$json = json_encode($contestList);
	print $json;
} else if ($_SERVER['REQUEST_METHOD'] === 'POST') {
	$jsonData = json_decode(file_get_contents("php://input"));
	$data = array_values((array) $jsonData);
	$query = "INSERT INTO contests (name, date, stadiumId, finished) VALUES (?,?,?,?)";

	Utils::validateJSON($jsonData, "contest.json");

	$data = array_map(function ($v) {
		return is_bool($v) ? (int) $v : $v;
	}, $data);
	$pdo->prepare($query)->execute($data);
	sql::insertFields("contestsUsers", [["key" => "contestId", "value" => $pdo->lastInsertId()], ["key" => "userId", "value" => $userId], ["key" => "relation", "value" => 0]]);

	Response::sendResponse("OK");
} else if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET["delete"]) && $_GET["delete"] == "true") {
	$query = "DELETE FROM contests where contestId = ?";

	$del = $pdo->prepare($query);

	$del->execute(array_values((array) $_GET["id"]));
	if ($del->rowcount() == 0) {
		Response::sendResponse("NOT_FOUND");
		die();
	}
	Response::sendResponse("OK");
} else if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
	$json = json_decode(file_get_contents('php://input'));
	//do zrobienia
}
