<?php
class Utils
{

    public static function init()
    {
        require_once "Response.php";
        require_once "./vendor/autoload.php";
        Utils::showHeaders();
        Utils::showErrors();
        global $_PUT;
        global $_DELETE;
        global $dateNow;
        global $timestampNow;
        if ($_SERVER['REQUEST_METHOD'] === 'PUT') {
            parse_str(file_get_contents('php://input'), $_PUT);
        } else if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
            parse_str(file_get_contents('php://input'), $_DELETE);
        }

        $dateNow  = date("Y-m-d H:i:s");
        $timestampNow = time();
    }

    public static function setContentType($type)
    {
        switch ($type) {
            case "json":
                header('Content-Type: application/json');
                break;
        }
    }

    public static function showErrors()
    {
        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);
    }

    private static function showHeaders()
    {
        header("Expires: Thu, 19 Nov 1981 08:52:00 GMT");

        header("Access-Control-Allow-Origin: *");
        header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Access-Control-Allow-Origin, X-PINGOTHER");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");

        header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
        header("Cache-Control: post-check=0, pre-check=0", false);
        header("Pragma: no-cache");
    }

    public static function validateJSON($jsonData, $template)
    {
        $validator = new JsonSchema\Validator;
        $validator->validate($jsonData, (object) ['$ref' => 'file://' . realpath('./jsonSchemas/' . $template)]);
        if (!$validator->isValid()) {
            $details = "";
            foreach ($validator->getErrors() as $error) {
                $details .= $error['property'] . " " . $error['message'] . "\n";
            }
            Response::sendResponse("INCORRECT_DATA", $details);
            die();
        }
    }

    public static function getApiKey()
    {
        return md5("kalafior12398@?" . $_SERVER['SERVER_ADDR'] . rand() . time());
    }
    public static function getAuthKey()
    {
        return md5("a@no??''astherSecurePa><2sswor798d" . $_SERVER['REMOTE_ADDR'] . rand() . time());
    }

    public static function getIntervalDate($minutes = 15)
    {
        date_default_timezone_set("UTC");
        $date = new DateTime();
        $date->add(new DateInterval('PT' . $minutes . 'M')); // PT15M means a period of 15 minutes
        $date = $date->format('Y-m-d H:i:s');
        return $date;
    }

    public static function getDate()
    {
        date_default_timezone_set("UTC");
        $date = new DateTime();
        $date = $date->format('Y-m-d H:i:s');
        return $date;
    }
}
