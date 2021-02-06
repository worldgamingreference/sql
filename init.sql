CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE account(
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	name VARCHAR(50) NOT NULL,
	mail varchar(150) NOT NULL
);

CREATE TABLE community(
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	created_at TIMESTAMP DEFAULT now(),
	updated_at TIMESTAMP DEFAULT now(),
	owner UUID NOT NULL,
	name varchar(50) NOT NULL,
	description text
);

CREATE TABLE game(
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	name varchar(50) NOT NULL,
	description varchar(50) NOT NULL,
	image_url varchar(200) NOT NULL
);

CREATE TABLE server(
	id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
	created_at TIMESTAMP DEFAULT now(),
	updated_at TIMESTAMP DEFAULT now(),
	owner UUID NOT NULL,
	name varchar(50) NOT NULL,
	description text NOT NULL,
	image_url varchar(200) NOT NULL,
	hostname varchar(50) NOT NULL,
	discord_url varchar(50),
	teamspeak_url varchar(50)
);

CREATE TABLE community_server(
	community UUID NOT NULL,
	server UUID NOT NULL,
	created_at TIMESTAMP DEFAULT now(),
	PRIMARY KEY (community, server)
);

CREATE TABLE tag(
	id UUID PRIMARY KEY,
	name varchar(25)
);

CREATE TABLE server_tag(
	tag UUID NOT NULL,
	server UUID NOT NULL,
	PRIMARY KEY (tag, server)
);

CREATE TABLE vote(
	source varchar(50) NOT NULL,
	server UUID NOT NULL,
	username varchar(50),
	created_at TIMESTAMP NOT NULL DEFAULT now(),
	PRIMARY KEY (source, server, username, created_at)
);
