<?php
    require_once('utils/database.php');

    session_start();
    session_destroy();
    $_SESSION["success"] = "Vous avez bien été déconnecté.";
    header("Location: /connexion.php");
?>