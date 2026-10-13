-- CONNEXION
mysql -u root -p;

-- UTILISATION
USE lira_book_store;

-- ==========================================
-- TABLE BOOKS
-- ==========================================

CREATE TABLE catalogue_books (
    -- IDENTIFICATION
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    author_id BIGINT UNSIGNED NOT NULL,
    category_id BIGINT UNSIGNED NOT NULL,

    -- INFORMATIONS GÉNÉRALES
    title VARCHAR(255) NOT NULL,
    slug VARCHAR(255) NOT NULL UNIQUE,
    subtitle VARCHAR(255),
    short_description TEXT,
    description LONGTEXT,

    -- COUVERTURE ET FICHIERS
    cover_url VARCHAR(500),
    file_url VARCHAR(500),
    file_size BIGINT UNSIGNED,
    extract_url VARCHAR(500),

    -- CARACTÉRISTIQUES
    format VARCHAR(20),
    language_code VARCHAR(10) NOT NULL DEFAULT 'fr',
    genre VARCHAR(100),
    subgenre JSON,
    target_audience JSON,
    isbn VARCHAR(17),
    page_count INT UNSIGNED,

    -- COMMERCIALISATION
    price DECIMAL(10,2) NOT NULL DEFAULT 0.00,

    -- DROITS
    rights_declared BOOLEAN NOT NULL DEFAULT FALSE,

    -- PUBLICATION
    status ENUM(
        'brouillon',
        'en_verification',
        'publie',
        'rejete',
        'archive'
    ) NOT NULL DEFAULT 'brouillon',

    -- STATISTIQUES
    rating_avg DECIMAL(3,2) NOT NULL DEFAULT 0.00,
    rating_count INT UNSIGNED NOT NULL DEFAULT 0,
    views_count INT UNSIGNED NOT NULL DEFAULT 0,

    -- DATES
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL
        DEFAULT CURRENT_TIMESTAMP
        ON UPDATE CURRENT_TIMESTAMP,

    -- INDEXATION DE RECHERCHE
    INDEX idx_author (author_id),
    INDEX idx_category (category_id),
    INDEX idx_status (status),
    INDEX idx_price (price),
    INDEX idx_created_at (created_at),

    -- VERIFICATION CHECK
    CONSTRAINT chk_book_price
        CHECK (price >= 0),
    CONSTRAINT chk_book_rating
        CHECK (rating_avg BETWEEN 0 AND 5),

    -- RELATION
    CONSTRAINT fk_category_catalogueBook
        FOREIGN KEY (category_id)
        REFERENCES catalogue_categories(id),
    CONSTRAINT fk_author_authorInscription
        FOREIGN KEY (author_id)
        REFERENCES author_inscription(id)
);



-- ==========================================
-- LIRA — 10 LIVRES DE TEST
-- ==========================================

INSERT INTO catalogue_books (

    author_id,
    category_id,

    title,
    slug,
    subtitle,
    short_description,
    description,

    cover_url,
    file_url,
    file_size,
    extract_url,

    format,
    language_code,
    genre,
    subgenre,
    target_audience,

    isbn,
    page_count,
    price,

    rights_declared,
    status,

    rating_avg,
    rating_count,
    views_count

)

VALUES

-- ==========================================
-- 1. LE JARDIN DES ÉTOILES
-- Sophie Laurent
-- ==========================================

(
    (SELECT id FROM author_inscription WHERE user_id = (SELECT id FROM user_user WHERE code_user = "LIRA-U001") AND status = "valide"),
    (SELECT id FROM catalogue_categories WHERE slug = 'fantastique'),

    'Le Jardin des Étoiles',
    'le-jardin-des-etoiles',
    'Là où les rêves deviennent réalité',

    'Une jeune fille découvre un jardin mystérieux où chaque étoile cache un secret.',

    'Élise découvre un jardin oublié au cœur de sa ville. Chaque nuit, les fleurs brillent comme des étoiles et révèlent des fragments de souvenirs. Elle devra percer les secrets de ce lieu avant sa disparition.',

    'images/books/jardin-etoiles.jpg',
    'files/books/jardin-etoiles.pdf',
    5242880,
    'files/extracts/jardin-etoiles.pdf',

    'pdf',
    'fr',
    'Fantastique',

    JSON_ARRAY('Magie', 'Mystère'),

    JSON_ARRAY('Adolescents', 'Adultes'),

    NULL,
    284,
    12.90,

    TRUE,
    'publie',

    4.80,
    125,
    2450
),

-- ==========================================
-- 2. LES PORTES DU TEMPS
-- Sophie Laurent
-- ==========================================

