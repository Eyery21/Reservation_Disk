<?php
session_start();

//démarre le gestion de système de session
require 'DataBase.php';



//vérifier la connexion

if 
(
    !empty($_POST['mail']) && isset($_POST['mail']) &&
    !empty($_POST['mdp']) && isset($_POST['mdp'])

)
 {
    $mail = htmlspecialchars($_POST['mail']);
    var_dump($_POST);
    $mdp = htmlspecialchars($_POST['mdp']);

    $connexion = connectionDB();

    $appelDB = $connexion->prepare(
        'SELECT`USER_ID`, `USER_MAIL`, `USER_PASSWORD`, `USER_NAME`


    FROM `users`
    WHERE `USER_MAIL` = ?'


    );
    $appelDB->execute([$mail]);

    $client = $appelDB->fetch();

    if ($client) {

        $test = password_verify($mdp, $client['USER_PASSWORD']);

        if ($test) {

            $_SESSION['user']['id_user'] = $client['USER_ID'];
            $_SESSION['user']['nom_user'] = $client['USER_NAME'];
            header('location:shop.php');
        }
    } else {
        // afficher un message d'erreur
        $message = "votre mot de passe est inncorrect";
    } {
        echo "oups";
        // sinon si le mail n'existe pas 
        // on affiche un message d'erreur 
        $message = "votre adresse mail n'existe pas ";
    } {
        $message = "attention !! tous les champs sont obligatoire";
    }
    require "index.php";
}
