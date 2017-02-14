<?php

class IndexController extends ControllerBase
{

    public function indexAction()
    {
        $this->testAction();
    }
    public function testAction(){
        echo "hello";
    }

}

