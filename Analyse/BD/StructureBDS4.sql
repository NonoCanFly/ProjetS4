/*==============================================================*/
/* Nom de SGBD :  MySQL 5.0                                     */
/* Date de création :  24/03/2016 16:43:50                      */
/*==============================================================*/


drop table if exists ADMINISTRATEUR;

drop table if exists CORRECTEUR;

drop table if exists CORRECTION;

drop table if exists FICHIER;

drop table if exists MEMBRE;

/*==============================================================*/
/* Table : ADMINISTRATEUR                                       */
/*==============================================================*/
create table ADMINISTRATEUR
(
   IDPERS               int not null,
   PRENOM               varchar(256),
   MAIL                 longtext,
   STATUT               int,
   MDP                  varchar(256),
   LOGIN                varchar(256),
   AVATAR               longblob,
   NOM                  varchar(256),
   primary key (IDPERS)
);

/*==============================================================*/
/* Table : CORRECTEUR                                           */
/*==============================================================*/
create table CORRECTEUR
(
   IDPERS               int not null,
   PRENOM               varchar(256),
   MAIL                 varchar(256),
   STATUT               int,
   MDP                  varchar(256),
   LOGIN                varchar(256),
   AVATAR               longblob,
   NOM                  varchar(256),
   NBDOCUMENTSCORR      int,
   SOMMENOTE            decimal,
   primary key (IDPERS)
);

/*==============================================================*/
/* Table : CORRECTION                                           */
/*==============================================================*/
create table CORRECTION
(
   IDCORR               int not null,
   IDPERS               int not null,
   IDFICHIER            int not null,
   primary key (IDCORR)
);

/*==============================================================*/
/* Table : FICHIER                                              */
/*==============================================================*/
create table FICHIER
(
   IDFICHIER            int not null,
   NOMFICHIER           varchar(256),
   TYPE                 varchar(256),
   LIEN                 varchar(256),
   DATEDEPOT            date,
   IDPERS               int not null,
   DATEFIN              date,
   primary key (IDFICHIER)
);

/*==============================================================*/
/* Table : MEMBRE                                               */
/*==============================================================*/
create table MEMBRE
(
   PRENOM               varchar(256),
   MAIL                 varchar(256),
   STATUT               int,
   MDP                  varchar(256),
   LOGIN                varchar(256),
   AVATAR               longblob,
   IDPERS               int not null,
   NOM                  varchar(256),
   primary key (IDPERS)
);

alter table CORRECTEUR add constraint FK__ foreign key (IDPERS)
      references MEMBRE (IDPERS);

alter table ADMINISTRATEUR add constraint FK__2 foreign key (IDPERS)
      references MEMBRE (IDPERS);

alter table CORRECTION add constraint FK_PROPOSER foreign key (IDPERS)
      references CORRECTEUR (IDPERS);

alter table FICHIER add constraint FK_DEPOSER foreign key (IDPERS)
      references MEMBRE(IDPERS) ;

alter table CORRECTION add constraint FK_LI foreign key (IDFICHIER)
      references FICHIER (IDFICHIER);

