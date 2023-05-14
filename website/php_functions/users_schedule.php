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
/*
    echo "<form method='POST' action='../php_functions/reset_schedule.php'><table style=\"float:left; margin-bottom:150px;\" class=\"table table-bordered col-md-1\">";
    echo "<tbody id=\"tableBody\">";
    echo "<thead><tr><td> </td></tr></thead>";
    foreach ($hours as $hour){
        echo "<tr><td>$hour</td></tr>";
    }
    echo "</tbody>";
    echo "</table>";
    $days = array('Poniedziałek', 'Wtorek', 'Środa', 'Czwartek', 'Piątek');

    for ($d = 1; $d <= 5; $d++) {
        echo "<table class=\"table table-bordered col-md-2\" style='float:left;'>";
        $i = $d - 1;
        echo "<thead><tr><th>" . $days[$i] . "</th></tr></thead>";
        echo "<tbody id=\"tableBody\">";
        foreach ($hours as $hour) {
            $cell_type = '';
            $rowspan_count = 1;
            $cell_content = '';
            $subject_info = '';
            $type = '';
            $q = "SELECT subject, day, beginning_time, end_time, lecturer, type FROM schedules WHERE day = '$d' AND beginning_time = '$hour'";
            $r = mysqli_query($conn, $q);
            $schedule = mysqli_fetch_assoc($r);
            if (mysqli_num_rows($r) > 0) {
                $cell_content = $schedule['subject'];
                $cell_type = $schedule['type'];
                $subject_info = '<br> Prowadzący: ' . $schedule['lecturer'] . '<br> Godzina rozpoczęcia: ' . $hour . '<br> Godzina zakończenia: ' . $schedule['end_time'];
                $rowspan = ceil((strtotime($schedule['end_time']) - strtotime($hour)) / 900);
                $rowspan_count = $rowspan;
                switch ($cell_type) {
                    case 'seminar':
                        $class_name = 'bg-warning';
                        $type = 'Rodzaj zajęć: konwersatoria';
                        break;
                    case 'labolatories':
                        $class_name = 'bg-success';
                        $type = 'Rodzaj zajęć: laboratoria';
                        break;
                    case 'lecture':
                        $class_name = 'bg-primary';
                        $type = ' Rodzaj zajęć: wykład';
                        break;
                    default:
                        $class_name = '';
                        $type = '';
                        break;
                }
                echo "<tr><td data-toggle='popover' data-content='" . $type . $subject_info . "' data-html='true' data-title='" . $cell_content . "' style='text-align:center;' class=\"$class_name\"" . ($rowspan > 1 ? " rowspan=\"$rowspan\"" : "") . ">$cell_content</td></tr>";
            } else {
                    echo "<tr><td> </td></tr>";
            }
        }
        echo "</tbody>";
        echo "</table>";
    }
    */
    echo "<form method='POST' action='../php_functions/reset_schedule.php'><table class=\"table table-bordered\">
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
            $cell_type = '';
            $rowspan = 1;
            $cell_content = '';
            $subject_info = '';
            $type = '';
            while ($schedule = mysqli_fetch_assoc($result)) {
                $q = "SELECT subject, day, beginning_time, end_time, lecturer, type FROM schedules WHERE id = '$schedule[subject_id]'";
                $r = mysqli_query($conn, $q);
                $s = mysqli_fetch_assoc($r);
                if (intval($s['day']) == $d && strtotime($s['beginning_time']) == strtotime($hour)) {
                    $end_time = $s['end_time'];
                    $rowspan = ceil((strtotime($end_time) - strtotime($hour)) / 900);
                    $cell_content = $s['subject'];
                    $cell_type = $s['type'];
                    $end_hour = date('H:i', strtotime($s['end_time']));

                    $subject_info = '<br> Prowadzący: ' . $s['lecturer'] . '<br> Godzina rozpoczęcia: ' . $hour . '<br> Godzina zakończenia: ' . $end_hour;
                    break;
                }

            }
            switch ($cell_type) {
                case 'seminar':
                    $class_name = 'bg-warning';
                    $type = 'Rodzaj zajęć: konwersatoria';
                    break;
                case 'labolatories':
                    $class_name = 'bg-success';
                    $type = 'Rodzaj zajęć: laboratoria';
                    break;
                case 'lecture':
                    $class_name = 'bg-primary';
                    $type = ' Rodzaj zajęć: wykład';
                    break;
                default:
                    $class_name = '';
                    $type = '';
                    break;
            }

            echo "<td data-toggle='popover' data-content='" . $type . $subject_info . "' data-html='true' data-title='" . $cell_content . "' style='text-align:center;' class=\"$class_name\"" . ($rowspan > 1 ? " rowspan=\"$rowspan\"" : "") . ">$cell_content</td>";
            mysqli_data_seek($result, 0);
        }
        echo "</tr>";
    }
    echo "</tbody></table>
    <div style=\"position: fixed !important; bottom: 10%; right: 10%;\">
        <button class=\"btn btn-outline-dark\" type=\"submit\" style=\"width: 300%;\">Reset</button>
    </div></form>";

}

?>