<?php
    session_start();
    setlocale(LC_ALL, "fr_FR.utf8");
    date_default_timezone_set('Europe/Paris');
    mb_internal_encoding("UTF-8");
?>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

        <title>GPI - Etre Un Artiste</title>

        <script> </script>
        <link rel="stylesheet" href="/assets/css/style.css">
    </head>
    <body>
        <header>
            <h1>Etre Un Artiste</h1>
            <p class="subtitle">Concours de dessin en ligne</p>

            <?php
                $CONFIG = require(__DIR__ . "/../utils/config.php");
                if ($CONFIG["debug"]):
            ?>
                <p>$_SESSION: <?php var_dump($_SESSION); ?></p>
                <p>$_POST: <?php var_dump($_POST); ?></p>
            <?php endif; ?>
            <nav>
                <?php if (isset($_SESSION["login"])): ?>
                    <ul>
                            <li><p>Bienvenue <?php echo $_SESSION["prenom"]; ?></p></li>
                            <div class="right">
                                <li><a href="/listeConcours.php">Accueil</a></li>
                                <li><a href="/deconnexion.php">Déconnexion</a></li>
                            </div>
                    </ul>

                    <?php if ($_SESSION["estAdmin"]): ?>
                        <ul class="secondary admin">
                            <li><p>Menu Admin</p></li>
                            <div class="right">
                                <li><a href="/admin/utilisateur.php">Utilisateurs</a></li>
                                <li><a href="/admin/concours.php">Concours</a></li>
                            </div>
                        </ul>
                    <?php else: ?>
                        <ul class="secondary user">
                            <li><p>Menu Utilisateur</p></li>
                            <div class="right">
                                <li><a href="/listeConcours.php">Concours</a></li>
                            </div>
                        </ul>
                    <?php endif; ?>
                <?php endif; ?>
            </nav>
        </header>
        <main>

<?php
if (isset($_SESSION["error"])): ?>
    <div class="msg-box error">
        <?php
        echo($_SESSION["error"]);
        unset($_SESSION["error"]);
        ?>
    </div>
<?php endif; ?>

<?php
if (isset($_SESSION["success"])): ?>
    <div class="msg-box success">
        <?php
        echo($_SESSION["success"]);
        unset($_SESSION["success"]);
        ?>
    </div>
<?php endif; ?>
