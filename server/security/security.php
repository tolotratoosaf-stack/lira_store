<?php
  require_once __DIR__ . '/../config/config.php';

//   session_abort();
//   session_destroy();

  if(session_status()===PHP_SESSION_NONE) {
    session_start();
  }

  $email = $_POST["loginEmail"]??"";
  $password = $_POST["loginPassword"]??"";

  $sql = "SELECT * FROM user_user WHERE email = :email AND password = :password";

  if($_SERVER["REQUEST_METHOD"]==="POST") {
    $stmt = $pdo -> prepare($sql);
    $stmt->execute([
      "email"=>$email,
      "password"=>$password
    ]);
    $resultat = $stmt->fetch();

    echo "UTILISATEUR CONNECTER";

    $_SESSION["user_id"] = $resultat["id"];

    if(!empty($_SESSION["user_id"])) {
      echo "SESSION ENREGISTRER";
      header("Location:/project/lira_store/pages/public/home/home.php");
      exit;
    }
  }
?>