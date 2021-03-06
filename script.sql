USE [master]
GO
/****** Object:  Database [LibraryDb]    Script Date: 4/4/2022 11:44:21 PM ******/
CREATE DATABASE [LibraryDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LibraryDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LibraryDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LibraryDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LibraryDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LibraryDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryDb] SET RECOVERY FULL 
GO
ALTER DATABASE [LibraryDb] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LibraryDb', N'ON'
GO
ALTER DATABASE [LibraryDb] SET QUERY_STORE = OFF
GO
USE [LibraryDb]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 4/4/2022 11:44:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Language](
	[LanguageId] [int] IDENTITY(1,1) NOT NULL,
	[LanguageName] [nvarchar](30) NULL,
 CONSTRAINT [PK__Language__B93855AB06E954CE] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categorey]    Script Date: 4/4/2022 11:44:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorey](
	[CategoreyId] [int] IDENTITY(1,1) NOT NULL,
	[CategoreyName] [nvarchar](30) NULL,
 CONSTRAINT [PK__Categore__85FC58AE36274CDB] PRIMARY KEY CLUSTERED 
(
	[CategoreyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 4/4/2022 11:44:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookId] [int] NOT NULL,
	[BookName] [nvarchar](75) NULL,
	[Author] [nvarchar](65) NULL,
	[Publishar] [nvarchar](45) NULL,
	[PublishDate] [date] NULL,
	[LanguageId] [int] NULL,
	[CategoreyId] [int] NULL,
 CONSTRAINT [PK__Book__3DE0C207C714491E] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_BookMainView]    Script Date: 4/4/2022 11:44:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_BookMainView]
AS
SELECT        dbo.Book.BookId, dbo.Book.BookName, dbo.Book.Author, dbo.Book.Publishar, dbo.Book.PublishDate, dbo.Language.LanguageName, dbo.Categorey.CategoreyName, dbo.Book.LanguageId, dbo.Book.CategoreyId
FROM            dbo.Book INNER JOIN
                         dbo.Language ON dbo.Book.LanguageId = dbo.Language.LanguageId INNER JOIN
                         dbo.Categorey ON dbo.Book.CategoreyId = dbo.Categorey.CategoreyId
