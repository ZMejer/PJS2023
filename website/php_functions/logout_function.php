<?php
session_start();
session_unset();
session_destroy();
$_SESSION = array();
$url = $_SERVER['HTTP_REFERER'];
header("Location: $url");
?>