CREATE TABLE Tb_Clientes (
    Cliente_ID SERIAL PRIMARY KEY,
    Cliente_NomeCompleto VARCHAR(40) NOT NULL,
	Cliente_Email VARCHAR(40) NULL,
	Cliente_Celular VARCHAR(11) NULL
);
