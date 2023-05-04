<?php
include 'connection.php';
include 'session.php';
$subject = $_POST['subjects'];
$user = $_SESSION['id'];
$connection = connection();
foreach ($subject as $s) {
    $query = "INSERT INTO users_schedules VALUES ('', $user, $s)";
    if(mysqli_query($connection, $query)) {
        $url = $_SERVER['HTTP_REFERER'];
        header("Location: $url");
    }
    else {
        echo "Error: " . $sql . "<br>" . mysqli_error($conn);
    }
}

?>