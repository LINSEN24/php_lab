<?php
require_once  "../../resource/jdbc.php";
require_once "../uitl/mysql.php";
require_once "../pojo/User.php";

$link=connectDatabase($jdbc_hostname, $jdbc_username, $jdbc_password, $jdbc_database);

function findUserAll()
{
    global $link;

    $sql = "SELECT `id`,`account`,`password`,`username`,`phone`,`role` FROM `user`";

    $result = executePreparedStatement($link, $sql);

    $users=array();
    while ($row = mysqli_fetch_assoc($result)) {
        $user = new User();
        $user->setId($row["id"]);
        $user->setAccount($row["account"]);
        $user->setPassword($row["password"]);
        $user->setUsername($row["username"]);
        $user->setPhone($row["phone"]);
        $user->setRole($row["role"]);
        array_push($users,$user);
    }
    closeDatabase($link);

    if(!empty($users)){
        return $users;
    }else{
        return null;
    }
}

function findUserByAccountAndPassword($account,$password){
    global $link;
    $sql = "SELECT `id`,`account`,`password`,`username`,`phone`,`role` FROM `user` WHERE `account`=? AND `password`=?";
    $params=array($account,$password);

    $result = executePreparedStatement($link, $sql,$params,"ss");
    
    $row = mysqli_fetch_assoc($result);
    if(!$row) {
        return null;
    }
    $user = new User();
    $user->setId($row["id"]);
    $user->setAccount($row["account"]);
    $user->setPassword($row["password"]);
    $user->setUsername($row["username"]);
    $user->setPhone($row["phone"]);
    $user->setRole($row["role"]);
    closeDatabase($link);
    return $user;
}
?>
