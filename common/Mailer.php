<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;
require_once(__DIR__ . '/config.php');

$mailer = new Mailer($mailHost, $mailUsername, $mailPassword, $mailPort);

class Mailer
{
    private $host;
    private $username;
    private $password;
    private $port;

    public function __construct($host, $username, $password, $port)
    {
        $this->host = $host;
        $this->username =  $username;
        $this->password = $password;
        $this->port = $port;
    }

    public function sendMail($to, $subject, $body)
    {
        $mail = new PHPMailer(true);
        try {
            //Server settings
            //$mail->SMTPDebug = SMTP::DEBUG_SERVER;                      // Enable verbose debug output
            $mail->isSMTP();                                            // Send using SMTP
            $mail->Host       = $this->host;                    // Set the SMTP server to send through
            $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
            $mail->Username   = $this->username;                   // SMTP username
            $mail->Password   = $this->password;                            // SMTP password
            $mail->SMTPSecure = PHPMailer::ENCRYPTION_STARTTLS;         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` also accepted
            $mail->Port       = $this->port;                                  // TCP port to connect to

            //Recipients
            $mail->setFrom('dmanager@jakubwlodarczyk.pl', 'dManager Mailing Center');
            $mail->addAddress($to);     // Add a recipient

            // Attachments
            //$mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
            //$mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

            // Content
            $mail->isHTML(true);                                  // Set email format to HTML
            $mail->Subject = $subject;
            $mail->Body    = $body;
            $mail->AltBody = "Your maili client doesn't support HTML. Please use another client.";

            $mail->send();
            //echo 'Message has been sent';
        } catch (Exception $e) {
            //echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
        }
    }
}
