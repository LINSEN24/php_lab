<?php
session_start();
if(!$_SESSION["username"]){
    header("Location: /laboratoryReservationSystem/web/login.html");
    die();
}

$role=$_SESSION['role'];
if($role==0){
    header("Location: /laboratoryReservationSystem/web/adminHomepage.html");
}else if($role==1){
    header("Location: /laboratoryReservationSystem/web/teacherHomepage.html");
}else if($role==2){
    header("Location: /laboratoryReservationSystem/web/studentHomepage.html");
}else{
    die();
}
?>