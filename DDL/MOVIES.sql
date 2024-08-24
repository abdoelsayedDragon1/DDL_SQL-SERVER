USE MOVIES;
GO
CREATE SCHEMA SCHEMA_ACTOR
GO
CREATE SCHEMA SCHEMA_MOVIES
GO

create table SCHEMA_ACTOR.actors
(
act_id int,
act_fname varchar(20) not null,
act_lname varchar(20) not null,
act_gender char(1) not null,
constraint actors_pk primary key(act_id)
);

create table SCHEMA_ACTOR.directors
(
dir_id int,
dir_fname varchar(20) not null,
dir_lname varchar(20) not null,
constraint directors_pk primary key(dir_id)
);

create table SCHEMA_ACTOR.movie
(
movie_id int,
movie_title int not null,
movie_year int not null,
movie_time int not null,
movie_dt_rel date,
movie_rel_country varchar(50) not null,
constraint movie_pk primary key(movie_id)
);

create table SCHEMA_MOVIES.movie_direction
(
dir_id int,
movie_id int,
constraint dir_FK foreign key(dir_id)
REFERENCES schema_actor.directors(dir_id) ON DELETE CASCADE ON UPDATE CASCADE,
constraint movie_FK foreign key(movie_id)
REFERENCES schema_actor.movie(movie_id)ON DELETE CASCADE ON UPDATE CASCADE
);

create table SCHEMA_ACTOR.castes
(
act_id int,
movie_id int,
role varchar(20)
constraint mov_FK foreign key(movie_id)
REFERENCES schema_actor.movie(movie_id) ON DELETE CASCADE ON UPDATE CASCADE,
constraint act_FK foreign key(act_id)
REFERENCES schema_actor.actors(act_id) ON DELETE CASCADE ON UPDATE CASCADE
);

create table SCHEMA_ACTOR.genres
(
gen_id int,
gen_title varchar(20) not null,
constraint genres_pk primary key(gen_id)
);

create table SCHEMA_MOVIES.movie_genres
(
movie_id int,
gen_id int,
constraint movies_FK foreign key(movie_id)
REFERENCES schema_actor.movie(movie_id) ON DELETE CASCADE ON UPDATE CASCADE,
constraint genres_FK foreign key(gen_id)
REFERENCES schema_actor.genres(gen_id) ON DELETE CASCADE ON UPDATE CASCADE
);

create table SCHEMA_ACTOR.reviewer
(
rev_id int,
rev_name varchar(20) not null,
constraint rev_pK primary key(rev_id)
);

create table SCHEMA_MOVIES.rating
(
movie_id int,
rev_id int,
rev_stars int not null,
num_o_ratings int not null,
constraint mo_FK foreign key(movie_id)
REFERENCES schema_actor.movie (movie_id) ON DELETE CASCADE ON UPDATE CASCADE,
constraint rev_FK foreign key(rev_id)
REFERENCES schema_actor.reviewer(rev_id)ON DELETE CASCADE ON UPDATE CASCADE
);

