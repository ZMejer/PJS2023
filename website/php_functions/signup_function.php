<?php
include 'connection.php';
function register()
{
    $conn = connection();
    $name = $_POST['name'];
    $surname = $_POST['surname'];
    $email = $_POST['email'];
    $password = hash('sha256', $_POST['password']);
    $confirmPassword = hash('sha256', $_POST['confirmPassword']);
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
    }
    if($year != 1 && $year != 2 && $year != 3) {
        echo "Niepoprawny rok studiów!";
        return;
    }
    else {
        $query = "SELECT fields_of_study.faculty_id, faculties.id FROM fields_of_study, faculties WHERE fields_of_study.faculty_id = faculties.id AND fields_of_study.name = '$major' AND faculties.name = '$faculty'";
        $result = mysqli_query($conn, $query);
        if (mysqli_num_rows($result) <= 0) {
            echo "Nie ma takiego kierunku na tym wydziale!";
            return;
        }

        $query = "SELECT login FROM users WHERE email = '$email'";
        $result = mysqli_query($conn, $query);
        if (mysqli_num_rows($result) > 0) {
            echo "Użytkownik o takim adresie email już istnieje!";
            return;
        }
        
        $login = mb_substr($name, 0, 1) . $surname;
        $query = "SELECT login FROM users WHERE login = '$login'";
        $result = mysqli_query($conn, $query);
        $num = 1;
        $loginTmp = $login;
        while (mysqli_num_rows($result) > 0) {
            $loginTmp = $login . $num;
            $query = "SELECT login FROM users WHERE login = '$loginTmp'";
            $result = mysqli_query($conn, $query);
            $num++;
        }
        $login = $loginTmp;

        $sql = "INSERT INTO users VALUES ('', '$name', '$surname', '$login', '$password', '$email', '$faculty', '$major', '$semester')";
        if (mysqli_query($conn, $sql)) {
            echo "Udało się zarejestrować. Twój login to " . $login;
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