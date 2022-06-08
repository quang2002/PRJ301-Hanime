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
	[Password]		VARCHAR (32) NOT NULL,
	[IsAdmin]		BIT NOT NULL,			

	PRIMARY KEY		([ID]),
	UNIQUE			([Username]),
);

CREATE TABLE [Users] (
	[ID]			BIGINT,
	[Email]			NVARCHAR (320) NOT NULL,
	[Address]		NVARCHAR (MAX),
	[DOB]			DATE,
	[Gender]		BIT NOT NULL,
	[Phone]			VARCHAR (12),
	[Avatar]		VARBINARY(MAX),

	PRIMARY KEY		([ID]),
	FOREIGN KEY		([ID]) REFERENCES [Auth]([ID]) ON DELETE CASCADE,
	CHECK			([Phone] LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR [Phone] LIKE '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
);


-- UsersFilm
-- CategoryFilm

-- Auth(ID, Username, Password, Roles)
-- Users(ID, Email, Address, )
-- Category(ID, Name, Description)
-- Film(ID, Name, Description, ThumnailURI, VideoURI, ReleaseDate, Length)
-- View(ID, FilmID, UserID, Date)
-- Comment(ID, FilmID, UserID, Content)
-- Rate(ID, FilmID, UserID, Rate)


----------------------------------------------
--                PROCEDURE                 --
----------------------------------------------

GO
CREATE PROC [sp_create_account]
	@username		VARCHAR (32),
	@password		VARCHAR (32),
	@email			NVARCHAR (320),
	@gender			BIT,
	@isadmin		BIT
AS
BEGIN
	-- Create Auth
	INSERT INTO [Auth]([Username], [Password], [IsAdmin]) VALUES (@username, @password, @isadmin);

	-- Create User
	INSERT INTO [Users]([ID], [Email], [Gender]) 
	VALUES (
		(SELECT [ID] FROM [Auth] WHERE [Username] = @username),
		@email,
		@gender
	);
END;
