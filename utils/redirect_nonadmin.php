<?php
require_once('redirect_unknown.php');

if (!$_SESSION["estAdmin"]) {
    $_SESSION["error"] = "Cette page est reservée aux administrateurs.";
    header("Location: /index.php");
    exit;
}
?>