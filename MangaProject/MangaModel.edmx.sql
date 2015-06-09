
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 11/19/2013 18:40:02
-- Generated from EDMX file: c:\users\rreyes\documents\visual studio 2012\Projects\MangaProject\MangaProject\MangaModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ProjectManga];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_AuthorManga_Author]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AuthorManga] DROP CONSTRAINT [FK_AuthorManga_Author];
GO
IF OBJECT_ID(N'[dbo].[FK_AuthorManga_Manga]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AuthorManga] DROP CONSTRAINT [FK_AuthorManga_Manga];
GO
IF OBJECT_ID(N'[dbo].[FK_PublisherManga_Publisher]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PublisherManga] DROP CONSTRAINT [FK_PublisherManga_Publisher];
GO
IF OBJECT_ID(N'[dbo].[FK_PublisherManga_Manga]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PublisherManga] DROP CONSTRAINT [FK_PublisherManga_Manga];
GO
IF OBJECT_ID(N'[dbo].[FK_AuthorCountry]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Authors] DROP CONSTRAINT [FK_AuthorCountry];
GO
IF OBJECT_ID(N'[dbo].[FK_MangaLanguage]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Languages] DROP CONSTRAINT [FK_MangaLanguage];
GO
IF OBJECT_ID(N'[dbo].[FK_PublisherCountry]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Publishers] DROP CONSTRAINT [FK_PublisherCountry];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Mangas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Mangas];
GO
IF OBJECT_ID(N'[dbo].[Authors]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Authors];
GO
IF OBJECT_ID(N'[dbo].[Countries]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Countries];
GO
IF OBJECT_ID(N'[dbo].[Publishers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Publishers];
GO
IF OBJECT_ID(N'[dbo].[Languages]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Languages];
GO
IF OBJECT_ID(N'[dbo].[AuthorManga]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AuthorManga];
GO
IF OBJECT_ID(N'[dbo].[PublisherManga]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PublisherManga];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Mangas'
CREATE TABLE [dbo].[Mangas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [PublishDate] datetime  NOT NULL,
    [Image] nvarchar(max)  NOT NULL,
    [Volume] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Authors'
CREATE TABLE [dbo].[Authors] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [DateOfBirth] datetime  NOT NULL,
    [Image] nvarchar(max)  NOT NULL,
    [Country_Id] int  NOT NULL
);
GO

-- Creating table 'Countries'
CREATE TABLE [dbo].[Countries] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Publishers'
CREATE TABLE [dbo].[Publishers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Image] nvarchar(max)  NOT NULL,
    [Address1] nvarchar(max)  NOT NULL,
    [Address2] nvarchar(max)  NOT NULL,
    [Address3] nvarchar(max)  NOT NULL,
    [Country_Id] int  NOT NULL
);
GO

-- Creating table 'Languages'
CREATE TABLE [dbo].[Languages] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'AuthorManga'
CREATE TABLE [dbo].[AuthorManga] (
    [Authors_Id] int  NOT NULL,
    [Mangas_Id] int  NOT NULL
);
GO

-- Creating table 'PublisherManga'
CREATE TABLE [dbo].[PublisherManga] (
    [Publishers_Id] int  NOT NULL,
    [Mangas_Id] int  NOT NULL
);
GO

-- Creating table 'MangaLanguage'
CREATE TABLE [dbo].[MangaLanguage] (
    [Mangas_Id] int  NOT NULL,
    [Languages_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Mangas'
ALTER TABLE [dbo].[Mangas]
ADD CONSTRAINT [PK_Mangas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Authors'
ALTER TABLE [dbo].[Authors]
ADD CONSTRAINT [PK_Authors]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Countries'
ALTER TABLE [dbo].[Countries]
ADD CONSTRAINT [PK_Countries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Publishers'
ALTER TABLE [dbo].[Publishers]
ADD CONSTRAINT [PK_Publishers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Languages'
ALTER TABLE [dbo].[Languages]
ADD CONSTRAINT [PK_Languages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Authors_Id], [Mangas_Id] in table 'AuthorManga'
ALTER TABLE [dbo].[AuthorManga]
ADD CONSTRAINT [PK_AuthorManga]
    PRIMARY KEY NONCLUSTERED ([Authors_Id], [Mangas_Id] ASC);
GO

-- Creating primary key on [Publishers_Id], [Mangas_Id] in table 'PublisherManga'
ALTER TABLE [dbo].[PublisherManga]
ADD CONSTRAINT [PK_PublisherManga]
    PRIMARY KEY NONCLUSTERED ([Publishers_Id], [Mangas_Id] ASC);
GO

-- Creating primary key on [Mangas_Id], [Languages_Id] in table 'MangaLanguage'
ALTER TABLE [dbo].[MangaLanguage]
ADD CONSTRAINT [PK_MangaLanguage]
    PRIMARY KEY NONCLUSTERED ([Mangas_Id], [Languages_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Authors_Id] in table 'AuthorManga'
ALTER TABLE [dbo].[AuthorManga]
ADD CONSTRAINT [FK_AuthorManga_Author]
    FOREIGN KEY ([Authors_Id])
    REFERENCES [dbo].[Authors]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Mangas_Id] in table 'AuthorManga'
ALTER TABLE [dbo].[AuthorManga]
ADD CONSTRAINT [FK_AuthorManga_Manga]
    FOREIGN KEY ([Mangas_Id])
    REFERENCES [dbo].[Mangas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_AuthorManga_Manga'
CREATE INDEX [IX_FK_AuthorManga_Manga]
ON [dbo].[AuthorManga]
    ([Mangas_Id]);
GO

-- Creating foreign key on [Publishers_Id] in table 'PublisherManga'
ALTER TABLE [dbo].[PublisherManga]
ADD CONSTRAINT [FK_PublisherManga_Publisher]
    FOREIGN KEY ([Publishers_Id])
    REFERENCES [dbo].[Publishers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Mangas_Id] in table 'PublisherManga'
ALTER TABLE [dbo].[PublisherManga]
ADD CONSTRAINT [FK_PublisherManga_Manga]
    FOREIGN KEY ([Mangas_Id])
    REFERENCES [dbo].[Mangas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PublisherManga_Manga'
CREATE INDEX [IX_FK_PublisherManga_Manga]
ON [dbo].[PublisherManga]
    ([Mangas_Id]);
GO

-- Creating foreign key on [Country_Id] in table 'Authors'
ALTER TABLE [dbo].[Authors]
ADD CONSTRAINT [FK_AuthorCountry]
    FOREIGN KEY ([Country_Id])
    REFERENCES [dbo].[Countries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_AuthorCountry'
CREATE INDEX [IX_FK_AuthorCountry]
ON [dbo].[Authors]
    ([Country_Id]);
GO

-- Creating foreign key on [Country_Id] in table 'Publishers'
ALTER TABLE [dbo].[Publishers]
ADD CONSTRAINT [FK_PublisherCountry]
    FOREIGN KEY ([Country_Id])
    REFERENCES [dbo].[Countries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PublisherCountry'
CREATE INDEX [IX_FK_PublisherCountry]
ON [dbo].[Publishers]
    ([Country_Id]);
GO

-- Creating foreign key on [Mangas_Id] in table 'MangaLanguage'
ALTER TABLE [dbo].[MangaLanguage]
ADD CONSTRAINT [FK_MangaLanguage_Manga]
    FOREIGN KEY ([Mangas_Id])
    REFERENCES [dbo].[Mangas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Languages_Id] in table 'MangaLanguage'
ALTER TABLE [dbo].[MangaLanguage]
ADD CONSTRAINT [FK_MangaLanguage_Language]
    FOREIGN KEY ([Languages_Id])
    REFERENCES [dbo].[Languages]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_MangaLanguage_Language'
CREATE INDEX [IX_FK_MangaLanguage_Language]
ON [dbo].[MangaLanguage]
    ([Languages_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------