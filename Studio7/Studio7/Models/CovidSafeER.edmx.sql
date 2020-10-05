
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/03/2020 18:08:00
-- Generated from EDMX file: C:\Users\gagan\source\repos\Studio7\Studio7\Models\CovidSafeER.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [aspnet-Studio7-20200923060700];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AdministratorAddCovidCentre]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CovidCentres] DROP CONSTRAINT [FK_AdministratorAddCovidCentre];
GO
IF OBJECT_ID(N'[dbo].[FK_PatientRating]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ratings] DROP CONSTRAINT [FK_PatientRating];
GO
IF OBJECT_ID(N'[dbo].[FK_DoctorRating]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ratings] DROP CONSTRAINT [FK_DoctorRating];
GO
IF OBJECT_ID(N'[dbo].[FK_PatientEmail]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Emails] DROP CONSTRAINT [FK_PatientEmail];
GO
IF OBJECT_ID(N'[dbo].[FK_DoctorEmail]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Emails] DROP CONSTRAINT [FK_DoctorEmail];
GO
IF OBJECT_ID(N'[dbo].[FK_DoctorPatient]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users_Patient] DROP CONSTRAINT [FK_DoctorPatient];
GO
IF OBJECT_ID(N'[dbo].[FK_DoctorBroadcast]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Broadcasts] DROP CONSTRAINT [FK_DoctorBroadcast];
GO
IF OBJECT_ID(N'[dbo].[FK_Administrator_inherits_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users_Administrator] DROP CONSTRAINT [FK_Administrator_inherits_User];
GO
IF OBJECT_ID(N'[dbo].[FK_Patient_inherits_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users_Patient] DROP CONSTRAINT [FK_Patient_inherits_User];
GO
IF OBJECT_ID(N'[dbo].[FK_Doctor_inherits_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users_Doctor] DROP CONSTRAINT [FK_Doctor_inherits_User];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[CovidCentres]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CovidCentres];
GO
IF OBJECT_ID(N'[dbo].[Ratings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ratings];
GO
IF OBJECT_ID(N'[dbo].[QuestionBanks]', 'U') IS NOT NULL
    DROP TABLE [dbo].[QuestionBanks];
GO
IF OBJECT_ID(N'[dbo].[Emails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Emails];
GO
IF OBJECT_ID(N'[dbo].[Broadcasts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Broadcasts];
GO
IF OBJECT_ID(N'[dbo].[Responses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Responses];
GO
IF OBJECT_ID(N'[dbo].[Users_Administrator]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users_Administrator];
GO
IF OBJECT_ID(N'[dbo].[Users_Patient]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users_Patient];
GO
IF OBJECT_ID(N'[dbo].[Users_Doctor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users_Doctor];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [userId] int IDENTITY(1,1) NOT NULL,
    [userLoginId] nvarchar(max)  NOT NULL,
    [userLevel] nvarchar(max)  NOT NULL,
    [userPassword] nvarchar(max)  NOT NULL,
    [userName] nvarchar(max)  NOT NULL,
    [age] int  NOT NULL,
    [DOB] datetime  NULL,
    [emaild] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'CovidCentres'
CREATE TABLE [dbo].[CovidCentres] (
    [centreId] int IDENTITY(1,1) NOT NULL,
    [centreName] nvarchar(max)  NOT NULL,
    [centreLocation] geometry  NOT NULL,
    [Administrator_userId] int  NOT NULL
);
GO

-- Creating table 'Ratings'
CREATE TABLE [dbo].[Ratings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Patient_userId] int  NOT NULL,
    [Doctor_userId] int  NOT NULL
);
GO

-- Creating table 'QuestionBanks'
CREATE TABLE [dbo].[QuestionBanks] (
    [questionId] int IDENTITY(1,1) NOT NULL,
    [Question] nvarchar(max)  NOT NULL,
    [Option1] nvarchar(max)  NOT NULL,
    [Option2] nvarchar(max)  NOT NULL,
    [Option3] nvarchar(max)  NOT NULL,
    [Option4] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Emails'
CREATE TABLE [dbo].[Emails] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Patient_userId] int  NOT NULL,
    [Doctor_userId] int  NOT NULL,
    [Body] nvarchar(max)  NOT NULL,
    [Header] nvarchar(max)  NOT NULL,
    [emailDate] datetime  NOT NULL
);
GO

-- Creating table 'Broadcasts'
CREATE TABLE [dbo].[Broadcasts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Doctor_userId] int  NOT NULL
);
GO

-- Creating table 'Responses'
CREATE TABLE [dbo].[Responses] (
    [responceId] int IDENTITY(1,1) NOT NULL
);
GO

-- Creating table 'Users_Administrator'
CREATE TABLE [dbo].[Users_Administrator] (
    [userId] int  NOT NULL
);
GO

-- Creating table 'Users_Patient'
CREATE TABLE [dbo].[Users_Patient] (
    [Doctor_userId] int  NOT NULL,
    [userId] int  NOT NULL
);
GO

-- Creating table 'Users_Doctor'
CREATE TABLE [dbo].[Users_Doctor] (
    [userId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [userId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([userId] ASC);
GO

-- Creating primary key on [centreId] in table 'CovidCentres'
ALTER TABLE [dbo].[CovidCentres]
ADD CONSTRAINT [PK_CovidCentres]
    PRIMARY KEY CLUSTERED ([centreId] ASC);
GO

-- Creating primary key on [Id] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [PK_Ratings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [questionId] in table 'QuestionBanks'
ALTER TABLE [dbo].[QuestionBanks]
ADD CONSTRAINT [PK_QuestionBanks]
    PRIMARY KEY CLUSTERED ([questionId] ASC);
GO

-- Creating primary key on [Id] in table 'Emails'
ALTER TABLE [dbo].[Emails]
ADD CONSTRAINT [PK_Emails]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Broadcasts'
ALTER TABLE [dbo].[Broadcasts]
ADD CONSTRAINT [PK_Broadcasts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [responceId] in table 'Responses'
ALTER TABLE [dbo].[Responses]
ADD CONSTRAINT [PK_Responses]
    PRIMARY KEY CLUSTERED ([responceId] ASC);
GO

-- Creating primary key on [userId] in table 'Users_Administrator'
ALTER TABLE [dbo].[Users_Administrator]
ADD CONSTRAINT [PK_Users_Administrator]
    PRIMARY KEY CLUSTERED ([userId] ASC);
GO

-- Creating primary key on [userId] in table 'Users_Patient'
ALTER TABLE [dbo].[Users_Patient]
ADD CONSTRAINT [PK_Users_Patient]
    PRIMARY KEY CLUSTERED ([userId] ASC);
GO

-- Creating primary key on [userId] in table 'Users_Doctor'
ALTER TABLE [dbo].[Users_Doctor]
ADD CONSTRAINT [PK_Users_Doctor]
    PRIMARY KEY CLUSTERED ([userId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Administrator_userId] in table 'CovidCentres'
ALTER TABLE [dbo].[CovidCentres]
ADD CONSTRAINT [FK_AdministratorAddCovidCentre]
    FOREIGN KEY ([Administrator_userId])
    REFERENCES [dbo].[Users_Administrator]
        ([userId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdministratorAddCovidCentre'
CREATE INDEX [IX_FK_AdministratorAddCovidCentre]
ON [dbo].[CovidCentres]
    ([Administrator_userId]);
GO

-- Creating foreign key on [Patient_userId] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [FK_PatientRating]
    FOREIGN KEY ([Patient_userId])
    REFERENCES [dbo].[Users_Patient]
        ([userId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PatientRating'
CREATE INDEX [IX_FK_PatientRating]
ON [dbo].[Ratings]
    ([Patient_userId]);
GO

-- Creating foreign key on [Doctor_userId] in table 'Ratings'
ALTER TABLE [dbo].[Ratings]
ADD CONSTRAINT [FK_DoctorRating]
    FOREIGN KEY ([Doctor_userId])
    REFERENCES [dbo].[Users_Doctor]
        ([userId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DoctorRating'
CREATE INDEX [IX_FK_DoctorRating]
ON [dbo].[Ratings]
    ([Doctor_userId]);
GO

-- Creating foreign key on [Patient_userId] in table 'Emails'
ALTER TABLE [dbo].[Emails]
ADD CONSTRAINT [FK_PatientEmail]
    FOREIGN KEY ([Patient_userId])
    REFERENCES [dbo].[Users_Patient]
        ([userId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PatientEmail'
CREATE INDEX [IX_FK_PatientEmail]
ON [dbo].[Emails]
    ([Patient_userId]);
GO

-- Creating foreign key on [Doctor_userId] in table 'Emails'
ALTER TABLE [dbo].[Emails]
ADD CONSTRAINT [FK_DoctorEmail]
    FOREIGN KEY ([Doctor_userId])
    REFERENCES [dbo].[Users_Doctor]
        ([userId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DoctorEmail'
CREATE INDEX [IX_FK_DoctorEmail]
ON [dbo].[Emails]
    ([Doctor_userId]);
GO

-- Creating foreign key on [Doctor_userId] in table 'Users_Patient'
ALTER TABLE [dbo].[Users_Patient]
ADD CONSTRAINT [FK_DoctorPatient]
    FOREIGN KEY ([Doctor_userId])
    REFERENCES [dbo].[Users_Doctor]
        ([userId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DoctorPatient'
CREATE INDEX [IX_FK_DoctorPatient]
ON [dbo].[Users_Patient]
    ([Doctor_userId]);
GO

-- Creating foreign key on [Doctor_userId] in table 'Broadcasts'
ALTER TABLE [dbo].[Broadcasts]
ADD CONSTRAINT [FK_DoctorBroadcast]
    FOREIGN KEY ([Doctor_userId])
    REFERENCES [dbo].[Users_Doctor]
        ([userId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DoctorBroadcast'
CREATE INDEX [IX_FK_DoctorBroadcast]
ON [dbo].[Broadcasts]
    ([Doctor_userId]);
GO

-- Creating foreign key on [userId] in table 'Users_Administrator'
ALTER TABLE [dbo].[Users_Administrator]
ADD CONSTRAINT [FK_Administrator_inherits_User]
    FOREIGN KEY ([userId])
    REFERENCES [dbo].[Users]
        ([userId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [userId] in table 'Users_Patient'
ALTER TABLE [dbo].[Users_Patient]
ADD CONSTRAINT [FK_Patient_inherits_User]
    FOREIGN KEY ([userId])
    REFERENCES [dbo].[Users]
        ([userId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [userId] in table 'Users_Doctor'
ALTER TABLE [dbo].[Users_Doctor]
ADD CONSTRAINT [FK_Doctor_inherits_User]
    FOREIGN KEY ([userId])
    REFERENCES [dbo].[Users]
        ([userId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------