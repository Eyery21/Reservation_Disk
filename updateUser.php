<?php
session_start();

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

    $appelBD = $connexion->prepare('
    UPDATE `users`
    SET 
        `USER_NAME` = ?,
        `USER_MAIL` = ?,
        `USER_PASSWORD` =?


    WHERE `USER_ID`= ?
        
        ');
    // $statut = $appelBD->execute([$prenom, $mail, $mdp]);
    $statut =  $appelBD->execute(array(

        $prenom,
        $mail,
        $mdp,
        $_SESSION['user']['id_user']

    ));

    var_dump($appelBD->errorInfo());    // $statut = $appelBD->execute($prenom, $mail, $mdp);
    var_dump($statut);
    echo "$statut";

    if ($statut) {
        // redirection vers le form avec un msg confirm 
        // header('location:shop.php?message=votre compte à bien maj'); // une URL --> paramétre msg=valuer
        var_dump($statut);
    } else {
        // une redirection vers le form avec un msg d'erreur 
        // header('location:index.php?message=une erreur est survenue!!');
        // $appelBD->closeCursor();
        var_dump($statut);
    }
}
