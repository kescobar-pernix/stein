CREATE TABLE Adoptions (idAdoption int IDENTITY(1, 1) NOT NULL, name varchar(50) NOT NULL, PRIMARY KEY (idAdoption));
CREATE TABLE Answers (idAnswer int IDENTITY(1, 1) NOT NULL, FK_option int NOT NULL, FK_client int NOT NULL, PRIMARY KEY (idAnswer));
CREATE TABLE Clients (idClient int IDENTITY(1, 1) NOT NULL, name varchar(50) NOT NULL, lastName varchar(50) NULL, creationDate datetime DEFAULT GETDATE() NOT NULL, speciality varchar(50) NULL, country varchar(50) NOT NULL, province varchar(100) NULL, address1 varchar(400) NULL, address2 varchar(400) NULL, zone varchar(50) NULL, latitude float(10) NULL, longitude float(10) NULL, email varchar(50) NOT NULL, phone1 varchar(20) NULL, phone2 varchar(20) NULL, active bit DEFAULT 1 NOT NULL, maxNumVisits int NOT NULL, FK_adoption int NOT NULL, FK_potential int NOT NULL, FK_clientType int NOT NULL, FK_user int NOT NULL, PRIMARY KEY (idClient));
CREATE TABLE ClientTypes (idClientType int IDENTITY(1, 1) NOT NULL, name varchar(50) NOT NULL, PRIMARY KEY (idClientType));
CREATE TABLE Options (idOption int IDENTITY(1, 1) NOT NULL, description varchar(300) NOT NULL, FK_question int NOT NULL, active bit DEFAULT 1 NOT NULL, PRIMARY KEY (idOption));
CREATE TABLE Potentials (idPotential int IDENTITY(1, 1) NOT NULL, name varchar(50) NOT NULL, PRIMARY KEY (idPotential));
CREATE TABLE Products (idProduct int IDENTITY(1, 1) NOT NULL, name varchar(100) NOT NULL, active bit DEFAULT 1 NOT NULL, PRIMARY KEY (idProduct));
CREATE TABLE ProductsPerVisit (idProductPerVisit int IDENTITY(1, 1) NOT NULL, FK_visit int NOT NULL, FK_product int NOT NULL, quantity int NOT NULL, PRIMARY KEY (idProductPerVisit));
CREATE TABLE Questions (idQuestion int IDENTITY(1, 1) NOT NULL, question varchar(500) NOT NULL, active bit DEFAULT 1 NOT NULL, PRIMARY KEY (idQuestion));
CREATE TABLE Reactions (idReaction int IDENTITY(1, 1) NOT NULL, description varchar(50) NOT NULL, PRIMARY KEY (idReaction));
CREATE TABLE Users (idUser int IDENTITY(1, 1) NOT NULL, name varchar(50) NOT NULL, lastName varchar(50) NOT NULL, username varchar(50) NOT NULL, password varchar(50) NOT NULL, creationDate datetime NOT NULL, country varchar(50) NOT NULL, province varchar(50) NULL, address1 varchar(400) NULL, address2 varchar(400) NULL, zone varchar(50) NULL, email varchar(50) NOT NULL, phone1 varchar(20) NULL, phone2 varchar(20) NULL, active bit DEFAULT 1 NOT NULL, FK_userType int NOT NULL, PRIMARY KEY (idUser));
CREATE TABLE UserTypes (idAgentType int IDENTITY(1, 1) NOT NULL, name varchar(50) NOT NULL, PRIMARY KEY (idAgentType));
CREATE TABLE Visits (idVisit int IDENTITY(1, 1) NOT NULL, FK_client int NOT NULL, FK_reaction int NOT NULL, comment varchar(400) NOT NULL, [date] datetime NOT NULL, latitude float(10) NULL, longitude float(10) NULL, FK_visitType int NOT NULL, PRIMARY KEY (idVisit));
CREATE TABLE VisitTypes (idVisitType int IDENTITY(1, 1) NOT NULL, name varchar(50) NOT NULL, PRIMARY KEY (idVisitType));
ALTER TABLE Clients ADD CONSTRAINT FKClients270038 FOREIGN KEY (FK_potential) REFERENCES Potentials (idPotential);
ALTER TABLE Clients ADD CONSTRAINT FKClients619803 FOREIGN KEY (FK_adoption) REFERENCES Adoptions (idAdoption);
ALTER TABLE Visits ADD CONSTRAINT FKVisits976056 FOREIGN KEY (FK_visitType) REFERENCES VisitTypes (idVisitType);
ALTER TABLE Answers ADD CONSTRAINT FKAnswers50411 FOREIGN KEY (FK_client) REFERENCES Clients (idClient);
ALTER TABLE Answers ADD CONSTRAINT FKAnswers8255 FOREIGN KEY (FK_option) REFERENCES Options (idOption);
ALTER TABLE Options ADD CONSTRAINT FKOptions244805 FOREIGN KEY (FK_question) REFERENCES Questions (idQuestion);
ALTER TABLE Visits ADD CONSTRAINT FKVisits304121 FOREIGN KEY (FK_client) REFERENCES Clients (idClient);
ALTER TABLE Visits ADD CONSTRAINT FKVisits336297 FOREIGN KEY (FK_reaction) REFERENCES Reactions (idReaction);
ALTER TABLE Clients ADD CONSTRAINT FKClients629649 FOREIGN KEY (FK_clientType) REFERENCES ClientTypes (idClientType);
ALTER TABLE Users ADD CONSTRAINT FKUsers503235 FOREIGN KEY (FK_userType) REFERENCES UserTypes (idAgentType);
ALTER TABLE ProductsPerVisit ADD CONSTRAINT FKProductsPe486417 FOREIGN KEY (FK_visit) REFERENCES Visits (idVisit);
ALTER TABLE ProductsPerVisit ADD CONSTRAINT FKProductsPe587229 FOREIGN KEY (FK_product) REFERENCES Products (idProduct);
ALTER TABLE Clients ADD CONSTRAINT FKClients628131 FOREIGN KEY (FK_user) REFERENCES Users (idUser);
