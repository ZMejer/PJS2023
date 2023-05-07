<?php
include 'connection.php';
function timetable(){
    echo "<div class=\"container mt-5\"><div class=\"row justify-content-center\">";
    echo "<div class=\"col-md-5 mr-5\">";
    echo "<h4 class=\"mb-4\">Dodaj zadanie</h4>";
    echo "<form method=\"POST\" action=\"../php_functions/add_task.php\"><input class=\"form-control\" list=\"subjects\" id=\"subject\" name=\"subject\" placeholder=\"Wybierz przedmiot\" required>
    <datalist id=\"subjects\" name=\"subject\">";
    
    $conn = connection();
    $user_id = $_SESSION['id'];
    $query = "SELECT user_id, subject_id from users_schedules where user_id = '$user_id'";
    $result = mysqli_query($conn, $query);
    while($row = mysqli_fetch_assoc($result)){
        $q = "SELECT subject, day, beginning_time, end_time, lecturer, type FROM schedules WHERE id = '$row[subject_id]'";
        $r = mysqli_query($conn, $q);
        $s = mysqli_fetch_assoc($r);
        echo "<option value=\"$s[subject]\">";
    }

    echo "</datalist>";
    echo "<textarea name=\"task\" class=\"form-control mt-3\" id=\"exampleFormControlTextarea1\" rows=\"3\" placeholder=\"Do zrobienia\"></textarea>";
    echo "<label style='float:left;' for=\"dateInput\" class=\"form-label mt-3\">Na kiedy: </label><input style='float:left;' type=\"date\" class=\"form-control\" id=\"dateInput\" name=\"due_date\">";
    echo "<button type=\"submit\" style='float:right;' class=\"btn btn-success mt-4 col-md-5 mb-5\">Dodaj</button>";
    echo "</div></form>";

    echo "<div class=\"col-md-6\">";
    echo "<h4 class=\"text-secondary\">Twoje zadania:</h4>";
    echo "<div class=\"border rounded p-3\">";
    $tquery = "SELECT * FROM todo_list WHERE user_id = '$user_id' AND is_done = 0 ORDER BY due_date ASC";
    $result = mysqli_query($conn, $tquery);
    while($row = mysqli_fetch_assoc($result)){
        echo "<div class=\"\">". $row['task'] . " - " . $row['subject'] . "<span class=\"text-muted\"> " . $row['due_date'] . "</span>
        <div class=\"form-inline mt-1\"><form method=\"POST\" action=\"../php_functions/delete_task.php\"><button name=\"task_id\" value=\"". $row['id'] . "\" type=\"submit\" class=\"btn btn-outline-danger\">Usuń</button></form>
        <form method=\"POST\" action=\"../php_functions/finish_task.php\"><button name=\"task_id\" value=\"". $row['id'] . "\" type=\"submit\" class=\"btn btn-outline-success ml-1\">Zrobione</button></form></div></div><br>";
    }
    echo "</div>";
    echo "<h4 class=\"text-secondary mt-4\">Ukończone:</h4>";
    echo "<div class=\"border rounded p-3\">";
    $dquery = "SELECT * FROM todo_list WHERE user_id = '$user_id' AND is_done = 1 ORDER BY due_date ASC";
    $result = mysqli_query($conn, $dquery);
    while($row = mysqli_fetch_assoc($result)){
        echo "<div class=\"\">". $row['task'] . " - " . $row['subject'] . "<span class=\"text-muted\"> " . $row['due_date'] . "</span>
        <div class=\"form-inline mt-1\"><form method=\"POST\" action=\"../php_functions/delete_task.php\"><button name=\"task_id\" value=\"". $row['id'] . "\" type=\"submit\" class=\"btn btn-outline-danger\">Usuń</button></form>
        <form method=\"POST\" action=\"../php_functions/finish_task.php\"><button name=\"task_id\" value=\"". $row['id'] . "\" type=\"submit\" class=\"btn btn-outline-dark ml-1\">Przywróć</button></form></div></div><br>";
    }
    echo "</div></div>";
    echo "</div></div>";

}

?>