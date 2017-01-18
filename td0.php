<?php
  include ("PDO_connect.php");

  $bdd = ConnecterPDO();
  $sql = "select * from user";
  $tab_rep;
  $req = LireDonneesPDO1($bdd, $sql, $tab_rep);

 ?>

<!DOCTYPE html>
<html>
  <head>
    <title>TD n°0</title>
    <meta charset="utf-8" lang="fr"/>
  </head>
  <body>
    <h1>TD n°0</h1>
    <p>

    </p>
  </body>

</html>
