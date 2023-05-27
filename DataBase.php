<?php
function connectionDB()
{

    define("SERVER", 'localhost');
    define('DB', 'site_musique');
    define('USER', 'root');
    define('MDP', '');


    try {

        $connexion = new PDO("mysql:host=" . SERVER . ";dbname=" . DB . ";charset=utf8", USER, MDP);
    } catch (Exception $message) {
        die('message erreur connexion BDD' . $message->getMessage());
    }

    return ($connexion);
}

