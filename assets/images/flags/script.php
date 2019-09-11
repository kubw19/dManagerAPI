<?php
require_once "../../../common/sql.php";
$files = scandir('./');
foreach($files as $file) {
  if(explode(".", $file)[1] == "svg"){
	  $name = explode(".", $file)[0];
	  $name = str_replace("-"," ",$name);
	  $name = ucwords($name);
	  $filepath = "assets/images/flags/".$file;
	  $query = "INSERT INTO countries (name, taken, image_round) VALUES (:p1,'0',:p2)";
	  $insert = $pdo->prepare($query);
	  $insert ->bindParam(':p1', $name);
	  $insert ->bindParam(':p2', $filepath);
	  $insert->execute();
  }
}
?>