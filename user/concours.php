<?php

session_start();
require_once('../utils/redirect_admin.php');
require_once('../utils/database.php');
$DB = (new Database())->getDB();

$concours = intval($_GET["id"]);
$utilisateur = intval($_SESSION["numUtilisateur"]);

if (!isset($concours) ) {
    header("Location: /index.php");
} else {
    $res_concours = $DB->query("SELECT numConcours, description, dateDebut, dateFin, etat FROM Concours
    WHERE numConcours = '${concours}';");

    if (!$res_concours) {
        exit("Erreur SQL");
    }

    $concours = $res_concours->fetch_assoc();

    $res_concours->free();
}

$res_role = $DB->query("SELECT role FROM Participation WHERE utilisateur = '${utilisateur}' AND concours = '${concours['numConcours']}';");
if (!$res_role) {
    exit("Erreur SQL");
}

$role = "";
if ($res_role->num_rows == 0) {
    $role = "invité";
} else {
    $role = $res_role->fetch_assoc()["role"];
}


$res_role->free();

require_once('../template/header.php');
?>

<?php
    echo "<h1>Gestion du concours « ${concours['description']} »</h1>";
    echo "<p>Vous êtes connectés en tant que : ${role}</p>";
?>

<?php
require_once('../template/footer.php');
?>