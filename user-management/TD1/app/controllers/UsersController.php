<?php

class UsersController extends \Phalcon\Mvc\Controller
{

    public function indexAction($sField="firstname",$sens="asc",$filter=NULL)
    {



        $users=User::find();
        foreach ($users as $user) {
            $paginator = new Paginator([
                'data' => $users,
                'page' => $currentPage
            ]);
            $this->view->page = $paginator->getPaginate();
        }
    }

    public function formAction(id=NULL)
    {

    }

    public function updateAction()
    {

    }

    public function deleteAction(id)
    {

    }

    public function messageAction()
    {

    }

}

