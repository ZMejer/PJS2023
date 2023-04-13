<?php
include 'connection.php';

function schedule()
{
    $field_of_study = $_SESSION['major'];
    $semester = $_SESSION['semester'];
    $conn = connection();
    echo $field_of_study . " " . $semester;
    echo "<table class=\"table table-bordered\">
    <thead>
        <tr>
            <th></th>
            <th class=\"col-md-2\">Poniedziałek</th>
            <th class=\"col-md-2\">Wtorek</th>
            <th class=\"col-md-2\">Środa</th>
            <th class=\"col-md-2\">Czwartek</th>
            <th class=\"col-md-2\">Piątek</th>
        </tr>
    </thead>
    <tbody id=\"tableBody\">";
    echo "</tbody>
    </table>";
}

?>