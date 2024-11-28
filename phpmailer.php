<?php
// Importar las clases de PHPMailer en el espacio de nombres global
// Estas deben estar al principio de tu script, no dentro de una función
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;

// Incluir los archivos necesarios de PHPMailer
require 'PHPMailer/Exception.php';
require 'PHPMailer/PHPMailer.php';
require 'PHPMailer/SMTP.php';
