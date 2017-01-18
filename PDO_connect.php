<?php
// E.Porcq  pdo_oracle.php  11/10/2016

/*  Exemple
  $db_username = "ETU000";
  $db_password = "ETU000";
  //$db = "oci:dbname=info;charset=AL32UTF8"; // fonctionne si tnsname.ora est complet (base UTF8)
  $db = "oci:dbname=info;charset=WE8ISO8859P15"; // fonctionne si tnsname.ora est complet

  $conn = ConnecterPDO($db,$db_username,$db_password);
*/

    function ConnecterPDO()
  {
    $lien_base = "mysql:host=spartacus.iutc3.unicaen.fr;dbname=guillaume_gaujac";
    $db_username = "guillaume_gaujac";
    $db_password = "peihahri";
  try
  {
    $conn = new PDO($lien_base,$db_username,$db_password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  }
  catch(PDOException $e)
  {
    echo 'Echec lors de la connexion'.$e->getMessage();
  }
    return $conn;
  }

//---------------------------------------------------------------------------------------------
function majDonnees($conn,$sql)
{
  $stmt = $conn->exec($sql);
  return $stmt;
}
//---------------------------------------------------------------------------------------------
function preparerRequete($conn,$sql)
{
  $cur = $conn->prepare($sql);
  return $cur;
}
//---------------------------------------------------------------------------------------------
function ajouterParam($cur,$param,$contenu,$type='texte',$taille=0) // fonctionne avec preparerRequete
{
// Sur Oracle, on peut tout passer sans préciser le type. Sur MySQL ???
//  if ($type == 'nombre')
//    $cur->bindParam($param, $contenu, PDO::PARAM_INT);
//  else
    //$cur->bindParam($param, $contenu, PDO::PARAM_STR, $taille);
  $cur->bindParam($param, $contenu);
  return $cur;
}
//---------------------------------------------------------------------------------------------
function majDonneesPreparees($cur) // fonctionne avec ajouterParam
{
  $res = $cur->execute();
  return $res;
}
//---------------------------------------------------------------------------------------------
function majDonneesPrepareesTab($cur,$tab) // fonctionne directement après preparerRequete
{
  $res = $cur->execute($tab);
  return $res;
}//---------------------------------------------------------------------------------------------
function LireDonneesPDO1($conn,$sql,&$tab)
{
  $i=0;
  foreach  ($conn->query($sql,PDO::FETCH_ASSOC) as $ligne)
    $tab[$i++] = $ligne;
  $nbLignes = $i;
  return $nbLignes;
}
//---------------------------------------------------------------------------------------------
function LireDonneesPDOPreparee($cur)
{
  $res = $cur->execute();
  $tab = $cur->fetchall();
  return $tab;
}
//---------------------------------------------------------------------------------------------
function LireDonneesPDO2($conn,$sql,&$tab)
{
  $i=0;
  $cur = $conn->query($sql);
  while ($ligne = $cur->fetch(PDO::FETCH_ASSOC))
    $tab[$i++] = $ligne;
  $nbLignes = $i;
  return $nbLignes;
}
//---------------------------------------------------------------------------------------------
function LireDonneesPDO3($conn,$sql)
{
  $cur = $conn->query($sql);
  $tab = $cur->fetchall(PDO::FETCH_ASSOC);
  return $tab;
}
//---------------------------------------------------------------------------------------------
function AfficherDonnee($tab)
{
  foreach($tab as $ligne)
  {
    foreach($ligne as $cle =>$valeur)
  {
    $valeur = utf8_encode($valeur);
    echo $cle.":".$valeur."\t";
  }
    echo "<br/>";
  }
}
//---------------------------------------------------------------------------------------------

/* doc
$hote = '127.0.0.1';
$port = '1521'; // port par défaut
$service = 'TEST';
$utilisateur = 'TEST';
$motdepasse = 'MotDePasse';

$lien_base =
"oci:dbname=(DESCRIPTION =
(ADDRESS_LIST =
  (ADDRESS =
    (PROTOCOL = TCP)
    (Host = ".$hote .")
    (Port = ".$port."))
)
(CONNECT_DATA =
  (SERVICE_NAME = ".$service.")
)
)";

*/
 ?>
