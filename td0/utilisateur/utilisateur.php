<?php
  include ("../../PDO_connect.php");
  $bdd = ConnecterPDO();

  $sql_user = "SELECT login, firstname, lastname, email, image, idrole FROM user";
  $tab_user;
  $req_user = LireDonneesPDO1($bdd, $sql_user, $tab_user);
/**
  if(isset($_POST['modifier']))
  {
    //modifValue();
  }
 **/
  if(isset($_POST['suivant']))
  {
      nextValueUser();
  }
/**
  if(isset($_POST['supprimer']))
  {
    //delValue();
  }
**/

    //var_dump($tab_user);
 ?>
<!--UTILISER LE VAR DUMP !!!!!!-->
 <!DOCTYPE html>
 <html>
  <head>
    <title>TD0 - Utilisateur</title>
    <meta charset="utf-8" lang="fr"/>
    <script type="text/javascript" src="../../js/operationValue.js"></script>
  </head>

  <body>

    <form name="formUtilisateur" action="<?php echo $_SERVER['PHP_SELF']; ?>">
      
<!--<button onclick="modifValue()">Modifier</button>
    <button onclick="delValue()">Supprimer</button>
    <button onclick="nextValue()">Suivant</button>-->
      
      <br/>
      <fieldset>
        <legend>Formulaire Utilisateur</legend>
        <legend for="login">Login :</legend>
        <input type="text" name="login"/><br/>
        <legend for="firstName">FirstName :</legend>
        <input type="text" name="firstName"/><br/>
        <legend for="lastName">LastName :</legend>
        <input type="text" name="lastName"/><br/>
        <legend for="email">Email :</legend>
        <input type="text" name="email"/><br/>
        <legend for="image">Image :</legend>
        <!--input image--><br/>
        <legend for="idrole">Idrole :</legend>
        <input type="text" name="idrole"/><br/>
        <input type="submit" name="modifier" value="Modifier"/>
        <input type="submit" name="supprimer" value="Supprimer"/>
        <input type="submit" name="suivant" value="Suivant"/>
      </fieldset>
    </form>
  </body>
 </html>
