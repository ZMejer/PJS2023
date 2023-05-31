<?php
include 'connection.php';

function schedule()
{
    $field_of_study = $_SESSION['major'];
    $semester = $_SESSION['semester'];
    $conn = connection();
    //echo $field_of_study . " " . $semester;

    $query = "SELECT id FROM fields_of_study WHERE name = '$field_of_study'";
    $result = mysqli_query($conn, $query);
    $row = mysqli_fetch_assoc($result);
    $field_of_study_id = $row['id'];

    $query = "SELECT id, subject, day, beginning_time, end_time, lecturer, type FROM schedules WHERE field_of_study_id = '$field_of_study_id' AND semester = '$semester'";
    $result = mysqli_query($conn, $query);

    $hours = array();
    for ($h = 8; $h <= 20; $h++) {
        for ($m = 0; $m < 60; $m += 15) {
            $hours[] = sprintf('%02d:%02d', $h, $m);
        }
    }

    echo "<form method=\"POST\" action=\"../php_functions/submit_schedule.php\"><table class=\"table table-bordered\">
    <thead>
        <tr>
            <th></th>
            <th class=\"col-md-2\" colspan=\"12\">Poniedziałek</th>
            <th class=\"col-md-2\" colspan=\"12\">Wtorek</th>
            <th class=\"col-md-2\" colspan=\"12\">Środa</th>
            <th class=\"col-md-2\" colspan=\"12\">Czwartek</th>
            <th class=\"col-md-2\" colspan=\"12\">Piątek</th>
        </tr>
    </thead>
    <tbody id=\"tableBody\">";
    $cell_type = '';
    foreach ($hours as $hour) {
        $cell_type = '';
        echo "<tr><td>$hour</td>";
        for ($d = 1; $d <= 5; $d++) {
            $cell_content = '';
            $colspan = 12;
            $rowspan = 0;
            $cell_added = false;
            $conflicts = array();
            while ($schedule = mysqli_fetch_assoc($result)) {
                if (intval($schedule['day']) == $d && strtotime($schedule['beginning_time']) == strtotime($hour)) { 
                    $end_time = $schedule['end_time'];
                    $conflicts[] = $schedule;
                }
            }
            $num_conflicts = count($conflicts);
            if ($num_conflicts > 0) {
                $colspan = floor(12 / $num_conflicts);
                $rowspan = ceil((strtotime($conflicts[0]['end_time']) - strtotime($hour)) / 900);
                $cell_content = $conflicts[0]['subject'];
                $cell_type = $conflicts[0]['type'];
                $cell_added = true;
            }
            $class_name = '';
            switch ($cell_type) {
                case 'seminar':
                    $class_name = 'table-warning';
                    $type = 'konwersatoria';
                    break;
                case 'labolatories':
                    $class_name = 'table-success';
                    $type = 'laboratoria';
                    break;
                case 'lecture':
                    $class_name = 'table-primary';
                    $type = 'wykład';
                    break;
                default:
                    $class_name = '';
                    break;
            }
            switch ($d) {
                case 1:
                    $day = 'poniedziałek';
                    break;
                case 2:
                    $day = 'wtorek';
                    break;
                case 3:
                    $day = 'środa';
                    break;
                case 4:
                    $day = 'czwartek';
                    break;
                case 5:
                    $day = 'piątek';
                    break;
                default:
                    $day = '';
                    break;
            }
            if ($cell_content) {
                $end_hour = date('H:i', strtotime($conflicts[0]['end_time']));
                $subject_info = 'Rodzaj zajęć: ' . $type . '<br> Prowadzący: ' . $conflicts[0]['lecturer'] .'<br> Dzień: '. $day .'<br> Godzina rozpoczęcia: ' . $hour . '<br> Godzina zakończenia: ' . $end_hour;
                echo "<td data-toggle='popover' data-content='". $subject_info ."' data-html='true' data-title='". $conflicts[0]['subject'] ."'" . ($rowspan > 1 ? " rowspan=\"$rowspan\"" : "") . " colspan=\"$colspan\" class=\"$class_name change-color\" style='text-align:center;'>$cell_content
                <label><input type='checkbox' style='display:none;' name='subjects[]' value='" . $conflicts[0]['id'] . "'></label></td>";
            } else {
                echo "<td" . ($rowspan > 1 ? " rowspan=\"$rowspan\"" : "") . " colspan=\"$colspan\"></td>";
            }

            if ($num_conflicts > 1) {
                for ($i = 1; $i < $num_conflicts; $i++) {
                    $rowspan = ceil((strtotime($conflicts[$i]['end_time']) - strtotime($hour)) / 900);
                    $cell_content = $conflicts[$i]['subject'];
                    $cell_type = $conflicts[$i]['type'];
                    $class_name = '';
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
                    if ($cell_content) {
                        $end_hour = date('H:i', strtotime($conflicts[$i]['end_time']));
                        $subject_info = 'Rodzaj zajęć: ' . $type . '<br> Prowadzący: ' . $conflicts[$i]['lecturer'] .'<br> Dzień: '. $day .'<br> Godzina rozpoczęcia: ' . $hour . '<br> Godzina zakończenia: ' . $end_hour;
                        echo "<td data-toggle='popover' data-content='". $subject_info ."' data-html='true' data-title='". $conflicts[$i]['subject'] ."'" . ($rowspan > 1 ? " rowspan=\"$rowspan\"" : "") . " colspan=\"$colspan\" class=\"$class_name change-color\" style='text-align:center;'>$cell_content
                        <label><input type='checkbox' style='display:none;' name='subjects[]' value='" . $conflicts[$i]['id'] . "'></label></td>";
                    } else {
                        //echo "<td rowspan=\"$rowspan\" colspan=\"$colspan\"></td>";
                    }
                }
                $cell_added = true;
            }

            if (!$cell_added) {
                //echo "<td colspan=\"12\"></td>";
            }

            mysqli_data_seek($result, 0);
        }
        echo "</tr>";
    }
    echo "</tbody>
    </table>
    <div style=\"position: fixed !important; bottom: 10%; right: 10%;\">
        <button class=\"btn btn-success\" type=\"submit\" style=\"width: 300%;\">Zapisz</button>
    </div></form>";

}
?>