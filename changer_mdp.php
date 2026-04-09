<?php
// ============================================================
// changer_mdp.php — Changement de mot de passe (1ère connexion)
// ============================================================
session_start();
require_once 'db.php';

// Sécurité : si pas connecté ou pas première connexion → retour login
if (!isset($_SESSION['user_id']) || !isset($_SESSION['premier_connexion'])) {
    header("Location: login.php");
    exit();
}

$erreur = "";
$succes = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nouveau_mdp    = trim($_POST['nouveau_mdp']);
    $confirmer_mdp  = trim($_POST['confirmer_mdp']);

    // ---- Validations ----

    // 1. Les deux champs sont remplis
    if (empty($nouveau_mdp) || empty($confirmer_mdp)) {
        $erreur = "Veuillez remplir tous les champs.";

    // 2. Les deux mots de passe sont identiques
    } elseif ($nouveau_mdp !== $confirmer_mdp) {
        $erreur = "Les deux mots de passe ne correspondent pas.";

    // 3. Minimum 6 caractères
    } elseif (strlen($nouveau_mdp) < 6) {
        $erreur = "Le mot de passe doit contenir au moins 6 caractères.";

    // 4. Ne pas remettre la date de naissance comme mot de passe
    } else {
        // Récupérer la date de naissance de l'étudiant
        $stmt = $conn->prepare("SELECT date_naissance FROM etudiant WHERE id = ?");
        $stmt->bind_param("i", $_SESSION['user_id']);
        $stmt->execute();
        $result = $stmt->get_result();
        $etudiant = $result->fetch_assoc();
        $stmt->close();

        $date_naissance_formatee = date('dmY', strtotime($etudiant['date_naissance']));

        if ($nouveau_mdp === $date_naissance_formatee) {
            $erreur = "Le nouveau mot de passe ne peut pas être votre date de naissance.";
        } else {
            // ---- Tout est bon : mettre à jour le mot de passe ----
            $stmt = $conn->prepare("UPDATE etudiant SET `mot de passe` = ? WHERE id = ?");
            $stmt->bind_param("si", $nouveau_mdp, $_SESSION['user_id']);

            if ($stmt->execute()) {
                // Supprimer le flag première connexion
                unset($_SESSION['premier_connexion']);
                $succes = "Mot de passe changé avec succès ! Redirection...";
                // Redirection automatique après 2 secondes
                header("refresh:2;url=dashboard_etudiant.php");
            } else {
                $erreur = "Erreur lors de la mise à jour. Réessayez.";
            }
            $stmt->close();
        }
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Changer mot de passe — USTHB</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f4f8;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.10);
            padding: 40px 36px;
            width: 100%;
            max-width: 440px;
        }
        .titre { text-align: center; margin-bottom: 24px; }
        .titre h1 { font-size: 20px; font-weight: 700; color: #1a3a6b; }
        .titre p  { font-size: 13px; color: #6b7280; margin-top: 6px; }

        .alerte {
            padding: 12px 16px;
            border-radius: 8px;
            font-size: 13px;
            margin-bottom: 20px;
        }
        .alerte-info {
            background: #eff6ff;
            border: 1px solid #93c5fd;
            color: #1d4ed8;
        }
        .erreur {
            background: #fef2f2;
            border: 1px solid #fca5a5;
            color: #dc2626;
        }
        .succes {
            background: #f0fdf4;
            border: 1px solid #86efac;
            color: #16a34a;
        }

        .form-group { margin-bottom: 18px; }
        label { display: block; font-size: 13px; font-weight: 600; color: #374151; margin-bottom: 6px; }
        input {
            width: 100%; padding: 10px 14px;
            border: 1px solid #d1d5db; border-radius: 8px;
            font-size: 14px; color: #111827;
            background: #f9fafb; outline: none;
        }
        input:focus { border-color: #1a3a6b; background: #fff; }

        .regles {
            background: #f8fafc;
            border-radius: 8px;
            padding: 12px 16px;
            margin-bottom: 20px;
            font-size: 12px;
            color: #6b7280;
        }
        .regles p { font-weight: 600; color: #374151; margin-bottom: 6px; }
        .regles li { margin-left: 16px; margin-bottom: 3px; }

        .btn {
            width: 100%; padding: 12px;
            background: #1a3a6b; color: #fff;
            border: none; border-radius: 8px;
            font-size: 15px; font-weight: 600; cursor: pointer;
        }
        .btn:hover { background: #14306b; }
    </style>
</head>
<body>
<div class="container">
    <div class="titre">
        <h1>🔐 Changer votre mot de passe</h1>
        <p>Bonjour <strong><?= htmlspecialchars($_SESSION['user_nom']) ?></strong>, c'est votre première connexion.</p>
    </div>

    <!-- Message d'info -->
    <div class="alerte alerte-info">
        ℹ️ Pour votre sécurité, vous devez choisir un nouveau mot de passe personnel.
    </div>

    <!-- Messages erreur / succès -->
    <?php if ($erreur): ?>
        <div class="alerte erreur">❌ <?= htmlspecialchars($erreur) ?></div>
    <?php endif; ?>

    <?php if ($succes): ?>
        <div class="alerte succes">✅ <?= htmlspecialchars($succes) ?></div>
    <?php endif; ?>

    <!-- Règles du mot de passe -->
    <div class="regles">
        <p>Règles du mot de passe :</p>
        <ul>
            <li>Minimum 6 caractères</li>
            <li>Ne peut pas être votre date de naissance</li>
            <li>Les deux champs doivent être identiques</li>
        </ul>
    </div>

    <form method="POST">
        <div class="form-group">
            <label>Nouveau mot de passe</label>
            <input type="password" name="nouveau_mdp" placeholder="Entrez votre nouveau mot de passe" required>
        </div>
        <div class="form-group">
            <label>Confirmer le mot de passe</label>
            <input type="password" name="confirmer_mdp" placeholder="Répétez le mot de passe" required>
        </div>
        <button type="submit" class="btn">Enregistrer le mot de passe</button>
    </form>
</div>
</body>
</html>