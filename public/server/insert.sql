CREATE TABLE IF NOT EXISTS listas (
id int auto_increment,
titulo varchar(200) NOT NULL,
fechaCreacion int NOT NULL,
ultimaModificacion int NOT NULL,
encriptada int NOT NULL DEFAULT 0,
PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS elementos_listas(
id INTEGER PRIMARY KEY auto_increment,
id_lista INTEGER,
contenido TEXT NOT NULL,
terminado INTEGER NOT NULL DEFAULT 0,
FOREIGN KEY (id_lista) REFERENCES listas(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS fondos_listas(
id INTEGER PRIMARY KEY auto_increment,
id_lista INTEGER,
nombre TEXT NOT NULL,
FOREIGN KEY (id_lista) REFERENCES listas(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS etiquetas(
id INTEGER PRIMARY KEY auto_increment,
nombre TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS etiquetas_listas(
id INTEGER PRIMARY KEY auto_increment,
id_lista INTEGER,
id_etiqueta INTEGER,
FOREIGN KEY (id_lista) REFERENCES listas(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_etiqueta) REFERENCES etiquetas(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS notas(
id INTEGER PRIMARY KEY auto_increment,
titulo TEXT NOT NULL,
contenido TEXT NOT NULL,
fechaCreacion INTEGER NOT NULL,
ultimaModificacion INTEGER NOT NULL,
encriptada INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS fondos_notas(
id INTEGER PRIMARY KEY auto_increment,
id_nota INTEGER,
nombre TEXT NOT NULL,
FOREIGN KEY (id_nota) REFERENCES notas(id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS etiquetas_notas(
id INTEGER PRIMARY KEY auto_increment,
id_nota INTEGER,
id_etiqueta INTEGER,
FOREIGN KEY (id_nota) REFERENCES notas(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_etiqueta) REFERENCES etiquetas(id) ON DELETE CASCADE ON UPDATE CASCADE
);

