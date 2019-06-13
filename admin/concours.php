<?php

session_start();
require_once('../utils/redirect_nonadmin.php');
require_once('../utils/database.php');
$DB = (new Database())->getDB();

$description = $_POST["description"];
$dateDebut = $_POST["dateDebut"];
$dateFin = $_POST["dateFin"];
$president = intval($_POST["president"]);

if (isset($description) && isset($dateDebut) && isset($dateFin) && isset($president)) {
    $res_concours = $DB->query("INSERT INTO Concours (description, dateDebut, dateFin, etat)
    VALUES ('${description}', '${dateDebut}', '${dateFin}', 'pas commencé');");

    $res_participation = $DB->query("INSERT INTO Participation (utilisateur, concours, role)
    VALUES ('${president}', '" . $DB->insert_id . "', 'président');");
    
    if (!$res_concours || !$res_participation) {
        exit("Erreur SQL");
    } else {
        $_SESSION["success"] = "Le concours « ${description} » a bien été ajouté.";
    }
}

require_once('../template/header.php');
?>
<h1>Gestion des concours</h1>

<div>
    <h2>Liste des concours</h2>
    <table>
        <thead>
            <tr>
                <th>n°</th>
                <th>Description</th>
                <th>Date de début</th>
                <th>Date de fin</th>
                <th>Etat</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <?php
                $res = $DB->query("SELECT numConcours, description, dateDebut, dateFin, etat FROM Concours;");
                if (!$res) {
                    exit("Erreur SQL");
                }
                
                while ($row = $res->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>${row['numConcours']}</td>";
                    echo "<td>${row['description']}</td>";
                    echo "<td>${row['dateDebut']}</td>";
                    echo "<td>${row['dateFin']}</td>";
                    echo "<td>" . mb_strtoupper(mb_substr($row["etat"], 0, 1)) . mb_substr($row["etat"], 1) . "</td>";
                    echo "<td><a href='#'>Modifier</a></td>";
                    echo "<td><a href='#'>Supprimer</a></td>";
                    echo "</tr>";
                }
            ?>
        </tbody>
    </table>
</div>

<div>
    <h2>Ajout d'un concours</h2>
    <form method="post" class="form">
        <div class="form-item">
            <label for="description">Description : </label>
            <input type="text" name="description" id="description" required>
        </div>
        <div class="form-item">
            <div class="form-split">
                <label for="dateDebut">Date de début : </label>
                <input type="date" name="dateDebut" id="dateDebut" required>
            </div>
            <div class="form-split">
                <label for="dateFin">Date de fin : </label>
                <input type="date" name="dateFin" id="dateFin" required>
            </div>
        </div>
        <div class="form-item">
            <label for="president">Président : </label>

            <select name="president" id="president" required>
            <?php
                $res_utilisateurs = $DB->query("SELECT numUtilisateur, nom, prenom FROM Utilisateur WHERE estAdmin = '0'");

                if ($res_utilisateurs->num_rows == 0) {
                    echo "<option disabled>Aucun utilisateur possible</option>";
                } else {
                    while ($row = $res_utilisateurs->fetch_assoc()) {
                        echo "<option value='${row['numUtilisateur']}'>${row['nom']} ${row['prenom']}</option>";
                    }
                }
            ?>
            </select>
        </div>

        <input type="submit" value="Ajouter">
    </form>
</div>

<?php
require_once('../template/footer.php');
?>