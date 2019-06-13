<?php

require_once(__DIR__ . '/utils/session.php');

if (isset($_SESSION["login"])) {
    header("Location: /listeConcours.php");
}

require_once(__DIR__ . '/template/header.php');
require_once(__DIR__ . '/utils/database.php');
$DB = (new Database())->getDB();
?>

<?php if ($DB->connect_errno): ?>
<div class="error mysql">
<?php
    echo ("Echec lors de la connexion à MySQL : (" . $DB->connect_errno . ") " . $DB->connect_error);
?>
</div>
<?php endif; ?>

<form action="retourIndex.php" method="post" class="form-connection">
    <div class="form-item">
        <label for="login">Nom d'utilisateur : </label>
        <input type="text" name="login" id="login" required>
    </div>
    <div class="form-item">
        <label for="password">Mot de passe : </label>
        <input type="password" name="password" id="password" required>
    </div>
    
    <input type="submit" value="Se connecter">
</form>


<?php
require_once('template/footer.php');
?>