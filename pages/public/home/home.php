<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Lira</title>
    <link rel="stylesheet" href="home.css" />
    <script src="app.js" async></script>
  </head>
  <body>
    <!-- NAVIGATION -->
    <nav>
      <p>Lira</p>
      <ul class="right">
        <li class="navSelected"><a href="#">Acceuil</a></li>
        <li><a href="../listBook/listBook.php">Livres</a></li>
        <li><a href="#">Categories</a></li>
        <li><a href="#">Devenir auteur</a></li>
        <li><a href="../../auth/login/login.html">Connexion</a></li>
      </ul>
    </nav>

    <!-- ACCEUIL -->
    <header>
      <h1>LIRA</h1>
      <p>Là où les histoires prennent vie</p>

      <form action="home.php" method="GET" id="searchBar">
        <input
          type="search"
          name="search"
          id="search"
          placeholder="Découvrir les livres de votre choix"
        />
        <button type="submit">Rechercher</button>
      </form>

      <!-- ILLUSTRATION PASTEL -->
      <div class="hero-illustration" aria-hidden="true">
        <div class="hero-blob hero-blob--blue"></div>
        <div class="hero-blob hero-blob--pink"></div>
        <div class="hero-blob hero-blob--purple"></div>

        <div class="hero-orbit hero-orbit--one"></div>
        <div class="hero-orbit hero-orbit--two"></div>

        <span class="hero-particle particle--one"></span>
        <span class="hero-particle particle--two"></span>
        <span class="hero-particle particle--three"></span>
        <span class="hero-particle particle--four"></span>

        <span class="hero-star star--one">✦</span>
        <span class="hero-star star--two">✧</span>
        <span class="hero-star star--three">✦</span>

        <div class="hero-book">
          <svg
            viewBox="0 0 320 200"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            aria-hidden="true"
          >
            <defs>
              <linearGradient id="bookGradient" x1="0" y1="0" x2="320" y2="200">
                <stop offset="0%" stop-color="#FFFFFF" />
                <stop offset="50%" stop-color="#FBE6F6" />
                <stop offset="100%" stop-color="#DDEAFF" />
              </linearGradient>
            </defs>

            <!-- Pages arrière -->
            <path
              d="M160 165
             C120 140 75 145 35 150
             L52 58
             C100 45 135 60 160 90
             C185 60 220 45 268 58
             L285 150
             C245 145 200 140 160 165Z"
              fill="url(#bookGradient)"
              fill-opacity="0.25"
              stroke="white"
              stroke-width="3"
            />

            <!-- Page gauche -->
            <path
              d="M160 155
             C125 125 88 120 45 130
             L65 40
             C105 32 140 48 160 80Z"
              fill="url(#bookGradient)"
              fill-opacity="0.8"
              stroke="white"
              stroke-width="3"
              stroke-linejoin="round"
            />

            <!-- Page droite -->
            <path
              d="M160 155
             C195 125 232 120 275 130
             L255 40
             C215 32 180 48 160 80Z"
              fill="url(#bookGradient)"
              fill-opacity="0.8"
              stroke="white"
              stroke-width="3"
              stroke-linejoin="round"
            />

            <!-- Reliure centrale -->
            <path
              d="M160 80V155"
              stroke="white"
              stroke-width="3"
              stroke-linecap="round"
            />
          </svg>
        </div>
      </div>
    </header>

    <!-- TENDANCES CETTE SEMAINE -->
    <section class="tendances">
      <h2>Tendances cette semaine</h2>

      <div class="resultTendance">
        <article class="book-card">
          <div class="book-cover">
            <img src="images/livre1.jpg" alt="Couverture du livre" />
            <span class="book-badge">Tendance ✨</span>
          </div>

          <div class="book-info">
            <h3>Le Jardin des Étoiles</h3>
            <p class="book-author">Par Sophie Laurent</p>

            <div class="book-details">
              <span class="book-rating">★ 4.8</span>
              <span class="book-price">12,90 €</span>
            </div>

            <a href="#" class="book-button">Découvrir →</a>
          </div>
        </article>
      </div>
    </section>

    <!-- FOOTER -->
    <!-- FOOTER -->
    <footer>
      <div class="footer-content">
        <!-- IDENTITÉ LIRA -->
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
