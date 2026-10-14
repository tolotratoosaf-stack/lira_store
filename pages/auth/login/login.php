<?php
  require_once __DIR__ . '/../../../server/config/config.php';

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

<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Log in</title>
    <link rel="stylesheet" href="login.css" />
    <script src="login.js" async></script>
  </head>
  <body>
    <form action="login.php" method="POST">
      <h1>lira</h1>
      <div class="card" id="authCard">
        <div class="card-front">
          <fieldset>
            <legend>Connexion</legend>

            <!-- Identifiant -->
            <div class="champs">
              <input
                type="email"
                name="loginEmail"
                id="loginEmail"
                placeholder="Entrer votre mail"
              />
              <input
                type="password"
                name="loginPassword"
                id="loginPassword"
                placeholder="Entrer votre mot de passe"
              />
            </div>

            <!-- Se souvenir de moi -->
            <div class="save">
              <input type="checkbox" name="souvenir" id="souvenir" />
              <label for="souvenir">Se souvenir de moi?</label>
            </div>

            <!-- Connexion -->
            <div class="button">
              <button type="submit" class="connecter" id="connecting">Se connecter</button>
              <button type="button" class="inscrire" id="showRegister">
                S'inscrire
              </button>
            </div>

            <p class="separate">ou</p>

            <div class="other">
              <a href="#">mot de passe oublier</a>
              <a href="#">Etes-vous auteur? acces auteur</a>
            </div>
          </fieldset>
        </div>
        <div class="card-back">
          <fieldset>
            <legend>Inscription</legend>

            <!-- Identifiant -->
            <div class="champs">
              <input
                type="text"
                name="nom"
                id="nom"
                placeholder="Entrer votre nom"
              />
              <input
                type="email"
                name="email"
                id="email"
                placeholder="Entrer votre mail"
              />
              <input
                type="password"
                name="password"
                id="password"
                placeholder="Entrer votre mot de passe"
              />
              <input
                type="password"
                name="mdpConfirme"
                id="mdpConfirme"
                placeholder="Confirmer votre mot de passe"
              />
            </div>

            <!-- Se souvenir de moi -->
            <div class="save">
              <div class="insCheck">
                <input type="checkbox" name="newsletter" id="newsletter" />
                <label for="newsletter">Se souvenir de moi?</label>
              </div>

              <div class="insCheck">
                <input type="checkbox" name="cgu" id="cgu" />
                <label for="cgu"
                  >J'accepte les CGU et la politique de confidentialite</label
                >
              </div>
            </div>

            <!-- Connexion -->
            <div class="button">
              <button type="submit" class="connecter">Creer mon compte</button>
            </div>

            <p class="separate">ou</p>

            <div class="other">
              <a href="#">Etes-vous auteur? acces auteur</a>
              <button type="button" class="retour" id="showLogin">
                Déjà un compte ? Se connecter
              </button>
            </div>
          </fieldset>
        </div>
      </div>
    </form>
  </body>
</html>
