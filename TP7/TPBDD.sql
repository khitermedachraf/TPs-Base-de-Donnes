SQL> DISCONNECT
D?onnect?de Oracle Database 11g Enterprise Edition Release 11.2.0.1.0 - 64bit Production
With the Partitioning, OLAP, Data Mining and Real Application Testing options
SQL> CONNECT BDDAdmin/TPAdmin;
Connect?
SQL> create table Enseignant (
  2  matricule_ens integer not null,
  3  nom_ens varchar2(30) not null,
  4  prenom_ens varchar2(30) not null,
  5  age integer not null,
  6  constraint pk_Enseignant primary key (matricule_ens));

Table cr?e.

SQL> create table Etudiant (
  2  matricule_etu integer not null,
  3  nom_etu varchar2(30) not null,
  4  prenom_etu varchar2(30) not null,
  5  date_naissance date not null,
  6  constraint pk_Enseignant primary key (matricule_etu));

Table cr?e.

SQL> create table Unite (
  2  code_Unite varchar2(30) not null,
  3  libelle varchar2(30) not null,
  4  nbr_heures integer not null,
  5  matricule_ens integer not null,
  6  constraint pk_Unite primary key (code_Unite),
  7  constraint fk_Unite foreign key (matricule_ens) references Enseignant (matricule_ens));

Table cr?e.

SQL> create table EtudiantUnite (
  2	 note_CC integer not null,
  3	 note_TP integer not null,
  4	 note_examen integer not null,
  5  code_Unite varchar2(30) not null, 
  6  matricule_etu integer not null,
  7  constraint pk_EtudiantUnite primary key (code_Unite,matricule_etu),
  8  constraint fk_EtudiantUnite1 foreign key (code_Unite) references Unite (code_Unite),
  9  constraint fk_EtudiantUnite2 foreign key (matricule_etu) references Etudiant (matricule_etu));

Table cr?e.

SQL> create index ix_Etudiant on Etudiant (nom_etu asc);

index cr?e.

SQL> create index ix_Enseignant on Enseignant (nom_ens desc);

index cr?e.

SQL> create user Etudiant identified by TPEtudiant;

Utilisateur cr?e.

SQL> grant select on Etudiant to Etudiant;

Autorisation de privilèges (GRANT) acceptée.

SQL> create user Etudiant identified by TPEtudiant;

Utilisateur cr?e.

SQL> grant select,insert on Enseignant to Enseignant;

Autorisation de privilèges (GRANT) acceptée.

SQL> alter table Etudiant ADD Adresse varchar2(100);

Table modifi?e.

SQL> alter table Enseignant DROP COLUMN age;

Table modifi?e.

SQL> alter table Etudiant modify prenom_etu varchar2(35);

Table modifi?e.

SQL> insert into Etudiant (matricule_etu,nom_etu,prenom_etu,date_naissance,Adresse) values (20190001,'BOUSSAI','MOHAMED','12-01-2000','Alger');

1 ligne cr?e.

SQL> insert into Etudiant (matricule_etu,nom_etu,prenom_etu,date_naissance,Adresse) values (20190002,'CHAID','LAMIA','01-10-1999','Batna');

1 ligne cr?e.

SQL> insert into Etudiant (matricule_etu,nom_etu,prenom_etu,date_naissance,Adresse) values (20190003,'BRAHIMI','SOUAD','18-11-2000','Setif');

1 ligne cr?e.

SQL> insert into Etudiant (matricule_etu,nom_etu,prenom_etu,date_naissance,Adresse) values (20190004,'LAMA','SAID','23-05-1999','Oran');

1 ligne cr?e.

SQL> insert into Enseignant (matricule_ens,nom_ens,prenom_ens) values (20000001,'HAROUNI','AMINE');

1 ligne cr?e.

SQL> insert into Enseignant (matricule_ens,nom_ens,prenom_ens) values (19990011,'FATHI','OMAR');

1 ligne cr?e.

SQL> insert into Enseignant (matricule_ens,nom_ens,prenom_ens) values (19980078,'BOUZIDANE','FARAH');

1 ligne cr?e.

SQL> insert into Enseignant (matricule_ens,nom_ens,prenom_ens) values (20170015,'ARABI','ZOUBIDA');

1 ligne cr?e.

SQL> insert into Unite (code_Unite,libelle,nbr_heures,matricule_ens) values ('FEI0001','POO',6,20000001);

1 ligne cr?e.

SQL> insert into Unite (code_Unite,libelle,nbr_heures,matricule_ens) values ('FEI000é','BDD',6,19990011);

1 ligne cr?e.

SQL> insert into Unite (code_Unite,libelle,nbr_heures,matricule_ens) values ('FEI0003','RESEAU',3,20170015);

1 ligne cr?e.

SQL> insert into Unite (code_Unite,libelle,nbr_heures,matricule_ens) values ('FEI0004','SYSTEM',6,19980078);

1 ligne cr?e

SQL> insert into EtudiantUnite (matricule_etu,code_Unite,note_CC,note_TP,note_examen) values (20190001,'FEI0001',10,15,9);

1 ligne cr?e.

SQL> insert into EtudiantUnite (matricule_etu,code_Unite,note_CC,note_TP,note_examen) values (20190002,'FEI0001',20,13,10);

1 ligne cr?e.

SQL> insert into EtudiantUnite (matricule_etu,code_Unite,note_CC,note_TP,note_examen) values (20190004,'FEI0001',13,17,16);

1 ligne cr?e.

SQL> insert into EtudiantUnite (matricule_etu,code_Unite,note_CC,note_TP,note_examen) values (20190002,'FEI0002',10,16,17);

1 ligne cr?e.

SQL> insert into EtudiantUnite (matricule_etu,code_Unite,note_CC,note_TP,note_examen) values (20190003,'FEI0002',9,8,15);

1 ligne cr?e.

SQL> insert into EtudiantUnite (matricule_etu,code_Unite,note_CC,note_TP,note_examen) values (20190004,'FEI0002',15,9,20);

1 ligne cr?e.

SQL> insert into EtudiantUnite (matricule_etu,code_Unite,note_CC,note_TP,note_examen) values (20190002,'FEI0004',12,18,14);

1 ligne cr?e.

SQL> insert into EtudiantUnite (matricule_etu,code_Unite,note_CC,note_TP,note_examen) values (20190003,'FEI0004',17,12,15);

1 ligne cr?e.

SQL> insert into EtudiantUnite (matricule_etu,code_Unite,note_CC,note_TP,note_examen) values (20190004,'FEI0004',12,12,20);

1 ligne cr?e.

SQL> spool off
