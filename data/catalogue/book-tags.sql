-- CONNEXION
mysql -u root -p

-- CREATION ET UTILISATION
USE lira_book_store;

-- ==========================================
-- TABLE CATALOGUE
-- ==========================================
CREATE TABLE catalogue_relation_book_tag (
    book_id BIGINT UNSIGNED NOT NULL,
    tag_id BIGINT UNSIGNED NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- KEY PRIMAIRE COMPOSE
    PRIMARY KEY (book_id, tag_id),

    -- INDEX POUR LES RECHERCHES PAR TAGS
    INDEX idx_tag (tag_id),

    -- RELATION
    CONSTRAINT fk_book_catalogueBook
        FOREIGN KEY (book_id)
        REFERENCES catalogue_books(id),
    CONSTRAINT fk_tag_catalogueTags
        FOREIGN KEY (tag_id)
        REFERENCES catalogue_tags(id)
);



-- ==========================================
-- LIRA — ASSOCIATIONS LIVRES / TAGS
-- ==========================================

INSERT INTO catalogue_relation_book_tag (
    book_id,
    tag_id
)
SELECT
    b.id,
    t.id
FROM catalogue_books AS b
INNER JOIN (
    SELECT 'le-jardin-des-etoiles' AS book_slug, 'magie' AS tag_slug
    UNION ALL SELECT 'le-jardin-des-etoiles', 'mystere'
    UNION ALL SELECT 'le-jardin-des-etoiles', 'romance'
    UNION ALL SELECT 'le-jardin-des-etoiles', 'secrets'

    UNION ALL SELECT 'les-portes-du-temps', 'voyage-temporel'
    UNION ALL SELECT 'les-portes-du-temps', 'science-fiction'
    UNION ALL SELECT 'les-portes-du-temps', 'aventure'

    UNION ALL SELECT 'lecho-des-mondes', 'fantasy'
    UNION ALL SELECT 'lecho-des-mondes', 'mondes-paralleles'
    UNION ALL SELECT 'lecho-des-mondes', 'magie'

    UNION ALL SELECT 'un-ete-a-paris', 'romance'
    UNION ALL SELECT 'un-ete-a-paris', 'amour'
    UNION ALL SELECT 'un-ete-a-paris', 'seconde-chance'

    UNION ALL SELECT 'nos-promesses-oubliees', 'romance'
    UNION ALL SELECT 'nos-promesses-oubliees', 'seconde-chance'
    UNION ALL SELECT 'nos-promesses-oubliees', 'drame'

    UNION ALL SELECT 'les-lettres-du-destin', 'mystere'
    UNION ALL SELECT 'les-lettres-du-destin', 'famille'
    UNION ALL SELECT 'les-lettres-du-destin', 'secrets'
    UNION ALL SELECT 'les-lettres-du-destin', 'drame'

    UNION ALL SELECT 'la-foret-des-secrets', 'fantasy'
    UNION ALL SELECT 'la-foret-des-secrets', 'magie'
    UNION ALL SELECT 'la-foret-des-secrets', 'creatures-fantastiques'
    UNION ALL SELECT 'la-foret-des-secrets', 'prophetie'

    UNION ALL SELECT 'les-gardiens-de-lumiere', 'jeunesse'
    UNION ALL SELECT 'les-gardiens-de-lumiere', 'amitie'
    UNION ALL SELECT 'les-gardiens-de-lumiere', 'courage'
    UNION ALL SELECT 'les-gardiens-de-lumiere', 'aventure'

    UNION ALL SELECT 'le-royaume-des-brumes', 'exploration'
    UNION ALL SELECT 'le-royaume-des-brumes', 'aventure'
    UNION ALL SELECT 'le-royaume-des-brumes', 'mystere'

    UNION ALL SELECT 'au-dela-de-lhorizon', 'science-fiction'
    UNION ALL SELECT 'au-dela-de-lhorizon', 'exploration-spatiale'
    UNION ALL SELECT 'au-dela-de-lhorizon', 'mystere'

) AS associations
    ON b.slug = associations.book_slug

INNER JOIN catalogue_tags AS t
    ON t.slug = associations.tag_slug;