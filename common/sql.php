<?php
require_once(__DIR__ . '/config.php');

new Sql($dbHost, $dbUser, $dbPass);

class Sql
{
   public static $pdo;
   public function __construct($host, $user, $pass)
   {
      try {
         Sql::$pdo = new PDO('mysql:host=' . $host . ';dbname=dManagerNewDB;charset=utf8', $user, $pass);
      } catch (PDOException $e) {
         echo 'Cant connect to database: ' . $e->getMessage();
      }
      //print_r(Sql::getFields("users", ["login", "password"], [["key" => "userId", "value" => 1]]));
      /*
      Sql::insertFields("sessions", [
         ["key" => "apiKey", "value" => "tesd"],
         ["key" => "authKey", "value" => "asd342tesd"],
         ["key" => "expire", "value" => "2019-09-09 19:02:45"],
         ["key" => "userId", "value" => "1"],
         ["key" => "ip", "value" => "192.168.0.59"],
         ["key" => "creationTime", "value" => "2014-09-09 19:02:45"]
      ]);
      */
      //Sql::updateFields("sessions", [["key" => "userId", "value" => "2"]], [["key" => "userId", "value" => "1"]]);
      //Sql::removeFields("sessions", []);
   }

   public static function getFields($table, $fieldsToGet, $wheres)
   {
      $query = "SELECT ";

      if (empty($fieldsToGet)) {
         $query .= "* ";
      } else {
         $i = 0;
         foreach ($fieldsToGet as $field) {
            if ($i > 0) {
               $query .= ", ";
            }
            $query .= $field;
            $i++;
         }
      }
      $query .= " FROM " . $table . " WHERE ";

      for ($i = 0; $i < count($wheres); $i++) {
         if ($i > 0) {
            $query .= " AND ";
         }
         $query .= $wheres[$i]["key"] . " = :p" . ($i + 1);
      }


      $p = Sql::$pdo->prepare($query);
      for ($i = 0; $i < count($wheres); $i++) {
         $p->bindParam(':p' . ($i + 1), $wheres[$i]["value"]);
      }
      $p->execute();
      $p = $p->fetchAll(PDO::FETCH_ASSOC);

      return $p;
   }

   public static function insertFields($table, $fieldsToInsert)
   {
      $query = "INSERT INTO " . $table . "(";

      $i = 0;
      foreach ($fieldsToInsert as $field) {
         if ($i > 0) {
            $query .= ", ";
         }
         $query .= $field["key"];
         $i++;
      }
      $query .= ") VALUES (";

      for ($i = 0; $i < count($fieldsToInsert); $i++) {
         if ($i > 0) {
            $query .= ", ";
         }
         $query .= ":p" . ($i + 1);
      }
      $query .= ")";


      $p = Sql::$pdo->prepare($query);
      for ($i = 0; $i < count($fieldsToInsert); $i++) {
         $p->bindParam(':p' . ($i + 1), $fieldsToInsert[$i]["value"]);
      }
      return $p->execute();
   }

   public static function updateFields($table, $fieldToUpdate, $wheres)
   {
      $query = "UPDATE " . $table . " SET " . $fieldToUpdate[0]["key"] . " = :p0";

      if (!empty($wheres)) {
         $query .= " WHERE ";
         for ($i = 0; $i < count($wheres); $i++) {
            if ($i > 0) {
               $query .= " AND ";
            }
            $query .= $wheres[$i]["key"] . " = :p" . ($i + 1);
         }
      }

      $p = Sql::$pdo->prepare($query);
      $p->bindParam(':p0', $fieldToUpdate[0]["value"]);
      if (!empty($wheres)) {
         for ($i = 0; $i < count($wheres); $i++) {
            $p->bindParam(':p' . ($i + 1), $wheres[$i]["value"]);
         }
      }
      return $p->execute();
   }

   public static function removeFields($table, $wheres)
   {
      $query = "DELETE FROM " . $table;

      if (!empty($wheres)) {
         $query .= " WHERE ";
         for ($i = 0; $i < count($wheres); $i++) {
            if ($i > 0) {
               $query .= " AND ";
            }
            $query .= $wheres[$i]["key"] . " = :p" . ($i + 1);
         }
      }

      $p = Sql::$pdo->prepare($query);

      if (!empty($wheres)) {
         for ($i = 0; $i < count($wheres); $i++) {
            $p->bindParam(':p' . ($i + 1), $wheres[$i]["value"]);
         }
      }
      return $p->execute();
   }
}
