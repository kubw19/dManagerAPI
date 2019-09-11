<?php
require_once "common/utils.php";
require_once "common/sql.php";


Utils::init();
Utils::setContentType("json");

session_start();

$inputEmpty = true;
if (!empty(file_get_contents("php://input"))) {
    $inputEmpty = false;
    $json = json_decode(file_get_contents("php://input"));
}

if (!$inputEmpty & $json->logout == true) {
    $loginData = new LoginData();
    $loginData->logged = false;
    $loginData->message = "LOGGED_OUT";
    session_unset();
    print json_encode($loginData);
    die();
}

if (isset($_SESSION['logged']) && $_SESSION['logged'] == true) {
    $loginData = new LoginData();
    $loginData->logged = true;
    $loginData->login = $_SESSION['login'];
    $loginData->userId = $_SESSION['userId'];
    print json_encode($loginData);
} else if ($inputEmpty) {
    LoginData::notLogged("PROVIDE_DATA");
    die();
} else {
    Utils::validateJSON($json, "login.json");

    $users = Sql::getFields("users", ["userId", "password", "login", "type"], [["key" => "email", "value" => $json->email]]);

    if (count($users) == 0) {
        LoginData::notLogged("WRONG_EMAIL");
        die();
    }


    if ($users[0]["password"] == $json->password) {
        //logged in correctly!
        $loginData = new LoginData();
        $loginData->logged = true;
        $loginData->login = $query[0]['login'];
        $loginData->userId = $query[0]['userId'];
        $loginData->authKey = Utils::getAuthKey();
        $loginData->apiKey = Utils::getApiKey();
 
        Sql::insertFields("sessions", [
            ["key" => "apiKey", "value" => $loginData->apiKey],
            ["key" => "authKey", "value" => $loginData->authKey],
            ["key" => "expire", "value" => Utils::getIntervalDate(15)],
            ["key" => "userId", "value" => $users[0]["userId"]],
            ["key" => "ip", "value" => $_SERVER['REMOTE_ADDR']],
            ["key" => "creationTime", "value" => Utils::getDate()]          
        ]);

        Sql::updateFields("users", [["key" => lastLogin, "value" => Utils::getDate()]], [["key" => "userId", "value" => $users[0]["userId"]]]);

        print json_encode($loginData);

        die();
    } else {
        LoginData::notLogged("WRONG_PASSWORD");
        die();
    }
}

class LoginData
{
    public $logged;
    public $login;
    public $userId;
    public $message;
    public $apiKey;
    public $authKey;

    public static function notLogged($message = null)
    {
        $loginData = new LoginData();
        $loginData->logged = false;
        if ($message != null) {
            $loginData->message = $message;
        }
        print json_encode($loginData);
    }
}
