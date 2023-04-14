create schema datos_pagina;

use datos_pagina;

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
insert into usuarios (id,email,contrasenia,fecha_de_nacimiento,dni,foto_de_perfil)values(default,"alecorti@gmail.com","33838383",'2003-09-02',44842994,"fotoperfil.png");
insert into usuarios (id,email,contrasenia,fecha_de_nacimiento,dni,foto_de_perfil)values(default,"elfedevitale@gmail.com","869997",'2009-02-13',44842997,"fotoperfil2.png");
insert into usuarios (id,email,contrasenia,fecha_de_nacimiento,dni,foto_de_perfil)values(default,"mauriciomacri@gmail.com","585689759",'2004-11-01',44842992,"fotoperfil3.png");
insert into usuarios (id,email,contrasenia,fecha_de_nacimiento,dni,foto_de_perfil)values(default,"elpitymartinez@gmail.com","32632646",'2002-12-23',44842996,"fotoperfil4.png");
insert into usuarios (id,email,contrasenia,fecha_de_nacimiento,dni,foto_de_perfil)values(default,"ignacioaracena@gmail.com","868797",'2000-08-20',44842993,"fotoperfil5.png");

create table productos(
id int unsigned primary key auto_increment,
usuario_id INT UNSIGNED NOT NULL,
producto varchar(255) not null,
descripcionProd varchar(255) not null,
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt timestamp null,
FOREIGN KEY(usuario_id) references usuarios(id),
);
insert into productos (usuario_id,producto,descripcionProd) 
values
(1,"Mate camionero acero","Mate camionero acero");
(2,"Mate imperial liso","Mate imperial liso");
(5,"Mate torpedo cincelado","Mate torpedo cincelado");
(3,"Mate calabaza cruda","Mate calabaza cruda");
(5,"Bombilla de oro","Bombilla de oro");
(2,"Bombillon premium","Bombillon premium");
(5,"Mate vaqueta","Mate vaqueta");
(4,"Stickers","Stickers");
(1,"Termo stanley","Termo stanley 1l");
(2,"Termo termolar","Termo termolar 1l");

create table comentarios(
id int unsigned primary key auto_increment,
post_id int unsigned not null,
usuario_id INT UNSIGNED NOT NULL,
comentario varchar(255) not null,
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt timestamp ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY(post_id) references productos(id),
FOREIGN KEY(usuario_id) references usuarios(id)
);
insert into comentarios (post_id, usuario_id, comentario) values(1, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(1, 2, "buen termo rey");
insert into comentarios (post_id, usuario_id, comentario) values(1, 3, "uffffffff");
insert into comentarios (post_id, usuario_id, comentario) values(1, 4, "no lo soñeeeeeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(2, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(2, 2, "buen termo rey");
insert into comentarios (post_id, usuario_id, comentario) values(2, 3, "uffffffff");
insert into comentarios (post_id, usuario_id, comentario) values(2, 4, "no lo soñeeeeeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(3, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(3, 2, "buen termo rey");
insert into comentarios (post_id, usuario_id, comentario) values(3, 3, "uffffffff");
insert into comentarios (post_id, usuario_id, comentario) values(3, 4, "no lo soñeeeeeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(4, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(4, 2, "buen termo rey");
insert into comentarios (post_id, usuario_id, comentario) values(4, 3, "uffffffff");
insert into comentarios (post_id, usuario_id, comentario) values(4, 4, "no lo soñeeeeeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(5, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(5, 2, "buen termo rey");
insert into comentarios (post_id, usuario_id, comentario) values(5, 3, "uffffffff");
insert into comentarios (post_id, usuario_id, comentario) values(5, 4, "no lo soñeeeeeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(6, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(6, 2, "buen termo rey");
insert into comentarios (post_id, usuario_id, comentario) values(6, 3, "uffffffff");
insert into comentarios (post_id, usuario_id, comentario) values(6, 4, "no lo soñeeeeeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(7, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(7, 2, "buen termo rey");
insert into comentarios (post_id, usuario_id, comentario) values(7, 3, "uffffffff");
insert into comentarios (post_id, usuario_id, comentario) values(7, 4, "no lo soñeeeeeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(8, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(8, 2, "buen termo rey");
insert into comentarios (post_id, usuario_id, comentario) values(8, 3, "uffffffff");
insert into comentarios (post_id, usuario_id, comentario) values(8, 4, "no lo soñeeeeeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(9, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(9, 2, "buen termo rey");
insert into comentarios (post_id, usuario_id, comentario) values(9, 3, "uffffffff");
insert into comentarios (post_id, usuario_id, comentario) values(9, 4, "no lo soñeeeeeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(10, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (post_id, usuario_id, comentario) values(10, 2, "buen termo rey");
insert into comentarios (post_id, usuario_id, comentario) values(10, 3, "uffffffff");
insert into comentarios (post_id, usuario_id, comentario) values(10, 4, "no lo soñeeeeeeeee");