<?php
session_start();
$conn=new mysqli("localhost","root","","cgua_university");
if($conn->connect_error) die("Database connection failed: ".$conn->connect_error);
$conn->set_charset("utf8mb4");
function e($v){return htmlspecialchars($v??"",ENT_QUOTES,"UTF-8");}
function is_logged_in(){return isset($_SESSION["user_id"]);}
function require_login(){if(!is_logged_in()){header("Location: /cgua/auth/login.php");exit;}}
function require_role($r){require_login();if(($_SESSION["role"]??"")!==$r){header("Location: /cgua/");exit;}}
?>