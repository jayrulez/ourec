CREATE TABLE aspnet_Object
(
	Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	EntityName VARCHAR(50) NOT NULL
);

CREATE TABLE aspnet_UserConfirmation
(
	UserId UNIQUEIDENTIFIER PRIMARY KEY NOT NULL,  
	Code VARCHAR(32) NOT NULL, 
	CreatedAt DATETIME NOT NULL, 
	UpdatedAt DATETIME DEFAULT NULL
);

CREATE TABLE aspnet_UserPrivacy
(
	UserId UNIQUEIDENTIFIER NOT NULL, 
	[Key] VARCHAR(50) NOT NULL, 
	Value TEXT,
	CONSTRAINT PK_UserPrivacy PRIMARY KEY(UserId, [Key])
);

CREATE TABLE aspnet_Friendship
(
	Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
	UserId UNIQUEIDENTIFIER NOT NULL, 
	FriendId UNIQUEIDENTIFIER NOT NULL, 
	Status INT NOT NULL, 
	CreatedAt DATETIME NOT NULL, 
	UpdatedAt DATETIME DEFAULT NULL
);

CREATE TABLE aspnet_FriendGroup
(
	Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
	UserId UNIQUEIDENTIFIER NOT NULL, 
	Name VARCHAR(50) NOT NULL,
	CreatedAt DATETIME NOT NULL, 
	UpdatedAt DATETIME DEFAULT NULL,
	CONSTRAINT UK_FriendGroup UNIQUE (UserId, Name)
);



CREATE TABLE aspnet_FriendGroupFriendship
(
	FriendshipId int NOT NULL, 
	FriendGroupId int NOT NULL,
	CONSTRAINT PK_FriendGroupFriendship PRIMARY KEY (FriendshipId, FriendGroupId)
);

CREATE TABLE aspnet_Developer
(
	UserId UNIQUEIDENTIFIER PRIMARY KEY NOT NULL, 
	ApiKey VARCHAR(32) NOT NULL,
	CONSTRAINT UK_ApiKey UNIQUE(ApiKey)
);

CREATE TABLE aspnet_Album
(
	Id INT PRIMARY KEY NOT NULL, 
	Name VARCHAR(100) NOT NULL, 
	UserId UNIQUEIDENTIFIER NOT NULL, 
	Description TEXT, 
	CreatedAt DATETIME NOT NULL, 
	UpdatedAt DATETIME DEFAULT NULL,
	CONSTRAINT UK_Album UNIQUE(UserId, Name)
);

CREATE TABLE aspnet_Photo
(
	Id INT PRIMARY KEY NOT NULL, 
	UserId UNIQUEIDENTIFIER NOT NULL, 
	AlbumId int DEFAULT NULL, 
	FilePath VARCHAR(255) NOT NULL, 
	Caption VARCHAR(255) DEFAULT NULL, 
	CreatedAt DATETIME NOT NULL, 
	UpdatedAt DATETIME DEFAULT NULL,
	CONSTRAINT UK_FilePath UNIQUE(FilePath)
);

CREATE TABLE aspnet_Post
(
	Id INT PRIMARY KEY NOT NULL, 
	UserId UNIQUEIDENTIFIER NOT NULL, 
	PersonId UNIQUEIDENTIFIER NOT NULL,
	Content TEXT, 
	CreatedAt DATETIME NOT NULL, 
	UpdatedAt DATETIME DEFAULT NULL
);

CREATE TABLE aspnet_Comment
(
	Id INT PRIMARY KEY NOT NULL, 
	UserId UNIQUEIDENTIFIER NOT NULL,
	ParentId INT DEFAULT NULL, 
	ObjectId INT NOT NULL, 
	Content TEXT, 
	CreatedAt DATETIME NOT NULL, 
	UpdatedAt DATETIME DEFAULT NULL
);

CREATE TABLE aspnet_News
(
	Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
	Title VARCHAR(255) NOT NULL, 
	Content TEXT, 
	CreatedAt DATETIME NOT NULL, 
	UpdatedAt DATETIME DEFAULT NULL
);

ALTER TABLE aspnet_UserConfirmation
ADD CONSTRAINT FK_UserConfirmation_User FOREIGN KEY (UserId) REFERENCES aspnet_Users(UserId);

