<?php
    $host = "localhost";
    $dbname = "lira_book_store";
    $charset = "utf8mb4";
    $user = "root";
    $mdp = "";

    $pdo = new PDO(
        "mysql: host=$host;dbname=$dbname;charset=$charset",
        $user,
        $mdp,

        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
        ]
    );
?>