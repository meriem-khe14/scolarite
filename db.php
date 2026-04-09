<?php
// db.php : Fichier de connexion à la base de données

$host = "localhost";      // Nom du serveur
$user = "root";           // Utilisateur MySQL par défaut sous XAMPP)
$password = "";           // Mot de passe 
$dbname = "scolarite";    // Nom de la base de données

// Création de la connexion
$conn = new mysqli($host, $user, $password, $dbname); //Crée la connexion entre PHP et MySQL en utilisant les 4 variables définies avant. Le résultat est stocké dans $conn 

// Vérification de la connexion
if ($conn->connect_error) {
    die("Échec de la connexion : " . $conn->connect_error);
}

?>