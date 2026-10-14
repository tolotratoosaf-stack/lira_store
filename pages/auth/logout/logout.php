<?php
    require_once __DIR__ . "/../../../server/config/config.php";

    if(session_status()===PHP_SESSION_NONE){
        session_start();
    }

    $_SESSION = [];
    session_destroy();

    header("Location:/project/lira_store/pages/auth/login/login.php");
    exit;
?>