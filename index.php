
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="d-flex flex-column min-vh-100">
    <div class="container"> <?php if (isset($_GET['message'])) : ?>
            <p> <?= $_GET['message'] ?></p>
        <?php endif; ?>


        <form action="login.php" method="post">
            <h1>Login</h1>
            <input type="text" name="mail" />
            <input type="password" name="mdp" />
            <input type="submit" value="Submit" />


        </form>

    </div>

</body>

</html>