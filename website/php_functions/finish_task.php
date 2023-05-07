<?php
include 'connection.php';
include 'session.php';
$conn = connection();
$user_id = $_SESSION['id'];
$task_id = $_POST['task_id'];
$q = "SELECT is_done FROM todo_list WHERE id = '$task_id'";
$r = mysqli_query($conn, $q);
$s = mysqli_fetch_assoc($r);
if($s['is_done'] == 1){
    $query = "UPDATE todo_list SET is_done = 0 WHERE id = '$task_id'";
}
else{
    $query = "UPDATE todo_list SET is_done = 1 WHERE id = '$task_id'";

}
mysqli_query($conn, $query);
$url = $_SERVER['HTTP_REFERER'];
header("Location: $url");
?>