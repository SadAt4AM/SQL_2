create table if not exists album (
id SERIAL PRIMARY key,
name varchar(50) UNIQUE not null,
year integer
);
create table if not exists soundtrack (
id SERIAL PRIMARY KEY,
name varchar(50) UNIQUE not null,
time integer,
album_id integer references album(id),
CONSTRAINT check_time_1 CHECK (time < '600')
);
create table if not exists singer(
id serial primary key,
nickname varchar(50) UNIQUE not null
);
create table if not exists singeralbum(
singerid integer references singer(id),
albumid integer references album(id),
constraint pk_1 primary key (singerid, albumid)
);
create table if not exists genre(
id serial primary key,
type varchar(50) unique not null
);
create table if not exists singergenre(
singerid integer references singer(id),
genreid integer references genre(id),
constraint pk_2 primary key (singerid, genreid)
);
create  table if not exists collection(
id serial primary key,
name varchar(50) UNIQUE not null,
year integer not null
);
create table if not exists soundtrackcollection(
soundtrackid integer references soundtrack(id),
collectionid integer references collection(id),
constraint pk_3 primary key (soundtrackid, collectionid)
);