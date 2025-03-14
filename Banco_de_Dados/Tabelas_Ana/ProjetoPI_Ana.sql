-- Criando banco de dados ProjetoPI
create database ProjetoPI;

-- Entrando no Banco de Dados ProjetoPI
use ProjetoPI;

-- Criação da tabela Usuário
create table usuario (
idUsuario int primary key auto_increment, 
nome varchar (60),
email varchar (70),
senha char (10)
);

-- Inserir os dados na tabela
insert into usuario (nome, email, senha) values
('Ana Beatriz Zinatto', 'ana.sobral@sptech.school', '948362'),
('Emilly Reis', 'Emilly.Reis@sptech.school', '94521'),
('Erick Lopez', 'Erick.Lopez@sptech.school', '497654'),
('Mateus Gomes', 'Mateus.gomes@sptech.school', '102745');


-- Ver os dados na tabela
select * from usuario;

-- Inserir os dados sem senha
insert into usuario (nome, email) values
('Gabriel Akira', 'gabriel.akira@sptech.school'),
('Igor Silva', 'igor.silva@sptech.school'),
('Eduardo Almeida', 'eduardo.almeida@sptech.school');


-- Concatenar dados
select concat (nome, ' você está logada ') as 'Usuário' from usuario;


-- Se a senha for nulo vai pedir para colocar uma senha, senão ira prosseguir
SELECT CASE WHEN senha IS NULL OR senha = '' THEN 'Coloque uma senha' 
ELSE 'Usuário Liberado' 
END AS Usuario_Senhas FROM usuario;



--------------------------------------------------------------------------------------------------

-- Criação da Tabela Sensor
create table sensor (
idSensor int primary key auto_increment,
nomeSensor varchar (30),
dtInstalação datetime,
dtManutenção datetime,
tipo varchar(20), constraint chkTipo check (tipo in('Gás'))
);

-- Inserir os dados na tabela
INSERT INTO sensor (nomeSensor, dtInstalação, dtManutenção, tipo) VALUES 
('MQ-2', '2024-03-01 08:30:00', '2025-03-01 10:00:00', 'Gás'),
('MQ-2', '2024-02-15 14:20:00', '2025-12-07 10:00:00', 'Gás'),
('MQ-2', '2023-12-10 09:00:00', '2024-12-10 09:30:00', 'Gás');

-- Concatenando informações
select concat (nomeSensor, ' é do tipo ',tipo) as 'Sensor e Tipo' from sensor;

-- Ver os dados na tabela
select * from sensor;

----------------------------------------------------------------------------------------------------

-- Criação da Tabela Dados
create table Dados (
idDados int primary key auto_increment,
nomeSensor varchar (30),
dataHora datetime,
gas varchar (10), constraint chkgas check (gas in('Moderado', 'Baixo', 'Alto'))
);

-- Inserir os dados na tabela
INSERT INTO Dados (nomeSensor, dataHora, gas) VALUES 
('MQ-2', '2024-03-10 08:30:00', 'Baixo'),
('MQ-2', '2024-03-10 09:15:00', 'Moderado'),
('MQ-2', '2024-03-10 10:45:00', 'Alto'),
('MQ-2', '2024-03-10 12:00:00', 'Alto');

-- Se o gás for moderado é Sem preocupações, senão você deverá controlar o gás
select case when gas ='Moderado' then 'Sem preocupações' 
else 'Controle o Gás' 
end as Monitoramento_Gas from Dados;

-- Concatenando informações
select concat ("O nome do Sensor é ", nomeSensor, '. A data e horário é  ',dataHora, '. O status é ', gas) as 'Dados do senspr' from Dados;

-- Ver os dados na tabela
select * from Dados;





