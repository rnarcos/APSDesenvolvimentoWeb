CREATE DATABASE Clinica;

USE Clinica;

CREATE TABLE Medico (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,	nome VARCHAR(50) NOT NULL
,	especialidade VARCHAR(20) NOT NULL
);

CREATE TABLE Paciente (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,	nome VARCHAR(50) NOT NULL
);

CREATE TABLE Consulta (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY
,	data DATETIME NOT NULL
,	convenio VARCHAR(10) NOT NULL
,	especialidade VARCHAR(20) NOT NULL
,	id_medico INT NOT NULL
,	id_paciente INT NOT NULL
,	FOREIGN KEY (id_medico) REFERENCES Medico(id)
,	FOREIGN KEY (id_paciente) REFERENCES Paciente(id)
);

INSERT INTO Medico (id, nome, especialidade) VALUES 
	(NULL, "Jose Camargo Lacerda", "Acupuntura")
,	(NULL, "Waylon Dalton", "Angiologia")
,	(NULL, "Justine Henderson", "Cardiologia")
,	(NULL, "Abdullah Lang", "Pediatra")
,	(NULL, "Marcus Cruz", "Clínica Geral")
,	(NULL, "Thalia Cobb", "Gastroentereologia")
,	(NULL, "Angela Walker", "Dermatologia")
,	(NULL, "Mathias Little", "Geriatria")
,	(NULL, "Eddie Randolph", "Ginecologia")
,	(NULL, "Sanaa Huff", "Obstetrícia")
,	(NULL, "Gina Estes", "Nutricionista")
,	(NULL, "Ivy Rubio", "Neurologista")
,	(NULL, "Thalia Garrett", "Psiquiatra")
,	(NULL, "Ana Tereza de A. Vasques", "Acupuntura")
,	(NULL, "Brisa Silva Bracchi", "Angiologia")
,	(NULL, "Debora Kaynara Patricio da Silva", "Cardiologia")
,	(NULL, "Glaucia Adriana Dantas Pereira", "Pediatra")
,	(NULL, "Isabele Acciolo P. Lima", "Clínica Geral")
,	(NULL, "Ivausck Maria L. da Costa", "Gastroentereologia")
,	(NULL, "Joane Maria da Silva Carvalho", "Dermatologia")
,	(NULL, "Kalyne Ribeiro Dantas Q. de Vasconcelos", "Geriatria")
,	(NULL, "Kênia Stephanie Nunes Arruda", "Ginecologia")
,	(NULL, "Lorena Alcântara de Farias", "Obstetrícia")
,	(NULL, "Luana Nascimento dos Santos", "Nutricionista")
,	(NULL, "Lucicleide Silva Freire Alves de Oliveira", "Neurologista")
,	(NULL, "Luisa Raquel Teixeira de Araújo", "Psiquiatra")
,	(NULL, "Victor Sthéfano de Moura Queiroz", "Angiologia")
,	(NULL, "Saulo Matheus de Oliveira L. Cavalcante", "Cardiologia")
,	(NULL, "Ramon Douglas Nunes de Andrade", "Pediatra")
,	(NULL, "Rafael Felipe de Lima Miranda", "Clínica Geral")
,	(NULL, "Pedro Henrique Gouveia de Lima", "Gastroentereologia")
,	(NULL, "Ítalo Nathan da Silva", "Dermatologia")
,	(NULL, "Cayo Rodrigues Nunes Moraes", "Geriatria")
,	(NULL, "Cristiano Rodrigues Alexandre da Silva", "Ginecologia")
,	(NULL, "Alexssandro Oliveria de Almeida Rocha", "Obstetrícia")
,	(NULL, "Ewertom Mascena de Araújo", "Nutricionista");


INSERT INTO Paciente (id, nome) VALUES 
	(NULL, "Lizbeth Chaney")
