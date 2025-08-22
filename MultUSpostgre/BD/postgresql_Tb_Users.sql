CREATE TABLE Tb_Users (
    user_ID SERIAL PRIMARY KEY,
    user_name VARCHAR(40) NOT NULL,
	user_password VARCHAR(8) NULL
);
