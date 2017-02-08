<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;


class RoleController extends ControllerBase
{
    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for role
     */
    public function searchAction()
    {
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, 'Role', $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = [];
        }
        $parameters["order"] = "id";

        $role = Role::find($parameters);
        if (count($role) == 0) {
            $this->flash->notice("The search did not find any role");

            $this->dispatcher->forward([
                "controller" => "role",
                "action" => "index"
            ]);

            return;
        }

        $paginator = new Paginator([
            'data' => $role,
            'limit' => 10,
            'page' => $numberPage
        ]);

        $this->view->page = $paginator->getPaginate();
    }

    /**
     * Displays the creation form
     */
    public function newAction()
    {

    }

    /**
     * Edits a role
     *
     * @param string $id
     */
    public function editAction($id)
    {
        if (!$this->request->isPost()) {

            $role = Role::findFirstByid($id);
            if (!$role) {
                $this->flash->error("role was not found");

                $this->dispatcher->forward([
                    'controller' => "role",
                    'action' => 'index'
                ]);

                return;
            }

            $this->view->id = $role->id;

            $this->tag->setDefault("id", $role->id);
            $this->tag->setDefault("name", $role->name);

        }
    }

    /**
     * Creates a new role
     */
    public function createAction()
    {
        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "role",
                'action' => 'index'
            ]);

            return;
        }

        $role = new Role();
        $role->name = $this->request->getPost("name");


        if (!$role->save()) {
            foreach ($role->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "role",
                'action' => 'new'
            ]);

            return;
        }

        $this->flash->success("role was created successfully");

        $this->dispatcher->forward([
            'controller' => "role",
            'action' => 'index'
        ]);
    }

    /**
     * Saves a role edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "role",
                'action' => 'index'
            ]);

            return;
        }

        $id = $this->request->getPost("id");
        $role = Role::findFirstByid($id);

        if (!$role) {
            $this->flash->error("role does not exist " . $id);

            $this->dispatcher->forward([
                'controller' => "role",
                'action' => 'index'
            ]);

            return;
        }

        $role->name = $this->request->getPost("name");


        if (!$role->save()) {

            foreach ($role->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "role",
                'action' => 'edit',
                'params' => [$role->id]
            ]);

            return;
        }

        $this->flash->success("role was updated successfully");

        $this->dispatcher->forward([
            'controller' => "role",
            'action' => 'index'
        ]);
    }

    /**
     * Deletes a role
     *
     * @param string $id
     */
    public function deleteAction($id)
    {
        $role = Role::findFirstByid($id);
        if (!$role) {
            $this->flash->error("role was not found");

            $this->dispatcher->forward([
                'controller' => "role",
                'action' => 'index'
            ]);

            return;
        }

        if (!$role->delete()) {

            foreach ($role->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "role",
                'action' => 'search'
            ]);

            return;
        }

        $this->flash->success("role was deleted successfully");

        $this->dispatcher->forward([
            'controller' => "role",
            'action' => "index"
        ]);
    }

}
