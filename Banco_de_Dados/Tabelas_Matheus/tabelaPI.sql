create database dbEstufa;

use dbEstufa;

create table tbUsuario(
	id_Usuaria INT PRIMARY KEY AUTO_INCREMENT,
    nome_Usuario VARCHAR(40) NOT NULL,
    email_Usuario VARCHAR (50) NOT NULL UNIQUE,
    senha_Usuario VARCHAR(20) NOT NULL,
    tel_Usuario CHAR(15),
	cpf_Usuario CHAR(15) NOT NULL UNIQUE,
    status_Usuario VARCHAR(15),
		CONSTRAINT chkStatus
			CHECK(status_Usuario IN('ativo', 'inativo')),
	ultimoAcesso_Usuario DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tbSensor(
	id_Sensor INT PRIMARY KEY AUTO_INCREMENT,
    tipo_Sensor VARCHAR (20),
		CONSTRAINT chkTipoSensor
			CHECK(tipo_Sensor IN('DHT11','LM35', 'MQ2')),
	status_Sensor VARCHAR(20),
		CONSTRAINT chkStatusSensor
			CHECK(status_Sensor IN('ativo','inativo')),
	ppmColetado_Sensor DOUBLE(10,2)
);

CREATE TABLE tbAdmin(
	id_Admin INT PRIMARY KEY AUTO_INCREMENT,
    email_Admin VARCHAR(40) NOT NULL UNIQUE,
    senha_Admin VARCHAR(30) NOT NULL,
    status_Admin VARCHAR(15),
		CONSTRAINT chkStatusAdmin
			CHECK(status_Admin IN('ativo','inativo')),
	ultimoAcesso_Usuario DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE tbAlerta(
	id_Alerta INT PRIMARY KEY AUTO_INCREMENT,
	qntPpm_Alerta DOUBLE(10,2),
	sensor_Alerta VARCHAR(10),
		CONSTRAINT chkSensorAlerta
			CHECK (sensor_Alerta IN('DHT11','LM35', 'MQ2')),
	risco_Alerta VARCHAR(15),
		CONSTRAINT chkRiscoAlerta
			CHECK(risco_Alerta IN('Perigoso','Normal','Atenção')),
	data_Alerta DATETIME DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM tbUsuario;
SELECT * FROM tbAdmin;
SELECT * FROM tbAlerta;
SELECT * FROM tbSensor;

INSERT INTO tbUsuario (nome_Usuario, email_Usuario, senha_Usuario, tel_Usuario, cpf_Usuario, status_Usuario) 
VALUES 
('Ana Silva', 'ana.silva@email.com', 'senha123', '11999999999', '123.456.789-00', 'ativo'),
('Carlos Souza', 'carlos.souza@email.com', 'senha456', '11988888888', '987.654.321-00', 'inativo'),
('Mariana Costa', 'mariana.costa@email.com', 'senha789', '11977777777', '111.267.333-44', 'ativo'),
('João Oliveira', 'joao.oliveira@email.com', 'senha012', '11966666666', '555.666.543-88', 'ativo'),
('Pedro Alves', 'pedro.alves@email.com', 'senha345', '11955555555', '222.633.444-55', 'inativo'),
('Roberta Lima', 'roberta.lima@email.com', 'senha678', '11944444444', '333.444.555-66', 'ativo'),
('Lucas Pereira', 'lucas.pereira@email.com', 'senha910', '11933333333', '444.435.626-77', 'ativo'),
('Julia Rocha', 'julia.rocha@email.com', 'senha111', '11922222222', '555.666.777-88', 'inativo'),
('Felipe Martins', 'felipe.martins@email.com', 'senha121', '11911111111', '546.907.888-99', 'ativo'),
('Beatriz Mendes', 'beatriz.mendes@email.com', 'senha131', '11900000000', '777.888.999-00', 'ativo');



INSERT INTO tbSensor (tipo_Sensor, status_Sensor, ppmColetado_Sensor) 
VALUES 
('DHT11', 'ativo', 45.75),
('LM35', 'inativo', 23.50),
('MQ2', 'ativo', 120.30),
('DHT11', 'ativo', 50.60),
('LM35', 'ativo', 28.90),
('MQ2', 'inativo', 140.10),
('DHT11', 'ativo', 35.00),
('LM35', 'ativo', 21.10),
('MQ2', 'ativo', 110.50),
('DHT11', 'inativo', 40.00);

INSERT INTO tbAdmin (email_Admin, senha_Admin, status_Admin) 
VALUES 
('admin1@email.com', 'admin123', 'ativo'),
('admin2@email.com', 'admin456', 'inativo'),
('admin3@email.com', 'admin789', 'ativo'),
('admin4@email.com', 'admin012', 'ativo'),
('admin5@email.com', 'admin345', 'inativo'),
('admin6@email.com', 'admin678', 'ativo'),
('admin7@email.com', 'admin910', 'ativo'),
('admin8@email.com', 'admin111', 'inativo'),
('admin9@email.com', 'admin121', 'ativo'),
('admin10@email.com', 'admin131', 'ativo');

INSERT INTO tbAlerta (qntPpm_Alerta, sensor_Alerta, risco_Alerta) 
VALUES 
(150.00, 'MQ2', 'Perigoso'),
(80.00, 'DHT11', 'Atenção'),
(200.00, 'LM35', 'Perigoso'),
(50.00, 'MQ2', 'Normal'),
(110.00, 'DHT11', 'Atenção'),
(120.00, 'LM35', 'Atenção'),
(95.00, 'MQ2', 'Normal'),
(180.00, 'DHT11', 'Perigoso'),
(70.00, 'LM35', 'Normal'),
(60.00, 'MQ2', 'Atenção');

