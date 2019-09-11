<?php
require_once "common/utils.php";
require_once "common/sql.php";

Utils::init();
Utils::setContentType("json");

if ($_SERVER['REQUEST_METHOD'] === 'GET') {


	$query = "SELECT * FROM stadiums";
	$stadiums = $pdo->prepare($query);
	$stadiums->execute();
	$stadiums = $stadiums->fetchAll(PDO::FETCH_ASSOC);

	$json = json_encode($stadiums);

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