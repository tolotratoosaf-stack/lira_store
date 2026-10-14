-- CONNEXION
mysql -u root -p

-- CREATION ET UTILISATION
CREATE DATABASE IF NOT EXISTS lira_book_store;
USE lira_book_store;

-- ==========================================
-- TABLE INSCRIPTION AUTEUR
-- ==========================================

CREATE TABLE author_inscription (
    id BIGINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT UNSIGNED NOT NULL UNIQUE,
    name VARCHAR(500),
    pseudo VARCHAR(500),
    avatar_url VARCHAR(500),
    banner_url VARCHAR(500),
    short_bio TEXT,
    long_bio LONGTEXT,
    languages VARCHAR(255),
    genres VARCHAR(255),
    country VARCHAR(255),
    birth_day DATE,
    legal_status BOOLEAN NOT NULL DEFAULT FALSE,
    website VARCHAR(255) UNIQUE,
    socials JSON,
    motivation LONGTEXT,
    project_description LONGTEXT,
    planned_books LONGTEXT,
    already_publish BOOLEAN NOT NULL DEFAULT FALSE,
    status ENUM(
        'en revision',
        'valide',
        'rejete'
    ),
    reviewed_note TEXT,
    reviewed_by BIGINT UNSIGNED,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    -- INDEXATION DE RECHERCHE
    INDEX idx_name (name),
    INDEX idx_pseudo (pseudo),
    INDEX idx_genres (genres),
    
    -- VERIFICATION LOGIQUE
    CONSTRAINT ch_date
        CHECK (created_at<=updated_at),
    
    -- RELATION VERS USER
    CONSTRAINT fk_user_userUser
        FOREIGN KEY (user_id)
        REFERENCES user_user(id)
);




-- ==========================================
-- LIRA — CANDIDATURES AUTEURS
-- DONNÉES DE TEST
-- ==========================================

INSERT INTO author_inscription (
    user_id,
    name,
    pseudo,
    avatar_url,
    banner_url,
    short_bio,
    long_bio,
    languages,
    genres,
    country,
    birth_day,
    legal_status,
    website,
    socials,
    motivation,
    project_description,
    planned_books,
    already_publish,
    status,
    reviewed_note,
    reviewed_by,
    created_at
)

VALUES

-- ==========================================
-- 1. SOPHIE LAURENT
-- CANDIDATURE VALIDÉE
-- ==========================================

(
    (SELECT id FROM user_user WHERE code_user = 'LIRA-U001'),
    'Sophie Laurent',
    'SophieWrites',
    NULL,
    NULL,
    'Romancière passionnée par les univers fantastiques.',
    'Sophie Laurent écrit des romans mêlant fantastique, aventure et émotions humaines. Elle aime créer des univers imaginaires et des personnages attachants.',
    'Français, Anglais',
    'Fantastique, Romance, Aventure',
    'France',
    '1994-05-18',
    TRUE,
    NULL,
    JSON_OBJECT(
        'instagram', 'sophiewrites',
        'facebook', 'SophieWrites'
    ),
    "Je souhaite partager mes histoires avec une communauté de lecteurs passionnés et développer ma carrière d' auteure.",
    'Publication de romans fantastiques mêlant romance et aventure.',
    'Le Jardin des Étoiles, Les Portes du Temps',
    TRUE,
    'valide',
    'Candidature complète. Profil auteur approuvé.',
    (SELECT id FROM user_user WHERE code_user = 'LIRA-U005'),
    '2026-09-15 10:30:00'
),


-- ==========================================
-- 2. EMMA MOREAU
-- CANDIDATURE VALIDÉE
-- ==========================================

(
    (SELECT id FROM user_user WHERE code_user = 'LIRA-U003'),
    'Emma Moreau',
    'EmmaPlume',
    NULL,
    NULL,
    'Auteure de romances contemporaines.',
    'Emma Moreau écrit des histoires centrées sur les relations humaines, les émotions et les rencontres inattendues.',
    'Français',
    'Romance, Drame',
    'France',
    '1997-02-11',
    FALSE,
    NULL,
    JSON_OBJECT(
        'instagram', 'emmaplume'
    ),
    'Je souhaite publier mes romans et faire découvrir mes personnages aux lecteurs de Lira.',
    "Création d'une collection de romances contemporaines.",
    'Un Été à Paris, Nos Promesses Oubliées',
    TRUE,
    'valide',
    'Projet littéraire intéressant. Candidature acceptée.',
    (SELECT id FROM user_user WHERE code_user = 'LIRA-U009'),
    '2026-09-18 14:20:00'
),


