CREATE TABLE Users (
    Id serial,
    UserName varchar (64) not null,
	Password varchar (64) not null,
    primary key(Id)
)

CREATE TABLE UserContactInformation (
    Id serial,
    UserId int not null,
    Phone int not null,
    Email varchar (64) not null,
    primary key (Id),
    foreign key (UserId) references Users (Id),
)

CREATE TABLE UserPersonalInformation (
    Id serial,
    UserId int not null,
    Name varchar (64) not null,
    DOB date not null,
    CountryId int not null,
    Gender varchar (6) not null check (Gender in ('Male', 'Female', 'Others')),
    primary key (Id),
    foreign key (UserId) references Users (Id),
    foreign key (CountryId) references Country (Id)
)

CREATE TABLE Country (
    Id serial,
    Name varchar (50) not null,
    TwoCharCountryCode char (2),
    ThreeCharCountryCode char (3),
    primary key (Id)
)

CREATE TABLE UserPaymentMethod (
    Id serial,
    UserId int not null,
    CardNumber varchar (16) not null,
    CardType varchar (64) not null,
    CVI varchar (3) not null,
    primary key (Id),
    foreign key (UserId) references Users (Id),
)

CREATE TABLE ScoutCompany (
    Id serial,
    Name varchar (64) not null,
    Phone int not null,
    Email varchar (64) not null,
    Address varchar (64) not null,
    primary key (Id)
)

CREATE TABLE ScoutGroup (
    Id serial,
    ScoutCompanyId int not null,
    Name varchar (64) not null,
    Phone int not null,
    Email varchar (64) not null,
    Address varchar (64) not null,
    primary key (Id), 
    foreign key (ScoutCompanyId) references ScountCompany (Id) on delete cascade
)

CREATE TABLE Scout (
    Id serial,
    UserId int not null,
    ScoutGroupId int not null,
    primary key (Id),
    foreign key (UserId) references Users (Id) on delete cascade,
    foreign key (ScoutGroupId) references ScoutGroup (Id) on delete cascade
)

CREATE TABLE Musician (
    Id serial,
    UserId int not null,
    Genre varchar (64) not null, -- TODO
    primary key (Id),
	foreign key (UserId) references Users (Id) on delete cascade
)

CREATE TABLE MusicianQualification (
    Id serial,
    MusicianId int not null,
    MusicianTypeId varchar (64) not null, -- Singer/DJ/Guitarist. TODO
    Certification varchar (64), -- TODO
    Skills varchar (64), -- TODO
    primary key (Id),
    foreign key (MusicianId) references Musicians (Id),
    foreign key (MusicianTypeId) references MusicianTypes (Id) 
)

CREATE TABLE MusicianTypes (
    Id serial,
    Name varchar (64) not null,
    primary key (Id)
)
