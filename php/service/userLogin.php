<?php
require_once "../dao/UserDao.php";

// Retrieve the raw request body
$request_body = file_get_contents('php://input');

// Decode the JSON data
$data = json_decode($request_body);

// Extract the username and password from the data

$user=findUserByAccountAndPassword($data->account,$data->password);

if($user==null){
  $response = array('success' => false);
  echo json_encode($response);
}else if ($user->getAccount() === $data->account && $user->getPassword() === $data->password) {
  session_start();
  $_SESSION['username']=$user->getUsername();
  $_SESSION['role']=$user->getRole();
  
  $response = array('success' => true);
  echo json_encode($response);
}else{
  $response = array('success' => false);
  echo json_encode($response);
}

// TODO: Validate the username and password

// TODO: Check if the user exists in the database

// TODO: Verify the password

// TODO: Set the session variables

// Send a JSON response
?>