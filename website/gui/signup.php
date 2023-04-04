<!DOCTYPE html>
<html lang="pl">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Asystent zapisów</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="./css/style.css">
</head>
<?php
include '../php_functions/signup_function.php';
if(!empty($_POST['surname']) && !empty($_POST['email']) && !empty($_POST['password']) && !empty($_POST['confirmPassword']) && !empty($_POST['terms']) && !empty($_POST['faculty']) && !empty($_POST['major']) && !empty($_POST['year'])){
  register();
}

?>

<body>
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand d-flex" href="index.php">Asystent zapisów</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="index.php">Strona główna</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" href="signup.php">Rejestracja</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="schedule.php">Plan zajęć</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="regulations.php">Regulamin</a>
          </li>
        </ul>
        <ul class="navbar-nav ml-auto">
          <li class="nav-item">
            <button type="button" class="btn btn-outline-light" data-toggle="modal" data-target="#loginModal">Zaloguj
              się</button>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="loginModalLabel">Logowanie</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form>
            <div class="form-group">
              <label for="inputEmail">Login:</label>
              <input type="email" class="form-control" id="inputEmail" placeholder="Wpisz login">
            </div>
            <div class="form-group">
              <label for="inputPassword">Hasło:</label>
              <input type="password" class="form-control" id="inputPassword" placeholder="Wpisz hasło">
            </div>
            <div class="form-check">
              <input type="checkbox" class="form-check-input" id="rememberMe">
              <label class="form-check-label" for="rememberMe">Zapamiętaj mnie</label>
            </div>
            <div class="form-group">
              Nie posiadasz konta? <a href="signup.php">Zarejestruj się.</a>
            </div>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-dark" data-dismiss="modal">Anuluj</button>
          <button type="button" class="btn btn-success">Zaloguj się</button>
        </div>
      </div>
    </div>
  </div>

  <div class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-4">
        <h1 class="h3">Rejestracja</h1>
        <form class="mt-4" method="POST" action="<?php echo $_SERVER['PHP_SELF']; ?>">
          <div class="mb-3">
            <input type="text" class="form-control" id="name" name="name" placeholder="Imię" required>
          </div>
          <div class="mb-3">
            <input type="text" class="form-control" id="surname" name="surname" placeholder="Nazwisko" required>
          </div>
          <div class="mb-3">
            <input type="email" class="form-control" id="email" name="email" placeholder="Email" required>
          </div>
          <div class="mb-3">
            <input class="form-control" list="faculties" id="faculty" name="faculty" placeholder="Wydział" required>
            <datalist id="faculties">
              <?php faculties(); ?>
            </datalist>
          </div>
          <div class="mb-3">
            <input class="form-control" list="majors" id="major" name="major" placeholder="Kierunek" required>
            <datalist id="majors">
              <?php majors(); ?>
            </datalist>
          </div>
          <div class="mb-3">
            <input class="form-control" list="years" id="year" name="year" placeholder="Rok studiów" required>
            <datalist id="years">
              <option value="1">
              <option value="2">
              <option value="3">
            </datalist>
          </div>
          <div class="mb-3">
            <input type="password" class="form-control" id="password" name="password" placeholder="Hasło" required>
          </div>
          <div class="mb-3">
            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword"
              placeholder="Potwierdź hasło" required>
          </div>
          <div class="form-check mb-3">
            <input type="checkbox" class="form-check-input" id="terms" name="terms" required>
            <label class="form-check-label" for="terms">Zgadzam się z <a href="regulations.php">warunkami
                użytkowania</a></label>
          </div>
          <button type="submit" class="btn btn-success">Zarejestruj się</button>
        </form>
      </div>
    </div>
  </div>

  <footer class="footer fixed-bottom p-3 bg-dark">
    <div class="container">
      <span class="text-muted pull-right">Asystent zapisów &copy; 2023</span>
    </div>
  </footer>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>