# Base de données Discovery - Mars 2014 -
drop schema if exists galaxia;
create schema galaxia;
use galaxia;

# ---------------------------------------------------------------------
#    les tables fournies par Klotz
# ---------------------------------------------------------------------

create table galaxie (
    `Nom` varchar(100) not null,
    `Categorie` varchar(100) not null,
    `Informations` varchar(200) not null,
    `nbSupernovae` int not null,
    `ra` double not null,
    `dec` double not null,
    `dist` double not null,
    `mag` double not null,
    primary key (`Nom`)
) engine=InnoDB character set utf8;

create table image (
    `id` integer not null auto_increment,
    `Date` varchar(100) not null,
    `GalaxieNom` varchar(100) not null,
    `Chemin` varchar(30) not null,
    `dateobs` datetime not null,
    `crpix1` double not null,
    `crpix2` double not null,
    `crval1` double not null,
    `crval2` double not null,
    `cdelt1` double not null,
    `cdelt2` double not null,
    `crota2` double not null,
    `ra` double not null,
    `dec` double not null,
    primary key (`id`),
    index fkGalaxie01 (`GalaxieNom`)
) engine=InnoDB character set utf8;

create table actu (
    `id` integer not null auto_increment,
    `Date` varchar(10) not null,
    `Titre` text not null,
    `Contenu` text not null,
    primary key (`id`)
) engine=InnoDB character set utf8;

# ------------------------------------------------------------------------------
#    Cette table n'est pas utilisée pour l'instant
# ------------------------------------------------------------------------------
create table skyobjects (
    `id` integer not null auto_increment,
    `ra` double not null,
    `dec` double not null,
    `mag` double not null,
    `type` varchar(255) not null,
    `infos` varchar(255) not null,
    `date` datetime not null,
    `imageId` int(10) not null,
    primary key  (`id`),
    index fkImage01 (`imageId`), 
    constraint fkImage01 foreign key (`imageId`) references image (`id`)
) engine=InnoDB character set utf8;

# ---------------------------------------------------------------------
#     nos tables pour Discovery
# ---------------------------------------------------------------------

create table user (
    `pseudo` varchar(30) not null,  
    `username` varchar(100) not null,  
    # deux users ne peuvent pas avoir le même email
    `email` varchar(255) not null unique,  
    `password` varchar(200) not null,  
    `grade` integer not null, 
    `blocked` boolean not null,  
    `registerDate` datetime not null,  
    `lastVisitDate` datetime not null,
    `nbCandidates` integer not null,
    `nbConnexions` integer not null,
    primary key (`pseudo`)
) engine=InnoDB character set utf8;

create table candidate (
    `userPseudo` varchar(30) not null,
    `nomImage` varchar(100) not null,
    `chemin` varchar(30) not null,
    `date` timestamp not null,  
    `certitude` integer not null,  
    `x`   integer not null,  
    `y`   integer not null,  
    `ra`  double not null,  
    `dec` double not null,
    # un user ne peut déposer qu'une fois une même image candidate
    primary key (`userPseudo`, `nomImage`, `chemin`),
    index fkUser02 (`userPseudo`), 
    constraint fkUser02 foreign key (`userPseudo`) references user (`pseudo`)
) engine=InnoDB character set utf8;

# ------------------------------------------------------------------------------
#    Cette table n'est pas utilisée pour l'instant
# ------------------------------------------------------------------------------
create table consultation (
    `userPseudo` varchar(30) not null, 
    `imageId` integer not null,  
    primary key (`userPseudo`, `imageId`),
    index fkImage02 (`imageId`), 
    constraint fkImage02 foreign key (`imageId`) references image (`id`),
    index fkUser01 (`userPseudo`), 
    constraint fkUser01 foreign key (`userPseudo`) references user (`pseudo`)
) engine=InnoDB character set utf8;
