<?php
require_once(__DIR__ . '/../utils/session.php');
require_once(__DIR__ . '/../utils/redirect_admin.php');
require_once(__DIR__ . '/../utils/database.php');
$DB = (new Database())->getDB();

$utilisateur = intval($_SESSION["numUtilisateur"]);

if (!isset($_GET["id"]) ) {
    header("Location: /index.php");
    exit();
}
$id = intval($_GET["id"]);

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

if ($role != "invité") {
    $_SESSION["error"] = "Vous avez déjà un rôle !";
} else {
    $res = $DB->query("INSERT INTO Participation (utilisateur, concours, role) VALUES (${utilisateur}, ${id}, 'compétiteur');");
    if (!$res) {
        exit("Erreur SQL : " . $DB->error);
    }

    $_SESSION["success"] = "Vous êtes maintenant inscrit au concours !";
}

header("Location: concours.php?id=" . $id);
exit();