-- ============================================================================
-- Script de création de la base de données GESTASSU
-- Généré à partir de la liste complète des structures
-- Date de génération: 2026-02-05
-- ============================================================================

-- Création de la base de données
CREATE DATABASE IF NOT EXISTS gestassu_db
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE gestassu_db;

-- ============================================================================
-- Table : indicateur_engagement
-- ============================================================================
CREATE TABLE IF NOT EXISTS indicateur_engagement (
    ID_INDICATEUR_ENG VARCHAR(50) PRIMARY KEY,
    date_enreg DATETIME,
    solde_caisse DECIMAL(15, 2),
    solde_client DECIMAL(15, 2),
    solde_compagnie DECIMAL(15, 2),
    solde_quittance_nonreverse DECIMAL(15, 2),
    effacer BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    sync BOOLEAN DEFAULT FALSE,
    montant_engagement DECIMAL(15, 2),
    solde_banque DECIMAL(15, 2),
    montant_couverture DECIMAL(15, 2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : info_societe
-- ============================================================================
CREATE TABLE IF NOT EXISTS info_societe (
    raisonsocial VARCHAR(255),
    Adresse VARCHAR(255),
    tel_courtier VARCHAR(50),
    email_courtier VARCHAR(100),
    logo_courtier TEXT,
    date_enreg DATETIME,
    date_modif DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    BP_coutier VARCHAR(50),
    Fax_coutier VARCHAR(50),
    basdepage VARCHAR(255),
    param_CEMAC INT,
    param_CCA INT,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : client
-- ============================================================================
CREATE TABLE IF NOT EXISTS client (
    ID_Client VARCHAR(50) PRIMARY KEY,
    Nom_client VARCHAR(255),
    Adresse VARCHAR(255),
    Email VARCHAR(100),
    Telephone VARCHAR(50),
    Tel_WhatsApp VARCHAR(50),
    Date_naissance DATE,
    Profession VARCHAR(100),
    date_enreg DATETIME,
    civilite VARCHAR(20),
    Source VARCHAR(100),
    pays VARCHAR(100),
    Autres_Informations TEXT,
    est_entreprise BOOLEAN DEFAULT FALSE,
    representant_Entreprise VARCHAR(255),
    IDUTILISATEUR_source VARCHAR(50),
    IDUTILISATEUR_save VARCHAR(50),
    date_modif DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    role_representant VARCHAR(100),
    nif_client VARCHAR(50),
    prenom_client VARCHAR(255),
    date_permis_cond DATE,
    Fax_client VARCHAR(50),
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : utilisateur
-- ============================================================================
CREATE TABLE IF NOT EXISTS utilisateur (
    IDUTILISATEUR VARCHAR(50) PRIMARY KEY,
    Nom_utilisateur VARCHAR(255),
    Adresse_email VARCHAR(100),
    Mot_de_passe VARCHAR(255),
    Tel_utilisateur VARCHAR(50),
    Role_utilisateur VARCHAR(50),
    login_utilisateur VARCHAR(100),
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    date_modif DATETIME,
    date_enreg DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    CodeAgence VARCHAR(50),
    est_desactiver BOOLEAN DEFAULT FALSE,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : interaction
-- ============================================================================
CREATE TABLE IF NOT EXISTS interaction (
    IDINTERACTION VARCHAR(50) PRIMARY KEY,
    ID_Client VARCHAR(50),
    Type_interaction VARCHAR(50),
    date_heure_interaction DATETIME,
    duree_interaction VARCHAR(50),
    Lieu VARCHAR(255),
    Description TEXT,
    Resultat_interaction TEXT,
    Date_rappel DATETIME,
    rappel_necessaire BOOLEAN DEFAULT FALSE,
    IDUTILISATEUR_action VARCHAR(50),
    effacer BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    date_enreg DATETIME,
    date_modif DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    sync BOOLEAN DEFAULT FALSE,
    titre_rappel VARCHAR(255),
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : droits
-- ============================================================================
CREATE TABLE IF NOT EXISTS droits (
    code_Droit VARCHAR(50) PRIMARY KEY,
    libelle_droit VARCHAR(255),
    IDGROUPE INT,
    date_modif DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    date_enreg DATETIME,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : groupe_droit
-- ============================================================================
CREATE TABLE IF NOT EXISTS groupe_droit (
    IDGROUPE INT PRIMARY KEY AUTO_INCREMENT,
    LIBELLE_GROUPE VARCHAR(255),
    date_synchro DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : possede_droit
-- ============================================================================
CREATE TABLE IF NOT EXISTS possede_droit (
    Code_Droit VARCHAR(50),
    droitactif BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    sync BOOLEAN DEFAULT FALSE,
    CodeAgence VARCHAR(50),
    IDUTILISATEUR_save VARCHAR(50),
    date_enreg DATETIME,
    date_modif DATETIME,
    IDUTILISATEUR VARCHAR(50),
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : taches
-- ============================================================================
CREATE TABLE IF NOT EXISTS taches (
    IDTACHES VARCHAR(50) PRIMARY KEY,
    date_echeance_tache DATETIME,
    date_creation_tache DATETIME,
    titre_tache VARCHAR(255),
    date_cloture_tache DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    date_enreg DATETIME,
    date_synchro DATETIME,
    sync BOOLEAN DEFAULT FALSE,
    effacer BOOLEAN DEFAULT FALSE,
    IDUTILISATEUR_affecter VARCHAR(50),
    description_tache TEXT,
    statut_tache INT,
    date_modif DATETIME,
    ID_Client VARCHAR(50),
    IDINTERACTION VARCHAR(50),
    code_couleur VARCHAR(20),
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : compagnie
-- ============================================================================
CREATE TABLE IF NOT EXISTS compagnie (
    id_compagnie VARCHAR(50) PRIMARY KEY,
    nom_compagnie VARCHAR(255),
    tel_compagnie VARCHAR(50),
    adresse_compagnie VARCHAR(255),
    email_compagnie VARCHAR(100),
    logo TEXT,
    date_enreg DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    date_modif DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    codification_compagnie VARCHAR(50),
    Url_logo VARCHAR(255),
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : groupe_produit
-- ============================================================================
CREATE TABLE IF NOT EXISTS groupe_produit (
    code_groupe_prod VARCHAR(50) PRIMARY KEY,
    lib_groupe_prod VARCHAR(255),
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : produit
-- ============================================================================
CREATE TABLE IF NOT EXISTS produit (
    id_produit VARCHAR(50) PRIMARY KEY,
    lib_produit VARCHAR(255),
    date_enreg DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    date_modif DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    branche VARCHAR(100),
    type_risque VARCHAR(100),
    codification_produit VARCHAR(50),
    Id_compagnie VARCHAR(50),
    taux_commission DECIMAL(10, 2),
    montant_fixe_commission DECIMAL(15, 2),
    taux_taxe DECIMAL(10, 2),
    code_groupe_prod VARCHAR(50),
    frais_gestion INT,
    frais_adhesion INT,
    taux_frais_gestion DECIMAL(10, 2),
    taux_com_premiere_an DECIMAL(10, 2),
    taux_com_an_suivant DECIMAL(10, 2),
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : contrat
-- ============================================================================
CREATE TABLE IF NOT EXISTS contrat (
    id_contrat VARCHAR(50) PRIMARY KEY,
    estprojet BOOLEAN DEFAULT FALSE,
    numPolice VARCHAR(100),
    date_acte DATE,
    date_effet DATE,
    Date_echeance DATE,
    duree_contrat INT,
    ID_Client VARCHAR(50),
    Id_produit VARCHAR(50),
    prime_nette_brute INT,
    reductions VARCHAR(255),
    prime_net_red INT,
    Id_compagnie VARCHAR(50),
    accessoires INT,
    taxe INT,
    CEMAC INT,
    CSS INT,
    TSVL INT,
    CCA INT,
    prime_totale INT,
    montant_reductions INT,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    date_enreg DATETIME,
    date_modif DATETIME,
    nature_contrat VARCHAR(100),
    type_doc VARCHAR(50),
    attestation_jaune VARCHAR(50),
    attestation_rose VARCHAR(50),
    commission_courtier INT,
    CodeAgence VARCHAR(50),
    numAvenant VARCHAR(50),
    code_apporteur VARCHAR(50),
    taux_com_apporteur DECIMAL(10, 2),
    montant_com_apporteur INT,
    type_contrat VARCHAR(50),
    surprime_taux DECIMAL(10, 2),
    surprime_fixe INT,
    montant_surprime INT,
    fractionnement DECIMAL(10, 2),
    daterecupserveur DATETIME,
    est_suspendu BOOLEAN DEFAULT FALSE,
    date_debut_suspension DATE,
    date_fin_suspension DATE,
    Motif_avenant VARCHAR(255),
    duree_paiement INT,
    frequence_paiement VARCHAR(50),
    observation TEXT,
    piece_justif VARCHAR(255),
    est_resilier BOOLEAN DEFAULT FALSE,
    date_resiliation DATE,
    prime_ristone DECIMAL(15, 2),
    numPolice_assureur VARCHAR(100),
    generation_auto_cotisation BOOLEAN DEFAULT FALSE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : risques
-- ============================================================================
CREATE TABLE IF NOT EXISTS risques (
    id_risque VARCHAR(50) PRIMARY KEY,
    type_risque VARCHAR(50),
    date_enreg DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    date_modif DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    designation_risque VARCHAR(255),
    veh_marque VARCHAR(100),
    veh_modele VARCHAR(100),
    veh_type VARCHAR(100),
    veh_energie VARCHAR(50),
    veh_carrosserie VARCHAR(100),
    veh_puissance VARCHAR(50),
    veh_valeurneuve DECIMAL(15, 2),
    veh_valeurvenale DECIMAL(15, 2),
    veh_datemisecircul DATE,
    veh_immat VARCHAR(50),
    veh_chassis VARCHAR(50),
    veh_usage VARCHAR(100),
    veh_nbplace INT,
    veh_cat VARCHAR(50),
    veh_nbremorque INT,
    veh_conducteur_hab VARCHAR(255),
    veh_mat_inflammable BOOLEAN DEFAULT FALSE,
    bat_adresse VARCHAR(255),
    bat_localisation VARCHAR(255),
    bat_activite VARCHAR(255),
    bat_type VARCHAR(100),
    bat_usage VARCHAR(100),
    bat_superficie DECIMAL(10, 2),
    bat_nb_piece INT,
    bat_valeur DECIMAL(15, 2),
    bat_systeme_secu VARCHAR(255),
    bat_qualite_assure VARCHAR(255),
    veh_type_remorque VARCHAR(100),
    veh_marque_remorque VARCHAR(100),
    veh_immat_remorque VARCHAR(50),
    ass_nom VARCHAR(100),
    ass_prenom VARCHAR(100),
    ass_datenaissance DATE,
    ass_adresse VARCHAR(255),
    ass_bp VARCHAR(50),
    ass_ville VARCHAR(100),
    ass_telephone VARCHAR(50),
    ass_facebook VARCHAR(100),
    ass_autreinfo VARCHAR(255),
    ass_profession VARCHAR(100),
    ass_personne_acontacter VARCHAR(255),
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : garanties
-- ============================================================================
CREATE TABLE IF NOT EXISTS garanties (
    ID_Garantie VARCHAR(50) PRIMARY KEY,
    lib_garantie VARCHAR(255),
    Id_produit VARCHAR(50),
    date_enreg DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    date_modif DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    inclus_PF BOOLEAN DEFAULT FALSE,
    inclus_ValeurVenal BOOLEAN DEFAULT FALSE,
    num_ordre INT,
    est_obligatoire BOOLEAN DEFAULT FALSE,
    capital_deces INT,
    capital_invalidite INT,
    capital_fraismedicaux INT,
    tx_commision DECIMAL(10, 2),
    tx_taxe DECIMAL(10, 2),
    code_groupe_garantie VARCHAR(50),
    inclus_surprime BOOLEAN DEFAULT FALSE,
    reduc_com_flotte BOOLEAN DEFAULT FALSE,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : contrat_risques
-- ============================================================================
CREATE TABLE IF NOT EXISTS contrat_risques (
    Id_risque VARCHAR(50),
    Id_contrat VARCHAR(50),
    date_modif DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    daterecupserveur DATETIME,
    attestation_jaune VARCHAR(50),
    attestation_rose VARCHAR(50),
    montant_cotisation INT,
    mode_paiement VARCHAR(50),
    est_incorporation BOOLEAN DEFAULT FALSE,
    jour_debut_cotisation INT,
    date_debut_cotisation DATE,
    PRIMARY KEY (Id_risque, Id_contrat)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : contrat_garanties
-- ============================================================================
CREATE TABLE IF NOT EXISTS contrat_garanties (
    ID_Garantie VARCHAR(50),
    Id_contrat VARCHAR(50),
    lib_garantie VARCHAR(255),
    capital DECIMAL(15, 2),
    nb_risque INT,
    prime_annuelle INT,
    prime_periode INT,
    date_modif DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    franchise DECIMAL(15, 2),
    Id_risque VARCHAR(50),
    daterecupserveur DATETIME,
    PRIMARY KEY (ID_Garantie, Id_contrat)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : agence
-- ============================================================================
CREATE TABLE IF NOT EXISTS agence (
    CodeAgence VARCHAR(50) PRIMARY KEY,
    numero_agence VARCHAR(50),
    nom_agence VARCHAR(255),
    adresse_agence VARCHAR(255),
    tel_agence VARCHAR(50),
    email_agence VARCHAR(100),
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    date_modif DATETIME,
    date_enreg DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : documents
-- ============================================================================
CREATE TABLE IF NOT EXISTS documents (
    IDDOCUMENTS VARCHAR(50) PRIMARY KEY,
    sync BOOLEAN DEFAULT FALSE,
    effacer BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    date_modif DATETIME,
    date_enreg DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    titre_document VARCHAR(255),
    ID_Client VARCHAR(50),
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : mouvements
-- ============================================================================
CREATE TABLE IF NOT EXISTS mouvements (
    idquittance VARCHAR(50),
    idmouvement VARCHAR(50) PRIMARY KEY,
    datemouvement DATETIME,
    mont_debit DECIMAL(15, 2),
    mont_credit DECIMAL(15, 2),
    observation TEXT,
    sync BOOLEAN DEFAULT FALSE,
    Effacer BOOLEAN DEFAULT FALSE,
    IDTYPE_MVT VARCHAR(50),
    solde_caisse DECIMAL(15, 2),
    LibType_Mouvement VARCHAR(255),
    idtransfert VARCHAR(50),
    nature_compte VARCHAR(50),
    date_annulation DATETIME,
    num_MVT INT,
    est_annuler_par VARCHAR(50),
    date_enreg_mvt DATETIME,
    est_annuler BOOLEAN DEFAULT FALSE,
    IDCaisse VARCHAR(50),
    date_synchro DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    Nom_utilisateur VARCHAR(255),
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : caisse
-- ============================================================================
CREATE TABLE IF NOT EXISTS caisse (
    IDCaisse VARCHAR(50) PRIMARY KEY,
    nom_caisse VARCHAR(255),
    solde_caisse DECIMAL(15, 2),
    date_enreg DATETIME,
    date_modif DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    CodeAgence VARCHAR(50),
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : quittance
-- ============================================================================
CREATE TABLE IF NOT EXISTS quittance (
    idquittance VARCHAR(50) PRIMARY KEY,
    id_contrat VARCHAR(50),
    numQuittance VARCHAR(100),
    montant_police INT,
    montant_encaisse INT,
    montant_apayer INT,
    dateQuittance DATE,
    observation TEXT,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    date_enreg DATETIME,
    date_modif DATETIME,
    est_reversee BOOLEAN DEFAULT FALSE,
    solde_quittance INT,
    est_annulee BOOLEAN DEFAULT FALSE,
    est_ristourner BOOLEAN DEFAULT FALSE,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : type_mouvement
-- ============================================================================
CREATE TABLE IF NOT EXISTS type_mouvement (
    IDTYPE_MVT VARCHAR(50) PRIMARY KEY,
    LibType_Mouvement VARCHAR(255),
    TYPE_ENREG VARCHAR(50),
    date_enreg DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    date_modif DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : demande_annulation
-- ============================================================================
CREATE TABLE IF NOT EXISTS demande_annulation (
    ID_Demande VARCHAR(50) PRIMARY KEY,
    Type_Demande VARCHAR(50),
    Motif TEXT,
    Statut VARCHAR(50),
    Date_Creation DATETIME,
    Date_Modification DATETIME,
    idquittance VARCHAR(50),
    ID_utilisateur VARCHAR(50),
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : validation_demande_annulation
-- ============================================================================
CREATE TABLE IF NOT EXISTS validation_demande_annulation (
    ID_Validation VARCHAR(50) PRIMARY KEY,
    ID_Demande VARCHAR(50),
    Role_Responsable VARCHAR(50),
    Statut VARCHAR(50),
    Date_Validation DATETIME,
    Commentaire TEXT,
    IDUTILISATEUR VARCHAR(50),
    date_enreg DATETIME,
    date_modif DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : declaration_sinistre
-- ============================================================================
CREATE TABLE IF NOT EXISTS declaration_sinistre (
    ID_Sinistre VARCHAR(50) PRIMARY KEY,
    Date_Sinistre DATETIME,
    Type_Sinistre VARCHAR(100),
    Lieu_Sinistre VARCHAR(255),
    Description_Sinistre TEXT,
    Statut VARCHAR(50),
    Commentaire TEXT,
    Date_Declaration DATETIME,
    date_modif DATETIME,
    date_enreg DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    id_contrat VARCHAR(50),
    ID_utilisateur VARCHAR(50),
    Nom_declarant VARCHAR(255),
    Adresse_declarant VARCHAR(255),
    telephone_declarant VARCHAR(50),
    mail_declarant VARCHAR(100),
    type_dommage VARCHAR(100),
    Description_dommage TEXT,
    Nom_adverse VARCHAR(255),
    adresse_adverse VARCHAR(255),
    telephone_adverse VARCHAR(50),
    assureur_adverse VARCHAR(100),
    numpolice_adverse VARCHAR(100),
    detail_bien_impliquer TEXT,
    daterecupserveur DATETIME,
    numero_sinistre VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : commerciaux
-- ============================================================================
CREATE TABLE IF NOT EXISTS commerciaux (
    ID_Commercial VARCHAR(50) PRIMARY KEY,
    Nom_Raison_Sociale VARCHAR(255),
    Date_naissance DATE,
    Adresse VARCHAR(255),
    Telephone VARCHAR(50),
    Email VARCHAR(100),
    Date_Embauche DATE,
    Type_Commercial VARCHAR(50),
    date_Modification DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    date_enreg DATETIME,
    login_commercial VARCHAR(100),
    mdp_commercial VARCHAR(255),
    NIF_RCCM VARCHAR(100),
    Numero_Piece_Identite VARCHAR(50),
    Sous_Type_Commercial VARCHAR(50),
    Reference_Commercial VARCHAR(100),
    Frequence_paiement VARCHAR(50),
    daterecupserveur DATETIME,
    code_retour VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : paiement_commissions
-- ============================================================================
CREATE TABLE IF NOT EXISTS paiement_commissions (
    IDPAIEMENT_COMMISSIONS VARCHAR(50) PRIMARY KEY,
    date_paiement DATETIME,
    observation TEXT,
    ID_Commercial VARCHAR(50),
    sync BOOLEAN DEFAULT FALSE,
    effacer BOOLEAN DEFAULT FALSE,
    IDUTILISATEUR_save VARCHAR(50),
    date_synchro DATETIME,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : details_paiement_commission
-- ============================================================================
CREATE TABLE IF NOT EXISTS details_paiement_commission (
    IDPAIEMENT_COMMISSIONS VARCHAR(50),
    IDCOMMISSIONS_COMMERCIAL VARCHAR(50),
    montant_paye DECIMAL(15, 2),
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    daterecupserveur DATETIME,
    PRIMARY KEY (IDPAIEMENT_COMMISSIONS, IDCOMMISSIONS_COMMERCIAL)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : commissions_commercial
-- ============================================================================
CREATE TABLE IF NOT EXISTS commissions_commercial (
    IDCOMMISSIONS_COMMERCIAL VARCHAR(50) PRIMARY KEY,
    date_generation DATETIME,
    montant_commission DECIMAL(15, 2),
    id_contrat VARCHAR(50),
    ID_Commercial VARCHAR(50),
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_modif DATETIME,
    date_synchro DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    date_enreg DATETIME,
    statut_commission INT,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : remuneration_commerciaux
-- ============================================================================
CREATE TABLE IF NOT EXISTS remuneration_commerciaux (
    IDREMUNERATION_COMMERCIAUX VARCHAR(50) PRIMARY KEY,
    code_groupe_prod VARCHAR(50),
    pourcentage_commission DECIMAL(10, 2),
    mode_remuneration VARCHAR(50),
    commission_fixe DECIMAL(15, 2),
    sync BOOLEAN DEFAULT FALSE,
    effacer BOOLEAN DEFAULT FALSE,
    IDUTILISATEUR_save VARCHAR(50),
    date_enreg DATETIME,
    date_synchro DATETIME,
    date_modif DATETIME,
    ID_Commercial VARCHAR(50),
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : cotisations
-- ============================================================================
CREATE TABLE IF NOT EXISTS cotisations (
    Id_contrat VARCHAR(50),
    Id_risque VARCHAR(50),
    numero_ordre_cotisation INT,
    id_cotisation VARCHAR(50) PRIMARY KEY,
    date_emission DATETIME,
    date_encaissement DATETIME,
    montant_brut INT,
    type_mouvement VARCHAR(50),
    frais_adhesion INT,
    frais_gestion INT,
    montant_investi INT,
    date_enreg DATETIME,
    date_modif DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    est_regle_chez_assureur BOOLEAN DEFAULT FALSE,
    daterecupserveur DATETIME,
    montant_commission INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : beneficiaire
-- ============================================================================
CREATE TABLE IF NOT EXISTS beneficiaire (
    id_beneficiaire VARCHAR(50) PRIMARY KEY,
    nom_beneficiaire VARCHAR(255),
    prenom_beneficiaire VARCHAR(255),
    datenaissance DATE,
    adresse_beneficiaire VARCHAR(255),
    bp_beneficiaire VARCHAR(50),
    ville_beneficiaire VARCHAR(100),
    telephone_beneficiaire VARCHAR(50),
    facebook_beneficiaire VARCHAR(100),
    autresinfos_beneficiaire TEXT,
    profession_beneficiaire VARCHAR(100),
    Id_risque VARCHAR(50),
    date_enreg DATETIME,
    date_modif DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : encaissement_commission
-- ============================================================================
CREATE TABLE IF NOT EXISTS encaissement_commission (
    id_encaissement VARCHAR(50) PRIMARY KEY,
    date_encaissement DATETIME,
    idgroupereversement VARCHAR(50),
    montant_total INT,
    date_enreg DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    date_modif DATETIME,
    observation TEXT,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : repart_accessoire
-- ============================================================================
CREATE TABLE IF NOT EXISTS repart_accessoire (
    IDREPART VARCHAR(50) PRIMARY KEY,
    access_min INT,
    access_max INT,
    part_access_fixe INT,
    Part_access_taux DECIMAL(10, 2),
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    date_modif DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    Id_compagnie VARCHAR(50),
    date_enreg DATETIME,
    daterecupserveur DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : reversement
-- ============================================================================
CREATE TABLE IF NOT EXISTS reversement (
    idgroupereversement VARCHAR(50) PRIMARY KEY,
    montant_reverse_total INT,
    datereversement DATETIME,
    date_enreg DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    lib_reversement VARCHAR(255),
    Id_compagnie VARCHAR(50),
    num_ordre_rev VARCHAR(50),
    periode_rev VARCHAR(100),
    est_valide BOOLEAN DEFAULT FALSE,
    Commission_genere INT,
    daterecupserveur DATETIME,
    montant_payer INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : reversement_details
-- ============================================================================
CREATE TABLE IF NOT EXISTS reversement_details (
    idreversement VARCHAR(50) PRIMARY KEY,
    idgroupereversement VARCHAR(50),
    Idquittance VARCHAR(50),
    montant_reverse INT,
    date_enreg DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    daterecupserveur DATETIME,
    montant_commission INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- Table : reversement_reglement
-- ============================================================================
CREATE TABLE IF NOT EXISTS reversement_reglement (
    idregle_rev VARCHAR(50) PRIMARY KEY,
    date_reglement DATETIME,
    date_enreg DATETIME,
    effacer BOOLEAN DEFAULT FALSE,
    sync BOOLEAN DEFAULT FALSE,
    date_synchro DATETIME,
    IDUTILISATEUR_save VARCHAR(50),
    Idgroupereversement VARCHAR(50),
    Observation_reglement TEXT,
    Montant_Regle INT,
    Mode_versement VARCHAR(50),
    daterecupserveur DATETIME,
    idmouvement VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ============================================================================
-- CRÉATION DES INDEX POUR AMÉLIORER LES PERFORMANCES
-- ============================================================================

-- Index sur les clés étrangères
CREATE INDEX idx_interaction_client ON interaction(ID_Client);
CREATE INDEX idx_taches_client ON taches(ID_Client);
CREATE INDEX idx_taches_utilisateur ON taches(IDUTILISATEUR_affecter);
CREATE INDEX idx_contrat_client ON contrat(ID_Client);
CREATE INDEX idx_contrat_produit ON contrat(Id_produit);
CREATE INDEX idx_contrat_compagnie ON contrat(Id_compagnie);
CREATE INDEX idx_quittance_contrat ON quittance(id_contrat);
CREATE INDEX idx_mouvements_quittance ON mouvements(idquittance);
CREATE INDEX idx_contrat_risques_contrat ON contrat_risques(Id_contrat);
CREATE INDEX idx_contrat_risques_risque ON contrat_risques(Id_risque);
CREATE INDEX idx_contrat_garanties_contrat ON contrat_garanties(Id_contrat);
CREATE INDEX idx_contrat_garanties_garantie ON contrat_garanties(ID_Garantie);
CREATE INDEX idx_produit_compagnie ON produit(Id_compagnie);
CREATE INDEX idx_garanties_produit ON garanties(Id_produit);
CREATE INDEX idx_commerciaux_commission ON commissions_commercial(ID_Commercial);
CREATE INDEX idx_sinistre_contrat ON declaration_sinistre(id_contrat);

-- Index sur les dates pour les requêtes temporelles
CREATE INDEX idx_contrat_date_effet ON contrat(date_effet);
CREATE INDEX idx_contrat_date_echeance ON contrat(Date_echeance);
CREATE INDEX idx_quittance_date ON quittance(dateQuittance);
CREATE INDEX idx_mouvements_date ON mouvements(datemouvement);

-- Index sur les champs de synchronisation
CREATE INDEX idx_client_sync ON client(sync, effacer);
CREATE INDEX idx_contrat_sync ON contrat(sync, effacer);
CREATE INDEX idx_quittance_sync ON quittance(sync, effacer);

-- ============================================================================
-- FIN DU SCRIPT
-- ============================================================================

-- Afficher un message de confirmation
SELECT 'Base de données GESTASSU créée avec succès!' AS Message;
SELECT COUNT(*) AS 'Nombre de tables créées' FROM information_schema.tables 
WHERE table_schema = 'gestassu_db';