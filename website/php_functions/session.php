<?php
session_start();
  if(isset($_SESSION['id'])){

    function navbar(){
      echo "<li class=\"nav-item\">
        <a class=\"nav-link\" href=\"schedule.php\">Plan zajęć</a>
      </li>
      <li class=\"nav-item\">
        <a class=\"nav-link\" href=\"timetable.php\">Terminarz</a>
      </li>";
    }
    function button(){
      echo '<a href="../php_functions/logout_function.php" class="btn btn-outline-light">Wyloguj</a>';
    }

    function schedules(){
      $conn = mysqli_connect("localhost", "root", "", "timetables") or die ("Connection failed: " . mysqli_connect_error());
      $id = $_SESSION['id'];
      $sql = "SELECT * FROM users_schedules WHERE user_id = $id";
      $result = mysqli_query($conn, $sql);
      $row = mysqli_fetch_assoc($result);
      if(mysqli_num_rows($result) > 0){
        include 'users_schedule.php';
        users_schedule();
      }
      else {
        include 'schedule_function.php';
        schedule();
      }
      
    }

    function introduction(){
      echo "<h2 style=\"text-align:center;\">Witaj w Asystencie Zapisów</h2>";
      echo "<h4 style=\"text-align:center;\">Jesteś zalogowany/a jako " . $_SESSION['login'] . "</h4><br>";
      echo "<div style=\"text-align:center;\"><a style=\"color:white;\" type=\"button\" href=\"schedule.php\" class=\"btn btn-success\">Plan zajęć</a>";
      echo "<a type=\"button\" class=\"btn btn-warning ml-3\" href=\"timetable.php\">Terminarz</a></div>";
    }
    function timetables(){
      include 'timetable_function.php';
      timetable();
    }
  }
  else{
    function navbar(){
      echo '';
    }
    function button(){
      echo '<button type="button" class="btn btn-outline-light" data-toggle="modal" data-target="#loginModal">Zaloguj
      się</button>';
    }

    function schedules(){
      echo "<h2 style=\"text-align:center;\">Zaloguj się, aby zobaczyć plan zajęć</h2>";
    }

    function introduction(){
      echo "<h2 style=\"text-align:center;\">Witaj w Asystencie Zapisów</h2>";
      echo "<h4 style=\"text-align:center;\">Dołącz już teraz i ułóż swój plan na przyszły semestr</h4><br>";
      echo "<div style=\"text-align:center;\"><button type=\"button\" class=\"btn btn-success\" data-toggle=\"modal\" data-target=\"#loginModal\">Zaloguj się</button>";
      echo "<a type=\"button\" class=\"btn btn-warning ml-3\" href=\"signup.php\">Stwórz konto</a></div>";

    }
    function timetables(){
      echo "<h2 style=\"text-align:center;\">Zaloguj się, aby zobaczyć terminarz</h2>";
    }
  }
?>