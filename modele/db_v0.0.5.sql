<<<<<<< HEAD
#-----------news---------------------------news---------------------------news----------------

#v0.0.5
#added id field to Emprunte table as new primary key in defavor of Emprunte.date
#replaced Retourne.date_Emprunte with an id field which is both the primary key of Retourne and it's foreign key to Emprunte.id
=======
#version 0.0.5

#-----------news---------------------------news---------------------------news----------------

#v0.0.5
#added column image on table Livre

>>>>>>> b0c3dba5479333b0f7023b47366a1c5670193393
#-----------news---------------------------news---------------------------news----------------

#v0.0.4
#added constraint unique on on column date_Emprunte of table Retourne
#deleted id_livre id_adherent columns in table Retourne

<<<<<<< HEAD
#-----------news---------------------------news---------------------------news----------------

=======
>>>>>>> b0c3dba5479333b0f7023b47366a1c5670193393
#v0.0.3
#added column foreign key date_Emprunte in table Retourne
#added columns on Adherent

<<<<<<< HEAD
#-----------news---------------------------news---------------------------news----------------
=======
>>>>>>> b0c3dba5479333b0f7023b47366a1c5670193393
#v0.0.2
#added not null, default and check constraint where was necessarly
#foreign key is OK

<<<<<<< HEAD
#-----------news---------------------------news---------------------------news----------------

=======
>>>>>>> b0c3dba5479333b0f7023b47366a1c5670193393
#v0.0.1
#delete added update cascade to foreign key constraint
# and added delete cascade to foreign key constraint



#drop database if exists dut_puc2442_proj_db;
#create database dut_puc2442_proj_db;

#use dut_puc2442_proj_db;

PRAGMA foreign_keys = off;

create table Auteur(
	id integer primary key,
	nom varchar(30) not null,
	prenom varchar(30) not null
);

create table Livre(
	id integer primary key,
	titre varchar(100) not null,
	dateDePub datetime not null,
	nbreExemplairesTotal int not null default '0',
	nbreExemplairesEmprunter int not null default '0',
	id_auteur int not null,
<<<<<<< HEAD
=======
	image text,
>>>>>>> b0c3dba5479333b0f7023b47366a1c5670193393
	check (nbreExemplairesTotal >=0 and nbreExemplairesEmprunter >=0),
	constraint fk_idAuteur_livre foreign key (id_auteur) references Auteur(id) ON DELETE CASCADE
);

create table Adherent(
	id integer primary key,
	nom varchar(50) not null,
	prenom varchar(50) not null,
	addresse varchar(100) not null,
	email varchar(320) not null,
	dateDeNaissance datetime not null,
	sexe char(1) not null default 'm',
	nbreLivresEmprunter integer not null default '0',
	check ( nbreLivresEmprunter >=0 and (sexe = 'f' or sexe = 'm'))
);

create table Emprunte(
<<<<<<< HEAD
	id integer,
	date timestamp,
	id_livre integer,
	id_adherent integer,
	primary key(id),
=======
	id_livre integer,
	id_adherent integer,
	date timestamp,
	primary key(id_livre,id_adherent,date),
>>>>>>> b0c3dba5479333b0f7023b47366a1c5670193393
	constraint fk_idLivre_emprunte foreign key (id_livre) references Livre(id) ON DELETE CASCADE,
	constraint fk_idAdherent_emprunte foreign key (id_adherent) references Adherent(id) ON DELETE CASCADE
);

create table Retourne(
<<<<<<< HEAD
	id integer,
	date timestamp,
	primary key(id),
	constraint fk_idEmprunte_retourne foreign key (id) references Emprunte(id) ON DELETE CASCADE
=======
	date_Emprunte datetime unique not null,
	date timestamp,
	primary key(date),
	constraint fk_date_Emprunte_retourne foreign key (date_Emprunte) references Emprunte(date) ON DELETE CASCADE
>>>>>>> b0c3dba5479333b0f7023b47366a1c5670193393
);

PRAGMA foreign_keys = on;
