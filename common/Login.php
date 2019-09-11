<?php
class Login
{
    public $authorized;
    public $message;
    public $apiKey;
    public $authKey;
    public $expire;

    public function __construct($authorized, $apiKey, $authKey, $expire, $message)
    {
        $this->authorized = $authorized;
        $this->apiKey = $apiKey;
        $this->authKey = $authKey;
        $this->message = $message;
        $this->expire = $expire;
    }

    public static function notLogged($message = null)
    {
        $loginData = new Login(false, null, null, null, $message);
        print json_encode($loginData);
    }

    public static function logged($apiKey, $authKey, $expire, $message = "Authenticated")
    {
        $loginData = new Login(true, $apiKey, $authKey, $expire, $message);
        print json_encode($loginData);
    }

    public static function checkLogin(&$userId = null)
    {
        $input = json_decode(file_get_contents("php://input"));
        if (!isset($input->apiKey) || !isset($input->token)) {
            die();
        };

        $apiKey = $input->apiKey;
        $token = $input->token;

        $fields = Sql::getFields("sessions", ["authKey", "expire", "userId"], [["key" => "apiKey", "value" => $apiKey]]);

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
    }

    public static function userType()
    {
        $input = json_decode(file_get_contents("php://input"));
        if (!isset($input->apiKey)) {
            die();
        };

        $result = Sql::getFields("sessions", ["userId"], [["key" => "apiKey", "value" => $input->apiKey]]);
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
