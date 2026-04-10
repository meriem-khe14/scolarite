<?php
session_start();
require_once 'db.php';

$erreur = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $identifiant  = trim($_POST['identifiant']);
    $mot_de_passe = trim($_POST['mot_de_passe']);
    $role         = $_POST['role'];

    // ========== ÉTUDIANT ==========
    if ($role === 'etudiant') {

        $sql  = "SELECT * FROM etudiant WHERE matricule = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $identifiant);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $etudiant = $result->fetch_assoc();

            // ✅ CORRIGÉ : mot_de_passe avec underscore
            if ($mot_de_passe === $etudiant['mot_de_passe']) {

                $_SESSION['user_id']   = $etudiant['id'];
                $_SESSION['user_nom']  = $etudiant['nom'];
                $_SESSION['user_role'] = 'etudiant';

                $date_naissance_formatee = date('dmY', strtotime($etudiant['date_naissance']));

                if ($mot_de_passe === $date_naissance_formatee) {
                    $_SESSION['premier_connexion'] = true;
                    header("Location: changer_mdp.php");
                    exit();
                } else {
                    header("Location: dashboard_etudiant.php");
                    exit();
                }

            } else {
                $erreur = "Matricule ou mot de passe incorrect.";
            }
        } else {
            $erreur = "Matricule ou mot de passe incorrect.";
        }
        $stmt->close();

    // ========== ENSEIGNANT ==========
    } elseif ($role === 'enseignant') {

        $sql  = "SELECT * FROM enseignants WHERE email = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $identifiant);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $enseignant = $result->fetch_assoc();
            // ✅ CORRIGÉ : mot_de_passe avec underscore
            if ($mot_de_passe === $enseignant['mot_de_passe']) {
                $_SESSION['user_id']   = $enseignant['id'];
                $_SESSION['user_nom']  = $enseignant['nom'];
                $_SESSION['user_role'] = 'enseignant';
                header("Location: dashboard_enseignant.php");
                exit();
            } else {
                $erreur = "Email ou mot de passe incorrect.";
            }
        } else {
            $erreur = "Email ou mot de passe incorrect.";
        }
        $stmt->close();

    // ========== ADMIN ==========
    } elseif ($role === 'admin') {

        $sql  = "SELECT * FROM admin WHERE email = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("s", $identifiant);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $admin = $result->fetch_assoc();
            // ✅ CORRIGÉ : mot_de_passe avec underscore
            if ($mot_de_passe === $admin['mot_de_passe']) {
                $_SESSION['user_id']   = $admin['id'];
                $_SESSION['user_nom']  = $admin['nom'];
                $_SESSION['user_role'] = 'admin';
                header("Location: dashboard_admin.php");
                exit();
            } else {
                $erreur = "Email ou mot de passe incorrect.";
            }
        } else {
            $erreur = "Email ou mot de passe incorrect.";
        }
        $stmt->close();
    }
}
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connexion — Scolarité USTHB</title>
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
            max-width: 420px;
        }
        .logo { text-align: center; margin-bottom: 28px; }
        .logo h1 { font-size: 22px; font-weight: 700; color: #1a3a6b; }
        .logo p  { font-size: 13px; color: #6b7280; margin-top: 4px; }
        .form-group { margin-bottom: 18px; }
        label { display: block; font-size: 13px; font-weight: 600; color: #374151; margin-bottom: 6px; }
        input, select {
            width: 100%; padding: 10px 14px;
            border: 1px solid #d1d5db; border-radius: 8px;
            font-size: 14px; color: #111827;
            background: #f9fafb; outline: none;
        }
        input:focus, select:focus { border-color: #1a3a6b; background: #fff; }
        .erreur {
            background: #fef2f2; border: 1px solid #fca5a5;
            color: #dc2626; padding: 10px 14px;
            border-radius: 8px; font-size: 13px; margin-bottom: 16px;
        }
        .btn {
            width: 100%; padding: 12px;
            background: #1a3a6b; color: #fff;
            border: none; border-radius: 8px;
            font-size: 15px; font-weight: 600; cursor: pointer;
        }
        .btn:hover { background: #14306b; }
        .hint { text-align: center; font-size: 12px; color: #9ca3af; margin-top: 18px; }
    </style>
</head>
<body>
<div class="container">
    <div class="logo">
        <h1>🎓 USTHB</h1>
        <p>Système de gestion de la scolarité</p>
    </div>

    <?php if ($erreur): ?>
        <div class="erreur">❌ <?= htmlspecialchars($erreur) ?></div>
    <?php endif; ?>

    <form method="POST">
        <div class="form-group">
            <label>Vous êtes :</label>
            <select name="role" required>
                <option value="etudiant">Étudiant</option>
                <option value="enseignant">Enseignant</option>
                <option value="admin">Administrateur</option>
            </select>
        </div>
        <div class="form-group">
            <label>Matricule / Email</label>
            <input type="text" name="identifiant" placeholder="Votre matricule ou email" required>
        </div>
        <div class="form-group">
            <label>Mot de passe</label>
            <input type="password" name="mot_de_passe" placeholder="Votre mot de passe" required>
        </div>
        <button type="submit" class="btn">Se connecter</button>
    </form>

    <p class="hint">Première connexion ? Mot de passe = date de naissance (JJMMAAAA)<br>Exemple : 16082004</p>
</div>
</body>
</html>