<?php
use Phalcon\Paginator\Adapter\Model as PaginatorModel;

class UsersController extends \Phalcon\Mvc\Controller
{

    /** Liste par défaut des utilisateurs, triés suivant sField dans l'ordre sens, en utilisant le filtre filter
     * @param string $sField
     * @param string $sens
     * @param null $filter
     */
    public function indexAction()
    {
        $users = User::find();
        $this->view->setVar('users', $users);

    }

    /**Formulaire de saisie/modification d'un utilisateur, id est la clé primaire de l'utilisateur à modifier
     * @param null $id
     */
    public function formAction($id = NULL)
    {
        $userModify = User::find(
            [
                "condition" => $id,
            ]
        );

        if ($userModify != 0) {

        }


    }

    /**
     *Met à jour l'utilisateur posté dans la base de données, puis affiche un message
     */
    public function updateAction()
    {

    }

    /**Supprime l'utilisateur dont l'id est passé en paramètre
     * @param $id
     */
    public function deleteAction($id)
    {

    }

    /**
     *Gère le message de mise à jour et affiche la vue
     */
    public function messageAction()
    {

    }

}

