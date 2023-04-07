<?php
session_start();
  if(isset($_SESSION['id'])){
    echo "Jesteś zalogowany jako " . $_SESSION['login'];
    function button(){
      echo '<a href="../php_functions/logout_function.php" class="btn btn-outline-light">Wyloguj</a>';
    }
  }else{
    echo "Nie jesteś zalogowany";
    function button(){
      echo '<button type="button" class="btn btn-outline-light" data-toggle="modal" data-target="#loginModal">Zaloguj
      się</button>';
    }
  }
?>