ALTER TABLE aspnet_UserPrivacy
ADD CONSTRAINT FK_UserPrivacy_User FOREIGN KEY (UserId) REFERENCES aspnet_Users(UserId);

ALTER TABLE aspnet_Friendship
ADD CONSTRAINT FK_friendship_User FOREIGN KEY (UserId) REFERENCES aspnet_Users(UserId);

ALTER TABLE aspnet_Friendship
ADD CONSTRAINT FK_Friendship_Friend FOREIGN KEY (FriendId) REFERENCES aspnet_Users(UserId);

ALTER TABLE aspnet_FriendGroup
ADD CONSTRAINT FK_FriendGroup_User FOREIGN KEY (UserId) REFERENCES aspnet_Users(UserId);

ALTER TABLE aspnet_FriendGroupFriendship
ADD CONSTRAINT FK_FriendGroupFriendship_Friendship FOREIGN KEY (FriendshipId) REFERENCES aspnet_Friendship(Id);

ALTER TABLE aspnet_FriendGroupFriendship
ADD CONSTRAINT FK_FriendGroupFriendship_FriendGroup FOREIGN KEY (FriendGroupId) REFERENCES aspnet_FriendGroup(Id);

ALTER TABLE aspnet_Developer
ADD CONSTRAINT FK_Developer_User FOREIGN KEY (UserId) REFERENCES aspnet_Users(UserId);

ALTER TABLE aspnet_Album
ADD CONSTRAINT FK_Album_User FOREIGN KEY (UserId) REFERENCES aspnet_Users(UserId);

ALTER TABLE aspnet_Album
ADD CONSTRAINT FK_Album_Id FOREIGN KEY (Id) REFERENCES aspnet_Object(Id);

ALTER TABLE aspnet_Photo
ADD CONSTRAINT FK_Photo_User FOREIGN KEY (UserId) REFERENCES aspnet_Users(UserId);

ALTER TABLE aspnet_Photo
ADD CONSTRAINT FK_Photo_Album FOREIGN KEY (AlbumId) REFERENCES aspnet_Album(Id);

ALTER TABLE aspnet_Photo
ADD CONSTRAINT FK_Photo_Id FOREIGN KEY (Id) REFERENCES aspnet_Object(Id);

ALTER TABLE aspnet_Post
ADD CONSTRAINT FK_Post_User FOREIGN KEY (UserId) REFERENCES aspnet_Users(UserId);

ALTER TABLE aspnet_Post
ADD CONSTRAINT FK_Post_person FOREIGN KEY (personId) REFERENCES aspnet_Users(UserId);

ALTER TABLE aspnet_Post
ADD CONSTRAINT FK_Post_Id FOREIGN KEY (Id) REFERENCES aspnet_Object(Id);

ALTER TABLE aspnet_Comment
ADD CONSTRAINT FK_Comment_User FOREIGN KEY (UserId) REFERENCES aspnet_Users(UserId);

ALTER TABLE aspnet_Comment
ADD CONSTRAINT FK_Comment_Comment FOREIGN KEY (parentId) REFERENCES aspnet_Comment(Id);

ALTER TABLE aspnet_Comment
ADD CONSTRAINT FK_Comment_Object FOREIGN KEY (ObjectId) REFERENCES aspnet_Object(Id);

ALTER TABLE aspnet_Comment
ADD CONSTRAINT FK_Comment_Id FOREIGN KEY (Id) REFERENCES aspnet_Object(Id);

CREATE TRIGGER trig_DeleteAlbumObject
ON aspnet_Album
AFTER DELETE
AS
BEGIN
	DECLARE @DeletedId INT
	DELETE FROM Object WHERE Id=@DeletedId
END

CREATE TRIGGER trig_DeletePhotoObject
ON aspnet_Photo
AFTER DELETE
AS
BEGIN
	DECLARE @DeletedId INT
	DELETE FROM Object WHERE Id=@DeletedId
END

CREATE TRIGGER trig_DeletePostObject
ON aspnet_Post
AFTER DELETE
AS
BEGIN
	DECLARE @DeletedId INT
	DELETE FROM Object WHERE Id=@DeletedId
END

CREATE TRIGGER trig_DeleteCommentObject
ON aspnet_Comment
AFTER DELETE
AS
BEGIN
	DECLARE @DeletedId INT
	DELETE FROM Object WHERE Id=@DeletedId
END