-- ==========================================
-- 3. INÈS MARTIN
-- CANDIDATURE VALIDÉE
-- ==========================================

(
    (SELECT id FROM user_user WHERE code_user = 'LIRA-U007'),
    'Inès Martin',
    'InesStories',
    NULL,
    NULL,
    'Auteure de récits jeunesse et de fantasy.',
    "Inès Martin imagine des aventures fantastiques destinées aux jeunes lecteurs. Ses histoires abordent le courage, l' amitié et la découverte de soi.",
    'Français, Anglais',
    'Fantasy, Jeunesse, Aventure',
    'Madagascar',
    '1999-08-24',
    FALSE,
    NULL,
    JSON_OBJECT(
        'instagram', 'inesstories',
        'tiktok', 'inesstories'
    ),
    'Je veux encourager les jeunes à lire et à développer leur imagination.',
    'Publication de romans fantasy pour adolescents.',
    'La Forêt des Secrets, Les Gardiens de Lumière',
    FALSE,
    'valide',
    'Projet original et adapté au public jeunesse. Validé.',
    (SELECT id FROM user_user WHERE code_user = 'LIRA-U005'),
    '2026-09-20 09:45:00'
),


-- ==========================================
-- 4. LUCAS BERNARD
-- CANDIDATURE EN RÉVISION
-- ==========================================

(
    (SELECT id FROM user_user WHERE code_user = 'LIRA-U004'),
    'Lucas Bernard',
    'LucasBooks',
    NULL,
    NULL,
    "Passionné de science-fiction et d' écriture.",
    'Lucas Bernard travaille actuellement sur son premier roman de science-fiction.',
    'Français',
    'Science-fiction, Aventure',
    'France',
    '2001-03-12',
    FALSE,
    NULL,
    JSON_OBJECT(
        'instagram', 'lucasbooks'
    ),
    'Je souhaite publier mon premier roman et recevoir des retours de lecteurs.',
    'Un roman de science-fiction explorant les voyages interstellaires.',
    'Au-delà des Étoiles',
    FALSE,
    'en_revision',
    NULL,
    NULL,
    NULL
),


-- ==========================================
-- 5. HUGO FONTAINE
-- CANDIDATURE EN RÉVISION
-- ==========================================

(
    (SELECT id FROM user_user WHERE code_user = 'LIRA-U008'),
    'Hugo Fontaine',
    'HugoLecture',
    NULL,
    NULL,
    'Passionné de mangas et de bandes dessinées.',
    "Hugo Fontaine développe un projet de bande dessinée inspiré des récits d' aventure et de fantasy.",
    'Français, Japonais',
    'Manga, Fantasy, Aventure',
    'France',
    '2000-11-06',
    FALSE,
    NULL,
    JSON_OBJECT(
        'instagram', 'hugoart',
        'tiktok', 'hugoart'
    ),
    'Je souhaite partager mes créations et découvrir une communauté de lecteurs.',
    "Création d' une série de bandes dessinées fantastiques.",
    'Les Chroniques du Dragon',
    FALSE,
    'en_revision',
    NULL,
    NULL,
    NULL
),


-- ==========================================
-- 6. THOMAS LEROY
-- CANDIDATURE REJETÉE
-- ==========================================

(
    (SELECT id FROM user_user WHERE code_user = 'LIRA-U006'),
    'Thomas Leroy',
    'ThomasReader',
    NULL,
    NULL,
    'Passionné de littérature classique.',
    'Thomas Leroy souhaite écrire des essais littéraires et partager ses analyses de romans classiques.',
    'Français',
    'Essai, Littérature classique',
    'France',
    '1988-07-09',
    FALSE,
    NULL,
    JSON_OBJECT(
        'facebook', 'ThomasReader'
    ),
    'Je souhaite publier mes réflexions sur la littérature.',
    "Publication d' essais et de commentaires littéraires.",
    'Regards sur les Classiques',
    FALSE,
    'rejete',
    'Candidature incomplète. Une description plus détaillée du projet est nécessaire.',
    (SELECT id FROM user_user WHERE code_user = 'LIRA-U009'),
    '2026-09-22 16:10:00'
);