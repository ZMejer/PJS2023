<?php
function connection()
{
    $conn = mysqli_connect("localhost", "root", "", "timetables");
    if (!$conn) {
        die("Connection failed: " . mysqli_connect_error());
    } else {
        return $conn;
    }
}
function register()
{
    $conn = connection();
    $name = $_POST['name'];
    $surname = $_POST['surname'];
    $email = $_POST['email'];
    $password = $_POST['password'];
    $confirmPassword = $_POST['confirmPassword'];
    $faculty = $_POST['faculty'];
    $major = $_POST['major'];
    $year = $_POST['year'];
    $month = date("m");
    if ($month >= 9 || $month <= 1) {
        $semester = $year * 2 - 1;
    } else {
        $semester = $year * 2;
    }
    if ($password != $confirmPassword) {
        echo "Hasła nie są takie same!";
        return;
    } else {
            $query = "SELECT fields_of_study.faculty_id, faculties.id FROM fields_of_study, faculties WHERE fields_of_study.faculty_id = faculties.id AND fields_of_study.name = '$major' AND faculties.name = '$faculty'";
            $result = mysqli_query($conn, $query);
            if (mysqli_num_rows($result) <= 0) {
                echo "Nie ma takiego kierunku na tym wydziale!";
                return;
            }
        $login = mb_substr($name, 0, 1) . $surname;
        $sql = "INSERT INTO users VALUES ('', '$name', '$surname', '$login', '$password', '$email', '$faculty', '$major', '$semester')";
        if (mysqli_query($conn, $sql)) {
            echo "Nowy rekord dodany poprawnie";
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
    }
}



function faculties()
{
    $conn = connection();
    $sql = "SELECT * FROM faculties";
    $result = mysqli_query($conn, $sql);
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<option value='" . $row['name'] . "'>";
        }
    }
}
function majors()
{
    $conn = connection();
    $sql = "SELECT * FROM fields_of_study";
    $result = mysqli_query($conn, $sql);
    if (mysqli_num_rows($result) > 0) {
        while ($row = mysqli_fetch_assoc($result)) {
            echo "<option value='" . $row['name'] . "'>";
        }
    }
}

?>