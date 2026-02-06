-- ============================================================================
-- Script SQL des tables MANQUANTES de GESTASSU
-- Date de génération: 2026-02-05
-- ============================================================================

USE gestassu_db;

-- ============================================================================
-- Table : contact_compagnie
-- ============================================================================
CREATE TABLE IF NOT EXISTS contact_compagnie (
    idcontact_compagnie VARCHAR(50) PRIMARY KEY,
    Nom_contact VARCHAR(255),
    tel_contact VARCHAR(50),
    whatsapp_contact VARCHAR(50),
    email_contact VARCHAR(100),
    fonction_contact VARCHAR(100),
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    date_modif DATETIME,
    date_enreg DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    Id_compagnie VARCHAR(50),
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : cat_vehicule
-- ============================================================================
CREATE TABLE IF NOT EXISTS cat_vehicule (
    code_cat VARCHAR(50) PRIMARY KEY,
    lib_cat VARCHAR(255),
    description_cat TEXT,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_modif DATETIME,
    date_synchro DATETIME,
    date_enreg DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    enable_flotte BOOLEAN DEFAULT FALSE,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : tarif_auto
-- ============================================================================
CREATE TABLE IF NOT EXISTS tarif_auto (
    idtarif VARCHAR(50) PRIMARY KEY,
    id_produit VARCHAR(50),
    groupe VARCHAR(100),
    code_cat VARCHAR(50),
    energie VARCHAR(50),
    puissance_fiscale INT,
    valeur_vehicule INT,
    ID_Garantie VARCHAR(50),
    prime_fixe INT,
    surprime_passager DECIMAL(10, 2),
    franchise_fixe INT,
    taux_franchise DECIMAL(10, 2),
    date_modif DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    capital INT,
    surprime_remorque DECIMAL(10, 2),
    franchise_min INT,
    prime_minimun INT,
    prime_taux DECIMAL(10, 2),
    prime_taux_sur VARCHAR(100),
    franchise_max INT,
    Id_compagnie VARCHAR(50),
    prime_taux_garantie VARCHAR(100),
    surprime_passager_fixe DECIMAL(15, 2),
    nb_passager_surprime INT,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : attestation
-- ============================================================================
CREATE TABLE IF NOT EXISTS attestation (
    id_compagnie VARCHAR(50),
    id_attestation VARCHAR(50) PRIMARY KEY,
    Num_attestation VARCHAR(100),
    Etat_attestation INT,
    Remarque_attestation TEXT,
    date_synchro DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_enreg DATETIME,
    date_modif DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    type_attestation VARCHAR(50),
    ref_lot VARCHAR(50),
    CodeAgence VARCHAR(50),
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : type_mvt_automatique
-- ============================================================================
CREATE TABLE IF NOT EXISTS type_mvt_automatique (
    IDTYPE_MVT VARCHAR(50) PRIMARY KEY,
    LibType_Mouvement VARCHAR(255),
    typeOP BOOLEAN DEFAULT FALSE,
    Acteur VARCHAR(100),
    date_synchro DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : type_mvt_manuel
-- ============================================================================
CREATE TABLE IF NOT EXISTS type_mvt_manuel (
    IDTYPE_MVT VARCHAR(50) PRIMARY KEY,
    LibType_Mouvement VARCHAR(255),
    typeOP BOOLEAN DEFAULT FALSE,
    Effacer BOOLEAN DEFAULT FALSE,
    Acteur VARCHAR(100),
    IDUTILISATEUR_save VARCHAR(50),
    date_enreg DATETIME,
    date_modif DATETIME,
    date_synchro DATETIME,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : visibilite_caisse
-- ============================================================================
CREATE TABLE IF NOT EXISTS visibilite_caisse (
    estvisible BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    IDCaisse VARCHAR(50),
    IDUTILISATEUR_save VARCHAR(50),
    date_synchro DATETIME,
    date_enreg DATETIME,
    ID_utilisateur VARCHAR(50),
    date_modif DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    daterecupserveur DATETIME,
    PRIMARY KEY (IDCaisse, ID_utilisateur)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : frais_accessoire
-- ============================================================================
CREATE TABLE IF NOT EXISTS frais_accessoire (
    IDFRAISACCESS VARCHAR(50) PRIMARY KEY,
    INTERV_MIN INT,
    INTERV_MAX INT,
    MONTANT INT,
    Id_compagnie VARCHAR(50),
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : commission_categorie
-- ============================================================================
CREATE TABLE IF NOT EXISTS commission_categorie (
    Code_cat VARCHAR(50),
    Id_compagnie VARCHAR(50),
    tx_commision DECIMAL(10, 2),
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    date_enreg DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    daterecupserveur DATETIME,
    PRIMARY KEY (Code_cat, Id_compagnie)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : tarif_mrh
-- ============================================================================
CREATE TABLE IF NOT EXISTS tarif_mrh (
    ID_Garantie VARCHAR(50),
    IDtarif_mrh VARCHAR(50) PRIMARY KEY,
    id_produit VARCHAR(50),
    idcompagnie VARCHAR(50),
    montant_plafond INT,
    taux DECIMAL(10, 2),
    franchise_min INT,
    franchise_max INT,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    date_modif DATETIME,
    surprime_taux DECIMAL(10, 2),
    surprime_fixe INT,
    prime_fixe INT,
    franchise_fixe INT,
    taux_franchise DECIMAL(10, 2),
    capital_min DECIMAL(15, 2),
    capital_max DECIMAL(15, 2),
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : reversement_prime
-- ============================================================================
CREATE TABLE IF NOT EXISTS reversement_prime (
    idreversement VARCHAR(50) PRIMARY KEY,
    idgroupereversement VARCHAR(50),
    num_ordre_rev VARCHAR(50),
    lib_reversement VARCHAR(255),
    Idquittance VARCHAR(50),
    montant_reverse INT,
    datereversement DATETIME,
    date_enreg DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    Id_compagnie VARCHAR(50),
    idmouvement VARCHAR(50),
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : groupe_garantie
-- ============================================================================
CREATE TABLE IF NOT EXISTS groupe_garantie (
    code_groupe_garantie VARCHAR(50) PRIMARY KEY,
    lib_groupe_garantie VARCHAR(255),
    Code_groupe_prod VARCHAR(50),
    sync BOOLEAN DEFAULT FALSE,
    effacer BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- CRÉATION DES INDEX POUR LES NOUVELLES TABLES
-- ============================================================================

-- Index pour contact_compagnie
CREATE INDEX idx_contact_compagnie ON contact_compagnie(Id_compagnie);

-- Index pour tarif_auto
CREATE INDEX idx_tarif_auto_produit ON tarif_auto(id_produit);
CREATE INDEX idx_tarif_auto_compagnie ON tarif_auto(Id_compagnie);
CREATE INDEX idx_tarif_auto_cat ON tarif_auto(code_cat);
CREATE INDEX idx_tarif_auto_garantie ON tarif_auto(ID_Garantie);

-- Index pour attestation
CREATE INDEX idx_attestation_compagnie ON attestation(id_compagnie);
CREATE INDEX idx_attestation_agence ON attestation(CodeAgence);

-- Index pour visibilite_caisse
CREATE INDEX idx_visibilite_caisse_utilisateur ON visibilite_caisse(ID_utilisateur);
CREATE INDEX idx_visibilite_caisse_caisse ON visibilite_caisse(IDCaisse);

-- Index pour frais_accessoire
CREATE INDEX idx_frais_accessoire_compagnie ON frais_accessoire(Id_compagnie);

-- Index pour commission_categorie
CREATE INDEX idx_commission_cat_compagnie ON commission_categorie(Id_compagnie);

-- Index pour tarif_mrh
CREATE INDEX idx_tarif_mrh_produit ON tarif_mrh(id_produit);
CREATE INDEX idx_tarif_mrh_compagnie ON tarif_mrh(idcompagnie);
CREATE INDEX idx_tarif_mrh_garantie ON tarif_mrh(ID_Garantie);

-- Index pour reversement_prime
CREATE INDEX idx_reversement_prime_groupe ON reversement_prime(idgroupereversement);
CREATE INDEX idx_reversement_prime_quittance ON reversement_prime(Idquittance);
CREATE INDEX idx_reversement_prime_compagnie ON reversement_prime(Id_compagnie);

-- Index pour groupe_garantie
CREATE INDEX idx_groupe_garantie_prod ON groupe_garantie(Code_groupe_prod);

-- ============================================================================
-- FIN DU SCRIPT
-- ============================================================================

SELECT 'Tables manquantes créées avec succès!' AS Message;
SELECT COUNT(*) AS 'Nombre de nouvelles tables' FROM information_schema.tables 
WHERE table_schema = 'gestassu_db' 
AND table_name IN (
    'contact_compagnie', 'cat_vehicule', 'tarif_auto', 'attestation',
    'type_mvt_automatique', 'type_mvt_manuel', 'visibilite_caisse',
    'frais_accessoire', 'commission_categorie', 'tarif_mrh',
    'reversement_prime', 'groupe_garantie'
);
