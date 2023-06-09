create schema datos_pagina;

use datos_pagina; 

create table usuarios (
id int unsigned primary key auto_increment,
usuario varchar(255) unique not null,
email varchar(255) unique not null,
contrasenia varchar(255) not null,
fechaDeNacimiento date,
dni int unsigned not null,
fotoDePerfil varchar(255),
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt timestamp null);
insert into usuarios (id,usuario,email,contrasenia,fechaDeNacimiento,dni,fotoDePerfil)values(default,"cortipopo08","alecorti@gmail.com","33838383",'2003-09-02',44842994,"/images/users/messi.jpg");
insert into usuarios (id,usuario,email,contrasenia,fechaDeNacimiento,dni,fotoDePerfil)values(default,"kakito","elfedevitale@gmail.com","869997",'2009-02-13',44842997,"/images/users/fotoperfil.png");
insert into usuarios (id,usuario,email,contrasenia,fechaDeNacimiento,dni,fotoDePerfil)values(default,"gustavito12","mauriciomacri@gmail.com","585689759",'2004-11-01',44842992,"/images/users/buli.jpg");
insert into usuarios (id,usuario,email,contrasenia,fechaDeNacimiento,dni,fotoDePerfil)values(default,"nachoton","elpitymartinez@gmail.com","32632646",'2002-12-23',44842996,"/images/users/messi.jpg");
insert into usuarios (id,usuario,email,contrasenia,fechaDeNacimiento,dni,fotoDePerfil)values(default,"eligna45","ignacioaracena@gmail.com","868797",'2000-08-20',44842993,"/images/users/messi.jpg");


create table productos(
id int unsigned primary key auto_increment,
usuarioId INT UNSIGNED NOT NULL,
imgProd varchar(255) not null,
producto varchar(255) not null,
descripcionProd varchar(255) not null,
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt timestamp null,
FOREIGN KEY(usuarioId) references usuarios(id));
insert into productos (usuarioId,imgProd,producto,descripcionProd)values(1,'/images/products/torpedo_alpaca_2.png',"Mate camionero acero","Mate camionero acero");
insert into productos (usuarioId,imgProd,producto,descripcionProd)values(2,'/images/products/torpedo_alpaca_2.png',"Mate imperial liso","Mate imperial liso");
insert into productos (usuarioId,imgProd,producto,descripcionProd)values(5,'/images/products/torpedo_alpaca_2.png',"Mate torpedo cincelado","Mate torpedo cincelado");
insert into productos (usuarioId,imgProd,producto,descripcionProd)values(3,'/images/products/torpedo_alpaca_2.png',"Mate calabaza cruda","Mate calabaza cruda");
insert into productos (usuarioId,imgProd,producto,descripcionProd)values(5,'/images/products/torpedo_alpaca_2.png',"Bombilla de oro","Bombilla de oro");
insert into productos (usuarioId,imgProd,producto,descripcionProd)values(2,'/images/products/torpedo_alpaca_2.png',"Bombillon premium","Bombillon premium");
insert into productos (usuarioId,imgProd,producto,descripcionProd)values(5,'/images/products/torpedo_alpaca_2.png',"Mate vaqueta","Mate vaqueta");
insert into productos (usuarioId,imgProd,producto,descripcionProd)values(4,'/images/products/torpedo_alpaca_2.png',"Stickers","Stickers");
insert into productos (usuarioId,imgProd,producto,descripcionProd)values(1,'/images/products/torpedo_alpaca_2.png',"Termo stanley","Termo stanley 1l");
insert into productos (usuarioId,imgProd,producto,descripcionProd)values(2,'/images/products/torpedo_alpaca_2.png',"Termo termolar","Termo termolar 1l");

create table comentarios(
id int unsigned primary key auto_increment,
postId int unsigned not null,
usuarioId INT UNSIGNED NOT NULL,
comentario varchar(255) not null,
createdAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
deletedAt timestamp null,
FOREIGN KEY(postId) references productos(id),
FOREIGN KEY(usuarioId) references usuarios(id)
);
insert into comentarios (postId, usuarioId, comentario) values(1, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (postId, usuarioId, comentario) values(1, 2, "buen termo rey");
insert into comentarios (postId, usuarioId, comentario) values(1, 3, "uffffffff");
insert into comentarios (postId, usuarioId, comentario) values(1, 4, "no lo soñeeeeeeeee");
insert into comentarios (postId, usuarioId, comentario) values(2, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (postId, usuarioId, comentario) values(2, 2, "buen termo rey");
insert into comentarios (postId, usuarioId, comentario) values(2, 3, "uffffffff");
insert into comentarios (postId, usuarioId, comentario) values(2, 4, "no lo soñeeeeeeeee");
insert into comentarios (postId, usuarioId, comentario) values(3, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (postId, usuarioId, comentario) values(3, 2, "buen termo rey");
insert into comentarios (postId, usuarioId, comentario) values(3, 3, "uffffffff");
insert into comentarios (postId, usuarioId, comentario) values(3, 4, "no lo soñeeeeeeeee");
insert into comentarios (postId, usuarioId, comentario) values(4, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (postId, usuarioId, comentario) values(4, 2, "buen termo rey");
insert into comentarios (postId, usuarioId, comentario) values(4, 3, "uffffffff");
insert into comentarios (postId, usuarioId, comentario) values(4, 4, "no lo soñeeeeeeeee");
insert into comentarios (postId, usuarioId, comentario) values(5, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (postId, usuarioId, comentario) values(5, 2, "buen termo rey");
insert into comentarios (postId, usuarioId, comentario) values(5, 3, "uffffffff");
insert into comentarios (postId, usuarioId, comentario) values(5, 4, "no lo soñeeeeeeeee");
insert into comentarios (postId, usuarioId, comentario) values(6, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (postId, usuarioId, comentario) values(6, 2, "buen termo rey");
insert into comentarios (postId, usuarioId, comentario) values(6, 3, "uffffffff");
insert into comentarios (postId, usuarioId, comentario) values(6, 4, "no lo soñeeeeeeeee");
insert into comentarios (postId, usuarioId, comentario) values(7, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (postId, usuarioId, comentario) values(7, 2, "buen termo rey");
insert into comentarios (postId, usuarioId, comentario) values(7, 3, "uffffffff");
insert into comentarios (postId, usuarioId, comentario) values(7, 4, "no lo soñeeeeeeeee");
insert into comentarios (postId, usuarioId, comentario) values(8, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (postId, usuarioId, comentario) values(8, 2, "buen termo rey");
insert into comentarios (postId, usuarioId, comentario) values(8, 3, "uffffffff");
insert into comentarios (postId, usuarioId, comentario) values(8, 4, "no lo soñeeeeeeeee");
insert into comentarios (postId, usuarioId, comentario) values(9, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (postId, usuarioId, comentario) values(9, 2, "buen termo rey");
insert into comentarios (postId, usuarioId, comentario) values(9, 3, "uffffffff");
insert into comentarios (postId, usuarioId, comentario) values(9, 4, "no lo soñeeeeeeeee");
insert into comentarios (postId, usuarioId, comentario) values(10, 1, "Lo bueno que esta ese mateeeeee");
insert into comentarios (postId, usuarioId, comentario) values(10, 2, "buen termo rey");
insert into comentarios (postId, usuarioId, comentario) values(10, 3, "uffffffff");
insert into comentarios (postId, usuarioId, comentario) values(10, 4, "no lo soñeeeeeeeee");