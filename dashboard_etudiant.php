<?php
// Tableau de bord de l'étudiant connecté
session_start();

//  verifier si etudiant connecte
// if (!isset($_SESSION['user_id']) || $_SESSION['user_role'] !== 'etudiant') {
//     header("Location: login.php");
//     exit();
// }

// Connexion BDD 
// require_once 'config.php';  // contient $pdo (PDO MySQL)

//Données de l'étudiant  
$etudiant = [
  'matricule' => '20230045',
  'nom'       => 'mechai',
  'prenom'    => 'wissam',
  'email'     => 'm.wissam@gmail.com',
  'niveau'    => 'L2 INFO-ISIL',
  'groupe'    => 'Groupe 2',
  'annee'     => '2025/2026',
];

// Exemple de notes  
$notes = [
  ['module'=>'Bases de données',       'code'=>'BD',   'coeff'=>3, 'note'=>13.50, 'td'=>13.00, 'tp'=>15.00],
  ['module'=>'Algorithmique',           'code'=>'Algo', 'coeff'=>4, 'note'=> 5.00, 'td'=> 7.50, 'tp'=>12.50],
  ['module'=>'Programmation Web',       'code'=>'PWeb', 'coeff'=>3, 'note'=>18.00, 'td'=>0, 'tp'=>12.50],
  ['module'=>'logique mathematique',    'code'=>'LM',   'coeff'=>3, 'note'=>10.50, 'td'=>10.00, 'tp'=>0],
  ['module'=>'systeme d`information',   'code'=>' sysinfo', 'coeff'=>3, 'note'=>10.50, 'td'=>1 2.00, 'tp'=>0],
];

// Calcul de la moyenne générale  
$total_points = 0;
$total_coeff  = 0;
foreach ($notes as $n) {
  $total_points += $n['note'] * $n['coeff'];
  $total_coeff  += $n['coeff'];
}
$moyenne_generale = $total_coeff > 0 ? round($total_points / $total_coeff, 2) : 0;
$statut = $moyenne_generale >= 10 ? 'Admis(e)' : 'Ajourné(e)';
$statut_class = $moyenne_generale >= 10 ? 'success' : 'danger';

// Variables pour header.php
$page_title = 'Mon espace étudiant';
$breadcrumb = ['Tableau de bord' => false];

require_once 'header.php';
?>

<! EN-TÊTE DE BIENVENUE >
<div class="page-header">
  <div>
    <h1>Bienvenue, <?= htmlspecialchars($etudiant['prenom']) ?> 👋</h1>
    <p>résumé de votre situation académique – <?= htmlspecialchars($etudiant['annee']) ?></p>
  </div>
  <a href="releve_etudiant.php" class="btn btn-primary">
    <i class="fa fa-download"></i>
    Télécharger mon relevé
  </a>
</div>

<! CARTES STATISTIQUES >
<div class="stats-grid">

  <div class="stat-card">
    <div class="stat-icon blue"><i class="fa fa-star"></i></div>
    <div>
      <div class="stat-value"><?= $moyenne_generale ?></div>
      <div class="stat-label">Moyenne générale / 20</div>
    </div>
  </div>

  <div class="stat-card">
    <div class="stat-icon <?= $statut_class === 'success' ? 'green' : 'red' ?>">
      <i class="fa fa-<?= $statut_class === 'success' ? 'check' : 'times' ?>"></i>
    </div>
    <div>
      <div class="stat-value" style="font-size:18px;color:var(--<?= $statut_class ?>);">
        <?= htmlspecialchars($statut) ?>
      </div>
      <div class="stat-label">Statut académique</div>
    </div>
  </div>

  <div class="stat-card">
    <div class="stat-icon orange"><i class="fa fa-book"></i></div>
    <div>
      <div class="stat-value"><?= count($notes) ?></div>
      <div class="stat-label">Modules inscrits</div>
    </div>
  </div>

  <div class="stat-card">
    <div class="stat-icon blue"><i class="fa fa-graduation-cap"></i></div>
    <div>
      <div class="stat-value" style="font-size:16px;"><?= htmlspecialchars($etudiant['niveau']) ?></div>
      <div class="stat-label">Niveau d'étude</div>
    </div>
  </div>

</div>

