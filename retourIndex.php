<?php
require_once('utils/database.php');
$DB = (new Database())->getDB();

$login = $_POST["login"];
$password = $_POST["password"];

$res = $DB->query("SELECT numUtilisateur, nom, prenom, motDePasse, estAdmin FROM Utilisateur WHERE login = '${login}';");
if (!$res) {
    exit("Erreur SQL");
}
$row = $res->fetch_assoc();

session_start();

if ($row["motDePasse"] == $password) {
    $_SESSION["numUtilisateur"] = $row["numUtilisateur"];
    $_SESSION["login"] = $login;
    $_SESSION["nom"] = $row["nom"];
    $_SESSION["prenom"] = $row["prenom"];
    $_SESSION["estAdmin"] = boolval($row["estAdmin"]);

    $res->free();

    $_SESSION["success"] = "Connexion réussie !";

    header("Location: /listeConcours.php");
} else {
    $_SESSION["error"] = "Le nom d'utilisateur ou le mot de passe est invalide.";
    header("Location: /connexion.php");
}
?>