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
insert into usuarios (id,email,contrasenia,fecha_de_nacimiento,dni,foto_de_perfil)values(default,"alecorti@gmial.com","33838383",'2003-09-02',44842994,"fotoperfil.png");
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
FOREIGN KEY(usuario_id) references usuarios(id)
);
insert into productos (id,usuario_id,producto,descripcionProd) values(default,53,"Mate camionero acero","Mate camionero acero");
insert into productos (id,usuario_id,producto,descripcionProd)values(default,85,"Mate imperial liso","Mate imperial liso");
insert into productos (id,usuario_id,producto,descripcionProd)values(default,1,"Mate torpedo cincelado","Mate torpedo cincelado");
insert into productos (id,usuario_id,producto,descripcionProd)values(default,824,"Mate calabaza cruda","Mate calabaza cruda");
insert into productos (id,usuario_id,producto,descripcionProd)values(default,8924,"Bombilla de oro","Bombilla de oro");
insert into productos (id,usuario_id,producto,descripcionProd)values(default,421,"Bombillon premium","Bombillon premium");
insert into productos (id,usuario_id,producto,descripcionProd)values(default,1313,"Mate vaqueta","Mate vaqueta");
insert into productos (id,usuario_id,producto,descripcionProd)values(default,4,"Stickers","Stickers");
insert into productos (id,usuario_id,producto,descripcionProd)values(default,99,"Termo stanley","Termo stanley 1l");
insert into productos (id,usuario_id,producto,descripcionProd)values(default,34,"Termo termolar","Termo termolar 1l");

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
insert into comentarios (id,post_id,usuario_id,comentario) values(default,"6","1","Lo bueno que esta ese mateeeeee");
insert into comentarios (id,post_id,usuario_id,comentario) values(default,"46","1","buen termo rey");
insert into comentarios (id,post_id,usuario_id,comentario) values(default,"87","1","uffffffff");
insert into comentarios (id,post_id,usuario_id,comentario) values(default,"1","1","no lo soñeeeeeeeee");