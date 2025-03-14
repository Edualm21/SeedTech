CREATE DATABASE individualCOFFE;

USE individualCOFFE;

CREATE TABLE usuario(
idUsuario int primary key auto_increment,
nomeUsuario varchar(40),
emailUsuario Varchar(100) UNIQUE,
senhaUsuario varchar(40),
statusUsuario varchar(10)
);

CREATE TABLE arduino (
idSensor int primary key auto_increment,
tipoSensor varchar(40),
dataHora DATETIME DEFAULT current_timestamp,
nivelGas float
);

CREATE TABLE admin(
idAdmin int primary key,
emailAdmin varchar(100),
senhaAdmin varchar(40)
);

CREATE TABLE notificação (
idNotificacao int primary key auto_increment,
condicaoNotificacao varchar(40),
-- interacaoArduino -> idSensor  relacionar com o nivel de co2
statusNotificacao varchar(40)
);

show tables;

ALTER TABLE usuario ADD CONSTRAINT cdkUser CHECK(statusUsuario in('Ativo', 'Inativo'));
ALTER TABLE notificação ADD CONSTRAINT cdkNotificacao CHECK(statusNotificacao in('lido', 'não lido'));
ALTER TABLE notificação ADD CONSTRAINT condicaoNotificacao CHECK(condicaoNotificacao in('alto', 'ideal', 'baixo'));


INSERT INTO arduino(tipoSensor, nivelGas) VALUES
('hjd-90', 200),
('hjd-90', 250),
('hjd-90', 230),
('hjd-90', 400),
('hjd-90', 600),
( 'hjd-90', 1990);


INSERT INTO usuario (nomeUsuario, emailUsuario, senhaUsuario, statusUsuario) VALUES
('Hygor', 'HyguinGamerPro13@gmail.com', 'Arroz157', 'Ativo'),
('Erick', 'ErickNinja10@gmail.com', 'updateSEMwhere', 'Inativo'),
('Matheus', 'matheusmachine@gmail.com', 'machine123', 'Ativo'),
('Eduardo', 'EduCorinthians@gmail.com', 'VaiCorinthians', 'Inativo'),
('Akira', 'akiraGabriel@gmail.com', 'Akirinha123', 'Ativo'),
('Ana', 'anaSafras@gmail.com', 'safraGirl', 'Ativo'),
('Emilly', 'emilly@gmail.com', 'twoBack', 'Ativo');

INSERT admin VALUES
(1, 'admin@admin.com', 'admin123');


INSERT INTO notificação (statusNotificacao, condicaoNotificacao ) VALUES
('não lido', 'alto');



select * from arduino;

select * from admin;

select * from notificação;

select * from usuario;

alter table arduino rename column nivelGas to co2;

select co2,
	CASE 
	WHEN co2 < 400 THEN 'Extremamente Baixo'
    WHEN co2 < 600 THEN ' abaixo do ideal'
    WHEN co2 <= 1200 THEN 'ideal'
     WHEN co2 < 1500 THEN 'mais alto do ideal'
    ELSE 'Extremamente alto'
    END AS Status FROM arduino;
    
    
    select * from usuario where statusUsuario = 'ativo';
    
	select * from usuario where statusUsuario = 'inativo';
    
    select * from notificação where statusNotificacao = 'não lido';


