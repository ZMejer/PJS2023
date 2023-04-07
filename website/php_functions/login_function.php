<?php
function connect()
{
    $conn = mysqli_connect("localhost", "root", "", "timetables");
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    } else {
        return $conn;
    }
}
function login()
{
    $conn = connect();
    $login = $_POST['login'];
    $password = hash('sha256', $_POST['loginPassword']);
    $sql = "SELECT * FROM users WHERE login = '$login' AND password = '$password'";
    $result = mysqli_query($conn, $sql);
    $row = mysqli_fetch_assoc($result);
    if (mysqli_num_rows($result) > 0) {
        session_start();
        $_SESSION['id'] = $row['id'];
        $_SESSION['login'] = $row['login'];
        header("Location: ../gui/index.php");
    } else {
        echo "<script>alert('Niepoprawny login lub hasło!')</script>";
    }
}

login();

?>