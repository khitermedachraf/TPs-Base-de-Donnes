*==============================================================*/
/* Database name:  TP                                           */
/*==============================================================*/


drop index AIMER_FK
/


drop index JOUER_FK
/


drop index PRODUIR_FK
/


drop index PROJETER_FK
/


drop index VOIR_FK
/


drop table AIME cascade constraints
/


drop table VU cascade constraints
/


drop table SEANCE cascade constraints
/


drop table PRODUIT cascade constraints
/


drop table JOUE cascade constraints
/


drop table FILM cascade constraints
/


/*==============================================================*/
/* Table: FILM                                                  */
/*==============================================================*/


create table FILM  (
   TITRE                VARCHAR2(40)                     not null,
   DUREE                INTEGER,
   NATIONALITE          VARCHAR2(30),
   NOM_REALISATEUR   VARCHAR2(30),
   constraint PK_FILM primary key (TITRE)
)
/


/*==============================================================*/
/* Table: JOUE                                                  */
/*==============================================================*/


create table JOUE  (
   NOM_ACTEUR           VARCHAR2(30)                     not null,
   TITRE                VARCHAR2(40)                     not null,
   constraint PK_JOUE primary key (NOM_ACTEUR, TITRE),
   constraint FK_JOUE_JOUER_FILM foreign key (TITRE)
         references FILM (TITRE)
)
/


/*==============================================================*/
/* Index: JOUER_FK                                              */
/*==============================================================*/
create  index JOUER_FK on JOUE (
   TITRE ASC
)
/


/*==============================================================*/
/* Table: PRODUIT                                               */
/*==============================================================*/


create table PRODUIT  (
   NOM_PRODUCTEUR       VARCHAR2(30)                     not null,
   TITRE                VARCHAR2(40)                     not null,
   constraint PK_PRODUIT primary key (NOM_PRODUCTEUR, TITRE),
   constraint FK_PRODUIT_PRODUIR_FILM foreign key (TITRE)
         references FILM (TITRE)
)
/


/*==============================================================*/
/* Index: PRODUIR_FK                                            */
/*==============================================================*/
create  index PRODUIR_FK on PRODUIT (
   TITRE ASC
)
/


/*==============================================================*/
/* Table: SEANCE                                                */
/*==============================================================*/


create table SEANCE  (
   TITRE                VARCHAR2(40)                     not null,
   NOM_SALLE            VARCHAR2(30)                     not null,
   HEURE_DEBUT          VARCHAR2(6)                      not null,
   VERSION              VARCHAR2(10),
   constraint PK_SEANCE primary key (TITRE, NOM_SALLE, HEURE_DEBUT),
   constraint FK_SEANCE_PROJETER_FILM foreign key (TITRE)
         references FILM (TITRE)
)
/


/*==============================================================*/
/* Table: AIME                                                  */
/*==============================================================*/


create table AIME  (
   NOM_AMATEUR          VARCHAR2(30)                     not null,
   TITRE                VARCHAR2(40)                     not null,
   constraint PK_AIME primary key (NOM_AMATEUR, TITRE),
   constraint FK_AIME_AIMER_FILM foreign key (TITRE)
         references FILM (TITRE)
)
/

/*==============================================================*/
/* Table: VU                                                    */
/*==============================================================*/


create table VU  (
   NOM_SPECTATEUR       VARCHAR2(30)                     not null,
   TITRE                VARCHAR2(40)                     not null,
   constraint PK_VU primary key (NOM_SPECTATEUR, TITRE),
   constraint FK_VU_VOIR_FILM foreign key (TITRE)
         references FILM (TITRE)
)
/

/*==============================================================*/
/* Create SYNONYME a la table : SEANCE  .                       */
/*==============================================================*/
CREATE SYNONYM <RENCONTRE> FOR <SEANCE> ;


/*==============================================================*/
/* Créer un index pour la table SEANCE sur l'attribut TITRE dans l'ordre croissant. */
/*==============================================================*/
create  index PROJETER_FK on SEANCE (TITRE ASC ) ; 


/*==============================================================*/
/*Créer un index pour la table VU sur l'attribut TITRE dans l'ordre décroissant. */
/*==============================================================*/
create  index VOIR_FK on VU ( TITRE  DESC ) ; 


/*==============================================================*/
/*Créer un index pour la table AIME sur l'attribut TITRE dans l'ordre croissant.*/
/*==============================================================*/
create  index AIMER_FK on AIME ( TITRE ASC ) ; 

/*==============================================================*/
/*Modifier le type de l'attribut TITRE de la table AIME de manière 
    à l'augmenter de 20 caractères.                      */
/*==============================================================*/

ALTER TABLE < AIME > Modify (TITRE  VARCHAR2(20) ) ;


/*==============================================================*/
/*Ajouter une contrainte sur la table SEANCE pour que HEURE_DEBUT soit toujours
   supérieure à 13      */
/*==============================================================*/

ALTER TABLE <SEANCE> ADD constraint C2 check  (HEURE_DEBUT > 13) ;

/*==============================================================*/
/*	Ajouter une contrainte sur la table SEANCE pour que NOM_SALLE
   soit "IBN ZAIDOUN" ou "IBN KHALDOUN".    */
/*==============================================================*/

Alter table SEANCE add constraint C3 check  (NOM_SALLE in (‘IBN ZAYDOUN’,’IBN KHALDOUNE’));