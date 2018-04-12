ALTER DATABASE mentorshipData CHARACTER SET utf8 COLLATE utf8_unicode_ci;

DROP TABLE IF EXISTS message;
DROP TABLE IF EXISTS eval;
DROP TABLE IF EXISTS profile;

CREATE TABLE profile (
	-- this creates the attribute for the primary key
	-- not null means the attribute is required!
	profileID BINARY(16) NOT NULL,
	profileName VARCHAR(32) NOT NULL,
	profileEmail VARCHAR(128) NOT NULL,
	-- to make something optional, exclude the not null
	profileLocation VARCHAR (128) NOT NULL,
	profileDateJoined VARCHAR (128) NOT NULL,
	profileAge TINYINT(3),
	profileGender VARCHAR (32),
	profileAvail BIT(1) NOT NULL,
	profilePhone VARCHAR(32),
	UNIQUE(profileName),
	UNIQUE(profileEmail),
	PRIMARY KEY(profileId)
);

CREATE TABLE eval (
	evalId BINARY(16) NOT NULL,
	evalFromId BINARY(16) NOT NULL,
	evalToId BINARY(16) NOT NULL,
	evalContent VARCHAR(140) NOT NULL,
	evalDate DATETIME(6) NOT NULL,
	INDEX(evalFromId),
	INDEX(evalToId),
	FOREIGN KEY(evalFromId) REFERENCES profile(profileId),
	FOREIGN KEY(evalToId) REFERENCES profile(profileId),
	PRIMARY KEY(evalId)
);

CREATE TABLE message (
	messageId BINARY(16) NOT NULL,
	messageFromId BINARY(16) NOT NULL,
	messageToId BINARY(16) NOT NULL,
	messageContent VARCHAR(280) NOT NULL,
	messageDate DATETIME(6) NOT NULL,
	INDEX(messageFromId),
	INDEX(messageToId),
	FOREIGN KEY(messageFromId) REFERENCES profile(profileId),
	FOREIGN KEY(messageToId) REFERENCES profile(profileId),
	PRIMARY KEY(messageId)
);
