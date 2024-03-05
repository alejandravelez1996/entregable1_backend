--USERS====================
create table users(
	id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50)
);
insert into users (first_name,last_name,email) values 
('ruben','vallejo','ruben@gmail.com'),
('arian','rueda','arian@gmail.com'),
('hans','posada','hansposada@gmail.com');

---------POSTS======================================
create table posts (
	id serial primary key,
	creator_id int references users(id),
	title varchar(50),
	text varchar(200)
);
insert into posts (creator_id,title,text) values
(1,'como llegar a guarne',
 'Hay 3 maneras de llegar desde Medellín hasta
 Guarne en autobús, taxi o en coche'),
(2,'como dormir mejor',
  'No coma una comida pesada a la noche, opte por
  una merienda liviana. Haga que su dormitorio sea
  cómodo, esté oscuro, tranquilo'),
 (3,'el rock','el rock es el conjunto de géneros variados de
  música popular, muy cercano al pop, según la época, que
  desciende del Rock n Roll original nacido en los Estados Unidos '),
 (2,'la risa','Estimula muchos órganos. La risa mejora la toma de aire con alto
 contenido de oxígeno, estimula el corazón, los pulmones y los músculos'),
 (3,'programar con ext js','Ext JS es una biblioteca de JavaScript para el desarrollo de aplicaciones 
 web interactivas usando tecnologías como AJAX, DHTML y DOM. Fue desarrollada por Sencha.');

delete from posts where id=6;

--------LIKES======================================
create table likes (
	id serial primary key,
	user_id int references users(id),
	post_id int references posts(id)
);
insert into likes (user_id,post_id) values
(1,3),(2,1),(3,4),(1,5),(3,2);

select * from likes;
select * from posts;
--Trae todos los posts y la información del usuario del campo creator_id
--Trae todos los posts, con la información de los usuarios que les dieron like.
--                                INNER JOINS 
select posts.creator_id,posts.title, posts.text,users.first_name, users.last_name from posts
inner join users on
posts.creator_id=users.id;

-- posts - likes- info.users =============
select * from posts inner join likes 
on posts.id = likes.post_id inner join 
users on likes.user_id=users.id;







