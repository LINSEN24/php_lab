<?php
session_start();
if(!$_SESSION["username"]){
    header("Location: /laboratoryReservationSystem/web/login.html");
    die();
}

echo "欢迎您,".$_SESSION["username"];
?>