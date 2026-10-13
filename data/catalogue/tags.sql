-- CONNEXION
mysql -u root -p

-- CREATION ET UTILISATION
USE lira_book_store;

-- ==========================================
-- TABLE CATALOGUE
-- ==========================================
CREATE TABLE catalogue_tags (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    slug VARCHAR(255) UNIQUE NOT NULL,
    usage_count BIGINT UNSIGNED DEFAULT 0,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);



-- ==========================================
-- LIRA — TAGS DE TEST
-- ==========================================