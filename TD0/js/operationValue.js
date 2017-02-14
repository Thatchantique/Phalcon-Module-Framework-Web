function nextValueUser()
{
  //Regarder à indice +1 et changer sur le formulaire
  document.getElementById('login').value = "truc";
  document.getElementById('firstName').value = "";
  document.getElementById('lastName').value = "";
  document.getElementById('email').value = "";
  // document.getElementById('image').value = "";
  document.getElementById('idrole').value = "truc";
}

function modifValue()
{
  //Prendre les valeurs du formulaire et les remplacer dans la base.
  document.getElementById('nom').value = "My value";

}

function delValue()
{
  //Regarde si les valeurs du formulaire sont dans la base si toutes oui alors supprimer sinon juste effacer écran.
  document.getElementById('nom').value = "My value";

}