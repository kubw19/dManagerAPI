<?php
class Response
{
    public $message;
    public $details;
    public static function sendResponse($type, $details = null)
    {
        $response = new Response();
        switch ($type) {
            case "NOT_FOUND":
                //header("Status: 304");                
                $response->message = "Not found";
                break;
            case "SUCCESS":
                //header("Status: 304");
                $response->message = "Success";
                break;
            case "EMPTY":
                //header("Status: 304");
                $response->message = "Empty";
                break;
            case "NOT_ALLOWED":
                header("Status: 405");
                $response->message = "Method not allowed";
                break;
            case "INCORRECT_DATA":
                Response::setHttpCode(406);
                $response->message = "Incorrect data";
                break;
            case "OK":
                header("Status: 200");
                $response->message = "OK";
                break;
            case "UNAUTHORIZED":
                //Response::setHttpCode(401);
                $response->message = "UNAUTHORIZED";
                break;
			
        }
        $response->details = $details;
        print_r(json_encode($response));
    }

    public static function setHttpCode($code)
    {

        if ($_SERVER['REQUEST_METHOD'] != "OPTIONS") {
            http_response_code($code);
        }
    }
}
