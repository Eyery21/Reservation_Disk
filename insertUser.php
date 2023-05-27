<?php




require "DataBase.php";
var_dump($_POST);


if (
    !empty($_POST['prenom']) && isset($_POST['prenom']) &&
    !empty($_POST['mail']) && isset($_POST['mail']) &&
    !empty($_POST['mdp']) && isset($_POST['mdp'])
) {
    var_dump($_POST);

    $prenom = ($_POST['prenom']);
    $mail = ($_POST['mail']);
    $mdp = ($_POST['mdp']); //hash le mdp dans la bdd


    // htmlspecialchars empèche une balise <script> de s'enclencher dans le formulaire

    $connexion = connectionDB();
    var_dump($connexion);
    $appelBD = $connexion->prepare('
    INSERT INTO `users`( 
        `USER_NAME`,
        `USER_MAIL`,
        `USER_PASSWORD`
        ) 
        VALUES (?,?,?)
    
    
    ');
    // var_dump($appelBD);

    $statut = $appelBD->execute([$prenom, $mail, $mdp]);
    var_dump($statut);

    if ($statut) {
        // redirection vers le form avec un msg confirm 
        header('location:index.php?message=votre compte à bien été créer'); // une URL --> paramétre msg=valuer
        var_dump($statut);

        echo "votre compte à bien été créer";
        // header('location:index.php?message=votre compte à bien été créer'); // une URL --> paramétre msg=valuer
    } else {
        // une redirection vers le form avec un msg d'erreur 
        var_dump($statut);
        echo "votre compte n'as pas été créé";

        // header('location:index.php?message=une erreur est survenue!!');
    }
}
