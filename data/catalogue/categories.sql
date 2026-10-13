-- CONNEXION
mysql -u root -p

-- CREATION ET UTILISATION
USE lira_book_store;

-- ==========================================
-- TABLE CATEGORIES
-- ==========================================
CREATE TABLE catalogue_categories (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    slug VARCHAR(255) UNIQUE,
    description TEXT,
    icon VARCHAR(500),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-- ==========================================
-- INSERTION CATEOGIRES
-- ==========================================
INSERT INTO catalogue_categories (
    name,
    slug,
    description
)
VALUES
(
    'Fantastique',
    'fantastique',
    'Romans mêlant réalité et éléments surnaturels.'
),
(
    'Science-fiction',
    'science-fiction',
    'Histoires imaginant des technologies et des mondes futurs.'
),
(
    'Fantasy',
    'fantasy',
    'Univers imaginaires, magie et aventures épiques.'
),
(
    'Romance',
    'romance',
    'Histoires centrées sur les relations amoureuses.'
),
(
    'Drame',
    'drame',
    'Récits abordant les émotions et les conflits humains.'
),
(
    'Jeunesse',
    'jeunesse',
    'Livres destinés aux enfants et adolescents.'
),
(
    'Aventure',
    'aventure',
    'Récits de voyages, découvertes et défis.'
);