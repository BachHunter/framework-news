<?php

namespace App\Controller;

use App\Model\UserMapper;

class AccountCtrl extends CoreCtrl {

    protected $userMapper;

    function init() {
        parent::init();
        $this->userMapper = UserMapper::makeInstance();
    }

    function index() {
        //xoa session cu
        $this->session->remove('user');

        $data = array('appName' => $this->setting->getSetting('themeAppName'));
        if (!empty($_POST)) {
            $acc = $this->req->post('account');
            $pass = $this->req->post('password');
            $callback = $this->req->get('callback', url());
            $result = $this->userMapper->authenticate($acc, $pass);
            if ($result['status']) {
                $this->session->set('user', array(
                    'id'   => $result['user']->id,
                    'pass' => md5($pass)
                ));
                $this->resp->redirect($callback);
                return;
            } else {
                $data['error'] = $result['error'];
                $data['account'] = $acc;
                $data['password'] = $pass;
            }
        }
        $this->contentOnlyLayout
                ->setData($data)
                ->render('Account/login.phtml');
    }

    function changePassword() {
        $this->requireLogin();
        if (!empty($_POST)) {
            $currentPass = $this->req->post('txtCurrent');
            $newPass = $this->req->post('txtNew');
            $rePass = $this->req->post('txtRe');
            
            if ($this->user()->pass != md5($currentPass)) {
                $data['error'] = 'wrongCurrent';
            } else if ($newPass !== $rePass) {
                $data['error'] = 'wrongRePass';
            } else {
                $this->userMapper->changePassword($this->user()->id, $newPass);
                $data['success'] = true;
            }
        }
        $histories = $this->session->get('histories');
        $data['lastPage'] = $histories ? end($histories) : url();
        $this->twoColsLayout
                ->setData($data)
                ->render('Account/changePassword.phtml');
    }

}