,	(NULL, "Rolando Washington")
,	(NULL, "Gordon Bean")
,	(NULL, "Brice Burns")
,	(NULL, "Axel Cordova")
,	(NULL, "Jazmine Whitehead")
,	(NULL, "Demetrius Pena")
,	(NULL, "Tessa Hamilton")
,	(NULL, "Elianna Velazquez")
,	(NULL, "Coby Malone")
,	(NULL, "Kaylie Montgomery")
,	(NULL, "Tyrese Harris")
,	(NULL, "Paige Mcguire")
,	(NULL, "Ramon Graves")
,	(NULL, "Owen Mccullough")
,	(NULL, "Haylee Newton")
,	(NULL, "Layton Gregory")
,	(NULL, "Dayana Dodson")
,	(NULL, "Irvin Faulkner")
,	(NULL, "Amari Cantrell")
,	(NULL, "Humberto Bullock")
,	(NULL, "Martha Kent")
,	(NULL, "Lizeth Schroeder")
,	(NULL, "Avah Barnett")
,	(NULL, "Alana Monteiro Bispo da Silva")
,	(NULL, "Amanda C. Moreira")
,	(NULL, "Ana Tereza de Abreu Vasquez")
,	(NULL, "Angélica Augusta Linhares do Monte")
,	(NULL, "Gesuino Carlos C. Silva")
,	(NULL, "Helouise Thainá da Silva Macêdo")
,	(NULL, "Rafael Laureano Wanderley")
,	(NULL, "Mariano Salles Franco Torres")
,	(NULL, "Alexsandro Santana dos Santos")
,	(NULL, "Simone Karla Costa da Silva")
,	(NULL, "Sara da G. Ferreira")
,	(NULL, "Maria Gisele da Silva de Oliveira")
,	(NULL, "Maria Isabel Azevedo Gomes")
,	(NULL, "Maria Isabel Paiva Gomes")
,	(NULL, "Maria José Santana dos Santos")
,	(NULL, "Maria Luisa Cavalcante de Moraes ")
,	(NULL, "Patrick Ramos de Melo")
,	(NULL, "Rafael Souza Teixeira")
,	(NULL, "Monalisa da Silva Godeiro")
,	(NULL, "Luiz Fernando da Silva Câmara")
,	(NULL, "Alfredo Alves de Oliveira")
,	(NULL, "Fernando Alcântara de Faria")
,	(NULL, "Alvaro Lucena de Araújo ")
,	(NULL, "Washington Edilma de Abreu");

DELIMITER $

CREATE PROCEDURE list_especialidades ()
BEGIN
	SELECT DISTINCT especialidade
	FROM Medico;
END$

CREATE PROCEDURE list_medicos_from_especialidade(especialidade VARCHAR(20))
BEGIN
	SELECT nome
	FROM Medico
	WHERE Medico.especialidade = especialidade;
END$


CREATE PROCEDURE create_consulta(
	medico VARCHAR(50)
,	especialidade VARCHAR(20)
,	paciente VARCHAR(50)
,	data DATETIME
,	convenio VARCHAR(10)
)
BEGIN
	DECLARE id_paciente, id_medico INT;
	SET id_paciente = COALESCE(find_paciente_id_by_name(paciente), create_paciente(paciente));
	SET id_medico = find_medico_id_by_name(medico);
	INSERT INTO Consulta (id, data, convenio, especialidade, id_medico, id_paciente) VALUES 
		(NULL, data, convenio, especialidade, id_medico, id_paciente);
END$

CREATE FUNCTION create_paciente (nome VARCHAR(50))
RETURNS INT
BEGIN
	INSERT INTO Paciente Values
	(NULL, nome);
	RETURN LAST_INSERT_ID();

END$

CREATE PROCEDURE find_paciente(
	id INT
,	nome VARCHAR(50)
)
BEGIN
	SELECT *
	FROM Paciente
	WHERE Paciente.id = id 
	OR Paciente.nome = nome;
END$


CREATE FUNCTION find_paciente_name_by_id(
	id INT
)
RETURNS VARCHAR(50)
BEGIN
	RETURN(SELECT nome
	FROM Paciente
	WHERE Paciente.id = id );
END$

CREATE FUNCTION find_paciente_id_by_name(
	nome VARCHAR(50)
)
RETURNS INT
BEGIN
	RETURN(SELECT id
	FROM Paciente
	WHERE Paciente.nome = nome);
END$

CREATE FUNCTION find_medico_name_by_id(
	id INT
)
RETURNS VARCHAR(50)
BEGIN
	RETURN (SELECT nome
	FROM Medico
	WHERE Medico.id = id);
END$

CREATE FUNCTION find_medico_id_by_name(
	nome VARCHAR(50)
)
RETURNS INT
BEGIN
	RETURN (SELECT id
	FROM Medico
	WHERE Medico.nome = nome);
END$

CREATE PROCEDURE list_consultas()
BEGIN
	SELECT find_medico_name_by_id(id_medico) AS "medico", especialidade, find_paciente_name_by_id(id_paciente) as "paciente", DATE_FORMAT(data, "%d/%m/%Y %H:%i") as data, convenio
	FROM Consulta
	ORDER BY DATE(data) ASC;
