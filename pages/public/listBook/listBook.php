<?php
  require_once __DIR__ . "/../../../server/config/config.php";

  $search = trim($_GET["search"]??'');
  $genre = $_GET["genre"]??"";
  $langue = $_GET["langue"]??"";
  $format = $_GET["pdf"]??"";
  $longueur = $_GET["longueur"]??"";
  $prix = $_GET["prix"]??"";

  $sql = "SELECT * FROM catalogue_books";

  function filterActif($filtre){
    if($filtre!==""){
      $sql .= " AND $filtre LIKE :$filtre";
    }
  }

  if($search !== ""){
    $sql .= " WHERE (title LIKE :title OR slug LIKE :slug) AND (genre LIKE :genre)";

    filterActif($genre);
    // filterActif($langue);
    // filtreActif($format);
    // filterActif($longueur);
    // filtreActif($prix);

    $STATEMENT = $pdo -> prepare($sql);
    $STATEMENT->execute([
      "title"=>"%{$search}%",
      "slug"=>"%{$search}%",
      "genre"=>"%{$genre}%"
      // "langue"=>"%{$langue}%",
      // "format"=>"%{$format}%",
      // "longueur"=>"%{$longueur}%",
      // "prix"=>"%{$prix}%"
    ]);
  } else {
    $STATEMENT = $pdo -> prepare($sql);
    $STATEMENT -> execute();
  }



  $resultat = $STATEMENT->fetchAll();
?>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Lira</title>
    <link rel="stylesheet" href="listBook.css" />
    <script src="app.js" async></script>
  </head>
  <body>
    <!-- NAVIGATION -->
    <nav>
      <p>Lira</p>
      <ul class="right">
        <li><a href="../home/home.html">Acceuil</a></li>
        <li class="navSelected"><a href="#">Livres</a></li>
        <li><a href="#">Categories</a></li>
        <li><a href="#">Devenir auteur</a></li>
        <li><a href="../../auth/login/login.html">Connexion</a></li>
      </ul>
    </nav>

    <!-- HEADER -->
    <header>
      <h1>Listes des livres</h1>
      <nav class="breadcrumb" aria-label="Fil d'Ariane">
        <a href="../home/home.html">Accueil</a>
        <span aria-hidden="true">›</span>
        <span aria-current="page">Livres</span>
      </nav>
      <div class="result"><h3>Tous les livres</h3></div>
    </header>

    <!-- SECTION DES LIVRES -->
    <section>
      <!-- search -->
      <form class="searchBar" id="searchBarForm" method="GET">
        <input
          type="search"
          name="search"
          id="search"
          placeholder="Découvrir les livres de votre choix"
        />
        <button type="submit">Search</button>
      </form>

      <!-- RÉSULTATS DES LIVRES -->
      <div class="resultLivre">
        <!-- BARRE LATÉRALE DE FILTRES -->
        <aside class="book-filters" aria-labelledby="filters-title">
          <h2 id="filters-title">Filtres</h2>

          <form id="book-filter-form" method="GET">
            <!-- GENRE -->
            <fieldset class="filter-group">
              <legend>Genre</legend>

              <label for="genre">Choisir un genre</label>

              <select name="genre" id="genre">
                <option value="">Tous les genres</option>
                <option value="roman">Roman</option>
                <option value="fiction">Fiction</option>
              </select>
            </fieldset>

            <!-- LANGUE -->
            <fieldset class="filter-group">
              <legend>Langue</legend>

              <label for="langue">Choisir une langue</label>

              <select name="langue" id="langue">
                <option value="">Toutes les langues</option>
                <option value="fr">Français</option>
                <option value="en">Anglais</option>
              </select>
            </fieldset>

            <!-- FORMAT -->
            <fieldset class="filter-group">
              <legend>Format</legend>

              <div class="filter-option">
                <input
                  type="checkbox"
                  id="formatPDF"
                  name="format"
                  value="pdf"
                />
                <label for="formatPDF">PDF</label>
              </div>

              <div class="filter-option">
                <input
                  type="checkbox"
                  id="formatEPUB"
                  name="format"
                  value="epub"
                />
                <label for="formatEPUB">EPUB</label>
              </div>
            </fieldset>

            <!-- LONGUEUR -->
            <fieldset class="filter-group">
              <legend>Longueur du livre</legend>

              <label for="longueur"> Nombre maximum de pages </label>

              <input
                type="number"
                id="longueur"
                name="longueur"
                min="1"
                step="1"
                placeholder="Ex. : 300"
              />
            </fieldset>

            <!-- PRIX -->
            <fieldset class="filter-group">
              <legend>Prix</legend>

              <div class="filter-option">
                <input
                  type="checkbox"
                  id="prixFREE"
                  name="prix"
                  value="gratuit"
                />
                <label for="prixFREE">Gratuit</label>
              </div>

              <div class="filter-option">
                <input
                  type="checkbox"
                  id="prixPAYANT"
                  name="prix"
                  value="payant"
                />
                <label for="prixPAYANT">Payant</label>
              </div>
            </fieldset>

            <!-- ACTIONS -->
            <div class="filter-actions">
              <button type="submit">Appliquer les filtres</button>

              <button type="reset">Réinitialiser</button>
            </div>
          </form>
        </aside>

        <!-- CATALOGUE DES LIVRES -->
        <section class="book-results" aria-labelledby="results-title">

          <h2 id="results-title">Tous les livres</h2>

          <?php if (empty($resultat)): ?>

            <div class="resultEmpty">
              <h3>Aucun résultat correspondant 😢</h3>

              <p>
                Aucun livre trouvé pour
                <strong>
                  "<?= htmlspecialchars($search, ENT_QUOTES, 'UTF-8') ?>"
                </strong>
              </p>

              <a href="listBook.php">
                Voir tous les livres →
              </a>
            </div>

          <?php else: ?>

            <div class="book-grid">

              <?php foreach ($resultat as $book): ?>

                <article class="book-card">

                  <div class="book-cover">
                    <img
                      src="<?= htmlspecialchars($book['cover_url'], ENT_QUOTES, 'UTF-8') ?>"
                      alt="<?= htmlspecialchars($book['title'], ENT_QUOTES, 'UTF-8') ?>"
                      loading="lazy"
                    />
                  </div>

                  <div class="book-info">

                    <h3>
                      <?= htmlspecialchars($book['title'], ENT_QUOTES, 'UTF-8') ?>
                    </h3>

                    <p class="book-author">
                      Par Sophie Laurent
                    </p>

                    <div class="book-details">
                      <span class="book-price">
                        <?= htmlspecialchars((string) $book['price'], ENT_QUOTES, 'UTF-8') ?> €
                      </span>
                    </div>

                    <a href="#" class="book-button">
                      Découvrir →
                    </a>

                  </div>

                </article>

              <?php endforeach; ?>

            </div>

          <?php endif; ?>

        </section>
      </div>
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
