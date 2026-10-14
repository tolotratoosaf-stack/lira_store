<?php
  require_once __DIR__ . "/../../../server/session/session.php";
  require_once __DIR__ . "/../../../server/config/config.php";

  $link = $_GET["slug"];
  $slug = htmlspecialchars($link, ENT_QUOTES,"UTF-8");

  $sql = "SELECT * FROM catalogue_books WHERE slug = :slug";
  $authorReq = "SELECT * FROM user_user WHERE id = :id";

  $STATEMENT = $pdo -> prepare($sql);
  $STATEMENT->execute([
    "slug"=>$slug
  ]);
  $resultat = $STATEMENT->fetch();

  $AUTHOR = $pdo -> prepare($authorReq);
  $AUTHOR->execute([
    "id"=>(int)$resultat["author_id"]
  ]);
  $author = $AUTHOR->fetch();


  $audience = json_decode($resultat["target_audience"],true);
?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="readBook.css" />
    <script src="app.js" defer></script>
  </head>
  <body>
    <!-- NAVIGATION -->
    <nav>
      <p>Lira</p>
      <ul class="right">
        <li><a href="../home/home.php">Acceuil</a></li>
        <li><a href="../listBook/listBook.php">Livres</a></li>
        <li><a href="#">Categories</a></li>
        <li><a href="#">Devenir auteur</a></li>
        <li><a href="../../auth/login/login.php">Connexion</a></li>
      </ul>
    </nav>

    <!-- HEADER -->
    <header>
      <form
        class="searchBar"
        id="searchBarForm"
        method="GET"
        action="listBook.php"
      >
        <input
          type="search"
          name="search"
          id="search"
          placeholder="Découvrir d'autre livre"
        />

        <!-- POUR TOUJOURS RECUPERER LE RECHERCHE -->
        <button type="submit">Search</button>
      </form>
    </header>

    <!-- RESULTAT DU LIVRE A DECOUVRIR -->
    <section class="decouvrir">
      <!-- IDENTITE DU LIVRE -->
      <article class="identite">
        <figure>
          <img src="<?= $resultat["cover_url"]?>" alt="<?= $resultat["slug"]?>" />
        </figure>
        <div class="book">
          <h1><?= $resultat["title"]?></h1>

          <!-- auteur -->
          <div class="auteur">
            <h3>Ecrit par <?= $author["name"]?></h3>
            <button>suivre</button>
          </div>

          <!-- note -->
          <div class="note">
            <p><?= $resultat["rating_avg"]?></p>
            <p><?= $resultat["genre"]?></p>
            <p><?= $resultat["created_at"]?></p>
            <p><?= $resultat["language_code"]?></p>
          </div>

          <!-- a propos -->
          <div class="details">
            <p><?= $resultat["page_count"]?> pages</p>
            <p><?= $resultat["format"]?></p>
            <p>
              <?php foreach($audience as $person):?>
                <?= htmlspecialchars($person, ENT_QUOTES,'UTF-8')?>
              <?php endforeach?>
            </p>
          </div>

          <!-- button -->
          <div class="button">
            <button>Lire</button>
            <button>favoris</button>
            <button>Acheter</button>
          </div>
        </div>

        <!-- description court -->
        <div class="description-court">
          <p><?= $resultat["description"]?></p>
        </div>
      </article>

      <section class="avis">
        <h2>Avis des lecteurs 💬</h2>

        <!-- LISTE DES COMMENTAIRES -->
        <div class="liste-avis">
          <!-- COMMENTAIRE 1 -->
          <article class="avis">
            <figure>
              <img src="profil1.jpg" alt="Photo de profil" />
            </figure>

            <div class="commentaire">
              <p>Marie Dupont</p>

              <p>
                Une histoire magnifique ! J'ai adoré les personnages et
                l'univers de ce livre.
              </p>
            </div>
          </article>

          <!-- COMMENTAIRE 2 -->
          <article class="avis">
            <figure>
              <img src="profil2.jpg" alt="Photo de profil" />
            </figure>

            <div class="commentaire">
              <p>Lucas Martin</p>

              <p>
                Très belle découverte. L'histoire est captivante du début
                jusqu'à la fin !
              </p>
            </div>
          </article>
        </div>

        <!-- FORMULAIRE -->
        <form method="POST">
          <textarea
            name="avis"
            id="avis"
            placeholder="Partagez votre avis sur ce livre..."
            rows="3"
            required
          ></textarea>

          <button type="submit">Envoyer ➤</button>
        </form>
      </section>
    </section>

    <!-- FOOTER -->
    <footer>
      <div class="footer-content">
        <div class="footer-brand">
          <h2>Lira</h2>
          <p>Là où les histoires prennent vie.</p>
        </div>

        <div class="footer-section">
          <h3>Découvrir</h3>
          <ul>
            <li><a href="#">Accueil</a></li>
            <li><a href="#">Catalogue</a></li>
            <li><a href="#">Nouveautés</a></li>
            <li><a href="#">Top ventes</a></li>
            <li><a href="#">Auteurs</a></li>
          </ul>
        </div>

        <div class="footer-section">
          <h3>Auteurs</h3>
          <ul>
            <li><a href="#">Devenir auteur</a></li>
            <li><a href="#">Publier un livre</a></li>
            <li><a href="#">Politique de revenus</a></li>
            <li><a href="#">Auteurs populaires</a></li>
          </ul>
        </div>

        <div class="footer-section">
          <h3>Support</h3>
          <ul>
            <li><a href="#">Centre d'aide</a></li>
            <li><a href="#">Nous contacter</a></li>
            <li><a href="#">Signaler un problème</a></li>
            <li><a href="#">CGU</a></li>
            <li><a href="#">Confidentialité</a></li>
          </ul>
        </div>
      </div>

      <div class="footer-bottom">
        <p>&copy; 2026 Lira. Tous droits réservés.</p>
      </div>
    </footer>
  </body>
</html>
