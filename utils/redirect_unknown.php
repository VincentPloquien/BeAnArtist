<?php

require_once(__DIR__ . '/session.php');

if (!isset($_SESSION["login"])) {
    header("Location: /connexion.php");
    exit;
}
?>