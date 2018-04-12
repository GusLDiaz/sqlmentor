CREATE TABLE profile (
	-- this creates the attribute for the primary key
	-- not null means the attribute is required!
	profileID BINARY(16) NOT NULL,
	profileName VARCHAR(32) NOT NULL,
	profileEmail VARCHAR(128) NOT NULL,
	-- to make something optional, exclude the not null
	profileLocation VARCHAR (128) NOT NULL,
	profileDateJoined VARCHAR (128) NOT NULL,
	profileAge TINYINT,
	profileGender VARCHAR (32),
	profileAvail BIT(1) NOT NULL









	profilePhone VARCHAR(32),

	-- to make sure duplicate data cannot exist, create a unique index
	UNIQUE(profileName),
	UNIQUE(profileEmail),
	-- this officiates the primary key for the entity
	PRIMARY KEY(profileId)
);
CREATE TABLE eval(
	-- this is for yet another primary key...
	evalId BINARY(16) NOT NULL,
	-- this is for a foreign key
	evalFromId BINARY(16) NOT NULL,
	evalToId BINARY(16) NOT NULL,
	evalContent VARCHAR(140) NOT NULL,
	evalDate DATETIME(6) NOT NULL,

	-- this creates the actual foreign key relation
	FOREIGN KEY(evalFromId) REFERENCES profile(profileId),
	FOREIGN KEY(evalToId) REFERENCES profile(profileId),
	-- and finally create the primary key
	PRIMARY KEY(evalId)