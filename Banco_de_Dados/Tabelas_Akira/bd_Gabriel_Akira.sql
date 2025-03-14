create database bdSprint;
use bdSprint;

create table Usuario(
	id_Usu INT PRIMARY KEY AUTO_INCREMENT,
    nome_Usu VARCHAR(40) NOT NULL,
    email_Usu VARCHAR (50) NOT NULL,
    senha_Usu VARCHAR(20) NOT NULL,
    tel_Usu CHAR(15),
	cpf_Usu CHAR(15) NOT NULL UNIQUE,
    tipo_Usu varchar(7)
    constraint chkUsu check(tipo_Usu in('adm','normal'))
);

CREATE TABLE Sensor(
	id_Sensor INT PRIMARY KEY AUTO_INCREMENT,
	status_Sensor VARCHAR (8)
	CONSTRAINT chkStatusSensor CHECK(status_Sensor IN('ativo','inativo'))
);

CREATE TABLE Alerta(
    id_Alerta INT PRIMARY KEY AUTO_INCREMENT,
    qntPpm DOUBLE(10,2),
    lvl_perigo VARCHAR(8),
    CONSTRAINT chkRiscoAlerta CHECK(lvl_perigo IN('0','1','2')),
    data_Alerta DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Usuario (nome_Usu, email_Usu, senha_Usu, tel_Usu, cpf_Usu, tipo_Usu)
VALUES 
('Ana Silva', 'ana.silva@email.com', 'senha123', '11999999999', '123.456.789-00', 'normal'),
('Carlos Souza', 'carlos.souza@email.com', 'senha456', '11988888888', '987.654.321-00', 'adm'),
('Mariana Costa', 'mariana.costa@email.com', 'senha789', '11977777777', '111.267.333-44', 'normal'),
('João Oliveira', 'joao.oliveira@email.com', 'senha012', '11966666666', '555.666.543-88', 'adm'),
('Pedro Alves', 'pedro.alves@email.com', 'senha345', '11955555555', '222.633.444-55', 'normal');

INSERT INTO Sensor (status_Sensor)
VALUES 
('ativo'),
('inativo'),
('ativo'),
('ativo'),
('inativo');

INSERT INTO Alerta (qntPpm, lvl_perigo)
VALUES 
(1500.00, '2'),
(800.00, '1'),
(2000.00, '2'),
(1200.00, '0'),
(1100.00, '1');

SELECT * FROM Usuario;
SELECT * FROM Alerta;
SELECT * FROM Sensor;


