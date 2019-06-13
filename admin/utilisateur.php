<?php

session_start();
require_once('../utils/redirect_nonadmin.php');
require_once('../utils/database.php');
$DB = (new Database())->getDB();


if (isset($_POST["nom"]) && isset($_POST["prenom"]) && isset($_POST["login"]) && isset($_POST["motDePasse"])) {
    $nom = $_POST["nom"];
    $prenom = $_POST["prenom"];
    $adresse = $_POST["adresse"];
    $login = $_POST["login"];
    $motDePasse = $_POST["motDePasse"];
    $estAdmin = boolval($_POST["estAdmin"]);

    $res = $DB->query("INSERT INTO Utilisateur (nom, prenom, adresse, login, motDePasse, estAdmin)
    VALUES ('${nom}', '${prenom}', '${adresse}', '${login}', '${motDePasse}', '${estAdmin}');");
    
    if ($DB->errno == 1062) {
        $_SESSION["error"] = "Un utilisateur avec ce login existe déjà !";
    } else if (!$res) {
        exit("Erreur SQL");
    } else {
        $_SESSION["success"] = "L'utilisateur « ${nom} ${prenom} » a bien été ajouté.";
    }

    $res->free();
}

require_once('../template/header.php');
?>
<h1>Gestion des utilisateurs</h1>

<div>
    <h2>Liste des utilisateurs</h2>
    <table>
        <thead>
            <tr>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Login</th>
                <th>Admin</th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <?php
                $res = $DB->query("SELECT nom, prenom, login, estAdmin FROM Utilisateur;");
                if (!$res) {
                    exit("Erreur SQL");
                }
                
                while ($row = $res->fetch_assoc()) {
                    echo "<tr>";
                    echo "<td>${row['nom']}</td>";
                    echo "<td>${row['prenom']}</td>";
                    echo "<td>${row['login']}</td>";
                    echo "<td>" . ($row['estAdmin'] == '1' ? '✅' : '❌') . "</td>";
                    echo "<td><a href='#'>⚙️</a></td>";
                    echo "<td><a href='#'>🗑️</a></td>";
                    echo "</tr>";
                }
            ?>
        </tbody>
    </table>
</div>

<div>
    <h2>Ajout d'un utilisateur</h2>
    <form method="post" class="form">
        <div class="form-item">
            <label for="nom">Nom : </label>
            <input type="text" name="nom" id="nom" required>
        </div>
        <div class="form-item">
            <label for="prenom">Prénom : </label>
            <input type="text" name="prenom" id="prenom" required>
        </div>
        <div class="form-item">
            <label for="adresse">Adresse : </label>
            <input type="text" name="adresse" id="adresse">
        </div>
        
        <div class="form-item">
            <label for="login">Nom d'utilisateur : </label>
            <input type="text" name="login" id="login" required>
        </div>
        <div class="form-item">
            <label for="motDePasse">Mot de passe : </label>
            <input type="text" name="motDePasse" id="motDePasse" required>
        </div>

        <div class="form-item">
            <label for="estAdmin">Administrateur : </label>
            <input type="checkbox" name="estAdmin" id="estAdmin">
        </div>

        <input type="submit" value="Ajouter">
    </form>
</div>

<?php
require_once('../template/footer.php');
?>