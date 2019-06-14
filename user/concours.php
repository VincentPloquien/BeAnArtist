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

require_once('../template/header.php');
?>

    <?php
        echo "<h1>Gestion du concours « ${concours['description']} »</h1>";
        echo "<p>Vous êtes connecté en tant que : ${role}</p>";
    ?>

    <?php
    switch ($role):
        case "invité":
            echo "<a class='button' href='inscriptionCompetiteur.php?id=${id}'>Participer au concours</a>";
            echo "<a class='button' href='inscriptionEvaluateur.php?id=${id}'>Evaluer le concours</a>";
        break;
        case "président":
            ?>
            <form action="changementEtat.php" method="post" class="form">
                <h2>Configuration du concours</h2>
                <?php echo "<input type='hidden' name='id'value='${id}'>"; ?>
                
                <div class="form-item">
                    <label for="etat">Nouvel état : </label>

                    <select name="etat" id="etat" required>
                        <?php
                            $etats_possibles = ['évalué', 'en cours', 'attente', 'pas commencé'];
                            foreach ($etats_possibles as $etat) {
                                if ($etat === $concours['etat']) {
                                    echo "<option value='${etat}' disabled>${etat}</option>";
                                } else {
                                    echo "<option value='${etat}'>${etat}</option>";
                                }
                            }
                        ?>
                    </select>
                </div>
                                
                <input type="submit" value="Modifier">
            </form>
            <?php 
        break;
        case "compétiteur":
            if ($concours["etat"] === "en cours"):
            ?>
            <form action="ajoutDessin.php" method="post" class="form">
                <h2>Ajout d'un dessin</h2>
                <?php echo "<input type='hidden' name='id'value='${id}'>"; ?>
                
                <div class="form-item">
                    <label for="commentaire">Commentaire : </label>
                    <input type="text" name="commentaire">
                </div>

                <div class="form-item">
                    <label for="dessin">Dessin : </label>
                    <input enctype="multipart/form-data" type="file" name="dessin" accept=".svg" required>
                </div>

                <input type="submit" value="Envoyer">
            </form>
            <?php 
            endif;
        break;
        default:
            //
    ?>
        <p>autre</p>

<?php
        break;
    endswitch;
?>

<?php require_once('../template/footer.php'); ?>
