<!DOCTYPE html>
<html lang="pl">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Asystent zapisów</title>
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="icon" type="image/x-icon" href="./assets/favicon.png">
</head>
<?php
include '../php_functions/session.php';
?>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
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
                        <a class="nav-link" href="signup.php">Rejestracja</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="schedule.php">Plan zajęć</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="regulations.php">Regulamin</a>
                    </li>
                </ul>
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <?php button(); ?>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container" style="margin-top:8em; margin-bottom:8em;">
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th></th>
                    <th class="col-md-2">Poniedziałek</th>
                    <th class="col-md-2">Wtorek</th>
                    <th class="col-md-2">Środa</th>
                    <th class="col-md-2">Czwartek</th>
                    <th class="col-md-2">Piątek</th>
                </tr>
            </thead>
            <tbody id="tableBody">
            </tbody>
        </table>
    </div>
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
                    <form method="POST" action="../php_functions/login_function.php">
                        <div class="form-group">
                            <label for="login">Login:</label>
                            <input type="text" class="form-control" id="login" name="login" placeholder="Wpisz login">
                        </div>
                        <div class="form-group">
                            <label for="loginPassword">Hasło:</label>
                            <input type="password" class="form-control" id="loginPassword" name="loginPassword"
                                placeholder="Wpisz hasło">
                        </div>
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="rememberMe">
                            <label class="form-check-label" for="rememberMe">Zapamiętaj mnie</label>
                        </div>
                        <div class="form-group">
                            Nie posiadasz konta? <a href="signup.php">Zarejestruj się.</a>
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-dark" data-dismiss="modal">Anuluj</button>
                    <button type="submit" class="btn btn-success">Zaloguj się</button>
                    </form>
                </div>
            </div>
        </div>

    </div>
    <footer class="footer fixed-bottom p-3 bg-dark">
        <div class="container">
            <span class="text-muted pull-right">Asystent zapisów &copy; 2023</span><br>
            <span class="text-muted">Book icons created by<a href="https://www.flaticon.com/free-icons/book"
                    title="book icons"> Freepik - Flaticon</a></span>

        </div>
    </footer>
    <script src="./scripts/schedule.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>

</html>