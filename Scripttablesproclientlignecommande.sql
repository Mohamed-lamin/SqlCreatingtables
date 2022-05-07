create database GestionComerciale2019;

use GestionComerciale2019;

create table client (
idClient int identity(1,1) ,
nom varchar(50),
prenom varchar(30),
tel varchar(20),
eamil varchar(40)
);
alter table client add adresse varchar(150);
alter table client alter column adresse varchar(200);
alter table client drop column adresse;
alter table client add constraint pkclient primary key (idclient);

create table porduit(
ref varchar(50),
designation varchar(250),
prix money
)
alter table porduit alter column ref varchar(50) not null;
alter table porduit add constraint pkref primary key (ref);

---Ajout d'une table avec clé étrangère
--Méthode1---
create table commande (
idCommande int identity(1,1),
idClient int foreign key references client(idClient),
dateCommande date not  null,
constraint pkCommande primary key (idCommande),

);
drop table commande;

--Méthode2---
create table commande (
idCommande int identity(1,1),
idClient int ,
dateCommande date not null,
constraint pkCommande primary key (idCommande),
constraint fkCommandeClient foreign key (idClient) references client(idClient),

)

create table ligne(

idCommande int not null,
ref varchar(50) not null,
quantité int ,
prixVente money,
constraint pkLigne primary key (idCommande,ref),
constraint fkCommandeLigne foreign key (idCommande) references commande(idCommande),
constraint fkproduitLigne foreign key (ref) references porduit(ref),

);