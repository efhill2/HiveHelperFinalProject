USE [master]
GO
/****** Object:  Database [HiveHelper]    Script Date: 10/29/2020 12:04:03 PM ******/
CREATE DATABASE [HiveHelper]
GO
ALTER DATABASE [HiveHelper] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HiveHelper].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HiveHelper] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HiveHelper] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HiveHelper] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HiveHelper] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HiveHelper] SET ARITHABORT OFF 
GO
ALTER DATABASE [HiveHelper] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HiveHelper] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HiveHelper] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HiveHelper] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HiveHelper] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HiveHelper] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HiveHelper] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HiveHelper] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HiveHelper] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HiveHelper] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HiveHelper] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HiveHelper] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HiveHelper] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HiveHelper] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HiveHelper] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HiveHelper] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HiveHelper] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HiveHelper] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HiveHelper] SET  MULTI_USER 
GO
ALTER DATABASE [HiveHelper] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HiveHelper] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HiveHelper] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HiveHelper] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HiveHelper] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HiveHelper', N'ON'
GO
ALTER DATABASE [HiveHelper] SET QUERY_STORE = OFF
GO
USE [HiveHelper]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hive_id] [int] NOT NULL,
	[completed_by_id] [int] NULL,
	[entered_by_id] [int] NOT NULL,
	[primary_action_id] [int] NOT NULL,
	[secondary_action_id] [int] NOT NULL,
	[tertiary_action_id] [int] NULL,
	[completed] [bit] NOT NULL,
	[entry_date] [datetime] NOT NULL,
	[scheduled_date] [datetime] NULL,
	[completed_date] [datetime] NULL,
	[comments] [text] NULL,
 CONSTRAINT [PK_ActionDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hive]    Script Date: 10/29/2020 12:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hive](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[location_id] [int] NOT NULL,
	[inspection_interval] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Hive] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Location]    Script Date: 10/29/2020 12:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Location](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 10/29/2020 12:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[access_level] [int] NOT NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrimaryAction]    Script Date: 10/29/2020 12:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrimaryAction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_PrimaryAction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SecondaryAction]    Script Date: 10/29/2020 12:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecondaryAction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[primary_action_id] [int] NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_SecondaryAction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TertiaryAction]    Script Date: 10/29/2020 12:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TertiaryAction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[secondary_action_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[active] [bit] NOT NULL,
 CONSTRAINT [PK_TertiaryAction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/29/2020 12:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[access_level] [int] NOT NULL,
	[password] [nvarchar](max) NULL,
	[username] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PrimaryAction] ADD  CONSTRAINT [DF_PrimaryAction_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[SecondaryAction] ADD  CONSTRAINT [DF_SecondaryAction_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[TertiaryAction] ADD  CONSTRAINT [DF_TertiaryAction_active]  DEFAULT ((1)) FOR [active]
GO
ALTER TABLE [dbo].[ActionDetail]  WITH CHECK ADD  CONSTRAINT [FK_ActionDetail_Hive] FOREIGN KEY([hive_id])
REFERENCES [dbo].[Hive] ([id])
GO
ALTER TABLE [dbo].[ActionDetail] CHECK CONSTRAINT [FK_ActionDetail_Hive]
GO
ALTER TABLE [dbo].[ActionDetail]  WITH CHECK ADD  CONSTRAINT [FK_ActionDetail_PrimaryAction] FOREIGN KEY([primary_action_id])
REFERENCES [dbo].[PrimaryAction] ([id])
GO
ALTER TABLE [dbo].[ActionDetail] CHECK CONSTRAINT [FK_ActionDetail_PrimaryAction]
GO
ALTER TABLE [dbo].[ActionDetail]  WITH CHECK ADD  CONSTRAINT [FK_ActionDetail_SecondaryAction] FOREIGN KEY([secondary_action_id])
REFERENCES [dbo].[SecondaryAction] ([id])
GO
ALTER TABLE [dbo].[ActionDetail] CHECK CONSTRAINT [FK_ActionDetail_SecondaryAction]
GO
ALTER TABLE [dbo].[ActionDetail]  WITH CHECK ADD  CONSTRAINT [FK_ActionDetail_TertiaryAction] FOREIGN KEY([tertiary_action_id])
REFERENCES [dbo].[TertiaryAction] ([id])
GO
ALTER TABLE [dbo].[ActionDetail] CHECK CONSTRAINT [FK_ActionDetail_TertiaryAction]
GO
ALTER TABLE [dbo].[ActionDetail]  WITH CHECK ADD  CONSTRAINT [FK_ActionDetail_User] FOREIGN KEY([entered_by_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[ActionDetail] CHECK CONSTRAINT [FK_ActionDetail_User]
GO
ALTER TABLE [dbo].[ActionDetail]  WITH CHECK ADD  CONSTRAINT [FK_ActionDetail_User1] FOREIGN KEY([completed_by_id])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[ActionDetail] CHECK CONSTRAINT [FK_ActionDetail_User1]
GO
ALTER TABLE [dbo].[Hive]  WITH CHECK ADD  CONSTRAINT [FK_Hive_Location] FOREIGN KEY([location_id])
REFERENCES [dbo].[Location] ([id])
GO
ALTER TABLE [dbo].[Hive] CHECK CONSTRAINT [FK_Hive_Location]
GO
ALTER TABLE [dbo].[SecondaryAction]  WITH CHECK ADD  CONSTRAINT [FK_SecondaryAction_PrimaryAction] FOREIGN KEY([primary_action_id])
REFERENCES [dbo].[PrimaryAction] ([id])
GO
ALTER TABLE [dbo].[SecondaryAction] CHECK CONSTRAINT [FK_SecondaryAction_PrimaryAction]
GO
ALTER TABLE [dbo].[TertiaryAction]  WITH CHECK ADD  CONSTRAINT [FK_TertiaryAction_SecondaryAction] FOREIGN KEY([secondary_action_id])
REFERENCES [dbo].[SecondaryAction] ([id])
GO
ALTER TABLE [dbo].[TertiaryAction] CHECK CONSTRAINT [FK_TertiaryAction_SecondaryAction]
GO
/****** Object:  StoredProcedure [dbo].[AddHive]    Script Date: 10/29/2020 12:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddHive]
@location_id int, @inspection_interval int, @name nvarchar(50)
AS
INSERT INTO [Hive] (location_id, inspection_interval, name)
VALUES
(@location_id, @inspection_interval, @name)
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 10/29/2020 12:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddUser]
	@firstname nvarchar(50), @lastname nvarchar(50), @username nvarchar(50), @accesslevel int
AS
	INSERT INTO [User] (first_name, last_name, username, access_level) VALUES (@firstname, @lastname, @username, @accesslevel)
GO
/****** Object:  StoredProcedure [dbo].[AddYard]    Script Date: 10/29/2020 12:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddYard]
@name nvarchar(50), @address nvarchar(MAX)
AS
INSERT INTO [Location] ([name], [address]) VALUES (@name, @address)
GO
/****** Object:  StoredProcedure [dbo].[DeleteHive]    Script Date: 10/29/2020 12:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteHive]
@id int
AS
DELETE FROM [ActionDetail] WHERE hive_id = @id
DELETE FROM [Hive]
WHERE id = @id
 
GO
/****** Object:  StoredProcedure [dbo].[GetActionDetails]    Script Date: 10/29/2020 12:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetActionDetails]
@hive_id int
AS
SELECT ad.id, ad.primary_action_id, ad.secondary_action_id, ad.tertiary_action_id, ad.completed_by_id, ad.completed, ad.completed_date, ad.entered_by_id, ad.entry_date, ad.scheduled_date, ad.comments,
pa.name AS primary_action_name, sa.name AS secondary_action_name, ta.name AS tertiary_action_name, eu.first_name AS entered_by_first_name, eu.last_name AS entered_by_last_name, cu.first_name AS completed_by_first_name, cu.last_name AS completed_by_last_name
FROM ActionDetail ad
JOIN PrimaryAction pa ON ad.primary_action_id = pa.id
JOIN SecondaryAction sa ON ad.secondary_action_id = sa.id
JOIN TertiaryAction ta ON ad.tertiary_action_id = ta.id
JOIN [User] eu ON ad.entered_by_id = eu.id
JOIN [User] cu ON ad.completed_by_id = cu.id
WHERE ad.hive_id = @hive_id

GO
/****** Object:  StoredProcedure [dbo].[UpdatePrimaryAction]    Script Date: 10/29/2020 12:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePrimaryAction]
@id int, @active bit
AS
UPDATE PrimaryAction SET active = @active WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[UpdateSecondaryAction]    Script Date: 10/29/2020 12:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSecondaryAction]
@id int, @active bit
AS
UPDATE SecondaryAction SET active = @active WHERE id = @id
GO
/****** Object:  StoredProcedure [dbo].[UpdateTertiaryAction]    Script Date: 10/29/2020 12:04:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTertiaryAction]
@id int, @active bit
AS
UPDATE TertiaryAction SET active = @active WHERE id = @id
GO
USE [master]
GO
ALTER DATABASE [HiveHelper] SET  READ_WRITE 
GO
