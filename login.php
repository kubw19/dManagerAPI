<?php
require_once "common/utils.php";
require_once "common/sql.php";
require_once "common/Login.php";
require_once "common/Mailer.php";
require_once "common/config.php";

Utils::init();
Utils::setContentType("json");


//Utils::validateJSON($json, "login.json");

//echo md5("e0395fe4ee984c525ccc86d1ca1329fa" . "68f5f824750be3220a4468f12d046656");
//die();
//Login::checkLogin("e0395fe4ee984c525ccc86d1ca1329fa", "084f8487e7f4cba8a6db8c2958931786");
//die();
//file_put_contents("plik.txt", file_get_contents("php://input"));
$input = json_decode(file_get_contents("php://input"));

if (isset($input->email) && isset($input->password)) {
    $users = Sql::getFields("users", ["userId", "password", "login", "type"], [["key" => "email", "value" => $input->email]]);
    if (empty($users)) {
        Login::notLogged("WRONG_EMAIL");
        die();
    }


    if ($users[0]["password"] == md5($input->password)) {
        //logged in correctly!
        $apiKey = Utils::getApiKey();
        $authKey = Utils::getAuthKey();
        $expire = Utils::getIntervalDate(15);

        Sql::updateFields("sessions", [["key" => "expire", "value" => Utils::getDate()]], [["key" => "userId", "value" => $users[0]["userId"]], ["key" => "expire", "value" => Utils::getDate(), "operator" => ">="]]);

        $sessionId = Sql::insertFields("sessions", [
            ["key" => "apiKey", "value" => $apiKey],
            ["key" => "authKey", "value" => $authKey],
            ["key" => "expire", "value" => $expire],
            ["key" => "userId", "value" => $users[0]["userId"]],
            ["key" => "ip", "value" => $_SERVER['REMOTE_ADDR']],
            ["key" => "creationTime", "value" => Utils::getDate()]
        ]);

        Sql::updateFields("users", [["key" => "lastLogin", "value" => Utils::getDate()]], [["key" => "userId", "value" => $users[0]["userId"]]]);
        Login::logged($users[0]["userId"], $sessionId,  $apiKey, $authKey, strtotime($expire));
        die();
    } else {
        Login::notLogged("WRONG_PASSWORD");
        die();
    }
} else if(isset($input->email) && isset($input->action) && $input->action == "passwordRecovery"){
    $recoveryHash = md5(uniqid());
    $recoveryHashExpire = Utils::getIntervalDate(24 * 60);
    Sql::updateFields("users", [["key" => "recoveryHash", "value" => $recoveryHash]], [["key" => "email", "value" => $input->email]]);
    Sql::updateFields("users", [["key" => "recoveryHashExpire", "value" => $recoveryHashExpire]], [["key" => "email", "value" => $input->email]]);

    $recoveryLink = $address . "recoverPassword/" . $recoveryHash;

    $mailer->sendMail($input->email, "Password Recovery", "Hello.<br>Please click the link below to change your password.<br>" . $recoveryLink);
}
else {
    $userId = -1;
    Login::checkLogin($userId, true, false);
}