(
    (SELECT id FROM author_inscription WHERE user_id = (SELECT id FROM user_user WHERE code_user = "LIRA-U001") AND status = "valide"),
    (SELECT id FROM catalogue_categories WHERE slug = 'science-fiction'),

    'Les Portes du Temps',
    'les-portes-du-temps',
    'Un voyage au-delà des siècles',

    'Un scientifique découvre une machine capable de traverser les époques.',

    "Lorsque Gabriel active une ancienne machine expérimentale, il découvre un passage vers différentes périodes de l'histoire. Mais chaque voyage modifie progressivement son présent.",

    'images/books/portes-temps.jpg',
    'files/books/portes-temps.pdf',
    7340032,
    'files/extracts/portes-temps.pdf',

    'pdf',
    'fr',
    'Science-fiction',

    JSON_ARRAY('Voyage temporel', 'Aventure'),

    JSON_ARRAY('Adolescents', 'Adultes'),

    NULL,
    320,
    9.99,

    TRUE,
    'publie',

    4.50,
    86,
    1720
),

-- ==========================================
-- 3. L'ÉCHO DES MONDES
-- Sophie Laurent
-- BROUILLON
-- ==========================================

(
    (SELECT id FROM author_inscription WHERE user_id = (SELECT id FROM user_user WHERE code_user = "LIRA-U001") AND status = "valide"),
    (SELECT id FROM catalogue_categories WHERE slug = 'fantasy'),

    'L''Écho des Mondes',
    'lecho-des-mondes',
    "Les frontières de l' imaginaire",

    "Une jeune exploratrice découvre l'existence de mondes parallèles.",

    'À travers un ancien portail, Maëlle découvre des royaumes oubliés. Elle devra apprendre à maîtriser un pouvoir mystérieux pour empêcher leur destruction.',

    'images/books/echo-mondes.jpg',
    NULL,
    NULL,
    NULL,

    'epub',
    'fr',
    'Fantasy',

    JSON_ARRAY('Mondes parallèles', 'Magie'),

    JSON_ARRAY('Adolescents'),

    NULL,
    410,
    14.50,

    TRUE,
    'brouillon',

    0.00,
    0,
    0
),

-- ==========================================
-- 4. UN ÉTÉ À PARIS
-- Emma Moreau
-- ==========================================

(
    (SELECT id FROM author_inscription WHERE user_id = (SELECT id FROM user_user WHERE code_user = "LIRA-U003") AND status = "valide"),
    (SELECT id FROM catalogue_categories WHERE slug = 'romance'),

    'Un Été à Paris',
    'un-ete-a-paris',
    'Une rencontre inattendue',

    'Deux inconnus se rencontrent pendant un été parisien.',

    "Clara pensait passer un été tranquille à Paris. Sa rencontre avec Julien bouleverse ses projets et l'entraîne dans une histoire qu'elle n'aurait jamais imaginée.",

    'images/books/ete-paris.jpg',
    'files/books/ete-paris.pdf',
    4194304,
    'files/extracts/ete-paris.pdf',

    'pdf',
    'fr',
    'Romance',

    JSON_ARRAY('Contemporain', 'Amour'),

    JSON_ARRAY('Jeunes adultes', 'Adultes'),

    NULL,
    256,
    7.99,

    TRUE,
    'publie',

    4.70,
    210,
    3850
),

-- ==========================================
-- 5. NOS PROMESSES OUBLIÉES
-- Emma Moreau
-- LIVRE GRATUIT
-- ==========================================

(
    (SELECT id FROM author_inscription WHERE user_id = (SELECT id FROM user_user WHERE code_user = "LIRA-U003") AND status = "valide"),
    (SELECT id FROM catalogue_categories WHERE slug = 'romance'),

    'Nos Promesses Oubliées',
    'nos-promesses-oubliees',
    'Quand le passé refait surface',

    "Deux amis d'enfance se retrouvent après plusieurs années.",

    'Après dix ans de séparation, Léa et Antoine se retrouvent dans leur village natal. Les souvenirs et les promesses oubliées pourraient changer leur avenir.',

    'images/books/promesses-oubliees.jpg',
    'files/books/promesses-oubliees.pdf',
    3670016,
    'files/extracts/promesses-oubliees.pdf',

    'pdf',
    'fr',
    'Romance',

    JSON_ARRAY('Seconde chance', 'Drame'),

    JSON_ARRAY('Jeunes adultes', 'Adultes'),

    NULL,
    198,
    0.00,

    TRUE,
    'publie',

    4.60,
    95,
    2980
),

-- ==========================================
-- 6. LES LETTRES DU DESTIN
-- Emma Moreau
-- EN VÉRIFICATION
-- ==========================================

(
    (SELECT id FROM author_inscription WHERE user_id = (SELECT id FROM user_user WHERE code_user = "LIRA-U003") AND status = "valide"),
    (SELECT id FROM catalogue_categories WHERE slug = 'drame'),

    'Les Lettres du Destin',
    'les-lettres-du-destin',
    'Des mots qui changent une vie',

    'Une femme découvre une série de lettres mystérieuses.',

    "En vidant la maison familiale, Anaïs découvre des lettres jamais envoyées. Leur contenu remet en question tout ce qu'elle croyait savoir sur son histoire.",

    'images/books/lettres-destin.jpg',
    'files/books/lettres-destin.pdf',
    4718592,
    NULL,

    'pdf',
    'fr',
    'Drame',

    JSON_ARRAY('Famille', 'Mystère'),

    JSON_ARRAY('Adultes'),

    NULL,
    275,
    8.50,

    TRUE,
    'en_verification',

    0.00,
    0,
    0
),

