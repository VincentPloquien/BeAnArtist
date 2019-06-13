<?php

require_once('utils/redirect_unknown.php');

require_once('template/header.php');
require_once('utils/database.php');
$DB = (new Database())->getDB();
?>

<?php if ($DB->connect_errno): ?>
<div class="error mysql">
<?php
echo ("Echec lors de la connexion à MySQL : (" . $DB->connect_errno . ") " . $DB->connect_error);
?>   
</div>
<?php endif; ?>

<h1>Liste des Concours</h1>

<?php
    $res = $DB->query("SELECT numConcours, description, dateDebut, dateFin FROM Concours;");
    if (!$res) {
        exit("Erreur SQL");
    }
    
    while ($row = $res->fetch_assoc()) {
        echo "<div><h2><a href='/user/concours.php?id=${row['numConcours']}'>${row['description']}</a></h2><p>${row['dateDebut']} - ${row['dateFin']}</p></div>";
    }

    $res->free();
?>

<?php
require_once('template/footer.php');
?>