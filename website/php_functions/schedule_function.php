<?php
include 'connection.php';

function schedule()
{
    $field_of_study = $_SESSION['major'];
    $semester = $_SESSION['semester'];
    $conn = connection();
    echo $field_of_study . " " . $semester;

    $query = "SELECT id FROM fields_of_study WHERE name = '$field_of_study'";
    $result = mysqli_query($conn, $query);
    $row = mysqli_fetch_assoc($result);
    $field_of_study_id = $row['id'];

    $query = "SELECT subject, day, beginning_time, end_time FROM schedules WHERE field_of_study_id = '$field_of_study_id' AND semester = '$semester'";
    $result = mysqli_query($conn, $query);

    $hours = array();
    for ($h = 8; $h <= 20; $h++) {
        for ($m = 0; $m < 60; $m += 15) {
            $hours[] = sprintf('%02d:%02d', $h, $m);
        }
    }

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

    foreach ($hours as $hour) {
        echo "<tr><td>$hour</td>";
        for ($d = 1; $d <= 5; $d++) {
            $rowspan = 1;
            $cell_content = '';
            while ($schedule = mysqli_fetch_assoc($result)) {
                if (intval($schedule['day']) == $d && strtotime($schedule['beginning_time']) == strtotime($hour)) {
                    $end_time = $schedule['end_time'];
                    $rowspan = ceil((strtotime($end_time) - strtotime($hour)) / 900);
                    $cell_content = $schedule['subject'];
                    break; 
                }
            }
            echo "<td" . ($rowspan > 1 ? " rowspan=\"$rowspan\"" : "") . ">$cell_content</td>";
            mysqli_data_seek($result, 0);
        }
        echo "</tr>";
    }

    echo "</tbody>
    </table>";
}
?>