-- ==========================================
-- 7. LA FORÊT DES SECRETS
-- Inès Martin
-- ==========================================

(
    (SELECT id FROM author_inscription WHERE user_id = (SELECT id FROM user_user WHERE code_user = "LIRA-U007") AND status = "valide"),
    (SELECT id FROM catalogue_categories WHERE slug = 'fantasy'),

    'La Forêt des Secrets',
    'la-foret-des-secrets',
    'Le mystère des arbres anciens',

    'Une adolescente découvre une forêt habitée par des créatures extraordinaires.',

    "Lorsque Lina pénètre dans une forêt interdite, elle découvre un monde peuplé de créatures magiques. Une ancienne prophétie pourrait faire d'elle la dernière gardienne de ce lieu.",

    'images/books/foret-secrets.jpg',
    'files/books/foret-secrets.pdf',
    6291456,
    'files/extracts/foret-secrets.pdf',

    'pdf',
    'fr',
    'Fantasy',

    JSON_ARRAY('Magie', 'Créatures fantastiques'),

    JSON_ARRAY('Adolescents'),

    NULL,
    340,
    11.90,

    TRUE,
    'publie',

    4.90,
    175,
    4120
),

-- ==========================================
-- 8. LES GARDIENS DE LUMIÈRE
-- Inès Martin
-- LIVRE GRATUIT
-- ==========================================

(
    (SELECT id FROM author_inscription WHERE user_id = (SELECT id FROM user_user WHERE code_user = "LIRA-U007") AND status = "valide"),
    (SELECT id FROM catalogue_categories WHERE slug = 'jeunesse'),

    'Les Gardiens de Lumière',
    'les-gardiens-de-lumiere',
    'Une aventure extraordinaire',

    'Trois jeunes amis doivent protéger une lumière magique.',

    "Dans un royaume où la lumière disparaît progressivement, trois amis partent à la recherche d'un cristal légendaire capable de sauver leur monde.",

    'images/books/gardiens-lumiere.jpg',
    'files/books/gardiens-lumiere.pdf',
    3145728,
    'files/extracts/gardiens-lumiere.pdf',

    'pdf',
    'fr',
    'Jeunesse',

    JSON_ARRAY('Fantasy', 'Amitié'),

    JSON_ARRAY('Enfants', 'Adolescents'),

    NULL,
    180,
    0.00,

    TRUE,
    'publie',

    4.70,
    132,
    3210
),

-- ==========================================
-- 9. LE ROYAUME DES BRUMES
-- Inès Martin
-- BROUILLON
-- ==========================================

(
    (SELECT id FROM author_inscription WHERE user_id = (SELECT id FROM user_user WHERE code_user = "LIRA-U007") AND status = "valide"),
    (SELECT id FROM catalogue_categories WHERE slug = 'aventure'),

    'Le Royaume des Brumes',
    'le-royaume-des-brumes',
    'Au-delà des montagnes oubliées',

    "Une exploratrice part à la recherche d'un royaume disparu.",

    'Guidée par une ancienne carte, Nora traverse des montagnes dangereuses pour découvrir un royaume caché depuis plusieurs siècles.',

    'images/books/royaume-brumes.jpg',
    NULL,
    NULL,
    NULL,

    'epub',
    'fr',
    'Aventure',

    JSON_ARRAY('Exploration', 'Mystère'),

    JSON_ARRAY('Adolescents', 'Adultes'),

    NULL,
    390,
    13.50,

    TRUE,
    'brouillon',

    0.00,
    0,
    0
),

-- ==========================================
-- 10. AU-DELÀ DE L'HORIZON
-- Sophie Laurent
-- ==========================================

(
    (SELECT id FROM author_inscription WHERE user_id = (SELECT id FROM user_user WHERE code_user = "LIRA-U007") AND status = "valide"),
    (SELECT id FROM catalogue_categories WHERE slug = 'science-fiction'),

    'Au-delà de l''Horizon',
    'au-dela-de-lhorizon',
    'Les derniers explorateurs',

    "Une équipe d'astronautes découvre une planète inconnue.",

    "Lors d'une mission spatiale, un équipage découvre une planète mystérieuse. Mais leur arrivée réveille une ancienne civilisation dont les intentions restent inconnues.",

    'images/books/au-dela-horizon.jpg',
    'files/books/au-dela-horizon.pdf',
    8388608,
    'files/extracts/au-dela-horizon.pdf',

    'pdf',
    'fr',
    'Science-fiction',

    JSON_ARRAY('Exploration spatiale', 'Mystère'),

    JSON_ARRAY('Adolescents', 'Adultes'),

    NULL,
    365,
    10.90,

    TRUE,
    'publie',

    4.40,
    74,
    1560
);