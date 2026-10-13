-- CONNEXION
mysql -u root -p

-- CREATION ET UTILISATION
CREATE DATABASE IF NOT EXISTS lira_book_store;
USE lira_book_store;

-- ==========================================
-- TABLE USER
-- ==========================================

CREATE TABLE user_user (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    code_user VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    pseudo VARCHAR(255),
    avatar_url VARCHAR(500),
    bio TEXT,
    role ENUM('lecteur','author','admin') NOT NULL DEFAULT 'lecteur',
    email_verified BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    -- VERIFICATION
    CONSTRAINT ch_created
        CHECK (created_at<=updated_at)
    
);


-- ============================================
-- INSERTION DES DONNEES TESTES
-- ============================================

INSERT INTO user_user (
    email,
    password,
    code_user,
    name,
    pseudo,
    avatar_url,
    bio,
    role,
    email_verified
)
VALUES
-- 1. AUTEUR
(
    "sophie.laurent@example.com",
    "HASH_A_REMPLACER_01",
    "LIRA-U001",
    "Sophie Laurent",
    "SophieWrites",
    NULL,
    "Romancière passionnée par les univers fantastiques.",
    "auteur",
    TRUE
),
-- 2. LECTEUR
(
    'marc.dubois@example.com',
    'HASH_A_REMPLACER_02',
    'LIRA-U002',
    'Marc Dubois',
    'MarcLit',
    NULL,
    'Amateur de romans policiers et de thrillers.',
    'lecteur',
    TRUE
),
-- 3. AUTEUR
(
    'emma.moreau@example.com',
    'HASH_A_REMPLACER_03',
    'LIRA-U003',
    'Emma Moreau',
    'EmmaPlume',
    NULL,
    'Auteure de romances contemporaines.',
    'auteur',
    TRUE
),
-- 4. LECTEUR
(
    'lucas.bernard@example.com',
    'HASH_A_REMPLACER_04',
    'LIRA-U004',
    'Lucas Bernard',
    'LucasBooks',
    NULL,
    'Je découvre les livres de science-fiction.',
    'lecteur',
    FALSE
),
-- 5. ADMIN
(
    'camille.petit@example.com',
    'HASH_A_REMPLACER_05',
    'LIRA-U005',
    'Camille Petit',
    'CamilleAdmin',
    NULL,
    'Administratrice de la plateforme Lira.',
    'admin',
    TRUE
),
-- 6. LECTEUR
(
    'thomas.leroy@example.com',
    'HASH_A_REMPLACER_06',
    'LIRA-U006',
    'Thomas Leroy',
    'ThomasReader',
    NULL,
    'Passionné de littérature classique.',
    'lecteur',
    TRUE
),
-- 7. AUTEUR
(
    'ines.martin@example.com',
    'HASH_A_REMPLACER_07',
    'LIRA-U007',
    'Inès Martin',
    'InesStories',
    NULL,
    'Auteure de récits jeunesse et de fantasy.',
    'auteur',
    TRUE
),
-- 8. LECTEUR
(
    'hugo.fontaine@example.com',
    'HASH_A_REMPLACER_08',
    'LIRA-U008',
    'Hugo Fontaine',
    'HugoLecture',
    NULL,
    'Lecteur de bandes dessinées et de mangas.',
    'lecteur',
    FALSE
),
-- 9. ADMIN
(
    'lea.rousseau@example.com',
    'HASH_A_REMPLACER_09',
    'LIRA-U009',
    'Léa Rousseau',
    'LeaAdmin',
    NULL,
    'Responsable de la modération des contenus.',
    'admin',
    TRUE
),
-- 10. LECTEUR
(
    'nathan.girard@example.com',
    'HASH_A_REMPLACER_10',
    'LIRA-U010',
    'Nathan Girard',
    'NathanReads',
    NULL,
    "J' aime découvrir de nouveaux auteurs.",
    'lecteur',
    TRUE
);