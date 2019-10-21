<?php
class Login
{
    public $authorized;
    public $message;
    public $apiKey;
    public $authKey;
    public $expire;
    public $userId;
    public $sessionId;

    public function __construct($authorized, $userId, $sessionId, $apiKey, $authKey, $expire, $message)
    {
        $this->authorized = $authorized;
        $this->apiKey = $apiKey;
        $this->authKey = $authKey;
        $this->message = $message;
        $this->expire = $expire;
        $this->userId = $userId;
        $this->sessionId = $sessionId;
    }

    public static function notLogged($message = null)
    {
        Response::setHttpCode(401);
        $loginData = new Login(false, null, null, null, null, null, $message);
        print json_encode($loginData);
    }

    public static function logged($userId, $sessionId, $apiKey, $authKey, $expire, $message = "Authenticated")
    {
        $loginData = new Login(true, $userId,$sessionId,  $apiKey, $authKey, $expire, $message);
        print json_encode($loginData);
    }

    public static function checkLogin(&$userId = null, $print = false, $extendExpirationTime = true)
    {
        if (!isset($_SERVER["HTTP_APIKEY"]) || !isset($_SERVER["HTTP_TOKEN"])) {
            Login::notLogged("INCORRECT_DATA");
            die();
        };

        $apiKey = $_SERVER["HTTP_APIKEY"];
        $token = $_SERVER["HTTP_TOKEN"];

        $fields = Sql::getFields("sessions", ["sessionId", "authKey", "expire", "userId"], [["key" => "apiKey", "value" => $apiKey]]);

        if (empty($fields)) {
            Login::notLogged();
            die();
        }

        if (md5($apiKey . $fields[0]["authKey"]) != $token) {
            Login::notLogged();
            die();
        };
        if ($fields[0]["expire"] < Utils::getDate()) {
            Login::notLogged("Expired");
            die();
        }

        if ($userId != null) $userId = $fields[0]["userId"];

        if ($extendExpirationTime && $fields[0]["expire"] < Utils::getIntervalDate(5)) {
            Login::extendExpirationTime($fields[0]["sessionId"]);
        }

        if ($print == true) {
            Login::logged($userId, $fields[0]["sessionId"], null, null, null, true);
            die();
        }
    }

    public static function extendExpirationTime($sessionId)
    {
        $time = Sql::getFields("sessions", ["expire"], [["key" => "sessionId", "value" => $sessionId]])[0]["expire"];
        Sql::updateFields("sessions", [["key" => "expire", "value" => Utils::addToDateMinutes($time, 10)]], [["key" => "sessionId", "value" => $sessionId]]);
    }

    public static function logout($sessionId)
    {
        Sql::updateFields("sessions", [["key" => "expire", "value" => "2000-01-01 00:00:00"]], [["key" => "sessionId", "value" => $sessionId]]);
    }

    public static function userType()
    {
        if (!isset($_SERVER["HTTP_APIKEY"])) {
            die();
        };

        $result = Sql::getFields("sessions", ["userId"], [["key" => "apiKey", "value" => $_SERVER["HTTP_APIKEY"]]]);
        $userId = $result[0]["userId"];
        $result = Sql::getFields("users", ["type"], [["key" => "userId", "value" => $userId]]);
        if (empty($result)) die();
        return $result[0]["type"];
    }

    public static function canAccess($type = "PAGE")
    {
        if (Login::userType() == 0) return true;
        die();
        switch ($type) {
            case "PAGE":
                $page = basename($_SERVER["SCRIPT_NAME"], ".php");
                break;
        }
    }
}
