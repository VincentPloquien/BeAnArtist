<?php

session_start();

if (isset($_SESSION["login"])) {
    header("Location: /listeConcours.php");
} else {
    header("Location: /connexion.php");
}

