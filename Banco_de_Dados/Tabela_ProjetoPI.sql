-- Criar Banco de Dados SeedTech
create database dbSeedTech;

-- Usando o Banco de Dados SeedTech
use dbSeedTech;

-- Criação da tabela Usuario
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


-- Criação da tabela Sensor
CREATE TABLE tbSensor(
	id_Sensor INT PRIMARY KEY AUTO_INCREMENT,
    tipo_Sensor VARCHAR (20),
		CONSTRAINT chkTipoSensor
			CHECK(tipo_Sensor IN('MQ2')),
	status_Sensor VARCHAR(20),
		CONSTRAINT chkStatusSensor
			CHECK(status_Sensor IN('ativo','inativo'))
);

-- Criação da tabela Administrador
CREATE TABLE tbAdmin(
	id_Admin INT PRIMARY KEY AUTO_INCREMENT,
    email_Admin VARCHAR(40) NOT NULL UNIQUE,
    senha_Admin VARCHAR(30) NOT NULL,
    status_Admin VARCHAR(15),
		CONSTRAINT chkStatusAdmin
			CHECK(status_Admin IN('ativo','inativo')),
	ultimoAcesso_Usuario DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- Criação da tabela Alerta
CREATE TABLE tbAlerta(
	id_Alerta INT PRIMARY KEY AUTO_INCREMENT,
	qntPpm_Alerta DOUBLE(10,2),
	sensor_Alerta VARCHAR(10),
		CONSTRAINT chkSensorAlerta
			CHECK (sensor_Alerta IN('MQ2')),
	risco_Alerta VARCHAR(15),
		CONSTRAINT chkRiscoAlerta
			CHECK(risco_Alerta IN('Alto','Baixo','Moderado')),
	data_Alerta DATETIME DEFAULT CURRENT_TIMESTAMP
);


SELECT * FROM tbUsuario;
SELECT * FROM tbAdmin;
SELECT * FROM tbAlerta;
SELECT * FROM tbSensor;

-- Inserindo os dados na Tabela Usuário
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


-- Inserindo os dados na Tabela Sensor
INSERT INTO tbSensor (tipo_Sensor, status_Sensor) 
VALUES 
('MQ2', 'ativo'),
('MQ2', 'inativo'),
('MQ2', 'ativo'),
('MQ2', 'ativo'),
('MQ2', 'ativo'),
('MQ2', 'inativo'),
('MQ2', 'ativo'),
('MQ2', 'ativo'),
('MQ2', 'ativo'),
('MQ2', 'inativo');



-- Inserindo os dados na Tabela Administrador
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



-- Inserindo os dados na Tabela Alerta
INSERT INTO tbAlerta (qntPpm_Alerta, sensor_Alerta, risco_Alerta) 
VALUES 
(1600.00, 'MQ2', 'Alto'),
(1150.00, 'MQ2', 'Moderado'),
(950.00, 'MQ2', 'Moderado'),
(1250.00, 'MQ2', 'Moderado'),
(300.00, 'MQ2', 'Baixo'),
(20.00, 'MQ2', 'Baixo'),
(900.00, 'MQ2', 'Moderado'),
(1800.00, 'MQ2', 'Alto'),
(1200.00, 'MQ2', 'Moderado');


-- Concatenando informações
select concat ("O Sensor: ", sensor_Alerta, '. Esta com o PPM: ',qntPpm_Alerta, '. Com o nível de CO2: ', risco_Alerta) as 'Dados do Alerta' from tbAlerta;

-- Comando para ver o risco do alerta e mostra também se foi por conta de baixa ou alta quantidade de CO²
SELECT 
	id_Alerta,qntPpm_Alerta, risco_Alerta,
    CASE 
		WHEN qntPpm_Alerta BETWEEN 500 AND 1500 THEN 'CO² Ideal'
        WHEN qntPpm_Alerta < 400 THEN 'Baixa quantidade de CO²'
        ELSE 'Alta quantidade de CO²'
    END AS Tipo_alerta
FROM tbAlerta;

-- quais usuarios estão ativos e quando foi a ultima vez que eles accesaram

SELECT nome_Usuario, email_Usuario, ultimoAcesso_Usuario
FROM tbUsuario
WHERE status_Usuario = 'ativo'
ORDER BY ultimoAcesso_Usuario DESC;

-- Usuario ve os adms inativos e quando foi seu ultimo acesso  em ordem decrescente
SELECT email_Admin, ultimoAcesso_Usuario
FROM tbAdmin
WHERE status_Admin = 'inativo'
ORDER BY ultimoAcesso_Usuario DESC;


--  lista apenas os sensores mq2 ativos
SELECT id_sensor, tipo_sensor, status_sensor
FROM tbSensor
WHERE tipo_sensor = 'MQ2' AND status_sensor = 'Ativo';

-- Usuario ve os alertas com o CO2 elevado e deixa eles em ordem drecescente ou seja do alerta mais novo ao mais velho
SELECT id_Alerta, qntPpm_Alerta, sensor_Alerta, risco_Alerta,data_Alerta
FROM tbAlerta
WHERE risco_Alerta = 'Alto'  order by data_Alerta;

-- Usuario ve os alertas com o CO2 Moderado e deixa eles em ordem drecescente ou seja do alerta mais novo ao mais velho
SELECT id_Alerta, qntPpm_Alerta, sensor_Alerta, risco_Alerta,data_Alerta
FROM tbAlerta
WHERE risco_Alerta = 'Moderado'  order by data_Alerta;

-- Usuario ve a quantidade apenas os sensores ativos 
SELECT id_Sensor, tipo_Sensor
FROM tbSensor
WHERE status_Sensor = 'ativo' and tipo_sensor='MQ2';

-- Se a senha for nulo vai pedir para colocar uma senha, senão ira prosseguir
SELECT CASE WHEN senha_Admin IS NULL OR senha_Admin = '' THEN 'Coloque uma senha' 
ELSE 'Usuário Liberado' 
END AS senha_Admin FROM tbAdmin;






