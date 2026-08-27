DROP DATABASE IF EXISTS aquashield;
CREATE DATABASE IF NOT EXISTS aquashield;

CREATE TABLE empresa (
    idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cnpj CHAR(14),
    email VARCHAR(50)
); 

CREATE TABLE cargo (
idCargo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL
);

CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
email VARCHAR(50),
senha VARCHAR(50),
fkCargo INT,
fkEmpresa INT,
CONSTRAINT fkUsuarioCargo FOREIGN KEY (fkCargo) REFERENCES cargo(idCargo),
CONSTRAINT fkUsuarioEmpresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE maquinas(
idMaquina INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
fkEmpresa INT,
CONSTRAINT fkEmpresa FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa));


CREATE TABLE Processador(
 id INT PRIMARY KEY AUTO_INCREMENT,
 temperatura DECIMAL(3,1),
 frequencia DECIMAL(7,2),
 porcentagem_de_uso DECIMAL(5,2),
 fkMaquina INT,
 fkEmpresa INT,
 CONSTRAINT fkMaquina FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
 CONSTRAINT fkEmpresa FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa));
 
 
 CREATE TABLE memoria(
 idMemoria INT PRIMARY KEY AUTO_INCREMENT,
 memoria_usada INT,
 memoria_disponivel INT,
 fkMaquina INT,
 fkEmpresa INT,
 CONSTRAINT fkMaquina FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
 CONSTRAINT fkEmpresa FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
 );
 
 CREATE TABLE disco(
 idDisco INT PRIMARY KEY AUTO_INCREMENT,
 discoUso INT,
 espaçoLivre INT,
 fkMaquina INT,
 fkEmpresa INT,
 CONSTRAINT fkMaquina FOREIGN KEY (fkMaquina) REFERENCES Maquina(idMaquina),
 CONSTRAINT fkEmpresa FOREIGN KEY (fkEmpresa) REFERENCES Empresa(idEmpresa)
 );
 
INSERT INTO cargo (id,nome) VALUES
(1,"Técnico de Automação"),
(2,"Controlador de Sistemas De Saneamento")