GO
/****** Object:  Table [dbo].[LibraryNote]    Script Date: 4/4/2022 11:44:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibraryNote](
	[LibraryNoteId] [int] NOT NULL,
	[BookId] [int] NULL,
	[Quantity] [int] NULL,
	[BookPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LibraryNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_LibraryNote]    Script Date: 4/4/2022 11:44:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_LibraryNote]
AS
SELECT        dbo.LibraryNote.LibraryNoteId, dbo.LibraryNote.BookId, dbo.Book.BookName, dbo.LibraryNote.Quantity, dbo.LibraryNote.BookPrice, dbo.LibraryNote.Quantity * dbo.LibraryNote.BookPrice AS Total
FROM            dbo.LibraryNote INNER JOIN
                         dbo.Book ON dbo.LibraryNote.BookId = dbo.Book.BookId
GO
/****** Object:  Table [dbo].[LibraryInvoice]    Script Date: 4/4/2022 11:44:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibraryInvoice](
	[LibraryInvoiceId] [int] NOT NULL,
	[Date] [date] NULL,
	[AccountId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LibraryInvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 4/4/2022 11:44:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[AccountId] [int] NOT NULL,
	[FullName] [varchar](40) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[RecoveryPhrase] [nvarchar](50) NULL,
	[Permission] [nvarchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Library]    Script Date: 4/4/2022 11:44:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Library](
	[LibraryId] [int] NOT NULL,
	[BookId] [int] NULL,
	[Quantity] [int] NULL,
	[LibraryInvoiceId] [int] NULL,
	[BookPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LibraryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_LibraryInvoice]    Script Date: 4/4/2022 11:44:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_LibraryInvoice]
AS
SELECT        dbo.Library.LibraryId, dbo.Library.LibraryInvoiceId, dbo.Book.BookId, dbo.Book.BookName, dbo.Library.Quantity, dbo.Library.BookPrice, dbo.Library.Quantity * dbo.Library.BookPrice AS Total, dbo.LibraryInvoice.Date, 
                         dbo.Account.FullName
FROM            dbo.Library INNER JOIN
                         dbo.Book ON dbo.Library.BookId = dbo.Book.BookId INNER JOIN
                         dbo.LibraryInvoice ON dbo.Library.LibraryInvoiceId = dbo.LibraryInvoice.LibraryInvoiceId INNER JOIN
                         dbo.Account ON dbo.LibraryInvoice.AccountId = dbo.Account.AccountId
GO
/****** Object:  Table [dbo].[BorrowNote]    Script Date: 4/4/2022 11:44:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowNote](
	[BorrowId] [int] NOT NULL,
	[BookId] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BorrowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_GetBorrowNote]    Script Date: 4/4/2022 11:44:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetBorrowNote]
AS
SELECT        dbo.BorrowNote.BorrowId, dbo.BorrowNote.BookId, dbo.Book.BookName, dbo.BorrowNote.Quantity
FROM            dbo.BorrowNote INNER JOIN
                         dbo.Book ON dbo.BorrowNote.BookId = dbo.Book.BookId
GO
/****** Object:  Table [dbo].[Borrow]    Script Date: 4/4/2022 11:44:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrow](
	[BorrowId] [int] NOT NULL,
	[BookId] [int] NULL,
	[BorrowInvoiceId] [int] NULL,
	[Quantity] [int] NULL,
	[IsReturned] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[BorrowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowInvoice]    Script Date: 4/4/2022 11:44:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowInvoice](
	[BorrowInvoiceId] [int] NOT NULL,
	[PersonId] [int] NULL,
	[Date] [date] NULL,
	[ReturenDate] [date] NULL,
	[AccountId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BorrowInvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 4/4/2022 11:44:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] NOT NULL,
	[FullName] [nvarchar](45) NULL,
	[Gender] [nvarchar](15) NULL,
	[Age] [int] NULL,
	[Phone] [nvarchar](25) NULL,
	[CartId] [nvarchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_GetFilteredBorrowInvoice]    Script Date: 4/4/2022 11:44:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_GetFilteredBorrowInvoice]
AS
SELECT        dbo.Borrow.BorrowId, dbo.Borrow.BookId, dbo.Borrow.BorrowInvoiceId, dbo.BorrowInvoice.PersonId, dbo.Book.BookName, dbo.Borrow.Quantity, dbo.Person.FullName, dbo.BorrowInvoice.Date, dbo.BorrowInvoice.ReturenDate, 
                         dbo.Borrow.IsReturned, dbo.BorrowInvoice.AccountId, dbo.Account.FullName AS Employee
FROM            dbo.Book INNER JOIN
                         dbo.Borrow ON dbo.Book.BookId = dbo.Borrow.BookId INNER JOIN
                         dbo.BorrowInvoice ON dbo.Borrow.BorrowInvoiceId = dbo.BorrowInvoice.BorrowInvoiceId INNER JOIN
                         dbo.Person ON dbo.BorrowInvoice.PersonId = dbo.Person.PersonId INNER JOIN
                         dbo.Account ON dbo.BorrowInvoice.AccountId = dbo.Account.AccountId
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 4/4/2022 11:44:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting](
	[BooksLimit] [int] NOT NULL,
	[ReturnLimit] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([AccountId], [FullName], [Username], [Password], [RecoveryPhrase], [Permission]) VALUES (1, N'harnas abubakr', N'hana', N'123', N'aaabc', N'admin')
INSERT [dbo].[Account] ([AccountId], [FullName], [Username], [Password], [RecoveryPhrase], [Permission]) VALUES (2, N'hastyar hussein', N'hastyar', N'123', N'hhh', N'employee')
INSERT [dbo].[Account] ([AccountId], [FullName], [Username], [Password], [RecoveryPhrase], [Permission]) VALUES (3, N'usera', N'usera', N'123', N'dddd', N'user')
GO
INSERT [dbo].[Book] ([BookId], [BookName], [Author], [Publishar], [PublishDate], [LanguageId], [CategoreyId]) VALUES (1, N'C# in Depth', N'jon skeet', N'manning', CAST(N'2008-05-01' AS Date), 1, 1)
INSERT [dbo].[Book] ([BookId], [BookName], [Author], [Publishar], [PublishDate], [LanguageId], [CategoreyId]) VALUES (2, N'Head First C#', N'Andrew Stellman', N'unknown', CAST(N'2007-11-26' AS Date), 1, 1)
INSERT [dbo].[Book] ([BookId], [BookName], [Author], [Publishar], [PublishDate], [LanguageId], [CategoreyId]) VALUES (3, N'Computer Networking: A Top-down Approach', N'Jim Kurose', N'unknown', CAST(N'2000-01-01' AS Date), 1, 3)
INSERT [dbo].[Book] ([BookId], [BookName], [Author], [Publishar], [PublishDate], [LanguageId], [CategoreyId]) VALUES (4, N'Network Warrior', N'unknown', N'unknown', CAST(N'2007-07-21' AS Date), 1, 3)
INSERT [dbo].[Book] ([BookId], [BookName], [Author], [Publishar], [PublishDate], [LanguageId], [CategoreyId]) VALUES (5, N'Network Programmability and Automation', N'Jason Edelman, Matt Oswalt, and Scott S. Lowe', N'unknown', CAST(N'2008-01-01' AS Date), 1, 3)
INSERT [dbo].[Book] ([BookId], [BookName], [Author], [Publishar], [PublishDate], [LanguageId], [CategoreyId]) VALUES (6, N'Database Systems: The Complete Book', N'Héctor García-Molina, Jeffrey Ullman, and Jennifer Widom', N'unknown', CAST(N'2001-01-01' AS Date), 1, 2)
INSERT [dbo].[Book] ([BookId], [BookName], [Author], [Publishar], [PublishDate], [LanguageId], [CategoreyId]) VALUES (7, N'Database Design for Mere Mortals: A Hands‑On', N'Michael J. Hernandez', N'unknown', CAST(N'1996-01-01' AS Date), 1, 2)
INSERT [dbo].[Book] ([BookId], [BookName], [Author], [Publishar], [PublishDate], [LanguageId], [CategoreyId]) VALUES (8, N'Cross-Platform Mobile Application Development', N'John R. Carlson Ph.D', N'ISBN-13: 979-8599755883', CAST(N'2010-01-01' AS Date), 1, 5)
INSERT [dbo].[Book] ([BookId], [BookName], [Author], [Publishar], [PublishDate], [LanguageId], [CategoreyId]) VALUES (9, N'sh', N'ss', N'DFGFGD', CAST(N'2022-03-30' AS Date), 3, 2)
INSERT [dbo].[Book] ([BookId], [BookName], [Author], [Publishar], [PublishDate], [LanguageId], [CategoreyId]) VALUES (10, N'fg', N'dfg', N'dfg', CAST(N'2022-04-25' AS Date), 2, 3)
GO
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (1, 8, 1, 2, 1)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (2, 2, 2, 1, 0)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (3, 1, 3, 1, 0)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (4, 4, 3, 1, 1)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (5, 8, 3, 1, 1)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (9, 8, 1, 1, 1)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (10, 8, 1, 1, 1)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (11, 8, 1, 1, 0)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (12, 8, 5, 1, 0)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (13, 8, 6, 1, 0)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (16, 1, 8, 1, 0)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (17, 1, 8, 3, 0)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (18, 3, 9, 2, 1)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (19, 8, 9, 2, 0)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (20, 3, 10, 1, 0)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (21, 6, 10, 2, 1)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (22, 9, 11, 1, 1)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (23, 8, 11, 2, 1)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (24, 9, 12, 2, 1)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (25, 6, 12, 1, 0)
INSERT [dbo].[Borrow] ([BorrowId], [BookId], [BorrowInvoiceId], [Quantity], [IsReturned]) VALUES (26, 2, 13, 1, 0)
GO
INSERT [dbo].[BorrowInvoice] ([BorrowInvoiceId], [PersonId], [Date], [ReturenDate], [AccountId]) VALUES (1, 3, CAST(N'2022-03-22' AS Date), CAST(N'2022-04-01' AS Date), 1)
INSERT [dbo].[BorrowInvoice] ([BorrowInvoiceId], [PersonId], [Date], [ReturenDate], [AccountId]) VALUES (2, 2, CAST(N'2022-03-22' AS Date), CAST(N'2022-04-01' AS Date), 1)
INSERT [dbo].[BorrowInvoice] ([BorrowInvoiceId], [PersonId], [Date], [ReturenDate], [AccountId]) VALUES (3, 1, CAST(N'2022-03-22' AS Date), CAST(N'2022-04-01' AS Date), 1)
INSERT [dbo].[BorrowInvoice] ([BorrowInvoiceId], [PersonId], [Date], [ReturenDate], [AccountId]) VALUES (5, 2, CAST(N'2022-03-23' AS Date), CAST(N'2022-04-02' AS Date), 1)
INSERT [dbo].[BorrowInvoice] ([BorrowInvoiceId], [PersonId], [Date], [ReturenDate], [AccountId]) VALUES (6, 4, CAST(N'2022-03-23' AS Date), CAST(N'2022-04-02' AS Date), 2)
INSERT [dbo].[BorrowInvoice] ([BorrowInvoiceId], [PersonId], [Date], [ReturenDate], [AccountId]) VALUES (8, 1, CAST(N'2022-04-04' AS Date), CAST(N'2022-04-14' AS Date), 1)
INSERT [dbo].[BorrowInvoice] ([BorrowInvoiceId], [PersonId], [Date], [ReturenDate], [AccountId]) VALUES (9, 5, CAST(N'2022-04-04' AS Date), CAST(N'2022-04-14' AS Date), 1)
INSERT [dbo].[BorrowInvoice] ([BorrowInvoiceId], [PersonId], [Date], [ReturenDate], [AccountId]) VALUES (10, 3, CAST(N'2022-04-04' AS Date), CAST(N'2022-04-14' AS Date), 1)
INSERT [dbo].[BorrowInvoice] ([BorrowInvoiceId], [PersonId], [Date], [ReturenDate], [AccountId]) VALUES (11, 5, CAST(N'2022-04-04' AS Date), CAST(N'2022-04-14' AS Date), 1)
INSERT [dbo].[BorrowInvoice] ([BorrowInvoiceId], [PersonId], [Date], [ReturenDate], [AccountId]) VALUES (12, 1, CAST(N'2022-04-04' AS Date), CAST(N'2022-04-14' AS Date), 1)
INSERT [dbo].[BorrowInvoice] ([BorrowInvoiceId], [PersonId], [Date], [ReturenDate], [AccountId]) VALUES (13, 2, CAST(N'2022-04-04' AS Date), CAST(N'2022-04-14' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[Categorey] ON 

INSERT [dbo].[Categorey] ([CategoreyId], [CategoreyName]) VALUES (1, N'Programming')
INSERT [dbo].[Categorey] ([CategoreyId], [CategoreyName]) VALUES (2, N'Database')
INSERT [dbo].[Categorey] ([CategoreyId], [CategoreyName]) VALUES (3, N'Network')
INSERT [dbo].[Categorey] ([CategoreyId], [CategoreyName]) VALUES (4, N'Visual Programming')
INSERT [dbo].[Categorey] ([CategoreyId], [CategoreyName]) VALUES (5, N'Mobile Application')
SET IDENTITY_INSERT [dbo].[Categorey] OFF
GO
SET IDENTITY_INSERT [dbo].[Language] ON 

INSERT [dbo].[Language] ([LanguageId], [LanguageName]) VALUES (1, N'English')
INSERT [dbo].[Language] ([LanguageId], [LanguageName]) VALUES (2, N'Arabic')
INSERT [dbo].[Language] ([LanguageId], [LanguageName]) VALUES (3, N'Kurdish')
INSERT [dbo].[Language] ([LanguageId], [LanguageName]) VALUES (5, N'b')
SET IDENTITY_INSERT [dbo].[Language] OFF
GO
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (1, 6, 5, 2, 10000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (2, 3, 20, 2, 8000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (3, 2, 15, 2, 4000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (4, 1, 10, 2, 3000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (5, 8, 6, 2, 5000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (7, 3, 6, 4, 3000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (8, 4, 6, 4, 1000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (9, 8, 2, 3, 3000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (10, 2, 5, 3, 2000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (11, 6, 4, 5, 1000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (12, 2, 3, 6, 4000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (13, 8, 2, 6, 3000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (15, 2, 1, 7, 1000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (16, 4, 2, 8, 1000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (17, 6, 4, 7, 2000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (18, 8, 10, 9, 5000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (19, 9, 5, 9, 1000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (20, 6, 5, 10, 4000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (21, 5, 5, 11, 2000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (22, 8, 5, 11, 1000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (23, 7, 1, 11, 2000)
INSERT [dbo].[Library] ([LibraryId], [BookId], [Quantity], [LibraryInvoiceId], [BookPrice]) VALUES (24, 8, 2, 12, 2000)
GO
INSERT [dbo].[LibraryInvoice] ([LibraryInvoiceId], [Date], [AccountId]) VALUES (1, CAST(N'2022-03-18' AS Date), 1)
INSERT [dbo].[LibraryInvoice] ([LibraryInvoiceId], [Date], [AccountId]) VALUES (2, CAST(N'2022-03-18' AS Date), 1)
INSERT [dbo].[LibraryInvoice] ([LibraryInvoiceId], [Date], [AccountId]) VALUES (3, CAST(N'2022-03-18' AS Date), 1)
INSERT [dbo].[LibraryInvoice] ([LibraryInvoiceId], [Date], [AccountId]) VALUES (4, CAST(N'2022-03-14' AS Date), 1)
INSERT [dbo].[LibraryInvoice] ([LibraryInvoiceId], [Date], [AccountId]) VALUES (5, CAST(N'2022-03-23' AS Date), 2)
INSERT [dbo].[LibraryInvoice] ([LibraryInvoiceId], [Date], [AccountId]) VALUES (6, CAST(N'2022-04-03' AS Date), 1)
INSERT [dbo].[LibraryInvoice] ([LibraryInvoiceId], [Date], [AccountId]) VALUES (7, CAST(N'2022-04-05' AS Date), 1)
INSERT [dbo].[LibraryInvoice] ([LibraryInvoiceId], [Date], [AccountId]) VALUES (8, CAST(N'2022-04-27' AS Date), 1)
INSERT [dbo].[LibraryInvoice] ([LibraryInvoiceId], [Date], [AccountId]) VALUES (9, CAST(N'2022-04-04' AS Date), 1)
INSERT [dbo].[LibraryInvoice] ([LibraryInvoiceId], [Date], [AccountId]) VALUES (10, CAST(N'2022-04-11' AS Date), 1)
INSERT [dbo].[LibraryInvoice] ([LibraryInvoiceId], [Date], [AccountId]) VALUES (11, CAST(N'2022-04-04' AS Date), 1)
INSERT [dbo].[LibraryInvoice] ([LibraryInvoiceId], [Date], [AccountId]) VALUES (12, CAST(N'2022-04-04' AS Date), 1)
GO
INSERT [dbo].[Person] ([PersonId], [FullName], [Gender], [Age], [Phone], [CartId]) VALUES (1, N'ahmed ali', N'Male', 22, N'0770 166 2889', N'a2332353-passport')
INSERT [dbo].[Person] ([PersonId], [FullName], [Gender], [Age], [Phone], [CartId]) VALUES (2, N'ali abas', N'Male', 20, N'0750 243 5465', N'43655632-taskara')
INSERT [dbo].[Person] ([PersonId], [FullName], [Gender], [Age], [Phone], [CartId]) VALUES (3, N'shanya qadr', N'Female', 19, N'0750 161 2332', N'2134321-injaza-sayaqi')
INSERT [dbo].[Person] ([PersonId], [FullName], [Gender], [Age], [Phone], [CartId]) VALUES (4, N'mhamad karzan', N'Male', 20, N'0770 162 6678', N'12343234-taskara')
INSERT [dbo].[Person] ([PersonId], [FullName], [Gender], [Age], [Phone], [CartId]) VALUES (5, N'xanda ', N'Female', 23, N'2094209', N'23443209-taskara')
GO
INSERT [dbo].[Setting] ([BooksLimit], [ReturnLimit]) VALUES (4, 10)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_BookName_Book]    Script Date: 4/4/2022 11:44:23 PM ******/
CREATE NONCLUSTERED INDEX [ix_BookName_Book] ON [dbo].[Book]
(
	[BookName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_Date_BorrowInvoice]    Script Date: 4/4/2022 11:44:23 PM ******/
CREATE NONCLUSTERED INDEX [ix_Date_BorrowInvoice] ON [dbo].[BorrowInvoice]
(
	[Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ix_ReturnDate_BorrowInvoice]    Script Date: 4/4/2022 11:44:23 PM ******/
CREATE NONCLUSTERED INDEX [ix_ReturnDate_BorrowInvoice] ON [dbo].[BorrowInvoice]
(
	[ReturenDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ix_FullName_Person]    Script Date: 4/4/2022 11:44:23 PM ******/
CREATE NONCLUSTERED INDEX [ix_FullName_Person] ON [dbo].[Person]
(
	[FullName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK__Book__CategoreyI__3B75D760] FOREIGN KEY([CategoreyId])
REFERENCES [dbo].[Categorey] ([CategoreyId])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK__Book__CategoreyI__3B75D760]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK__Book__LanguageId__3C69FB99] FOREIGN KEY([LanguageId])
REFERENCES [dbo].[Language] ([LanguageId])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK__Book__LanguageId__3C69FB99]
GO
ALTER TABLE [dbo].[Borrow]  WITH CHECK ADD  CONSTRAINT [FK__Borrow__BookId__3B75D760] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[Borrow] CHECK CONSTRAINT [FK__Borrow__BookId__3B75D760]
GO
ALTER TABLE [dbo].[Borrow]  WITH CHECK ADD FOREIGN KEY([BorrowInvoiceId])
REFERENCES [dbo].[BorrowInvoice] ([BorrowInvoiceId])
GO
ALTER TABLE [dbo].[BorrowInvoice]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[BorrowInvoice]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([PersonId])
GO
ALTER TABLE [dbo].[Library]  WITH CHECK ADD  CONSTRAINT [FK__Library__BookId__3F466844] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[Library] CHECK CONSTRAINT [FK__Library__BookId__3F466844]
GO
ALTER TABLE [dbo].[Library]  WITH CHECK ADD FOREIGN KEY([LibraryInvoiceId])
REFERENCES [dbo].[LibraryInvoice] ([LibraryInvoiceId])
GO
ALTER TABLE [dbo].[LibraryInvoice]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFilteredAccount]    Script Date: 4/4/2022 11:44:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetFilteredAccount]
@full nvarchar(50) ,
@user nvarchar(40) 
as
select * from Account where FullName like '%'+@full+'%' or Username like '%'+@user+'%' 
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFilteredBook]    Script Date: 4/4/2022 11:44:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_GetFilteredBook]
@name nvarchar(50) ,
@auth nvarchar(50),
@pub nvarchar(50),
@lang int,
@cat int
as
select * from vw_BookMainView where BookName like '%'+@name+'%' or Author like '%'+@auth+'%' or Publishar like '%'+@pub+'%' or  LanguageId = @lang or CategoreyId=@cat
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFilteredBorrowInvoice]    Script Date: 4/4/2022 11:44:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetFilteredBorrowInvoice]
@invoiceid int,
@full nvarchar(50),
@book varchar(50)
as
select * from vw_GetFilteredBorrowInvoice where BorrowInvoiceId=@invoiceid or FullName like '%'+@full+'%' or BookName like '%'+@book+'%' order by BorrowInvoiceId desc
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFilteredCategorey]    Script Date: 4/4/2022 11:44:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetFilteredCategorey]
@cat nvarchar(40)
as
select * from Categorey where CategoreyName like '%'+@cat+'%'
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFilteredInvoice]    Script Date: 4/4/2022 11:44:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetFilteredInvoice]
@name nvarchar(60),
@invoiceId int,
@date varchar(40)
as
select * from vw_LibraryInvoice where BookName like '%'+@name+'%' or LibraryInvoiceId = @invoiceId or Date like '%'+@date+'%'
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFilteredLanguage]    Script Date: 4/4/2022 11:44:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetFilteredLanguage]
@lang nvarchar(40)
as
select * from Language where LanguageName like '%'+@lang+'%'
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFilteredPerson]    Script Date: 4/4/2022 11:44:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_GetFilteredPerson]
@name nvarchar(50),
@cart nvarchar(50),
@phone nvarchar(50)
as
select * from Person where Fullname like'%'+@name+'%' or Phone like '%'+@phone+'%' or CartId like '%'+@cart+'%'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Book"
            Begin Extent = 
               Top = 42
               Left = 43
               Bottom = 207
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Language"
            Begin Extent = 
               Top = 4
               Left = 294
               Bottom = 144
               Right = 467
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Categorey"
            Begin Extent = 
               Top = 112
               Left = 530
               Bottom = 208
               Right = 705
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_BookMainView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_BookMainView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "BorrowNote"
            Begin Extent = 
               Top = 5
               Left = 12
               Bottom = 161
               Right = 187
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Book"
            Begin Extent = 
               Top = 9
               Left = 405
               Bottom = 139
               Right = 575
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetBorrowNote'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetBorrowNote'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Book"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Borrow"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 182
               Right = 421
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "BorrowInvoice"
            Begin Extent = 
               Top = 67
               Left = 504
               Bottom = 242
               Right = 679
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Person"
            Begin Extent = 
               Top = 17
               Left = 753
               Bottom = 202
               Right = 923
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Account"
            Begin Extent = 
               Top = 157
               Left = 38
               Bottom = 287
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 13' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetFilteredBorrowInvoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'50
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetFilteredBorrowInvoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_GetFilteredBorrowInvoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Account"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Book"
            Begin Extent = 
               Top = 6
               Left = 248
               Bottom = 136
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Library"
            Begin Extent = 
               Top = 6
               Left = 456
               Bottom = 136
               Right = 629
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "LibraryInvoice"
            Begin Extent = 
               Top = 6
               Left = 665
               Bottom = 146
               Right = 840
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_LibraryInvoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_LibraryInvoice'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "LibraryNote"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 177
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Book"
            Begin Extent = 
               Top = 6
               Left = 363
               Bottom = 172
               Right = 533
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_LibraryNote'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_LibraryNote'
GO
USE [master]
GO
ALTER DATABASE [LibraryDb] SET  READ_WRITE 
GO
