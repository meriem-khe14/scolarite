<?php
require_once 'db.php';

$result = $conn->query("SELECT * FROM etudiant");

if ($result && $result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo " ID: " . $row['id'] . " - Nom: " . $row['nom'] . "<br>";
    }
} else {
    echo " Aucun étudiant trouvé.";
}
?>