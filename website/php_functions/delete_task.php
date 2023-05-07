<?php
include 'connection.php';
include 'session.php';
$conn = connection();
$user_id = $_SESSION['id'];
$task_id = $_POST['task_id'];
$query = "DELETE FROM todo_list WHERE id = '$task_id'";
mysqli_query($conn, $query);
$url = $_SERVER['HTTP_REFERER'];
header("Location: $url");
?>