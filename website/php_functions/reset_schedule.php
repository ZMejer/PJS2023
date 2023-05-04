<?php
include 'connection.php';
include 'session.php';
$connection = connection();
$user = $_SESSION['id'];
$query = "DELETE FROM users_schedules WHERE user_id = $user";
if(mysqli_query($connection, $query)) {
    $url = $_SERVER['HTTP_REFERER'];
    header("Location: $url");
}
else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}
?>