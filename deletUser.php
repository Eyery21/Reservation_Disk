<?php


// session_start();

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
    DELETE FROM `user`
    WHERE `USER_ID` = ?
        
        
    ');

    // $statut =  $appelBD->execute(array(


    //    $_SESSION['user']['id_user']


    // ));
    var_dump($appelBD->errorInfo());    // $statut = $appelBD->execute($prenom, $mail, $mdp);
    var_dump($statut);
    echo "$statut";
    if ($statut) {
        // redirection vers le form avec un msg confirm 
        // header('location:../club.php?message=votre compte à bien été supprimer');
        // $appelBD->closeCursor();
        // une URL --> paramétre msg=valuer
    } else {
        // une redirection vers le form avec un msg d'erreur 
        // header('location:../club.php?message=une erreur est survenue lors de la suppression de lutilisateur!!');
        // $appelBD->closeCursor();
    }
}
