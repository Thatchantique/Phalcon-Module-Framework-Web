<?php

class UsersController extends \Phalcon\Mvc\Controller
{

    public function indexAction($sField="firstname",$sens="asc",$filter=NULL)
    {
        $users=User::find();
        $this->view->setVar("utilisateur");
        $this->view->setVar("");

    }

    public function formAction($id=NULL)
    {

    }

    public function updateAction()
    {

    }

    public function deleteAction($id)
    {

    }

    public function messageAction()
    {

    }

}

