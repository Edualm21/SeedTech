create database coffee;

use coffee;

create table adm(
idAdm int primary key auto_increment,
nomeAdm varchar(40) not null,
emailAdm varchar(50) not null unique,
senhaAdm varchar(10) not null unique
);

create table usuario (
idUsuario int primary key auto_increment,
nomeUsuario varchar(40) not null,
emailUsuario varchar(50) unique not null,
senhaUsuario varchar(10) unique not null,
cpfUsuario char(11),
numeroTelefoneUsuario char(14)
);

create table empresa (
idEmpresa int primary key auto_increment,
nomeEmpresa varchar(40),
cnpj char(14)
);

create table sensor (
idSensor int primary key auto_increment,
dtIntalacaoSensor datetime,
dtManutencao datetime,
statusSensor varchar(10)
);

alter table sensor add constraint chkStatus check(statusSensor in('ativo','inativo','manutenção'));

create table dados (
idDados int primary key auto_increment,
ppm float,
classificacaoDados varchar (10),
dtDados datetime default current_timestamp 

);

alter table dados add constraint chkClassDados check(classificacaoDados in('moderado','alto','baixo')); 


-- Inserir dados na tabela 'usuario'
INSERT INTO usuario (nomeUsuario, emailUsuario, senhaUsuario, cpfUsuario, numeroTelefoneUsuario)
VALUES 
('João Silva', 'joao.silva@email.com', 'senha123', '12345678901', '11987654321'),
('Maria Oliveira', 'maria.oliveira@email.com', 'senha456', '23456789012', '21998765432'),
('Carlos Santos', 'carlos.santos@email.com', 'senha789', '34567890123', '31912345678');

-- Inserir dados na tabela 'empresa'
INSERT INTO empresa (nomeEmpresa, cnpj)
VALUES
('Café do Brasil', '12345678000199'),
('Café Premium', '98765432000188'),
('Café Orgânico', '19283746000177');

-- Inserir dados na tabela 'sensor'
INSERT INTO sensor (dtIntalacaoSensor, dtManutencao, statusSensor)
VALUES
('2025-01-10 10:00:00', '2025-02-01 15:00:00', 'ativo'),
('2025-02-15 12:30:00', '2025-03-10 14:00:00', 'manutenção'),
('2025-03-05 09:00:00', '2025-03-12 16:30:00', 'inativo');



-- Inserir dados na tabela 'dados'
INSERT INTO dados (ppm)
VALUES
(35.7),
(45.3),
(50.8),
(33.2),
(48.6);

select * from dados;

drop database coffee;
