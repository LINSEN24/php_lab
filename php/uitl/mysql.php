<?php
/**
 * 连接数据库
 * @param mixed $hostname 数据库路径
 * @param mixed $username 用户名
 * @param mixed $password 密码
 * @param mixed $database 数据库
 * @return mysqli
 */
function connectDatabase($hostname,$username,$password,$database){
    $link=new mysqli($hostname,$username,$password,$database);
    if($link->connect_errno){
        die("数据库连接失败：".$link->connect_errno);
    }

    return $link;
}

/**
 * 关闭连接
 * @param mixed $link 数据库连接
 * @return void
 */
function closeDatabase($link){
    $link->close();
}

/**
 * sql预处理执行
 * @param mixed $link
 * @param mixed $sql
 * @param mixed $params
 * @param mixed $paramTypes
 * @return mixed result 检查执行结果
 */
function executePreparedStatement($link,$sql, $params=array(),$paramTypes="") {
    // 准备预处理语句
    $stmt = $link->prepare($sql);

    // 绑定参数
    if ($stmt) {
        if (!empty($params)) {
            $stmt->bind_param($paramTypes, ...$params);
        }

        // 执行预处理语句
        $stmt->execute();

        // 获取结果集
        $result = $stmt->get_result();

        // 关闭预处理语句和数据库连接
        $stmt->close();
        // 检查执行结果
        if ($result) {
            return $result;
        } else {
            return null;
        }        
    } else {
        die("预处理语句=[$sql],参数=[$params]执行失败: " . $link->error);
    }
}



?>