END$

CALL create_consulta(
	"Alexssandro Oliveria de Almeida Rocha"
,	"Obstetrícia"
,	"Washington Edilma de Abreu"
,	DATE("2018-05-16 12:00")
,	"AMIL"
);

CALL create_consulta(
	"Ewertom Mascena de Araújo"
,	"Nutricionista"
,	"Alvaro Lucena de Araújo"
,	DATE("2018-05-16 12:01")
,	"UNIMED"
);

CALL create_consulta(
	"Cristiano Rodrigues Alexandre da Silva"
,	"Ginecologia"
,	"Fernando Alcântara de Faria"
,	DATE("2018-05-16 12:11")
,	"AMIL"
);

CALL create_consulta(
	"Cayo Rodrigues Nunes Moraes"
,	"Geriatria"
,	"Alfredo Alves de Oliveira"
,	DATE("2018-05-16 15:01")
,	"AMIL"
);

CALL create_consulta(
	"Ítalo Nathan da Silva"
,	"Dermatologia"
,	"Luiz Fernando da Silva Câmara"
,	DATE("2018-02-12 17:01")
,	"UNIMED"
);

CALL create_consulta(
	"Pedro Henrique Gouveia de Lima"
,	"Gastroentereologia"
,	"Monalisa da Silva Godeiro"
,	DATE("2018-01-16 16:21")
,	"AMIL"
);

CALL create_consulta(
	"Rafael Felipe de Lima Miranda"
,	"Clínica Geral"
,	"Rafael Souza Teixeira"
,	DATE("2018-02-14 14:01")
,	"UNIMED"
);

CALL create_consulta(
	"Ramon Douglas Nunes de Andrade"
,	"Pediatra"
,	"Patrick Ramos de Melo"
,	DATE("2018-04-16 12:45")
,	"AMIL"
);

CALL create_consulta(
	"Kênia Stephanie Nunes Arruda"
,	"Ginecologia"
,	"Maria Luisa Cavalcante de Moraes"
,	DATE("2018-04-30 10:51")
,	"AMIL"
);

CALL create_consulta(
	"Lorena Alcântara de Farias"
,	"Obstetrícia"
,	"Maria José Santana dos Santos"
,	DATE("2018-02-22 09:01")
,	"UNIMED"
);

CALL create_consulta(
	"Ana Tereza de A. Vasques"
,	"Acupuntura"
,	"Maria Isabel Paiva Gomes"
,	DATE("2018-05-16 10:01")
,	"UNIMED"
);

CALL create_consulta(
	"Brisa Silva Bracchi"
,	"Angiologia"
,	"Maria Isabel Azevedo Gomes"
,	DATE("2018-03-30 13:01")
,	"AMIL"
);

CALL create_consulta(
	"Debora Kaynara Patricio da Silva"
,	"Cardiologia"
,	"Maria Gisele da Silva de Oliveira"
,	DATE("2018-02-28 15:31")
,	"AMIL"
);

CALL create_consulta(
	"Glaucia Adriana Dantas Pereira"
,	"Pediatra"
,	"Sara da G. Ferreira"
,	DATE("2018-04-16 12:01")
,	"AMIL"
);

CALL create_consulta(
	"Glaucia Adriana Dantas Pereira"
,	"Pediatra"
,	"Simone Karla Costa da Silva"
,	DATE("2018-03-14 14:01")
,	"UNIMED"
);

CALL create_consulta(
	"Ewertom Mascena de Araújo"
,	"Nutricionista"
,	"Alexsandro Santana dos Santos"
,	DATE("2018-03-26 15:01")
,	"UNIMED"
);

CALL create_consulta(
	"Ewertom Mascena de Araújo"
,	"Nutricionista"
,	"Mariano Salles Franco Torres"
,	DATE("2018-02-11 11:00")
,	"UNIMED"
);

CALL create_consulta(
	"Victor Sthéfano de Moura Queiroz"
,	"Angiologia"
,	"Rafael Laureano Wanderley"
,	DATE("2018-03-16 12:00")
,	"AMIL"
);

CALL create_consulta(
	"Victor Sthéfano de Moura Queiroz"
,	"Angiologia"
,	"Ana Tereza de Abreu Vasquez"
,	DATE("2018-05-14 12:21")
,	"UNIMED"
);

CALL create_consulta(
	"Ewertom Mascena de Araújo"
,	"Nutricionista"
,	"Angélica Augusta Linhares do Monte"
,	DATE("2018-01-13 10:47")
,	"UNIMED");