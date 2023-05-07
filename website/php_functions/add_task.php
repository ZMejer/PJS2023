<?php
include 'connection.php';
include 'session.php';
$conn = connection();
$user_id = $_SESSION['id'];
$subject = $_POST['subject'];
$task = strval($_POST['task']);
$due_date = $_POST['due_date'];
$is_done = 0;
$query = "INSERT INTO todo_list VALUES ('', '$task', '$due_date', '$user_id','$is_done', '$subject')";
mysqli_query($conn, $query);
$url = $_SERVER['HTTP_REFERER'];
header("Location: $url");
?>