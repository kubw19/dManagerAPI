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
        $loginData = new Login(false, null, null,null, $message);
        print json_encode($loginData);
    }

    public static function logged($apiKey, $authKey, $expire, $message = "Authenticated")
    {
        $loginData = new Login(true, $apiKey, $authKey, $expire, $message);
        print json_encode($loginData);
    }

    public static function checkLogin($apiKey, $token)
    {
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

        return $fields[0]["userId"];
    }
}

?>