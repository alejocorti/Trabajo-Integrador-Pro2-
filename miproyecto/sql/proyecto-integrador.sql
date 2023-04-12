create schema base_de_datos;

use base_de_datos;

create table usuarios (
id int unsigned primary key auto_increment,
email varchar(255) unique not null,
contrasenia varchar(255) not null,
fecha_de_nacimiento date,
dni int unsigned not null,
foto_de_perfil varchar(255),
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt timestamp null);

create table productos(
id int unsigned primary key auto_increment,
usuario_id INT UNSIGNED NOT NULL,
producto varchar(255) not null,
descripcionProd varchar(255) not null,
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt timestamp null,
FOREIGN KEY(usuario_id) references usuarios(id)
);

create table comentarios(
id int unsigned primary key auto_increment,
post_id int unsigned not null,
usuario_id INT UNSIGNED NOT NULL,
comentario varchar(255) not null,
FOREIGN KEY(post_id) references productos(id),
FOREIGN KEY(usuario_id) references usuarios(id),
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt timestamp null
);
