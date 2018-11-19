create table museums (
    museum_id integer PRIMARY KEY,
    name text
);

insert into museums(name) values('Centre Pompidou');
insert into museums(name) values('Espace Dali');
insert into museums(name) values('Moco Museum');
insert into museums(name) values('Museum Ludwig');
insert into museums(name) values('SF MOMA');

create table users (
    user_id integer PRIMARY KEY,
    name text
);

insert into users(name) values('Monica Tie');

create table artists (
    artist_id integer PRIMARY KEY,
    name text UNIQUE --there can be two artists...
);

insert into artists(name) values('Adolph Gottlieb');
insert into artists(name) values('Agnes Martin');
insert into artists(name) values('Alexander Calder');
insert into artists(name) values('Andy Warhol');
insert into artists(name) values('Anselm Kiefer');
insert into artists(name) values('Antony Gormley');
insert into artists(name) values('Banksy');
insert into artists(name) values('Barnett Newman');
insert into artists(name) values('Bernard Schultz');
insert into artists(name) values('Bernard Schultze');
insert into artists(name) values('Brice Marden');
insert into artists(name) values('Bruce Nauman');
insert into artists(name) values('Carl Andre');
insert into artists(name) values('Carle Andre');
insert into artists(name) values('Charlotte Potsenenske');
insert into artists(name) values('Christopher Wilmarth');
insert into artists(name) values('Chuck Close');
insert into artists(name) values('Claes Oldenburg and Coosje van Bruggen');
insert into artists(name) values('Clyfford E Still');
insert into artists(name) values('Cy Twombly');
insert into artists(name) values('Duane Hanson');
insert into artists(name) values('Duchamp');
insert into artists(name) values('Edvard Munch');
insert into artists(name) values('Edward Kienholz');
insert into artists(name) values('Ellsworth Kelly');
insert into artists(name) values('Endre Tot');
insert into artists(name) values('Enrico Castellani');
insert into artists(name) values('Ernst Wilhelm Nay');
insert into artists(name) values('Eva Hesse');
insert into artists(name) values('Fernand Leger');
insert into artists(name) values('Francis Picabia');
insert into artists(name) values('Frank Stella');
insert into artists(name) values('George Brecht');
insert into artists(name) values('Georges Yakoulov');
insert into artists(name) values('Gerhard Richter');
insert into artists(name) values('Gordon Matta-Clark');
insert into artists(name) values('Hans Hartung');
insert into artists(name) values('Icy & Sot');
insert into artists(name) values('Ida Tursic & Wilfried Mille');
insert into artists(name) values('Imi Knoebel');
insert into artists(name) values('Isamu Noguchi');
insert into artists(name) values('Jackson Pollock');
insert into artists(name) values('Jannis Kounellis');
insert into artists(name) values('Jay DeFeo');
insert into artists(name) values('Jean Gorin');
insert into artists(name) values('Jean-Michel Basquiat');
insert into artists(name) values('Jeff Koons');
insert into artists(name) values('Joan Mitchell');
insert into artists(name) values('Karl Otto Gotz');
insert into artists(name) values('Karol Hiller');
insert into artists(name) values('Katarzyna Kobro');
insert into artists(name) values('Katharina Fritsch');
insert into artists(name) values('Laszlo Moholy-Nagy');
insert into artists(name) values('Lee Krasner');
insert into artists(name) values('Lee Mingwei');
insert into artists(name) values('Lucio Fontana');
insert into artists(name) values('Marc Chagall');
insert into artists(name) values('Marcel Duchamp');
insert into artists(name) values('Meret Oppenheim');
insert into artists(name) values('Michel Majerus');
insert into artists(name) values('Mira Schendel');
insert into artists(name) values('Morris Louis');
insert into artists(name) values('On Kawara');
insert into artists(name) values('Pat Steir');
insert into artists(name) values('Picasso');
insert into artists(name) values('Richard Serra');
insert into artists(name) values('Robert Bechtle');
insert into artists(name) values('Robert Delaunay');
insert into artists(name) values('Robert Ryman');
insert into artists(name) values('Rothko');
insert into artists(name) values('Roy Lichtenstein');
insert into artists(name) values('Salvador Dali');
insert into artists(name) values('Sol LeWitt');
insert into artists(name) values('Tomas Saraceno');
insert into artists(name) values('Tony DeLap');
insert into artists(name) values('Walter De Maria');
insert into artists(name) values('Yayoi Kusama');
insert into artists(name) values('Yves Klein');

create table artwork (
    artwork_id integer PRIMARY KEY,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    name text,
    createdDate text
);

insert into artwork(artist_id, name, createdDate) values(65, 'La Pisseuse', '1965:04:16 00:00Z');
;

create table sightings (
    sighting_id integer PRIMARY KEY,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (museum_id) REFERENCES museums(museum_id),
    FOREIGN KEY (artwork_id) REFERENCES artwork(artwork_id),
    date text
);