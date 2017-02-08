<?php

class UsersController extends \Phalcon\Mvc\Controller
{

    public function indexAction()
    {
        $users=User::find();
        $this->view->setVar("users",$users);
    }

}

