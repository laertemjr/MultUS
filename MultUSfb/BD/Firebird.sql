/******************************************************************************/
/*                                   Tables                                   */
/******************************************************************************/



CREATE TABLE TB_CLIENTES (
    CLIENTE_ID            INTEGER NOT NULL,
    CLIENTE_NOMECOMPLETO  VARCHAR(40) NOT NULL,
    CLIENTE_EMAIL         VARCHAR(40),
    CLIENTE_CELULAR       VARCHAR(11)
);

CREATE TABLE TB_USERS (
    USER_ID        INTEGER NOT NULL,
    USER_NAME      VARCHAR(40) NOT NULL,
    USER_PASSWORD  VARCHAR(8) NOT NULL
);



/******************************************************************************/
/*                                Primary keys                                */
/******************************************************************************/

ALTER TABLE TB_CLIENTES ADD CONSTRAINT PK_TB_CLIENTES PRIMARY KEY (CLIENTE_ID);
ALTER TABLE TB_USERS ADD CONSTRAINT PK_TB_USERS PRIMARY KEY (USER_ID);


/******************************************************************************/
/*                                  Indices                                   */
/******************************************************************************/

CREATE INDEX TB_CLIENTES_IDX1 ON TB_CLIENTES (CLIENTE_NOMECOMPLETO);
CREATE INDEX TB_USERS_IDX1 ON TB_USERS (USER_NAME);
