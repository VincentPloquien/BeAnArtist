<?php
require_once(__DIR__ . '/../utils/session.php');
require_once(__DIR__ . '/../utils/redirect_admin.php');
require_once(__DIR__ . '/../utils/database.php');
$DB = (new Database())->getDB();

$utilisateur = intval($_SESSION["numUtilisateur"]);

if (!isset($_POST["id"])) {
    header("Location: /index.php");
    exit();
}
$id = intval($_POST["id"]);

if (!isset($_FILES["dessin"])) {
    var_dump($_FILES);
    exit();
    $_SESSION["error"] = "Aucun dessin n'a été envoyé";
    header("Location: concours.php?id=" . $id);
    exit();
}

$commentaire = $_POST["commentaire"];

if ($_FILES["dessin"]["error"] !== UPLOAD_ERR_OK) {
    exit("Erreur PHP : " . $_FILES["dessin"]["error"]);
}

$res_concours = $DB->query("SELECT numConcours, description, dateDebut, dateFin, etat FROM Concours WHERE numConcours = '${id}';");
if (!$res_concours) {
    exit("Erreur SQL");
}

if ($res_concours->num_rows == 0) {
    $_SESSION["error"] = "Le concours n'existe pas";
    header("Location: concours.php?id=" . $id);
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

if ($role != "compétiteur") {
    $_SESSION["error"] = "Vous ne pouvez pas faire ça";
} else {
    $svg = htmlspecialchars(file_get_contents($_FILES["dessin"]["tmp_name"]));

    $res = $DB->query("INSERT INTO Dessin (utilisateur, concours, commentaire, dateRemise, leDessin) VALUES ('${utilisateur}', '${id}', '${commentaire}', NOW(), '${svg}');");
    if (!$res) {
        exit("Erreur SQL : " . $DB->error);
    }

    $_SESSION["success"] = "Votre dessin est maintenant en ligne !";
}

header("Location: concours.php?id=" . $id);
exit();