<! CONTENU PRINCIPAL (2 colonnes)  >
<div style="display:grid;grid-template-columns:1fr 340px;gap:24px;align-items:start;">

  <! Colonne gauche : notes  >
  <div>
    <div class="card">
      <div class="card-header">
        <h3><i class="fa fa-star-half-stroke" style="color:var(--accent);margin-right:8px;"></i>Mes notes du semestre</h3>
        <a href="mes_notes.php" class="btn btn-outline btn-sm">
          <i class="fa fa-eye"></i> Voir détail
        </a>
      </div>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>Module</th>
              <th>Code</th>
              <th>Coeff.</th>
              <th>Note TD</th>
              <th>Note TP</th>
              <th>Moyenne</th>
              <th>Statut</th>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($notes as $n): ?>
            <?php $ok = $n['note'] >= 10; ?>
            <tr>
              <td style="font-weight:500;"><?= htmlspecialchars($n['module']) ?></td>
              <td><span class="badge badge-primary"><?= htmlspecialchars($n['code']) ?></span></td>
              <td><?= $n['coeff'] ?></td>
              <td><?= $n['td'] > 0 ? $n['td'] : '–' ?></td>
              <td><?= $n['tp'] > 0 ? $n['tp'] : '–' ?></td>
              <td>
                <strong style="color:var(--<?= $ok ? 'success' : 'danger' ?>);">
                  <?= number_format($n['note'], 2) ?>
                </strong>
              </td>
              <td>
                <span class="badge badge-<?= $ok ? 'success' : 'danger' ?>">
                  <?= $ok ? 'Validé' : 'Non validé' ?>
                </span>
              </td>
            </tr>
            <?php endforeach; ?>
          </tbody>
          <tfoot>
            <tr style="background:#f8fafc;font-weight:700;">
              <td colspan="5" style="text-align:right;padding-right:14px;font-size:13px;color:var(--text-muted);">
                Moyenne générale pondérée
              </td>
              <td style="color:var(--<?= $statut_class ?>);font-size:16px;">
                <?= $moyenne_generale ?> / 20
              </td>
              <td>
                <span class="badge badge-<?= $statut_class ?>"><?= $statut ?></span>
              </td>
            </tr>
          </tfoot>
        </table>
      </div>
    </div>
  </div>

  <! Colonne droite : profil + actions  >
  <div style="display:flex;flex-direction:column;gap:20px;">

    <!Profil  >
    <div class="card">
      <div class="card-header">
        <h3><i class="fa fa-user" style="color:var(--primary-light);margin-right:8px;"></i>Mon profil</h3>
        <a href="profile.php" class="btn btn-outline btn-sm">
          <i class="fa fa-pen"></i>
        </a>
      </div>
      <div class="card-body">

        <!  Avatar  >
        <div style="display:flex;align-items:center;gap:14px;margin-bottom:20px;">
          <div class="user-avatar" style="width:56px;height:56px;font-size:22px;background:var(--primary);">
            <?= strtoupper(substr($etudiant['prenom'],0,1)) ?>
          </div>
          <div>
            <div style="font-weight:700;font-size:15px;">
              <?= htmlspecialchars($etudiant['prenom'].' '.$etudiant['nom']) ?>
            </div>
            <div style="font-size:12px;color:var(--text-muted);">
              <?= htmlspecialchars($etudiant['matricule']) ?>
            </div>
          </div>
        </div>

        <!Infos>
        <?php
        $infos = [
          'fa-id-card'         => ['Matricule',    $etudiant['matricule']],
          'fa-envelope'        => ['Email',         $etudiant['email']],
          'fa-graduation-cap'  => ['Niveau',        $etudiant['niveau']],
          'fa-users'           => ['Groupe',        $etudiant['groupe']],
          'fa-calendar-days'   => ['Année univ.',   $etudiant['annee']],
        ];
        foreach ($infos as $icon => [$label, $val]):
        ?>
        <div style="display:flex;align-items:center;gap:12px;padding:9px 0;
                    border-bottom:1px solid var(--border);font-size:13px;">
          <i class="fa <?= $icon ?>" style="color:var(--primary-light);width:16px;flex-shrink:0;"></i>
          <span style="color:var(--text-muted);flex:1;"><?= $label ?></span>
          <span style="font-weight:500;color:var(--text);"><?= htmlspecialchars($val) ?></span>
        </div>
        <?php endforeach; ?>
        </div>
    </div>

    <! Actions rapides >
    <div class="card">
      <div class="card-header">
        <h3><i class="fa fa-bolt" style="color:var(--accent);margin-right:8px;"></i>Actions rapides</h3>
      </div>
      <div class="card-body" style="display:flex;flex-direction:column;gap:10px;">
        <a href="mes_notes.php" class="btn btn-outline" style="justify-content:flex-start;">
          <i class="fa fa-star" style="color:var(--accent);"></i> Voir toutes mes notes
        </a>
        <a href="releve_etudiant.php" class="btn btn-outline" style="justify-content:flex-start;">
          <i class="fa fa-file-lines" style="color:var(--primary-light);"></i> Mon relevé de notes
        </a>
        <a href="profile.php" class="btn btn-outline" style="justify-content:flex-start;">
          <i class="fa fa-user-pen" style="color:var(--success);"></i> Modifier mon profil
        </a>
        <a href="logout.php" class="btn btn-outline"
           style="justify-content:flex-start;color:var(--danger);"
           onclick="return confirm('Se déconnecter ?')">
          <i class="fa fa-right-from-bracket"></i> Déconnexion
        </a>
      </div>
    </div>

    <! Rappel statut>
    <div class="alert alert-<?= $statut_class === 'success' ? 'success' : 'danger' ?>">
      <i class="fa fa-<?= $statut_class === 'success' ? 'circle-check' : 'circle-xmark' ?>"></i>
      <div>
        <strong><?= $statut ?></strong> – Moyenne : <strong><?= $moyenne_generale ?> / 20</strong>
        <?php if ($statut_class !== 'success'): ?>
          <br><small>Des modules sont à repasser. Consultez votre relevé.</small>
        <?php endif; ?>
      </div>
    </div>

  </div>
</div>

<?php require_once 'footer.php'; ?>