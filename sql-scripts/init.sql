----------------------------------------------
--             CREATE DATABASE              --
----------------------------------------------

USE [master];

IF DB_ID('Hanime') IS NOT NULL 
BEGIN
	ALTER DATABASE [Hanime] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
	DROP DATABASE [Hanime]
END

CREATE DATABASE [Hanime]
GO
USE [Hanime];

----------------------------------------------
--              CREATE TABLES               --
----------------------------------------------

CREATE TABLE [Auth] (
	[ID]			BIGINT IDENTITY (1, 1),
	[Username]		VARCHAR (32) NOT NULL,
	[Password]		VARCHAR (64) NOT NULL,
	[IsAdmin]		BIT NOT NULL,			

	PRIMARY KEY		([ID]),
	UNIQUE			([Username]),
);

CREATE TABLE [User] (
	[ID]			BIGINT,
	[AvatarURL]		VARCHAR  (MAX),
	[Fullname]		NVARCHAR (MAX),
	[Email]			NVARCHAR (MAX) NOT NULL,
	[Address]		NVARCHAR (MAX),
	[DOB]			DATE,
	[Gender]		BIT NOT NULL,
	[Phone]			VARCHAR (12),

	[NotifyVideoUpload]			BIT DEFAULT 1,
	[NotifyFriendRequest]		BIT DEFAULT 1,
	[NotifyNews]				BIT DEFAULT 0,
	[NotifyUpdates]				BIT DEFAULT 0,

	PRIMARY KEY		([ID]),
	FOREIGN KEY		([ID]) REFERENCES [Auth]([ID]) ON DELETE CASCADE,
);

CREATE TABLE [Category] (
	[ID]			BIGINT IDENTITY (1, 1),
	[Name]			NVARCHAR (64),
	[Description]	NVARCHAR (MAX),

	PRIMARY KEY		([ID]),
	UNIQUE			([Name]),
);

CREATE TABLE [Film] (
	[ID]			BIGINT IDENTITY (1, 1),
	[Name]			NVARCHAR (MAX),
	[Description]	NVARCHAR (MAX),
	[ThumbnailURL]	VARCHAR  (MAX),

	PRIMARY KEY		([ID]),
);

CREATE TABLE [Video] (
	[ID]			BIGINT IDENTITY (1, 1),
	[Name]			NVARCHAR (MAX),
	[ThumbnailURL]	VARCHAR  (MAX),
	[VideoURL]		VARCHAR  (MAX),
	[ReleaseDate]	DATE,
	[Length]		INT,
	[View]			BIGINT,

	[FilmID]		BIGINT,

	PRIMARY KEY		([ID]),
	FOREIGN KEY		([FilmID]) REFERENCES [Film]([ID]) ON DELETE CASCADE,
	CHECK			([Length] >= 0),
	CHECK			([View] >= 0),
);

CREATE TABLE [FilmCategory] (
	[FilmID]		BIGINT,
	[CategoryID]	BIGINT,

	PRIMARY	KEY		([FilmID], [CategoryID]),
	FOREIGN KEY		([FilmID]) REFERENCES [Film]([ID]) ON DELETE CASCADE,
	FOREIGN KEY		([CategoryID]) REFERENCES [Category]([ID]) ON DELETE CASCADE,
);

CREATE TABLE [Follow] (
	[FilmID]		BIGINT,
	[UserID]		BIGINT,

	PRIMARY KEY		([FilmID], [UserID]),
	FOREIGN KEY		([FilmID]) REFERENCES [Film]([ID]) ON DELETE CASCADE,
	FOREIGN KEY		([UserID]) REFERENCES [User]([ID]) ON DELETE CASCADE,
);

CREATE TABLE [Comment] (
	[ID]			BIGINT IDENTITY (1, 1),
	[VideoID]		BIGINT NOT NULL,
	[UserID]		BIGINT,
	[Content]		NVARCHAR (MAX) NOT NULL,

	PRIMARY KEY		CLUSTERED ([ID] DESC),
	FOREIGN KEY		([VideoID]) REFERENCES [Video]([ID]) ON DELETE CASCADE,
	FOREIGN KEY		([UserID]) REFERENCES [User]([ID]) ON DELETE SET NULL,
);


CREATE TABLE [Rate] (
	[ID]			BIGINT IDENTITY (1, 1),
	[VideoID]		BIGINT NOT NULL,
	[UserID]		BIGINT,
	[Rate]			INT DEFAULT 0,

	PRIMARY KEY		([ID]),
	FOREIGN KEY		([VideoID]) REFERENCES [Video]([ID]) ON DELETE CASCADE,
	FOREIGN KEY		([UserID]) REFERENCES [User]([ID]) ON DELETE SET NULL,

	CHECK ([Rate] BETWEEN 0 AND 5),
);

----------------------------------------------
--                PROCEDURE                 --
----------------------------------------------

GO
CREATE PROC [sp_create_account]
	@username		VARCHAR (32),
	@password		VARCHAR (64),
	@email			NVARCHAR (320),
	@gender			BIT,
	@isadmin		BIT
AS
BEGIN
	-- Create Auth
	INSERT INTO [Auth]([Username], [Password], [IsAdmin]) VALUES (@username, @password, @isadmin);

	-- Create User
	INSERT INTO [User]([ID], [Email], [Gender], [AvatarURL]) 
	VALUES (
		(SELECT [ID] FROM [Auth] WHERE [Username] = @username),
		@email,
		@gender,
		'http://res.cloudinary.com/quang2002/image/upload/run6usa9xlfdzvwgywaw'
	);
END;
