<?php
  include ("PDO_connect.php");
  $bdd = ConnecterPDO();

  if (isset($_POST['newRole']))
  {
    $sql_max_id = "SELECT MAX(id)+1 FROM `role`";
    $req_max_id = LireDonneesPDO1($bdd, $sql_max_id, $req_max_id);
    var_dump($req_max_id);
  }

?>
<!DOCTYPE html>
<html>
  <head>
    <title>TD n°0</title>
    <meta charset="utf-8" lang="fr"/>
  </head>
  <body>
    <?php
    ?>
    <h1>TD n°0</h1>
    <form name="formRole" action="<?php echo $_SERVER['PHP_SELF']; ?>">
      <legend>Nom des roles</legend>
      <select name="nameRole">
        <?php
          $sql = "select * from role";
          $tab_rep;
          $req = LireDonneesPDO1($bdd, $sql, $tab_rep);
          foreach ($tab_rep as $role => $champs) {
            $NAME = $champs["name"];
            echo '<option value="'.$NAME.'">'.$NAME.'</option>';
          }
          // AfficherDonnee($tab_rep);
         ?>
       </select>
     <legend>Ajout d'un role</legend>
     <input type='text' name='newRole'/>
     <legend>Submit</legend>
     <input type="submit" name="submit"/>
  </form>
</body>

</html>
