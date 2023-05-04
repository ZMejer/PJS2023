<?php
include 'connection.php';


function users_schedule()
{
   
    $conn = connection();
   

    $user_id = $_SESSION['id'];
    $query = "SELECT user_id, subject_id from users_schedules where user_id = '$user_id'";
    
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
            $cell_type='';
            $rowspan = 1;
            $cell_content = '';
            while ($schedule = mysqli_fetch_assoc($result)) {
                $q = "SELECT subject, day, beginning_time, end_time, lecturer, type FROM schedules WHERE id = '$schedule[subject_id]'";
                $r = mysqli_query($conn, $q);
                $s = mysqli_fetch_assoc($r);
                if (intval($s['day']) == $d && strtotime($s['beginning_time']) == strtotime($hour)) {
                    $end_time = $s['end_time'];
                    $rowspan = ceil((strtotime($end_time) - strtotime($hour)) / 900);
                    $cell_content = $s['subject'];
                    $cell_type = $s['type'];
                    break;
                }

            }
            switch ($cell_type) {
                case 'seminar':
                    $class_name = 'table-warning';
                    break;
                case 'labolatories':
                    $class_name = 'table-success';
                    break;
                case 'lecture':
                    $class_name = 'table-primary';
                    break;
                default:
                    $class_name = '';
                    break;
            }
            echo "<td class=\"$class_name\"" . ($rowspan > 1 ? " rowspan=\"$rowspan\"" : "") . ">$cell_content</td>";
            mysqli_data_seek($result, 0);
        }
        echo "</tr>";
    }
    echo "</tbody></table>";

}

?>