<?php
require_once(__DIR__ . '/../utils/session.php');
require_once(__DIR__ . '/../utils/redirect_admin.php');
require_once(__DIR__ . '/../utils/database.php');
$DB = (new Database())->getDB();

$utilisateur = intval($_SESSION["numUtilisateur"]);

if (!isset($_GET["id"]) || !isset($_GET["etat"])) {
    header("Location: /index.php");
    exit();
}
$id = intval($_GET["id"]);
$etat = $_GET["etat"];

$res_concours = $DB->query("SELECT numConcours, description, dateDebut, dateFin, etat FROM Concours WHERE numConcours = '${id}';");
if (!$res_concours) {
    exit("Erreur SQL");
}

if ($res_concours->num_rows == 0) {
    $_SESSION["error"] = "Le concours n'existe pas";
    header("Location: concours.php");
    exit();
}
$concours = $res_concours->fetch_assoc();
$res_concours->free();

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

if ($role != "président") {
    $_SESSION["error"] = "Vous ne pouvez pas faire ça";
} else {
    $res = $DB->query("UPDATE Concours SET etat = '${etat}' WHERE ${id};");
    if (!$res) {
        exit("Erreur SQL : " . $DB->error);
    }

    $_SESSION["success"] = "Le concours est maintenant : " . $etat;
}

header("Location: concours.php?id=" . $id);
exit();