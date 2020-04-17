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
   HEURE_DEBUT          VARCHAR2(6)                             not null,
   VERSION              VARCHAR2(10),
   constraint PK_SEANCE primary key (TITRE, NOM_SALLE, HEURE_DEBUT),
   constraint FK_SEANCE_PROJETER_FILM foreign key (TITRE)
         references FILM (TITRE)
)
/


/*==============================================================*/
/* Index: PROJETER_FK                                           */
/*==============================================================*/
create  index PROJETER_FK on SEANCE (
   TITRE ASC
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
/* Index: VOIR_FK                                               */
/*==============================================================*/
create  index VOIR_FK on VU (
   TITRE ASC
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
/* Index: AIMER_FK                                              */
/*==============================================================*/
create  index AIMER_FK on AIME (
   TITRE ASC
)
/


