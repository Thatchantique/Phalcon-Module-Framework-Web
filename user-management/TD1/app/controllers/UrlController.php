<?php

use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;


class UrlController extends ControllerBase
{
    /**
     * Index action
     */
    public function indexAction()
    {
        $this->persistent->parameters = null;
    }

    /**
     * Searches for url
     */
    public function searchAction()
    {
        $numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, 'Url', $_POST);
            $this->persistent->parameters = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = $this->persistent->parameters;
        if (!is_array($parameters)) {
            $parameters = [];
        }
        $parameters["order"] = "id";

        $url = Url::find($parameters);
        if (count($url) == 0) {
            $this->flash->notice("The search did not find any url");

            $this->dispatcher->forward([
                "controller" => "url",
                "action" => "index"
            ]);

            return;
        }

        $paginator = new Paginator([
            'data' => $url,
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
     * Edits a url
     *
     * @param string $id
     */
    public function editAction($id)
    {
        if (!$this->request->isPost()) {

            $url = Url::findFirstByid($id);
            if (!$url) {
                $this->flash->error("url was not found");

                $this->dispatcher->forward([
                    'controller' => "url",
                    'action' => 'index'
                ]);

                return;
            }

            $this->view->id = $url->id;

            $this->tag->setDefault("id", $url->id);
            $this->tag->setDefault("icon", $url->icon);
            $this->tag->setDefault("title", $url->title);
            $this->tag->setDefault("controller", $url->controller);
            $this->tag->setDefault("action", $url->action);
            $this->tag->setDefault("roles", $url->roles);

        }
    }

    /**
     * Creates a new url
     */
    public function createAction()
    {
        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "url",
                'action' => 'index'
            ]);

            return;
        }

        $url = new Url();
        $url->icon = $this->request->getPost("icon");
        $url->title = $this->request->getPost("title");
        $url->controller = $this->request->getPost("controller");
        $url->action = $this->request->getPost("action");
        $url->roles = $this->request->getPost("roles");


        if (!$url->save()) {
            foreach ($url->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "url",
                'action' => 'new'
            ]);

            return;
        }

        $this->flash->success("url was created successfully");

        $this->dispatcher->forward([
            'controller' => "url",
            'action' => 'index'
        ]);
    }

    /**
     * Saves a url edited
     *
     */
    public function saveAction()
    {

        if (!$this->request->isPost()) {
            $this->dispatcher->forward([
                'controller' => "url",
                'action' => 'index'
            ]);

            return;
        }

        $id = $this->request->getPost("id");
        $url = Url::findFirstByid($id);

        if (!$url) {
            $this->flash->error("url does not exist " . $id);

            $this->dispatcher->forward([
                'controller' => "url",
                'action' => 'index'
            ]);

            return;
        }

        $url->icon = $this->request->getPost("icon");
        $url->title = $this->request->getPost("title");
        $url->controller = $this->request->getPost("controller");
        $url->action = $this->request->getPost("action");
        $url->roles = $this->request->getPost("roles");


        if (!$url->save()) {

            foreach ($url->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "url",
                'action' => 'edit',
                'params' => [$url->id]
            ]);

            return;
        }

        $this->flash->success("url was updated successfully");

        $this->dispatcher->forward([
            'controller' => "url",
            'action' => 'index'
        ]);
    }

    /**
     * Deletes a url
     *
     * @param string $id
     */
    public function deleteAction($id)
    {
        $url = Url::findFirstByid($id);
        if (!$url) {
            $this->flash->error("url was not found");

            $this->dispatcher->forward([
                'controller' => "url",
                'action' => 'index'
            ]);

            return;
        }

        if (!$url->delete()) {

            foreach ($url->getMessages() as $message) {
                $this->flash->error($message);
            }

            $this->dispatcher->forward([
                'controller' => "url",
                'action' => 'search'
            ]);

            return;
        }

        $this->flash->success("url was deleted successfully");

        $this->dispatcher->forward([
            'controller' => "url",
            'action' => "index"
        ]);
    }

}
