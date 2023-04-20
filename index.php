<?php
session_start();
if(!$_SESSION["username"]){
    header("Location: ./web/login.html");
}

echo "欢迎您,".$_SESSION["username"];
?>