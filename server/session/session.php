<?php
    if (session_status() === PHP_SESSION_NONE) {
        session_start();
    }

    if (!isset($_SESSION["user_id"])) {
        header("Location: /project/lira_store/pages/auth/login/login.php");
        exit;
    }
?>