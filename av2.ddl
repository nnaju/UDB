-- Criação da tabela Condomínio
CREATE TABLE Condominio (
    idCondominio NUMBER PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    endereco VARCHAR2(150) NOT NULL,
    num NUMBER NOT NULL,
    cep VARCHAR2(10) NOT NULL,
    bairro VARCHAR2(50) NOT NULL,
    cidade VARCHAR2(50) NOT NULL,
    estado VARCHAR2(2) NOT NULL,
    proprietario VARCHAR2(100) NOT NULL,
    cnpj VARCHAR2(18) UNIQUE NOT NULL
);

-- Criação da tabela Condominos
CREATE TABLE Condominos (
    idCondomino NUMBER PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    cpf VARCHAR2(11) UNIQUE NOT NULL,
    email VARCHAR2(100) NOT NULL,
    senha VARCHAR2(50) NOT NULL,
    user VARCHAR2(50) NOT NULL,
    Condominios_idCondominio NUMBER NOT NULL,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio)
);

-- Criação da tabela Morador
CREATE TABLE Morador (
    idMorador NUMBER PRIMARY KEY,
    bloco VARCHAR2(10) NOT NULL,
    numApart NUMBER NOT NULL,
    valorAluguel NUMBER NOT NULL,
    Condominios_idCondominio NUMBER NOT NULL,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio)
);

-- Criação da tabela Síndico
CREATE TABLE Sindico (
    idSindico NUMBER PRIMARY KEY,
    inicioMandato DATE NOT NULL,
    fimMandato DATE NOT NULL,
    Condominios_idCondominio NUMBER NOT NULL,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio)
);

-- Criação da tabela Tarefas
CREATE TABLE Tarefas (
    idTarefa NUMBER PRIMARY KEY,
    nome VARCHAR2(100) NOT NULL,
    status VARCHAR2(20) NOT NULL,
    dataConclusao DATE,
    descricao CLOB,
    Condominios_idCondominio NUMBER NOT NULL,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio)
);

-- Criação da tabela Portaria
CREATE TABLE Portaria (
    idPortaria NUMBER PRIMARY KEY,
    portaria VARCHAR2(50) NOT NULL,
    Condominios_idCondominio NUMBER NOT NULL,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio)
);

-- Criação da tabela Mensagem
CREATE TABLE Mensagem (
    idMensagem NUMBER PRIMARY KEY,
    destinatario VARCHAR2(100) NOT NULL,
    mensagem CLOB NOT NULL,
    Condominios_idCondominio NUMBER NOT NULL,
    Portarias_idPortaria NUMBER,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio),
    FOREIGN KEY (Portarias_idPortaria) REFERENCES Portaria (idPortaria)
);

-- Criação da tabela Solicitações
CREATE TABLE Solicitacoes (
    idSolicitacao NUMBER PRIMARY KEY,
    solicitacao CLOB NOT NULL,
    justificativa CLOB,
    Condominios_idCondominio NUMBER NOT NULL,
    FOREIGN KEY (Condominios_idCondominio) REFERENCES Condominio (idCondominio)
);
