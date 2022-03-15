USE [master]
GO
/****** Object:  Database [LibraryDb]    Script Date: 3/15/2022 11:55:59 PM ******/
CREATE DATABASE [LibraryDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\LibraryDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\LibraryDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[Book]    Script Date: 3/15/2022 11:55:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookId] [int] NOT NULL,
	[BookName] [nvarchar](45) NULL,
	[Author] [nvarchar](45) NULL,
	[Publishar] [nvarchar](45) NULL,
	[PublishDate] [date] NULL,
	[LanguageId] [int] NULL,
	[CategoreyId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Language]    Script Date: 3/15/2022 11:55:59 PM ******/
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
/****** Object:  Table [dbo].[Categorey]    Script Date: 3/15/2022 11:55:59 PM ******/
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
/****** Object:  View [dbo].[vw_BookMainView]    Script Date: 3/15/2022 11:55:59 PM ******/
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
/****** Object:  Table [dbo].[LibraryInvoice]    Script Date: 3/15/2022 11:55:59 PM ******/
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
/****** Object:  Table [dbo].[LibraryNote]    Script Date: 3/15/2022 11:55:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LibraryNote](
	[LibraryNoteId] [int] NOT NULL,
	[BookId] [int] NULL,
	[Quantity] [int] NULL,
	[LibraryInvoiceId] [int] NULL,
	[BookPrice] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[LibraryNoteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_LibraryNote]    Script Date: 3/15/2022 11:55:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_LibraryNote]
AS
SELECT        dbo.LibraryNote.BookId, dbo.Book.BookName, dbo.LibraryNote.Quantity, dbo.LibraryNote.LibraryInvoiceId, dbo.LibraryNote.BookPrice, dbo.LibraryInvoice.Date, dbo.LibraryInvoice.AccountId, dbo.LibraryNote.LibraryNoteId, 
                         dbo.LibraryNote.BookPrice * dbo.LibraryNote.Quantity AS 'Total'
FROM            dbo.Book INNER JOIN
                         dbo.LibraryNote ON dbo.Book.BookId = dbo.LibraryNote.BookId INNER JOIN
                         dbo.LibraryInvoice ON dbo.LibraryNote.LibraryInvoiceId = dbo.LibraryInvoice.LibraryInvoiceId
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/15/2022 11:55:59 PM ******/
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
/****** Object:  Table [dbo].[Borrow]    Script Date: 3/15/2022 11:55:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Borrow](
	[BorrowId] [int] NOT NULL,
	[BookId] [int] NULL,
	[BorrowInvoiceId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BorrowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BorrowInvoice]    Script Date: 3/15/2022 11:55:59 PM ******/
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
/****** Object:  Table [dbo].[BorrowNote]    Script Date: 3/15/2022 11:55:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BorrowNote](
	[BorrowId] [int] NOT NULL,
	[BookId] [int] NULL,
	[BorrowInvoiceId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[BorrowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Library]    Script Date: 3/15/2022 11:55:59 PM ******/
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
/****** Object:  Table [dbo].[Person]    Script Date: 3/15/2022 11:55:59 PM ******/
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
ALTER TABLE [dbo].[Borrow]  WITH CHECK ADD FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
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
ALTER TABLE [dbo].[Library]  WITH CHECK ADD FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[Library]  WITH CHECK ADD FOREIGN KEY([LibraryInvoiceId])
REFERENCES [dbo].[LibraryInvoice] ([LibraryInvoiceId])
GO
ALTER TABLE [dbo].[LibraryInvoice]  WITH CHECK ADD FOREIGN KEY([AccountId])
REFERENCES [dbo].[Account] ([AccountId])
GO
ALTER TABLE [dbo].[LibraryNote]  WITH CHECK ADD  CONSTRAINT [FK_LibraryNote_LibraryInvoice] FOREIGN KEY([LibraryInvoiceId])
REFERENCES [dbo].[LibraryInvoice] ([LibraryInvoiceId])
GO
ALTER TABLE [dbo].[LibraryNote] CHECK CONSTRAINT [FK_LibraryNote_LibraryInvoice]
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFilteredAccount]    Script Date: 3/15/2022 11:55:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetFilteredBook]    Script Date: 3/15/2022 11:55:59 PM ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetFilteredCategorey]    Script Date: 3/15/2022 11:55:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetFilteredCategorey]
@cat nvarchar(40)
as
select * from Categorey where CategoreyName like '%'+@cat+'%'
GO
/****** Object:  StoredProcedure [dbo].[sp_GetFilteredLanguage]    Script Date: 3/15/2022 11:55:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetFilteredLanguage]
@lang nvarchar(40)
as
select * from Language where LanguageName like '%'+@lang+'%'
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
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Language"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 419
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Categorey"
            Begin Extent = 
               Top = 6
               Left = 457
               Bottom = 102
               Right = 632
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
         Begin Table = "Book"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "LibraryNote"
            Begin Extent = 
               Top = 6
               Left = 668
               Bottom = 136
               Right = 841
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LibraryInvoice"
            Begin Extent = 
               Top = 171
               Left = 329
               Bottom = 317
               Right = 502
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
