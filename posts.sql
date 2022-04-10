-- Database: Posts

-- DROP DATABASE IF EXISTS "Posts";
--Parte 1
--1. Crear una base de datos con nombre “Posts”. (1 Punto)

CREATE DATABASE "Posts"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Spanish_Spain.1252'
    LC_CTYPE = 'Spanish_Spain.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
--2. Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación,contenido y descripción. (1 Punto)

CREATE TABLE posts (
ID SERIAL,
nombre_usuario VARCHAR(25),
fecha_creacion DATE,
contenido VARCHAR(255),
descripcion VARCHAR(255),
PRIMARY KEY (id));

--3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos". (0.6 Puntos)

INSERT INTO posts (nombre_usuario, fecha_creacion, contenido, descripcion) VALUES
('Pamela', '2022-04-10', 'Este es un contenido', 'y esta, una descripción');
INSERT INTO posts (nombre_usuario, fecha_creacion, contenido, descripcion) VALUES
('Pamela', '2022-04-10', 'Este es otro contenido', 'y esta, otra descripción');
INSERT INTO posts (nombre_usuario, fecha_creacion, contenido, descripcion) VALUES
('Carlos', '2022-04-10', 'Ahora este es un contenido para Carlos', 'y esta, una descripción para Carlos');

--4. Modificar la tabla post, agregando la columna título. (1 Punto)
ALTER TABLE posts ADD titulo VARCHAR(255);

--5. Agregar título a las publicaciones ya ingresadas. (1 Punto)
UPDATE posts SET titulo = 'Titulo_1 para Pamela' WHERE id = '1';
UPDATE posts SET titulo = 'Titulo_2 para Pamela' WHERE id = '2';
UPDATE posts SET titulo = 'Titulo_1 para Carlos' WHERE id = '3';

--6. Insertar 2 post para el usuario "Pedro". (0.4 Puntos)
INSERT INTO posts (nombre_usuario, fecha_creacion, contenido, descripcion, titulo) VALUES
('Pedro', '2022-04-10', 'Este es un contenido para Pedro', 'acá una descripción para Pedro', 'y un título para Pedro');
INSERT INTO posts (nombre_usuario, fecha_creacion, contenido, descripcion, titulo) VALUES
('Pedro', '2022-04-10', 'Este es otro contenido para Pedro', 'acá otra descripción para Pedro', 'y otro título para Pedro');

--7. Eliminar el post de Carlos. (1 Punto)
DELETE FROM posts WHERE nombre_usuario='Carlos';

--8. Ingresar un nuevo post para el usuario "Carlos". (0.6 Puntos)
INSERT INTO posts (nombre_usuario, fecha_creacion, contenido, descripcion, titulo) VALUES
('Carlos', '2022-04-10', 'Este es el contenido para Carlos que reemplaza el anterior que tenia', 'acá una nueva descripción para Carlos', 'y otro título nuevo para Carlos');

--Parte 2
--1. Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de creación y contenido, que se relacione con la tabla posts. (1 Punto)

CREATE TABLE comentarios(
   id SERIAL NOT NULL PRIMARY KEY,
   post_id BIGINT,
   fecha DATE,
   hora_creacion TIME,
   contenido VARCHAR(255),
   FOREIGN KEY (post_id) REFERENCES posts(id)
);

--2. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos". (0.4 Puntos)
--Conocer los id de los usuarios
SELECT * FROM posts;
--Pamela tiene el id 1
--Carlos tiene el id 6

INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('1', '2022-04-10', '10:20:00', 'comentario_1');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('1', '2022-04-10', '10:20:00', 'comentario_2');

INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('6', '2022-04-10', '10:20:00', 'comentario_1');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('6', '2022-04-10', '10:20:00', 'comentario_2');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('6', '2022-04-10', '10:20:00', 'comentario_3');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('6', '2022-04-10', '10:20:00', 'comentario_4');

--3. Crear un nuevo post para "Margarita". (1 Punto)
INSERT INTO posts(nombre_usuario, fecha_creacion, contenido, descripcion, titulo)
VALUES ('Margarita', '2022-04-10', 'Este es un contenido para Margarita', 'acá una descripción para Margarita', 'y el titulo para Margarita');

--4. Ingresar 5 comentarios para el post de Margarita. (1 Punto)
--Conocer los id de los usuarios
SELECT * FROM posts;
--Margarita tiene el id 7
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('7', '2022-04-10', '10:20:00', 'comentario_1');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('7', '2022-04-10', '10:20:00', 'comentario_2');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('7', '2022-04-10', '10:20:00', 'comentario_3');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('7', '2022-04-10', '10:20:00', 'comentario_4');
INSERT INTO comentarios(post_id, fecha, hora_creacion, contenido)
VALUES ('7', '2022-04-10', '10:20:00', 'comentario_5');