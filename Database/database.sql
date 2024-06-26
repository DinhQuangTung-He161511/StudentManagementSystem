USE [master]
GO
/****** Object:  Database [PRN221_StudentManagementSystem]    Script Date: 3/21/2024 10:05:26 PM ******/
CREATE DATABASE [PRN221_StudentManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'prj_prn221_student_manager_system', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\prj_prn221_student_manager_system.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'prj_prn221_student_manager_system_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\prj_prn221_student_manager_system_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRN221_StudentManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET QUERY_STORE = OFF
GO
USE [PRN221_StudentManagementSystem]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 3/21/2024 10:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[admin_name] [varchar](255) NOT NULL,
	[phone] [varchar](12) NULL,
	[role_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class_Subject]    Script Date: 3/21/2024 10:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Subject](
	[class_subject_id] [varchar](255) NOT NULL,
	[slot] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[room] [varchar](255) NOT NULL,
	[lecture_id] [varchar](255) NOT NULL,
	[subject_id] [varchar](255) NOT NULL,
	[number_of_students] [int] NOT NULL,
	[class_id] [int] NULL,
 CONSTRAINT [PK__Class_Su__DAA4A24DED7050B1] PRIMARY KEY CLUSTERED 
(
	[class_subject_id] ASC,
	[slot] ASC,
	[date] ASC,
	[room] ASC,
	[lecture_id] ASC,
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classes]    Script Date: 3/21/2024 10:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classes](
	[class_id] [int] IDENTITY(1,1) NOT NULL,
	[class_className] [varchar](500) NULL,
 CONSTRAINT [PK_Classes] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam_Schedule]    Script Date: 3/21/2024 10:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam_Schedule](
	[exam_schedule_id] [int] IDENTITY(1,1) NOT NULL,
	[room] [varchar](255) NOT NULL,
	[type_of_exam] [varchar](255) NOT NULL,
	[date] [datetime] NOT NULL,
	[time_from] [varchar](50) NOT NULL,
	[time_to] [varchar](50) NOT NULL,
	[date_of_public] [date] NOT NULL,
	[date_of_resit] [date] NULL,
	[time_from_resit] [varchar](50) NULL,
	[time_to_resit] [varchar](50) NULL,
	[date_of_public_resit] [date] NULL,
	[lecture_id] [varchar](255) NOT NULL,
	[subject_id] [varchar](255) NOT NULL,
	[semester_id] [int] NULL,
 CONSTRAINT [PK__Exam_Sch__6E72E9D1E7A51E9C] PRIMARY KEY CLUSTERED 
(
	[exam_schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Excercies]    Script Date: 3/21/2024 10:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Excercies](
	[exercise_name] [varchar](255) NOT NULL,
	[percentage] [real] NOT NULL,
	[dateline] [datetime] NOT NULL,
	[subject_id] [varchar](255) NOT NULL,
 CONSTRAINT [PK__Excercie__44AB11D9D8E394E5] PRIMARY KEY CLUSTERED 
(
	[exercise_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lectures]    Script Date: 3/21/2024 10:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lectures](
	[lecture_id] [varchar](255) NOT NULL,
	[lecture_name] [varchar](255) NOT NULL,
	[lecture_email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[dob] [datetime] NULL,
	[phone] [varchar](12) NULL,
	[role_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[lecture_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Majors]    Script Date: 3/21/2024 10:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Majors](
	[major_id] [varchar](255) NOT NULL,
	[major_name] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[major_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 3/21/2024 10:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[room_id] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 3/21/2024 10:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[semester_id] [int] IDENTITY(1,1) NOT NULL,
	[class_semester_name] [varchar](500) NULL,
	[year] [int] NOT NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[semester_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 3/21/2024 10:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[student_id] [varchar](255) NOT NULL,
	[student_name] [varchar](255) NOT NULL,
	[student_email] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[dob] [datetime] NULL,
	[phone] [varchar](12) NULL,
	[semester] [int] NOT NULL,
	[role_id] [int] NOT NULL,
	[major_id] [varchar](255) NOT NULL,
	[gender] [bit] NULL,
	[isActive] [bit] NULL,
	[class_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students_Exam_Schedule]    Script Date: 3/21/2024 10:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students_Exam_Schedule](
	[student_id] [varchar](255) NOT NULL,
	[exam_schedule_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC,
	[exam_schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students_Excercies]    Script Date: 3/21/2024 10:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students_Excercies](
	[student_id] [varchar](255) NOT NULL,
	[exercise_name] [varchar](255) NOT NULL,
	[mark] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[student_id] ASC,
	[exercise_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 3/21/2024 10:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[subject_id] [varchar](255) NOT NULL,
	[subject_name] [varchar](255) NOT NULL,
	[credit] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Admin] ([username], [password], [admin_name], [phone], [role_id]) VALUES (N'admin@gmail.com', N'123', N'Admin', N'0943317918', 1)
GO
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'GD1611-ID', 1, CAST(N'2023-10-25T00:00:00.000' AS DateTime), N'DE231', N'huongnt7', N'PRN221', 26, 3)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'GD1611-ID', 2, CAST(N'2023-11-02T00:00:00.000' AS DateTime), N'BE523', N'HE333333', N'CSI103', 27, 3)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'GD1611-ID', 2, CAST(N'2023-12-19T00:00:00.000' AS DateTime), N'BE222', N'HE555555', N'EN062', 25, 1)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'GD1611-ID', 3, CAST(N'2023-10-08T00:00:00.000' AS DateTime), N'BE523', N'HE101010', N'ECC301', 27, 1)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'GD1611-ID', 3, CAST(N'2023-11-23T00:00:00.000' AS DateTime), N'AL111L', N'HE666666', N'ERW412', 29, 1)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'GD1611-ID', 4, CAST(N'2023-12-11T00:00:00.000' AS DateTime), N'AL321R', N'HE101010', N'SWT301', 30, 1)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'GD1611-ID', 5, CAST(N'2023-12-22T00:00:00.000' AS DateTime), N'DE231', N'HE888888', N'ECM301', 30, 2)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'GD1611-ID', 6, CAST(N'2023-12-29T00:00:00.000' AS DateTime), N'DE342', N'HE444444', N'LTG201', 28, 2)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'MKT1615-MC', 1, CAST(N'2023-11-21T00:00:00.000' AS DateTime), N'AL111L', N'HE222222', N'ENW491', 29, 2)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'MKT1615-MC', 2, CAST(N'2023-11-07T00:00:00.000' AS DateTime), N'BE123', N'HE666666', N'SWR302', 29, 2)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'MKT1615-MC', 3, CAST(N'2023-10-12T00:00:00.000' AS DateTime), N'DE233', N'HE777777', N'CF112', 24, 3)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'MKT1615-MC', 4, CAST(N'2023-11-01T00:00:00.000' AS DateTime), N'AL132R', N'HE101010', N'DGT302', 28, 4)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'MKT1615-MC', 4, CAST(N'2023-12-15T00:00:00.000' AS DateTime), N'AL321R', N'HE999999', N'PRN211', 28, 4)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'MKT1615-MC', 5, CAST(N'2023-10-10T00:00:00.000' AS DateTime), N'BE112', N'HE999999', N'PRN221', 28, 4)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'MKT1615-MC', 5, CAST(N'2023-12-18T00:00:00.000' AS DateTime), N'DE342', N'HE444444', N'BJP_ELE', 29, 4)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'MKT1615-MC', 6, CAST(N'2023-12-08T00:00:00.000' AS DateTime), N'BE123', N'HE444444', N'ECC301', 27, 7)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'SE16331-NET', 1, CAST(N'2023-10-16T00:00:00.000' AS DateTime), N'AL132R', N'HE444444', N'ECM301', 25, 10)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'SE16331-NET', 1, CAST(N'2023-11-14T00:00:00.000' AS DateTime), N'AL111L', N'HE555555', N'ECN311', 28, 9)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'SE16331-NET', 2, CAST(N'2023-10-18T00:00:00.000' AS DateTime), N'DE233', N'HE333333', N'SWT301', 25, 10)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'SE16331-NET', 2, CAST(N'2023-12-17T00:00:00.000' AS DateTime), N'DE111', N'HE555555', N'ECC301', 28, 1)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'SE16331-NET', 3, CAST(N'2023-12-31T00:00:00.000' AS DateTime), N'DE342', N'HE999999', N'PRJ301', 29, 2)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'SE16331-NET', 4, CAST(N'2023-12-04T00:00:00.000' AS DateTime), N'BE523', N'HE777777', N'PRM301', 29, 3)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'SE16331-NET', 4, CAST(N'2023-12-13T00:00:00.000' AS DateTime), N'AL321R', N'HE101010', N'ELI302', 30, 4)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'SE16331-NET', 5, CAST(N'2023-11-22T00:00:00.000' AS DateTime), N'BE112', N'HE666666', N'BJP_ELE', 29, 5)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'SE16331-NET', 6, CAST(N'2023-10-05T00:00:00.000' AS DateTime), N'BE112', N'HE888888', N'DGT302', 28, 6)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'SE1635-NJ', 1, CAST(N'2023-11-19T00:00:00.000' AS DateTime), N'AL111L', N'HE777777', N'ENW491', 28, 19)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'SE1635-NJ', 1, CAST(N'2023-12-20T00:00:00.000' AS DateTime), N'AL132R', N'HE444444', N'FIN201', 27, 8)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'SE1635-NJ', 2, CAST(N'2023-10-29T00:00:00.000' AS DateTime), N'BE123', N'HE222222', N'JPD116', 21, 10)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'SE1635-NJ', 3, CAST(N'2023-11-09T00:00:00.000' AS DateTime), N'DE111', N'HE666666', N'ECC301', 26, 4)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'SE1635-NJ', 3, CAST(N'2023-12-25T00:00:00.000' AS DateTime), N'AL321R', N'HE999999', N'CSI103', 25, 4)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'SE1635-NJ', 4, CAST(N'2023-11-28T00:00:00.000' AS DateTime), N'AL111L', N'HE555555', N'PRN221', 26, 2)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'SE1635-NJ', 5, CAST(N'2023-11-15T00:00:00.000' AS DateTime), N'DE342', N'HE555555', N'LTG201', 25, 5)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'SE1635-NJ', 6, CAST(N'2023-10-27T00:00:00.000' AS DateTime), N'BE112', N'HE666666', N'EN062', 26, 5)
INSERT [dbo].[Class_Subject] ([class_subject_id], [slot], [date], [room], [lecture_id], [subject_id], [number_of_students], [class_id]) VALUES (N'SE1635-NJ', 6, CAST(N'2023-11-30T00:00:00.000' AS DateTime), N'BE523', N'HE555555', N'VO101', 27, 7)
GO
SET IDENTITY_INSERT [dbo].[Classes] ON 

INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (1, N'SE1701')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (2, N'SE1702')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (3, N'SE1703')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (4, N'SE1704')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (5, N'SE1705')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (6, N'SE1706')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (7, N'SE1707')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (8, N'SE1708')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (9, N'SE1709')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (10, N'SE1710')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (11, N'SE1711')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (12, N'SE1712')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (13, N'SE1713')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (14, N'SE1714')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (15, N'SE1715')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (16, N'SE1716')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (17, N'SE1717')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (18, N'SE1718')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (19, N'SE1719')
INSERT [dbo].[Classes] ([class_id], [class_className]) VALUES (20, N'SE1720')
SET IDENTITY_INSERT [dbo].[Classes] OFF
GO
SET IDENTITY_INSERT [dbo].[Exam_Schedule] ON 

INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (1, N'AL111L', N'PEA', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-01-08' AS Date), CAST(N'2023-01-15' AS Date), N'10:30', N'12:00', CAST(N'2023-01-22' AS Date), N'HE101010', N'ECC301', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (2, N'AL132R', N'FE', CAST(N'2023-01-02T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-01-09' AS Date), CAST(N'2023-01-16' AS Date), N'16:40', N'18:10', CAST(N'2023-01-23' AS Date), N'HE111111', N'SWR302', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (3, N'AL232L', N'TE', CAST(N'2023-01-03T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-01-10' AS Date), CAST(N'2023-01-17' AS Date), N'10:30', N'12:00', CAST(N'2023-01-24' AS Date), N'HE222222', N'DGT302', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (4, N'AL321R', N'PEA', CAST(N'2023-01-04T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-01-11' AS Date), CAST(N'2023-01-18' AS Date), N'16:40', N'18:10', CAST(N'2023-01-25' AS Date), N'HE333333', N'ECM301', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (5, N'BE112', N'FE', CAST(N'2023-01-05T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-01-12' AS Date), CAST(N'2023-01-19' AS Date), N'10:30', N'12:00', CAST(N'2023-01-26' AS Date), N'HE444444', N'EN062', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (6, N'BE123', N'TE', CAST(N'2023-01-06T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-01-13' AS Date), CAST(N'2023-01-20' AS Date), N'16:40', N'18:10', CAST(N'2023-01-27' AS Date), N'HE555555', N'SWT301', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (7, N'BE222', N'PEA', CAST(N'2023-01-07T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-01-14' AS Date), CAST(N'2023-01-21' AS Date), N'10:30', N'12:00', CAST(N'2023-01-28' AS Date), N'HE666666', N'ECN311', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (8, N'BE523', N'FE', CAST(N'2023-01-08T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-01-15' AS Date), CAST(N'2023-01-22' AS Date), N'16:40', N'18:10', CAST(N'2023-01-29' AS Date), N'HE777777', N'BJP_ELE', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (9, N'DE111', N'TE', CAST(N'2023-01-09T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-01-16' AS Date), CAST(N'2023-01-23' AS Date), N'10:30', N'12:00', CAST(N'2023-02-05' AS Date), N'HE888888', N'CAD201', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (10, N'DE231', N'PEA', CAST(N'2023-01-10T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-01-17' AS Date), CAST(N'2023-01-24' AS Date), N'16:40', N'18:10', CAST(N'2023-02-06' AS Date), N'HE999999', N'ERW412', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (11, N'DE233', N'FE', CAST(N'2023-01-11T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-01-18' AS Date), CAST(N'2023-01-25' AS Date), N'10:30', N'12:00', CAST(N'2023-02-12' AS Date), N'HE101010', N'HS111', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (12, N'DE342', N'TE', CAST(N'2023-01-12T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-01-19' AS Date), CAST(N'2023-01-26' AS Date), N'16:40', N'18:10', CAST(N'2023-02-19' AS Date), N'HE111111', N'LTG201', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (13, N'AL111L', N'PEA', CAST(N'2023-01-13T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-01-20' AS Date), CAST(N'2023-01-27' AS Date), N'10:30', N'12:00', CAST(N'2023-02-26' AS Date), N'HE222222', N'CF112', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (14, N'AL132R', N'FE', CAST(N'2023-01-14T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-01-21' AS Date), CAST(N'2023-01-28' AS Date), N'16:40', N'18:10', CAST(N'2023-03-05' AS Date), N'HE333333', N'JP112', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (15, N'AL232L', N'TE', CAST(N'2023-01-15T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-01-22' AS Date), CAST(N'2023-01-29' AS Date), N'10:30', N'12:00', CAST(N'2023-03-12' AS Date), N'HE444444', N'JPD116', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (16, N'AL321R', N'PEA', CAST(N'2023-01-16T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-01-23' AS Date), CAST(N'2023-02-05' AS Date), N'16:40', N'18:10', CAST(N'2023-03-19' AS Date), N'HE555555', N'CSI103', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (17, N'BE112', N'FE', CAST(N'2023-01-17T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-01-24' AS Date), CAST(N'2023-02-06' AS Date), N'10:30', N'12:00', CAST(N'2023-03-26' AS Date), N'HE666666', N'ELI302', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (18, N'BE123', N'TE', CAST(N'2023-01-18T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-01-25' AS Date), CAST(N'2023-02-12' AS Date), N'16:40', N'18:10', CAST(N'2023-04-02' AS Date), N'HE777777', N'ENW491', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (19, N'BE222', N'PEA', CAST(N'2023-01-19T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-01-26' AS Date), CAST(N'2023-02-19' AS Date), N'10:30', N'12:00', CAST(N'2023-04-09' AS Date), N'HE888888', N'PRJ301', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (20, N'BE523', N'FE', CAST(N'2023-01-20T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-02-05' AS Date), CAST(N'2023-02-26' AS Date), N'16:40', N'18:10', CAST(N'2023-04-16' AS Date), N'HE999999', N'PRN211', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (21, N'BE523', N'PEA', CAST(N'2023-02-20T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-02-27' AS Date), CAST(N'2023-03-06' AS Date), N'10:30', N'12:00', CAST(N'2023-04-23' AS Date), N'HE101010', N'VO101', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (22, N'DE111', N'FE', CAST(N'2023-02-21T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-02-28' AS Date), CAST(N'2023-03-07' AS Date), N'16:40', N'18:10', CAST(N'2023-04-30' AS Date), N'HE111111', N'ECC301', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (23, N'DE231', N'TE', CAST(N'2023-02-22T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-03-01' AS Date), CAST(N'2023-03-08' AS Date), N'10:30', N'12:00', CAST(N'2023-05-07' AS Date), N'HE222222', N'SWR302', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (24, N'DE233', N'PEA', CAST(N'2023-02-23T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-03-02' AS Date), CAST(N'2023-03-09' AS Date), N'16:40', N'18:10', CAST(N'2023-05-14' AS Date), N'HE333333', N'DGT302', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (25, N'DE342', N'FE', CAST(N'2023-02-24T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-03-03' AS Date), CAST(N'2023-03-10' AS Date), N'10:30', N'12:00', CAST(N'2023-05-21' AS Date), N'HE444444', N'ECM301', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (26, N'AL111L', N'TE', CAST(N'2023-02-25T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-03-04' AS Date), CAST(N'2023-03-11' AS Date), N'16:40', N'18:10', CAST(N'2023-05-28' AS Date), N'HE555555', N'EN062', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (27, N'AL132R', N'PEA', CAST(N'2023-02-26T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-03-05' AS Date), CAST(N'2023-03-12' AS Date), N'10:30', N'12:00', CAST(N'2023-06-04' AS Date), N'HE666666', N'SWT301', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (28, N'AL232L', N'FE', CAST(N'2023-02-27T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-03-06' AS Date), CAST(N'2023-03-13' AS Date), N'16:40', N'18:10', CAST(N'2023-06-11' AS Date), N'HE777777', N'ECN311', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (29, N'AL321R', N'TE', CAST(N'2023-02-28T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-03-07' AS Date), CAST(N'2023-03-14' AS Date), N'10:30', N'12:00', CAST(N'2023-06-18' AS Date), N'HE888888', N'BJP_ELE', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (30, N'BE112', N'PEA', CAST(N'2023-03-01T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-03-08' AS Date), CAST(N'2023-03-15' AS Date), N'16:40', N'18:10', CAST(N'2023-06-25' AS Date), N'HE999999', N'CAD201', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (31, N'AL111L', N'PEA', CAST(N'2023-07-01T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-07-08' AS Date), CAST(N'2023-07-15' AS Date), N'10:30', N'12:00', CAST(N'2023-07-22' AS Date), N'HE101010', N'ENW491', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (32, N'AL132R', N'FE', CAST(N'2023-07-02T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-07-09' AS Date), CAST(N'2023-07-16' AS Date), N'16:40', N'18:10', CAST(N'2023-07-23' AS Date), N'HE111111', N'PRJ301', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (33, N'AL232L', N'TE', CAST(N'2023-07-03T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-07-10' AS Date), CAST(N'2023-07-17' AS Date), N'10:30', N'12:00', CAST(N'2023-07-24' AS Date), N'HE222222', N'PRN211', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (34, N'AL321R', N'PEA', CAST(N'2023-07-04T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-07-11' AS Date), CAST(N'2023-07-18' AS Date), N'16:40', N'18:10', CAST(N'2023-07-25' AS Date), N'HE333333', N'PRN221', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (35, N'BE112', N'FE', CAST(N'2023-07-05T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-07-12' AS Date), CAST(N'2023-07-19' AS Date), N'10:30', N'12:00', CAST(N'2023-07-26' AS Date), N'HE444444', N'VO101', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (36, N'BE123', N'TE', CAST(N'2023-07-06T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-07-13' AS Date), CAST(N'2023-07-20' AS Date), N'16:40', N'18:10', CAST(N'2023-07-27' AS Date), N'HE555555', N'CAD201', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (37, N'BE222', N'PEA', CAST(N'2023-07-07T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-07-14' AS Date), CAST(N'2023-07-21' AS Date), N'10:30', N'12:00', CAST(N'2023-07-28' AS Date), N'HE666666', N'ERW412', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (38, N'BE523', N'FE', CAST(N'2023-07-08T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-07-15' AS Date), CAST(N'2023-07-22' AS Date), N'16:40', N'18:10', CAST(N'2023-07-29' AS Date), N'HE777777', N'FIN201', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (39, N'DE111', N'TE', CAST(N'2023-07-09T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-07-16' AS Date), CAST(N'2023-07-23' AS Date), N'10:30', N'12:00', CAST(N'2023-07-30' AS Date), N'HE888888', N'HS111', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (40, N'DE231', N'PEA', CAST(N'2023-07-10T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-07-17' AS Date), CAST(N'2023-07-24' AS Date), N'16:40', N'18:10', CAST(N'2023-08-06' AS Date), N'HE999999', N'LTG201', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (41, N'DE233', N'FE', CAST(N'2023-07-11T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-07-18' AS Date), CAST(N'2023-07-25' AS Date), N'10:30', N'12:00', CAST(N'2023-08-13' AS Date), N'HE101010', N'CF112', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (42, N'DE342', N'TE', CAST(N'2023-07-12T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-07-19' AS Date), CAST(N'2023-07-26' AS Date), N'16:40', N'18:10', CAST(N'2023-08-20' AS Date), N'HE111111', N'JP112', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (43, N'AL111L', N'PEA', CAST(N'2023-07-13T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-07-20' AS Date), CAST(N'2023-07-27' AS Date), N'10:30', N'12:00', CAST(N'2023-08-27' AS Date), N'HE222222', N'JPD116', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (44, N'AL132R', N'FE', CAST(N'2023-07-14T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-07-21' AS Date), CAST(N'2023-07-28' AS Date), N'16:40', N'18:10', CAST(N'2023-09-03' AS Date), N'HE333333', N'CSI103', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (45, N'AL232L', N'TE', CAST(N'2023-07-15T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-07-22' AS Date), CAST(N'2023-07-29' AS Date), N'10:30', N'12:00', CAST(N'2023-09-10' AS Date), N'HE444444', N'ELI302', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (46, N'AL321R', N'PEA', CAST(N'2023-07-16T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-07-23' AS Date), CAST(N'2023-07-30' AS Date), N'16:40', N'18:10', CAST(N'2023-09-17' AS Date), N'HE555555', N'ENW491', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (47, N'BE112', N'FE', CAST(N'2023-07-17T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-07-24' AS Date), CAST(N'2023-07-31' AS Date), N'10:30', N'12:00', CAST(N'2023-09-24' AS Date), N'HE666666', N'PRJ301', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (48, N'BE123', N'TE', CAST(N'2023-07-18T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-07-25' AS Date), CAST(N'2023-08-01' AS Date), N'16:40', N'18:10', CAST(N'2023-10-01' AS Date), N'HE777777', N'PRN211', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (49, N'BE222', N'PEA', CAST(N'2023-07-19T00:00:00.000' AS DateTime), N'07:30', N'09:00', CAST(N'2023-08-01' AS Date), CAST(N'2023-08-08' AS Date), N'10:30', N'12:00', CAST(N'2023-10-08' AS Date), N'HE888888', N'PRN221', 8)
INSERT [dbo].[Exam_Schedule] ([exam_schedule_id], [room], [type_of_exam], [date], [time_from], [time_to], [date_of_public], [date_of_resit], [time_from_resit], [time_to_resit], [date_of_public_resit], [lecture_id], [subject_id], [semester_id]) VALUES (50, N'BE523', N'FE', CAST(N'2023-07-20T00:00:00.000' AS DateTime), N'14:10', N'15:40', CAST(N'2023-08-02' AS Date), CAST(N'2023-08-09' AS Date), N'16:40', N'18:10', CAST(N'2023-10-15' AS Date), N'HE999999', N'VO101', 8)
SET IDENTITY_INSERT [dbo].[Exam_Schedule] OFF
GO
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise1', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ECC301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise10', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ERW412')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise100', 0.2, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'BJP_ELE')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise11', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'FIN201')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise12', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'HS111')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise13', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'LTG201')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise14', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'CF112')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise15', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'JP112')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise16', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'JPD116')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise17', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'CSI103')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise18', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ELI302')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise19', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ENW491')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise2', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'SWR302')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise20', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'PRJ301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise21', 0.25, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'PRN211')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise22', 0.25, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'PRN221')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise23', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'VO101')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise24', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ECC301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise25', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'SWR302')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise26', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'DGT302')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise27', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ECM301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise28', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'EN062')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise29', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'SWT301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise3', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'DGT302')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise30', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ECN311')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise31', 0.2, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'BJP_ELE')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise32', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'CAD201')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise33', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ERW412')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise34', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'FIN201')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise35', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'HS111')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise36', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'LTG201')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise37', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'CF112')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise38', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'JP112')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise39', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'JPD116')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise4', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ECM301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise40', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'CSI103')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise41', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ELI302')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise42', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ENW491')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise43', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'PRJ301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise44', 0.25, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'PRN211')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise45', 0.25, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'PRN221')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise46', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'VO101')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise47', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ECC301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise48', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'SWR302')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise49', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'DGT302')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise5', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'EN062')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise50', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ECM301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise51', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'EN062')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise52', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'SWT301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise53', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ECN311')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise54', 0.2, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'BJP_ELE')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise55', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'CAD201')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise56', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ERW412')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise57', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'FIN201')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise58', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'HS111')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise59', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'LTG201')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise6', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'SWT301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise60', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'CF112')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise61', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'JP112')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise62', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'JPD116')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise63', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'CSI103')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise64', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ELI302')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise65', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ENW491')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise66', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'PRJ301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise67', 0.25, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'PRN211')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise68', 0.25, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'PRN221')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise69', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'VO101')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise7', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ECN311')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise70', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ECC301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise71', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'SWR302')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise72', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'DGT302')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise73', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ECM301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise74', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'EN062')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise75', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'SWT301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise76', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ECN311')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise77', 0.2, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'BJP_ELE')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise78', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'CAD201')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise79', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ERW412')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise8', 0.2, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'BJP_ELE')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise80', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'FIN201')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise81', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'HS111')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise82', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'LTG201')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise83', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'CF112')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise84', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'JP112')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise85', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'JPD116')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise86', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'CSI103')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise87', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ELI302')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise88', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ENW491')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise89', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'PRJ301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise9', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'CAD201')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise90', 0.25, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'PRN211')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise91', 0.25, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'PRN221')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise92', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'VO101')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise93', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ECC301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise94', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'SWR302')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise95', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'DGT302')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise96', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ECM301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise97', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'EN062')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise98', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'SWT301')
INSERT [dbo].[Excercies] ([exercise_name], [percentage], [dateline], [subject_id]) VALUES (N'Exercise99', 0.31, CAST(N'2023-10-03T00:00:00.000' AS DateTime), N'ECN311')
GO
INSERT [dbo].[Lectures] ([lecture_id], [lecture_name], [lecture_email], [password], [dob], [phone], [role_id]) VALUES (N'HE101010', N'Nguyen Dang Long', N'longndhe101010@fpt.edu.vn', N'2', CAST(N'1888-08-08T00:00:00.000' AS DateTime), N'101010XXXX', 2)
INSERT [dbo].[Lectures] ([lecture_id], [lecture_name], [lecture_email], [password], [dob], [phone], [role_id]) VALUES (N'HE111111', N'Le Van Chung', N'chunglvhe111111@fpt.edu.vn', N'2', CAST(N'1984-01-03T00:00:00.000' AS DateTime), N'1111111XXX', 2)
INSERT [dbo].[Lectures] ([lecture_id], [lecture_name], [lecture_email], [password], [dob], [phone], [role_id]) VALUES (N'HE222222', N'Chu Thi Minh Huy', N'huetmhhe222222@fpt.edu.vn', N'2', CAST(N'1999-12-04T00:00:00.000' AS DateTime), N'2222222XXX', 2)
INSERT [dbo].[Lectures] ([lecture_id], [lecture_name], [lecture_email], [password], [dob], [phone], [role_id]) VALUES (N'HE333333', N'Khuat Tat Chung', N'chungkthe333333@fpt.edu.vn', N'2', CAST(N'1990-11-03T00:00:00.000' AS DateTime), N'3333333XXX', 2)
INSERT [dbo].[Lectures] ([lecture_id], [lecture_name], [lecture_email], [password], [dob], [phone], [role_id]) VALUES (N'HE444444', N'Vuong Minh Tuan', N'tuanvmhe444444@fpt.edu.vn', N'2', CAST(N'1993-02-21T00:00:00.000' AS DateTime), N'4444444XXX', 2)
INSERT [dbo].[Lectures] ([lecture_id], [lecture_name], [lecture_email], [password], [dob], [phone], [role_id]) VALUES (N'HE555555', N'Nguyen Ngoc Anh', N'anhnnhe555555@fpt.edu.vn', N'2', CAST(N'1999-01-01T00:00:00.000' AS DateTime), N'5555555XXX', 2)
INSERT [dbo].[Lectures] ([lecture_id], [lecture_name], [lecture_email], [password], [dob], [phone], [role_id]) VALUES (N'HE666666', N'Nguyen Thi Van Anh', N'anhntvhe666666@fpt.edu.vn', N'2', CAST(N'1998-03-12T00:00:00.000' AS DateTime), N'6666666XXX', 2)
INSERT [dbo].[Lectures] ([lecture_id], [lecture_name], [lecture_email], [password], [dob], [phone], [role_id]) VALUES (N'HE777777', N'Nguyen Thanh Don', N'donnthe777777@fpt.edu.vn', N'2', CAST(N'1888-12-03T00:00:00.000' AS DateTime), N'7777777XXX', 2)
INSERT [dbo].[Lectures] ([lecture_id], [lecture_name], [lecture_email], [password], [dob], [phone], [role_id]) VALUES (N'HE888888', N'Ta Dinh Tien', N'tiendthe888888@fpt.edu.vn', N'2', CAST(N'1990-10-11T00:00:00.000' AS DateTime), N'8888888XXX', 2)
INSERT [dbo].[Lectures] ([lecture_id], [lecture_name], [lecture_email], [password], [dob], [phone], [role_id]) VALUES (N'HE999999', N'Tran Quy Ban', N'bantqhe999999@fpt.edu.vn', N'2', CAST(N'1880-11-30T00:00:00.000' AS DateTime), N'9999999XXX', 2)
INSERT [dbo].[Lectures] ([lecture_id], [lecture_name], [lecture_email], [password], [dob], [phone], [role_id]) VALUES (N'huongnt7', N'Nguyen Thuy Huong', N'huongnt7@fe.edu.vn', N'123', NULL, N'0943129291', 2)
GO
INSERT [dbo].[Majors] ([major_id], [major_name]) VALUES (N'AI', N'Artificial Intelligence')
INSERT [dbo].[Majors] ([major_id], [major_name]) VALUES (N'GD', N'Graphic Design')
INSERT [dbo].[Majors] ([major_id], [major_name]) VALUES (N'IS', N'Information Security')
INSERT [dbo].[Majors] ([major_id], [major_name]) VALUES (N'NJ', N'Japanese')
INSERT [dbo].[Majors] ([major_id], [major_name]) VALUES (N'KOR', N'Korean')
INSERT [dbo].[Majors] ([major_id], [major_name]) VALUES (N'MKT', N'Marketing')
INSERT [dbo].[Majors] ([major_id], [major_name]) VALUES (N'SE', N'Software Engineering')
GO
INSERT [dbo].[Rooms] ([room_id]) VALUES (N'AL111L')
INSERT [dbo].[Rooms] ([room_id]) VALUES (N'AL132R')
INSERT [dbo].[Rooms] ([room_id]) VALUES (N'AL232L')
INSERT [dbo].[Rooms] ([room_id]) VALUES (N'AL321R')
INSERT [dbo].[Rooms] ([room_id]) VALUES (N'BE112')
INSERT [dbo].[Rooms] ([room_id]) VALUES (N'BE123')
INSERT [dbo].[Rooms] ([room_id]) VALUES (N'BE222')
INSERT [dbo].[Rooms] ([room_id]) VALUES (N'BE523')
INSERT [dbo].[Rooms] ([room_id]) VALUES (N'DE111')
INSERT [dbo].[Rooms] ([room_id]) VALUES (N'DE231')
INSERT [dbo].[Rooms] ([room_id]) VALUES (N'DE233')
INSERT [dbo].[Rooms] ([room_id]) VALUES (N'DE342')
GO
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([semester_id], [class_semester_name], [year]) VALUES (1, N'Spring', 2022)
INSERT [dbo].[Semester] ([semester_id], [class_semester_name], [year]) VALUES (2, N'Summer', 2022)
INSERT [dbo].[Semester] ([semester_id], [class_semester_name], [year]) VALUES (3, N'Fall', 2022)
INSERT [dbo].[Semester] ([semester_id], [class_semester_name], [year]) VALUES (4, N'Spring', 2023)
INSERT [dbo].[Semester] ([semester_id], [class_semester_name], [year]) VALUES (5, N'Summer', 2023)
INSERT [dbo].[Semester] ([semester_id], [class_semester_name], [year]) VALUES (7, N'Fall', 2023)
INSERT [dbo].[Semester] ([semester_id], [class_semester_name], [year]) VALUES (8, N'Spring', 2024)
INSERT [dbo].[Semester] ([semester_id], [class_semester_name], [year]) VALUES (9, N'Summer', 2024)
INSERT [dbo].[Semester] ([semester_id], [class_semester_name], [year]) VALUES (10, N'Fall', 2024)
SET IDENTITY_INSERT [dbo].[Semester] OFF
GO
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [password], [dob], [phone], [semester], [role_id], [major_id], [gender], [isActive], [class_id]) VALUES (N'HE134234', N'Nguyen Van Kien', N'kiennvhe134234@fpt.edu.vn', N'1', CAST(N'1999-05-12T00:00:00.000' AS DateTime), N'1231234XXX', 9, 3, N'AI', 1, 1, 3)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [password], [dob], [phone], [semester], [role_id], [major_id], [gender], [isActive], [class_id]) VALUES (N'HE143000', N'Nguyen Thi Hong', N'hongnthe143000@fpt.edu.vn', N'1', CAST(N'2000-01-31T00:00:00.000' AS DateTime), N'1221212XXX', 6, 3, N'MKT', 0, 1, 3)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [password], [dob], [phone], [semester], [role_id], [major_id], [gender], [isActive], [class_id]) VALUES (N'HE143232', N'Nguyen Dinh Huy', N'huyndhe143232@fpt.edu.vn', N'1', CAST(N'2004-12-11T00:00:00.000' AS DateTime), N'2323238XXX', 4, 3, N'AI', 1, 1, 3)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [password], [dob], [phone], [semester], [role_id], [major_id], [gender], [isActive], [class_id]) VALUES (N'HE143921', N'Phan Kim Kien', N'lienpkhe143921@fpt.edu.vn', N'1', CAST(N'2000-12-01T00:00:00.000' AS DateTime), N'212113XXX', 6, 3, N'MKT', 0, 1, 3)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [password], [dob], [phone], [semester], [role_id], [major_id], [gender], [isActive], [class_id]) VALUES (N'HE153211', N'Le Van Xuan', N'xuanlvhe153211@fpt.edu.vn', N'1', CAST(N'2003-08-23T00:00:00.000' AS DateTime), N'2342332XXX', 5, 3, N'IS', 1, 1, 3)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [password], [dob], [phone], [semester], [role_id], [major_id], [gender], [isActive], [class_id]) VALUES (N'HE159242', N'Tran Han Thinh', N'thinhhthe159242@fpt.edu.vn', N'1', CAST(N'2001-11-02T00:00:00.000' AS DateTime), N'21313122XX', 8, 3, N'KOR', 1, 1, 3)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [password], [dob], [phone], [semester], [role_id], [major_id], [gender], [isActive], [class_id]) VALUES (N'He163111', N'Mai Duc Huy', N'huymt@gmail.com', N'1', NULL, N'09441140101', 3, 3, N'AI', 1, 1, 3)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [password], [dob], [phone], [semester], [role_id], [major_id], [gender], [isActive], [class_id]) VALUES (N'HE163841', N'Mai Trong Hieu', N'hieumthe163841@fpt.edu.vn', N'123', NULL, N'0943317918', 7, 3, N'SE', 1, 1, 3)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [password], [dob], [phone], [semester], [role_id], [major_id], [gender], [isActive], [class_id]) VALUES (N'HE163898', N'Nguyen Hong Son', N'sonnhhe163898@fpt.edu.vn', N'1', CAST(N'2002-11-01T00:00:00.000' AS DateTime), N'123456XXX', 7, 3, N'SE', 1, 1, 3)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [password], [dob], [phone], [semester], [role_id], [major_id], [gender], [isActive], [class_id]) VALUES (N'HE164012', N'Mai Trong Hieu', N'hieumehe164012@fpt.edu.vn', N'1', CAST(N'2002-04-02T00:00:00.000' AS DateTime), N'1234512XXX', 7, 3, N'SE', 1, 1, 1)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [password], [dob], [phone], [semester], [role_id], [major_id], [gender], [isActive], [class_id]) VALUES (N'HE164018', N'Nguyen Dinh Cuong', N'cuongndhe164018@fpt.edu.vn', N'1', CAST(N'2002-01-01T00:00:00.000' AS DateTime), N'3456789XXX', 7, 3, N'SE', 1, 1, 1)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [password], [dob], [phone], [semester], [role_id], [major_id], [gender], [isActive], [class_id]) VALUES (N'HE169212', N'Nguyen Minh Tam', N'tamnmhe169212@fpt.edu.vn', N'1', CAST(N'2003-12-03T00:00:00.000' AS DateTime), N'32323XXX', 5, 3, N'IS', 1, 1, 1)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [password], [dob], [phone], [semester], [role_id], [major_id], [gender], [isActive], [class_id]) VALUES (N'HE172123', N'Le Thi Hoai', N'hoailthe172123@fpt.edu.vn', N'1', CAST(N'2003-07-12T00:00:00.000' AS DateTime), N'233324XXX', 3, 3, N'NJ', 0, 1, 1)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [password], [dob], [phone], [semester], [role_id], [major_id], [gender], [isActive], [class_id]) VALUES (N'HE183231', N'Le Thuy Linh', N'linhlthe183231@fpt.edu.vn', N'123', CAST(N'2004-12-04T00:00:00.000' AS DateTime), N'232323XXX', 0, 3, N'NJ', 0, 1, 3)
INSERT [dbo].[Students] ([student_id], [student_name], [student_email], [password], [dob], [phone], [semester], [role_id], [major_id], [gender], [isActive], [class_id]) VALUES (N'HE183242', N'Nguyen Thu Thao', N'thaonthe183242@fpt.edu.vn', N'1', CAST(N'2004-10-01T00:00:00.000' AS DateTime), N'43434894XXX', 2, 3, N'GD', 0, 1, 1)
GO
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE134234', 14)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE134234', 40)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE143000', 2)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE143000', 15)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE143000', 28)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE143000', 41)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE143921', 17)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE143921', 30)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE143921', 43)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE153211', 5)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE153211', 18)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE153211', 31)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE153211', 44)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE159242', 6)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE159242', 19)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE159242', 32)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE159242', 45)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE163841', 3)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE163841', 4)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE163841', 16)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE163841', 29)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE163841', 42)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE163898', 7)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE163898', 20)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE163898', 33)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE163898', 46)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE164012', 1)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE164012', 8)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE164012', 21)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE164012', 24)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE164012', 34)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE164012', 37)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE164012', 47)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE164012', 50)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE164018', 9)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE164018', 22)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE164018', 35)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE164018', 48)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE169212', 10)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE169212', 23)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE169212', 36)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE169212', 49)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE172123', 11)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE183231', 12)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE183231', 25)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE183231', 27)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE183231', 38)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE183242', 13)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE183242', 26)
INSERT [dbo].[Students_Exam_Schedule] ([student_id], [exam_schedule_id]) VALUES (N'HE183242', 39)
GO
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE134234', N'Exercise1', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE134234', N'Exercise14', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE134234', N'Exercise18', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE134234', N'Exercise27', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE134234', N'Exercise31', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE134234', N'Exercise40', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE134234', N'Exercise44', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE134234', N'Exercise5', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE134234', N'Exercise53', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE134234', N'Exercise57', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE134234', N'Exercise66', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE134234', N'Exercise70', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE134234', N'Exercise79', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE134234', N'Exercise83', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE134234', N'Exercise92', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE134234', N'Exercise96', 8.03)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143000', N'Exercise15', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143000', N'Exercise19', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143000', N'Exercise2', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143000', N'Exercise28', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143000', N'Exercise32', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143000', N'Exercise41', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143000', N'Exercise45', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143000', N'Exercise54', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143000', N'Exercise58', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143000', N'Exercise6', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143000', N'Exercise67', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143000', N'Exercise71', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143000', N'Exercise80', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143000', N'Exercise84', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143000', N'Exercise93', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143000', N'Exercise97', 8.03)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143232', N'Exercise16', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143232', N'Exercise20', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143232', N'Exercise29', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143232', N'Exercise3', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143232', N'Exercise33', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143232', N'Exercise42', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143232', N'Exercise46', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143232', N'Exercise55', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143232', N'Exercise59', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143232', N'Exercise68', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143232', N'Exercise7', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143232', N'Exercise72', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143232', N'Exercise81', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143232', N'Exercise85', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143232', N'Exercise94', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143232', N'Exercise98', 8.03)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143921', N'Exercise17', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143921', N'Exercise21', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143921', N'Exercise30', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143921', N'Exercise34', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143921', N'Exercise4', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143921', N'Exercise43', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143921', N'Exercise47', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143921', N'Exercise56', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143921', N'Exercise60', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143921', N'Exercise69', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143921', N'Exercise73', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143921', N'Exercise8', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143921', N'Exercise82', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143921', N'Exercise86', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143921', N'Exercise95', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE143921', N'Exercise99', 8.03)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE153211', N'Exercise100', 8.03)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE153211', N'Exercise18', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE153211', N'Exercise22', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE153211', N'Exercise31', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE153211', N'Exercise35', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE153211', N'Exercise44', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE153211', N'Exercise48', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE153211', N'Exercise5', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE153211', N'Exercise57', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE153211', N'Exercise61', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE153211', N'Exercise70', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE153211', N'Exercise74', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE153211', N'Exercise83', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE153211', N'Exercise87', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE153211', N'Exercise9', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE153211', N'Exercise96', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE159242', N'Exercise10', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE159242', N'Exercise19', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE159242', N'Exercise23', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE159242', N'Exercise32', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE159242', N'Exercise36', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE159242', N'Exercise45', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE159242', N'Exercise49', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE159242', N'Exercise58', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE159242', N'Exercise6', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE159242', N'Exercise62', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE159242', N'Exercise71', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE159242', N'Exercise75', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE159242', N'Exercise84', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE159242', N'Exercise88', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE159242', N'Exercise97', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE163898', N'Exercise11', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE163898', N'Exercise20', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE163898', N'Exercise24', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE163898', N'Exercise33', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE163898', N'Exercise37', 8.01)
GO
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE163898', N'Exercise46', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE163898', N'Exercise50', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE163898', N'Exercise59', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE163898', N'Exercise63', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE163898', N'Exercise7', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE163898', N'Exercise72', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE163898', N'Exercise76', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE163898', N'Exercise85', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE163898', N'Exercise89', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE163898', N'Exercise98', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164012', N'Exercise12', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164012', N'Exercise21', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164012', N'Exercise25', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164012', N'Exercise34', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164012', N'Exercise38', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164012', N'Exercise47', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164012', N'Exercise51', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164012', N'Exercise60', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164012', N'Exercise64', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164012', N'Exercise73', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164012', N'Exercise77', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164012', N'Exercise8', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164012', N'Exercise86', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164012', N'Exercise90', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164012', N'Exercise99', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164018', N'Exercise100', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164018', N'Exercise13', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164018', N'Exercise22', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164018', N'Exercise26', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164018', N'Exercise35', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164018', N'Exercise39', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164018', N'Exercise48', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164018', N'Exercise52', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164018', N'Exercise61', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164018', N'Exercise65', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164018', N'Exercise74', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164018', N'Exercise78', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164018', N'Exercise87', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164018', N'Exercise9', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE164018', N'Exercise91', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE169212', N'Exercise1', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE169212', N'Exercise10', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE169212', N'Exercise14', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE169212', N'Exercise23', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE169212', N'Exercise27', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE169212', N'Exercise36', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE169212', N'Exercise40', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE169212', N'Exercise49', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE169212', N'Exercise53', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE169212', N'Exercise62', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE169212', N'Exercise66', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE169212', N'Exercise75', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE169212', N'Exercise79', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE169212', N'Exercise88', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE169212', N'Exercise92', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE172123', N'Exercise11', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE172123', N'Exercise15', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE172123', N'Exercise2', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE172123', N'Exercise24', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE172123', N'Exercise28', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE172123', N'Exercise37', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE172123', N'Exercise41', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE172123', N'Exercise50', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE172123', N'Exercise54', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE172123', N'Exercise63', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE172123', N'Exercise67', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE172123', N'Exercise76', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE172123', N'Exercise80', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE172123', N'Exercise89', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE172123', N'Exercise93', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183231', N'Exercise12', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183231', N'Exercise16', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183231', N'Exercise22', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183231', N'Exercise25', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183231', N'Exercise29', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183231', N'Exercise3', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183231', N'Exercise38', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183231', N'Exercise42', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183231', N'Exercise45', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183231', N'Exercise51', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183231', N'Exercise55', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183231', N'Exercise64', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183231', N'Exercise68', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183231', N'Exercise77', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183231', N'Exercise90', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183242', N'Exercise13', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183242', N'Exercise17', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183242', N'Exercise22', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183242', N'Exercise26', 7.99)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183242', N'Exercise30', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183242', N'Exercise39', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183242', N'Exercise4', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183242', N'Exercise43', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183242', N'Exercise45', 8.01)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183242', N'Exercise52', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183242', N'Exercise56', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183242', N'Exercise65', 8)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183242', N'Exercise68', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183242', N'Exercise69', 8.02)
INSERT [dbo].[Students_Excercies] ([student_id], [exercise_name], [mark]) VALUES (N'HE183242', N'Exercise78', 8)
GO
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'2DP491', N'Digital project 2D', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'3DP491', N'Digital project 3D', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AAD305b', N'Final Project - Automotive Application Development', 5)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ACC101', N'Principles of Accounting', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ACC191', N'Principles of Accounting and Finance', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ACC302', N'Managerial Accounting', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ACC305', N'Financial Statement Analysis', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ACH301', N'Accommodation Management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ADB201', N'Book Design & Printing Technology', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ADE301', N'Visual Communication Project', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ADG201', N'Brand Identity Design', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ADG301', N'Book and Packaging Design', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ADH301', N'Mobility Applications Design 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ADP201', N'Audio Production', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ADP301', N'Packaging design', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ADS301', N'Google ads and SEO', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ADT401', N'Mobility Applications Design 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ADY201m', N'AI, DS with Python & SQL', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AET101', N'Aesthetic', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AFA201', N'Human Anatomy for Artis', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AGD301', N'Information Graphic Design', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AI-000001', N'Elective 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AI-000002', N'Elective 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AI-000003c', N'Elective 3', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AI-000004', N'Elective 4', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AI-000005', N'Elective 5', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AIB301c', N'AI for Business', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AID301c', N'AI in Production', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AIG201', N'Artificial Intelligence', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AIH301m', N'AI in Healthcare', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AIL301', N'Machine Learning', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AIM301m', N'AI for Medicine', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AIP391', N'AI programming project', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AIP490', N'AI Capstone Project', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AIT301', N'AI with Tensorflow', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AMR401', N'3D Modeling & Rigging', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ANA401', N'3D Character Animation', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ANB401', N'Background Painting for Animation', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ANC301', N'Character Development', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ANM301', N'3D Modeling & Texturing (Maya)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ANM312', N'Visual tool 3D', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ANM322', N'3D Modeling & Shading', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ANO301', N'Visual development for digital design', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ANR401', N'Introduction to Rigging', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ANS201', N'Idea & Script Development', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ANS301', N'Storyboarding', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ANT401', N'Traditional Animation Principles', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ANV301', N'Visual Development for Computer Animation', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ASR301c', N'AI for Scientific Research', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ATC201', N'Automata Theory and Computational Complexity', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'AVC101', N'Asian Culture', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BD201', N'Football', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BDI301c', N'Big Data', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BDM201', N'Business Decision Making', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BDP301b', N'Blockchain Basics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BDP302b', N'Smart Contract', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BDP303b', N'Decentralized Application Development (Dapps)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BDP304b', N'Blockchain Platforms', 1)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BDP306b', N'Final Project - Blockchain Development in Finance', 5)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BEN_ELE', N'Graduation Elective - English', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BEN_GRA_ELE', N'BEN Graduation Elective', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BJP_ELE', N'Graduation Thesis-Japanese Studies', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BKG201', N'Principles of Banking', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BKG301', N'Bank Management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BKG302', N'Investment Project Appraisal', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BKG304', N'Bank Lending', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BKR_COM*1', N'Subject 1 of combo', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BKR_COM*2', N'Subject 2 of combo', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BKR_COM*3', N'Subject 3 of combo', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BKR_COM*4', N'Subject 4 of combo', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BKR_COM*5', N'Subject 5 of combo', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BKR_ELE', N'Graduation Elective', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BPS301', N'Business Process Management Systems', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BRA301', N'Brand Management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BSI201', N'Business Statistics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BUE201', N'Business ethics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BUSI1317.1', N'Strategic Management 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BUSI1317.2', N'Strategic Management 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'BUSI1323', N'Leadership', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CAA201', N'Communications and advertising', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CAD201', N'Water Color', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CCC101', N'Cross Culture Communications', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CCM201', N'Communication crisis management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CCM301', N'Crisis Communications Management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CCO201', N'Corporate Communication', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CEA201', N'Computer Organization and Architecture', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CEC201', N'Circuits and Signals', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CES201', N'System Support and Trouble Shooting for Windows Server 2012', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CES202', N'System Support and Trouble Shooting', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CF001', N'Programming with Alice', 1)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CF100', N'Introduction to Computing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CF101', N'Programming Fundamentals', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CF102', N'Object-Oriented Paradigm', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CF103', N'Data Structures and Algorithms', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CF104', N'Operating Systems and Network', 4)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CF104-1', N'Operating Systems', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CF104-2', N'Networking', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CF105', N'Introduction to Databases', 4)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CF110', N'Core Java', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CF111', N'Advanced Java', 2)
GO
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CF112', N'.NET and C#', 4)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CF205', N'Java Application Development', 4)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CGG201', N'Computer Graphics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CIH201', N'Contemporary issues in hotel and tourism management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CMC201c', N'Creative Writing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000004', N'English 4', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000005', N'Business English', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000006', N'English for Information and Communication Technology (ICT)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000007', N'Sounds and Words (phonetics, phonology and morphology)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000008', N'British Cultures and Literature', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000009', N'Sociolinguistics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000010', N'English Language and Communication Project', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000011', N'American Cultures and Literature', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000012', N'Translation', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000013', N'Structures and Meanings (Syntax, Semantics and Pragmatics)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000014', N'Intercultural communication', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000015', N'Interpretation', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000016', N'Software Development Process', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000017', N'Introduction to International Business', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000018', N'Second foreign language 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000019', N'Business Project', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000020', N'Cross cultural management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000021', N'Information Systems', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000022', N'Global Business Environment', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000023', N'Second foreign language (2)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000024', N'Vietnamese cultural base', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000030', N'English 4.1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000034', N'Business writing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000035', N'Translation 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000036', N'Interpretation 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000037', N'Foreign language 2_1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000038', N'Effective Presentation Skills', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000039', N'Translation 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000040', N'Interpretation 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000041', N'Foreign language 2_2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000042', N'Foreign language 2_3', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CO-000043', N'English for international standardized tests', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'COM201', N'Communication Management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'COMP101', N'CompTIA A+', 1)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'COV111', N'Chess 1', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'COV121', N'Chess 2', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'COV131', N'Chess 3', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CPP101b', N'Basic C++ Programming', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CPP201b', N'Advanced C++ Programming', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CPV301', N'Computer Vision', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CQT201b', N'Create UI in C++ using Qt/QML', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CRY301', N'Cryptography and Applications', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CRY302', N'Introduction to Applied Cryptography', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CRY302c', N'Applied Cryptography', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CS-000002', N'Python Programming', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CS-000003', N'Systems Programming', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CS-000004', N'IT elective 2 (Machine Learning)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CS-00002', N'Free Elective 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CSD202', N'Data structures and algorithms (In C++)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CSD203', N'Data Structures and Algorithm with Python', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CSD301', N'Advanced Algorithms', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CSI101', N'Connecting to Computer Science', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CSI102', N'Introduction to Informatics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CSI103', N'Computer science fundamentals', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CSI104', N'Introduction to Computer Science', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CSL201', N'Programming languages', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CSP201m', N'Content Strategy for Professionals', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CSP491', N'Graduation thesis', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CST491', N'Graduation Assignment for CS', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CHN111', N'Elementary Chinese 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CHN122', N'Elementary Chinese 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CHN132', N'Elementary Chinese 3', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'CHN141', N'Chinese Elementary 4', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DAP391m', N'AI-DS Project', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DAT301m', N'AI Development with TensorFlow', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DBD301', N'Advanced Database', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DBM301', N'Data mining', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DBP391', N'Data Mining Project', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DBS401', N'Database Security', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DBW301', N'Data warehouse', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DGT201', N'Digital Fundamentals', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DGT202', N'Digital Design', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DGT301', N'Digital Signal Processing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DGT302', N'Visual Effects - Principles of Compositing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DID301', N'Thi?t k? d? ho? d? li?u & thông tin', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DLP301m', N'Deep Learning', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DM101', N'Discrete Mathematics 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DM102', N'Discrete Mathematics 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DMA301m', N'Digital Marketing Analytics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DMS301m', N'Digital Marketing Strategy', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DMS401', N'Applied Data Mining for Information assurance', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DMT301', N'Data mining with Tensorflow', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DPL301m', N'Deep Learing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DRA301', N'Character Design', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DRD201', N'Drawing - Speed drawing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DRF201', N'Drawing - Figure drawing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DRP101', N'Drawing - Plaster Statue, Portrait', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DRS101', N'Drawing - Form, Still-life', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DRW101', N'H?nh h?a co b?n', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DRW201', N'Interediate Drawing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DSA101', N'Traditional musical instrument - Sao Truc', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DSR301m', N'Applied Data Science with R', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DSS301', N'Decision Support Systems', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DTA301', N'Data Analytics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DTB102', N'Traditional musical instrument - Dan Ty Ba', 3)
GO
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DTG101', N'Digital Tool - 2D', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DTG102', N'Visual Design Tools', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DTG111', N'Visual Design Tools 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DTG121', N'Visual Design Tools 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DTG201', N'3D Digital Tool', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DTG301', N'Digital Tool - Interactive', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DTG303', N'Principles of Animation', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DTR101', N'Traditional musical instrument - Dan Tranh', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'DWP301c', N'Web Development with Python', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'E-AE1', N'Advanced English 1', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'E-AE2', N'Advanced English 2', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EAL201', N'Academic Listening', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EAL202', N'Academic English Listening', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EAW211', N'Academic Paper 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EAW212', N'Academic English Writing 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EAW221', N'Academic Writing 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EAW222', N'Academic English Writing 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EB111', N'Elementary Business English', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EB121', N'Pre-intermediate Business English', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EB131', N'Intermediate Business English', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EB141', N'Upper-intermediate Business English', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EB231', N'Upper Intermediate Business English', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EB241', N'Upper Intermediate Business English 2', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EB331', N'MKL Intermediate Business English 3', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EBC301', N'Business English Communication', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECB101', N'Culture of English-Speaking Countries', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECC301', N'Cross-cultural Communication', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECM301', N'Mobile Communications', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECM391', N'Wireless and Mobile Systems', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECM392', N'Wireless and Mobile Communication Security', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECN_COM*1', N'1st combo course', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECN_COM*2', N'2nd combo course', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECN_COM*3', N'3rd combo course', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECN_COM*4', N'4th combo course', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECN101', N'Integrated Chinese 1', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECN221', N'Integrated Chinese 3', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECN311', N'Integrated Chinese 4', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECN321', N'Integrated Chinese 5', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECO101', N'Business environment', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECO111', N'Microeconomics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECO121', N'Basic Macro Economics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECO201', N'International Economics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECO202', N'Macroeconomics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECO301', N'Optical Communications', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECP491', N'Capstone Project for EC', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECR201', N'Critical Reading', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECR202', N'Critical Reading in English', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECR211', N'Critical Reading 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECR221', N'Critical Reading 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ECS211', N'Communications Systems 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EDT202c', N'Emerging Digital Technologies', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EEA211', N'Electronics 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EEA221', N'Electronics 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EIT201', N'Ethics in Information Technology', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EIT491', N'English for Standardized Tests', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EL-000001', N'English 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EL-000002', N'English 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EL-000003', N'English 3', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ELI302', N'English Interpretation 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ELI402', N'English Interpretation 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ELR301', N'Research Methods', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ELS401c', N'Academic Listening and Speaking', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ELT302', N'English Translation 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ELT402', N'English Translation 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ELT492', N'Graduation Thesis - English studies', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EN011', N'Top Notch Fundamental', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EN021', N'Top Notch 1', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EN031', N'Top Notch 2', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EN041', N'Top Notch 3', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EN051', N'Summit 1', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EN062', N'Summit 2', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EN151', N'Academic English', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EN161', N'Advanced Academic English', 4)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EN162', N'Advanced Practical English', 4)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENB302', N'Business English Writing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENI511', N'Listening Speaking 5 (Part 1/2)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENI512', N'Listening Speaking 5 (Part 2/2)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENM101c', N'Business English 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENM111', N'Elementary Business English 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENM112c', N'Business English 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENM121', N'Elementary Business English 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENM211', N'Pre-Intermediate Business English 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENM211c', N'Business English Communication 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENM212', N'Pre-Intermediate Business English 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENM221c', N'Business English Communication 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENM411', N'MKL Upper Intermediate Business English 4', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENM511', N'Business English 6 - Advanced', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENP101', N'Phonetics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENP102', N'English phonetics and phonology in use', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENR101', N'Reading 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENR201', N'Reading 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENR301', N'Skillfull 3 - Reading 3', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENR401', N'Skillful 4: Reading', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENR501', N'Reading 5', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENS111', N'Skillfull 1 - Listening Speaking 1 (Part 1/2)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENS121', N'Skillfull 1- Listening Speaking 1 (Part 2/2)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENS211', N'Skillfull 2 - Listening & Speaking 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENS212', N'Skillfull 2 - Reading & Writing 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENS221', N'Skillfull 2 - Listening & Speaking 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENS222', N'Skillfull 2 - Reading & Writing 2', 3)
GO
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENS311', N'Skillfull 3 - Listening & Speaking 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENS312', N'Skillfull 3 - Reading & Writing 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENS321', N'Skillfull 3 - Listening & Speaking 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENS322', N'Skillfull 3 - Reading & Writing 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENS403', N'Skillfull 4: Reading', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENS411', N'Skillfull 4: Listening & Speaking (Part 1/2)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENS412', N'Skillfull 4: Reading & Writing (Part 1/2)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENS421', N'Skillfull 4: Listening & Speaking (Part 2/2)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENS422', N'Skillfull 4: Reading & Writing (Part 2/2)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENT103', N'Topnotch 1 - Fundamentals', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENW101', N'English Writing Skills 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENW201', N'English Writing Skills 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENW301', N'English Writing Skills 3', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENW401', N'English Writing Skills 4', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENW491', N'English Writing Skills', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENW492', N'Academic Writing Skills', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENW492c', N'Writing Research Papers', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENW501', N'English Writing Skills 5', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENG301', N'Advanced English Grammar', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENH301', N'Business English for Hospitality - Intermediate', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ENH401', N'Business English for Hospitality - Upper Intermediate', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EPC301', N'Persuasive Communication', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EPE101', N'Professional Ethics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ERW411', N'Read Think Write 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ERW412', N'English Read-Think-Write 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ERW421', N'Read Think Write 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ERW422', N'English Read-Think-Write 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ES311', N'Embedded System Hardware', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ES312', N'Embedded Software Development', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ES321', N'Smart Cards', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ES322', N'Wireless & Mobile Communication', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ESP301', N'Embedded system programming', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ESP301m', N'Microcontroller & embedded system programming', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ETR401', N'Entrepreneurship', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ETR402', N'software entrepreneurship', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EVN201', N'Event planning', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EVN202', N'Conventions and Tradeshows', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EVN203', N'Special Events and Wedding Production', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EVN301', N'Event Management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EWR101', N'Academic English (Writing)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EXC101', N'LAB Information Assurance', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EXC201', N'LAB Information Assurance 1', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EXE_ELE', N'Entrepreneurship Group 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EXE101', N'Experiential Entrepreneurship 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EXE101g', N'Group Experiential Entrepreneurship 1', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EXE201', N'Experiential Entrepreneurship 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'EXO401', N'Training Eos_Client', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FBM201', N'Food and Beverage Operations Management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FE-000001', N'Free Elective 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FE-000003', N'Free Elective 3', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FE-000004', N'Free Elective 4', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FER201m', N'Front-End web development with React', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FIM301', N'Valuation and financial modeling', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FIM302c', N'Financial Modelling', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FIN_ELE', N'Graduation Elective - Finance', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FIN201', N'Monetary Economics and Global Economy', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FIN202', N'Principles of Corporate Finance', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FIN301', N'Financial Markets and Institutions', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FIN303', N'Advanced Corporate Finance', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FIN308', N'International Corporate Finance', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FIN391', N'Applied Corporate Finance', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FIN402', N'Derivatives', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FIT391', N'Financial Technology', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FMM101', N'Fundamentals of Multimedia', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FRS301', N'Digital Forensics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FRS401', N'Network Forensics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'FUN131b', N'Becoming a Digital Citizen', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GBE101', N'International Business Environment', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GD_ELE3', N'Capstone Project Graphic Design', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GDA401', N'Mobility Applications Design', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GDF101', N'Fundamental of Graphic Design', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GDG401', N'Design 2: 3D Animation', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GDP101', N'Applied Graphic Design', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GDP491', N'Capstone Project', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GDP492', N'Capstone Project Graphic Design - Animation', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GDP493', N'Capstone Project Graphic Design - Interaction Design', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GDP494', N'Capstone Project Graphic Design - Communication Design', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GDQP', N'Military training', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GDS301', N'Design 1: Scenario Design & Animation', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GDW401', N'Web Design', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GEM201', N'Managing Guest Experience', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'Global Citizen', N'.', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GRA493', N'Graduation Assignment', 5)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GRA497', N'Capstone Project - Multimedia and Communication-', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GRB491', N'Graduation Thesis - Finance Banking', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GRF491', N'Graduation Thesis - Finance', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GRH491', N'Graduation Thesis - Hotel Management', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GRI491', N'Graduation Thesis - International Business', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GRM491', N'Graduation Thesis - Marketing', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'GRP490', N'Graduation thesis (Business plan)', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'HCI201', N'Human-Computer Interaction', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'HCI202', N'UI/UX', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'HCM201', N'Ho Chi Minh Ideology', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'HM_ELE', N'Graduation Elective - Hotel Management', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'HMO102', N'Introduction to Tourism & Hospitality industry', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'HOA101', N'Art History', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'HOD101', N'Design History', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'HOD401', N'Ethical Hacking and Offensive Security', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'HOM201', N'Hotel Operations Management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'HOM301c', N'Hotel Revenue Management', 3)
GO
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'HOM302', N'Service Operation Management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'HRM201', N'Human Resource Management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'HS111', N'Principles of Marxism - Leninism', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'HS112', N'Principles of Marxism Leninism', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'HS121', N'Hochiminh Ideology', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'HS131', N'Revolutionary Line of CPV', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IAA201', N'Risk-Vulnerability Analysis', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IAA202', N'Risk Management in Information Systems', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IAA301', N'Intelligence Analysics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IAD101b', N'Intro to Automotive Application Development', 1)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IAM301', N'Malware Analysis', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IAM302', N'Malware Analysis and Reverse Engineering', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IAO101', N'Information Assurance Overview', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IAO201c', N'Introduction to Information Assurance', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IAP201', N'Privacy and IT Ethics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IAP301', N'Policy Development in Information Assurance', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IAP491', N'IA Capstone Project', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IAR301', N'Incident Response', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IAT491', N'Graduate Project', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IAW301', N'Web security', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IB_ELE', N'Graduation Elective - International Business', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IBA101', N'Traditional musical instrument - Dan Bau', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IBC201', N'Cross Cultural Management and Negotiation', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IBF301', N'International Finance', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IBS301', N'International Business Strategy', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IEI301', N'Import and Export', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IFT201c', N'Innovation and Future thinking', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IHM101', N'Introduction to Hospitality industry', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IIP301', N'International payment', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IM1102', N'Internet Marketing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IMA301', N'International Merger and Acquisitions', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IMP301', N'Image Processing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IMT301', N'Image Processing Technology', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'INDU1130.1', N'International Human resource management 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'INDU1130.2', N'International Human resource management 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ING101', N'Traditional musical instrument - Dan Nguyet', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'INH101', N'Traditional musical instrument - Dan Nhi', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IOC311', N'Smart City', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IOC321', N'IoT for Smart City', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IOC391', N'IoT Project for Smart City', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IOP391', N'IoT application development project', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IOP490', N'IoT Capstone Project', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IOS301', N'IoT Security', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IoT-000005', N'Free Elective 5', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IOT101', N'Internet of Things', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IPR102', N'Intellectual Property Rights', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IS301', N'IT Applications in Enterprise', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IS312', N'E-Commerce', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IS313', N'ERP Systems', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'IS321', N'Advanced XML', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ISM302', N'Enterprise Resource Planning (ERP)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ISP391', N'Integrated System Project', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ISP490', N'IS Capstone Project', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ITA202', N'Management Information Systems', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ITA203', N'Information System overview', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ITA301', N'Information System Analysis and Design', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ITB301c', N'Business Intelligence (BI)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ITE302b', N'Ethics in IT', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ITE303', N'Cyber Law and IT Ethics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JBI301', N'Basic skills of Interpreting', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JBJ301', N'Nh?ng v?n d? co b?n v? ng? pháp ti?ng Nh?t - T? lí thuy?t d?n th?c ti?n', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JBP301', N'?ng x? trong môi tru?ng d?i v?i d?i tác Nh?t B?n', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JBT301', N'Basic skills of Translation', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JFE301', N'Japanese IT Fundamentals', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JGP491', N'Graduation Project - Japanese Studies', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JGT492', N'Graduation Thesis - Japanese Studies', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JIG301', N'Basic Issues of Japanese Grammar', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JIJ301', N'Basic issues of Japanese lexicology & phonetics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JIS401', N'Japanese in Software', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JIT301', N'Information Technology Japanese', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JIT401', N'IT Japanese', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JIT491', N'Japanese for JLPT', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JJB391', N'Japanese for JLPT & BJT', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JJL301', N'Japanese Literature', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JLP301', N'Project management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JLR301', N'Research Method', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JMS', N'Japan Monozukuri & SW Development', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JP111', N'Japanese Elementary 1', 4)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JP112', N'Japanese Elementary 2', 4)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JP113', N'Japanese Elementary 3', 4)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JP114', N'Japanese Elementary 4', 4)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JP115', N'Japanese Elementary 5', 4)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JP211', N'Japanese Intermediate 1', 4)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JP221', N'Japanese Intermediate 2', 4)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPB301', N'Japanese business language & business manner', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPC301', N'Japanese Culture and Literature', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD111', N'Elementary Japanese 1.1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD112', N'Elementary Japanese 1', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD113', N'Elementary Japanese 1-A1.1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD116', N'Elementary Japanese 1-A1/A2', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD121', N'Elementary Japanese 1.2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD122', N'Elementary Japanese 2', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD123', N'Elementary Japanese 1-A1.2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD126', N'Elementary Japanese 2-A2', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD131', N'Elementary Japanese 2.1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD133', N'Elementary Japanese1-A1/A2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD141', N'Elementary Japanese 2.2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD216', N'Japanese Pre-Intermediate 1-A2/B1', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD222', N'Pre-Intermediate Japanese 1', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD223', N'Pre-Intermediate Japanese 2', 6)
GO
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD226', N'Japanese Pre-Intermediate 2-B1', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD316', N'Intermediate Japanese 1-B1/B2', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD322', N'Intermediate Japanese 1', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD323', N'Intermediate Japanese 2', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD324', N'Intermediate Japanese 3', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD325', N'Intermediate Japanese 4', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD326', N'Japanese Intermediate 2-B2.1', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD336', N'Japanese Intermediate 2-B2.2', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPD346', N'Japanese Intermediate2-B2/C1', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPE301', N'Translation in Education', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPG301', N'Japanese Vocabulary and Grammar', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPN123', N'Get to know Japan', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPN709', N'H?i tho?i so c?p', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JPS301', N'Japanese Study', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JSC201', N'Computer System', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JSC301', N'Japanese Studies and Japanese Culture', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JSI201', N'Information System', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JTE301', N'Translation in Economics & Commerce', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JTI301', N'Introductory Translation & Interpreting', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JTL401', N'Translation in Japanese Literature', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JTN301', N'Translation on international hot news', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JTT301', N'Translation in Tourism', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'JTW301', N'Japanese IT terms and text translation', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KIT491', N'Korean for TOPIK', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KLE301', N'Korean Literature', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KLR301', N'Scientific Research Methods', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KMS301', N'Knowledge management system', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KOR311', N'Intermediate Korean Language 1', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KOR321', N'Intermediate Korean Language 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KOR411', N'Intermediate Korean Language 3', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KRC301', N'Korean Culture', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KRG301', N'Korean Grammar and Vocabulary', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KRL101', N'Elementary Korean 1', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KRL122', N'Elementary Korean 2', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KRL212', N'Intermediate Korean 1', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KRL222', N'Intermediate Korean 2', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KRL312', N'Intemediate Korean 3', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KRL322', N'Intemediate Korean 4', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KRL402', N'Advanced Korean 1', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KRL411', N'Intermediate Korean 3', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KRL421', N'Intermediate Korean 4', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KRL502', N'Advanced Korean 2', 6)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'KRP301', N'Korean Phonetics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LAB101', N'C Lab', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LAB211', N'OOP with Java Lab', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LAB221', N'Desktop Java Lab', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LAB231', N'Web Java Lab', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LAB301', N'C#.NET Lab', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LAW101', N'Business Law Fundamentals', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LAW102', N'Business Law and Ethics Fundamentals', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LAW201', N'Media Law and Ethics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LAW201c', N'International Business Law', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LIT101', N'English Literature', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LIT301', N'British and American Literature', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LOD211', N'Front office management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LOD212', N'Housekeeping management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LOD222', N'Front desk and receptionist skills', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LOG311', N'Customs Operations', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LOG321', N'Logistics and Transportation Management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LTG201', N'Introduction to linguistics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LTG203', N'Introduction to liguistics (in Japanness)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LTJ301', N'Japanese Theory', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LUK.PM', N'LUK.PM', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LUK1', N'LUK Global 1', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LUK1bs', N'Level 1', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LUK2', N'LUK Global 2', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LUK3', N'LUK Global 3', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LUK3bs', N'Level 3', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LUK4', N'LUK Global 4', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LUK4bs', N'Level 4', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LUK5', N'LUK Global 5', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LUK5bs', N'Level 5', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'LUK6', N'Level 6', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MA101', N'Advanced Mathematics 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MA102', N'Advanced Mathematics 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MA201', N'Statistics and Probability', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MAC001', N'Precalculus', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MAC102', N'Advanced Mathematics for Business', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MAC201', N'Calculus 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MAD101', N'Discrete mathematics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MAE101', N'Mathematics for Engineering', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MAI391', N'Mathematics for Machine Learning', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MAN201', N'Numerical Methods', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MAO301', N'Combinatorial Optimizations', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MAO302', N'Linear Optimization', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MAS201', N'Statistics and data processing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MAS202', N'Applied Statistics for Business', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MC-000001', N'Concentration Elective 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MC-000002', N'Concentration Elective 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MC-000003', N'Concentration Elective 3', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MC-000004', N'Concentration Elective 4', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MC-000005', N'Major Elective Group 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MC-000006', N'Major Elective Group 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MC-000007', N'Major Elective Group 3', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MCO201', N'Transmedia Storytelling', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MCO301', N'Research methods in Communication', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MCP301', N'Micro-controller programming', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MED201', N'New Media Technology', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MEP201', N'Multimedia Production Project', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MG101', N'Introduction to Management', 3)
GO
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MGT102', N'Management Principle', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MKD301', N'Digital Marketing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MKT_ELE', N'Graduation Elective - Marketing', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MKT101', N'Marketing Principles', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MKT201', N'Consumer Behavior', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MKT202', N'Services Marketing Management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MKT204', N'International Marketing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MKT208c', N'Social media marketing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MKT209', N'Content marketing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MKT301', N'Marketing Research', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MKT304', N'Integrated Marketing Communications', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MKT304c', N'Integrated Marketing Communication', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MKT305', N'Marketing Strategy', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MKT306', N'Marketing Channel', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MKT307', N'Customer Relationship Management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MKT309m', N'Omnichannel marketing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MKT318', N'Digital marketing 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MKT328', N'Digital marketing 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MLN111', N'Philosophy of Marxism – Leninism', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MLN122', N'Political economics of Marxism – Leninism', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MLN131', N'Scientific socialism', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MLT301', N'Machine Learning with Tensorflow', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MMA001', N'Monney Minded', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MMP101', N'Media Psychology', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MPL201', N'Strategic Media Planning', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'MSM201c', N'Meta social media marketing Management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'Music102-EX', N'Traditional Instrument', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'NLP301', N'Natural Language Processing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'NMN101', N'Traditional Instrument Night', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'NWC202', N'Computer Networking', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'NWC301', N'Advanced Networking', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'NWC302', N'Network Connetivity', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'NWC401', N'Network Connectivity', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'OB201', N'Organization Behavior', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'OBE101', N'Organizational Behavior', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'OFC321', N'Optical Fiber Communications 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'OJA201', N'On the job training', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'OJB202', N'On-the-job training', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'OJS211', N'On the Job Training 1', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'OJS221', N'On the Job Training 2', 5)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'OJS231', N'On the Job Training 3', 5)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'OPT101', N'Orientaiton and General Training Program', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ORG101', N'Orientation', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ORT102', N'Orientation IT', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ORT103', N'Orientation Examination', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ORT104', N'Orientation Academic', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ORT105', N'Orientation Library', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ORT106', N'Orientation Accounting', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'ORT107', N'Orientation GDQP', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'OSP201', N'Open Source Platform and Network Administration', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'OTP101', N'Orientation and General Training Program', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PCCC101', N'PCCC', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PDP101', N'K? nang sinh t?n t?i H?a L?c', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PDP102', N'Ho?t d?ng Van th?', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PDP103', N'L? tru?ng thành', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PDP104', N'SEX EDUCATION', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PFD201', N'Photography for Designer', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PFD202', N'Nhi?p ?nh', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PFL401', N'Portfolio Design', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PFP191', N'Programming Fundamentals with Python', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PIA201c', N'Art of Pitching', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PLT101', N'Placement Test', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRC391', N'Cloud Computing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRE201', N'Excel Programming', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRE201c', N'Excel Skills for Business', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRE202', N'Public Relations Principles and Strategies', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRJ301', N'Java Web Application Development', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRJ311', N'Desktop Java Applications', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRJ321', N'Web-Based Java Applications', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRM301', N'Mobile Programming', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRN211', N'Basic Cross-Platform Application Programming With .NET', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRN221', N'Advanced Cross-Platform Application Programming With .NET', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRN231', N'Building Cross-Platform Back-End Application With .NET', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRO191', N'Object-Oriented Paradigm (C++)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRO192', N'Object-Oriented Programming', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRO201', N'Front-end Web Development', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRO201c', N'Web Design for Everybody', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRS301', N'System Programming', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRU211c', N'C# Programming and Unity', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRU221m', N'Object-Oriented Programming for Unity Games', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PRX301', N'Web Development (XML)', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PST201', N'Perspective', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PST301', N'Intermediate Visual Principles', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PHY101', N'Physics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PHY121', N'Physics (Lab)', 1)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'PHY201', N'Modern physics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'REL301', N'Reinforcement Learning', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'RES201', N'Food Preparation & Science', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'RES213', N'Wines, Beers, Spirits 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'RES222', N'Wines, Beers, Spirits 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'RES301', N'Food and Beverage Cost Control', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'RMB301', N'Business Research Methods', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'RMB302', N'Research Methods & Quantitative Analysis', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SAL301', N'Professional Selling', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SAL302', N'Salesforce Management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SAP311', N'SAP General 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SAP321', N'SAP General 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SAP331', N'SAP Configuration', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SAP341', N'SAP Application Development with ABAP', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SCI201', N'Information Security', 3)
GO
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SCM201', N'Supply Chain Management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SCM301m', N'Procurement and Global Sourcing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SCT301', N'Supply Chain Management Technologies', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SDN301m', N'Server-Side development with NodeJS, Express, and MongoDB', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SDP201', N'Sound Production', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SE-000001', N'Specialization 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SE-000002', N'Specialization 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SE-000003', N'Specialization 3', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SE-000004', N'Specialization 4', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SE-000005', N'Specialization 5', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SE101', N'Introduction to Software Engineering', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SE211', N'Software Construction', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SE213', N'Software Requirements', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SE214', N'Software Quality Assurance & Testing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SE216', N'IT Project Management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SE315', N'Software Architecture and Design', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SEM101', N'Semantics', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SEO201c', N'Search Engine Optimization', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SEP490', N'SE Capstone Project', 10)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SPD401', N'System Planning and Design', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SPM401', N'Security Project Management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SRE301', N'Software Reverse Engineering', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SS101', N'Business Communication', 1)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SS102', N'Working in Group', 1)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SSB201', N'Advanced Business Communication', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SSC302', N'Advanced Presentation Skills', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SSG101', N'Working in Group Skills', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SSG101-ST08', N'Working in groups', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SSG103', N'Communication and In-Group Working Skills', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SSL101', N'Studying skill', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SSL101c', N'Academic Skills for University Success', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SSM201', N'Management Skills', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SSN301', N'Negotiation', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SSP201', N'Pitching creative ideas', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SSS101', N'Study skill', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SST301', N'Sensor Technology', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SWD391c', N'SW Architecture and Design', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SWM301', N'Software project management', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SWP391', N'Application development project', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SWQ391', N'Software Quality Assurance and Testing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SWR302', N'Software Requirement', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SWT301', N'Software Testing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'SYB301', N'Start Your Business', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'TMI101', N'Traditional musical instrument', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'TPG201', N'Typography 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'TPG203', N'Basic typography & Layout', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'TPG301', N'Typography 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'TPG302', N'Typography & E-publication', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'TTB101', N'?àn T? bà', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'TRG101', N'Traditional musical instrument - Trong', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'TRS501', N'English 5', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'TRS6', N'Transition', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'VCM201', N'Visual Communication', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'VDE301', N'Digital Video Editing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'VDP201', N'Video Production', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'VNC101', N'Vietnamese Cultural', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'VNC102', N'Vietnamese Culture', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'VNC103', N'Vietnamese culture base', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'VNF001', N'Vietnamese 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'VNL121', N'Vietnamese 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'VNL131', N'Vietnamese 3', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'VNR202', N'History of Vi?t Nam Communist Party', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'VO101', N'Vovinam 1', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'VO102', N'Vovinam 2', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'VO103', N'Vovinam 3', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'VO104', N'Vovinam 4', 2)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'VOV132', N'Vovinam 5', 1)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'VOV133', N'Vovinam 6', 1)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'VOV135', N'V? nâng cao', 0)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'WDL202', N'Web layout design', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'WDL301', N'Web Design 1', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'WDP301', N'Web Development Project', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'WDT401', N'Web Design 2', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'WDU201', N'Principles of UX', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'WDU202c', N'UI/UX Design', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'WIR201', N'Interaction design', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'WMC201', N'Media Writing', 3)
INSERT [dbo].[Subjects] ([subject_id], [subject_name], [credit]) VALUES (N'WMT201', N'Web and Mobility Technology', 3)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Admin__B43B145F895A80E4]    Script Date: 3/21/2024 10:05:26 PM ******/
ALTER TABLE [dbo].[Admin] ADD UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Lectures__B43B145FB2719904]    Script Date: 3/21/2024 10:05:26 PM ******/
ALTER TABLE [dbo].[Lectures] ADD UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Lectures__DADF7035E460882C]    Script Date: 3/21/2024 10:05:26 PM ******/
ALTER TABLE [dbo].[Lectures] ADD UNIQUE NONCLUSTERED 
(
	[lecture_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Majors__B2815F7A6E93E39A]    Script Date: 3/21/2024 10:05:26 PM ******/
ALTER TABLE [dbo].[Majors] ADD UNIQUE NONCLUSTERED 
(
	[major_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Students__820A8F3E1144F201]    Script Date: 3/21/2024 10:05:26 PM ******/
ALTER TABLE [dbo].[Students] ADD UNIQUE NONCLUSTERED 
(
	[student_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Students__B43B145FB1EA2B2E]    Script Date: 3/21/2024 10:05:26 PM ******/
ALTER TABLE [dbo].[Students] ADD UNIQUE NONCLUSTERED 
(
	[phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Subjects__40817661D499C7D5]    Script Date: 3/21/2024 10:05:26 PM ******/
ALTER TABLE [dbo].[Subjects] ADD UNIQUE NONCLUSTERED 
(
	[subject_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Class_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Class_Subject_Classes] FOREIGN KEY([class_id])
REFERENCES [dbo].[Classes] ([class_id])
GO
ALTER TABLE [dbo].[Class_Subject] CHECK CONSTRAINT [FK_Class_Subject_Classes]
GO
ALTER TABLE [dbo].[Class_Subject]  WITH CHECK ADD  CONSTRAINT [FKClass_Subj109304] FOREIGN KEY([lecture_id])
REFERENCES [dbo].[Lectures] ([lecture_id])
GO
ALTER TABLE [dbo].[Class_Subject] CHECK CONSTRAINT [FKClass_Subj109304]
GO
ALTER TABLE [dbo].[Class_Subject]  WITH CHECK ADD  CONSTRAINT [FKClass_Subj688945] FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subjects] ([subject_id])
GO
ALTER TABLE [dbo].[Class_Subject] CHECK CONSTRAINT [FKClass_Subj688945]
GO
ALTER TABLE [dbo].[Class_Subject]  WITH CHECK ADD  CONSTRAINT [FKClass_Subj765984] FOREIGN KEY([room])
REFERENCES [dbo].[Rooms] ([room_id])
GO
ALTER TABLE [dbo].[Class_Subject] CHECK CONSTRAINT [FKClass_Subj765984]
GO
ALTER TABLE [dbo].[Exam_Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Schedule_Semester] FOREIGN KEY([semester_id])
REFERENCES [dbo].[Semester] ([semester_id])
GO
ALTER TABLE [dbo].[Exam_Schedule] CHECK CONSTRAINT [FK_Exam_Schedule_Semester]
GO
ALTER TABLE [dbo].[Exam_Schedule]  WITH CHECK ADD  CONSTRAINT [FKExam_Sched39290] FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subjects] ([subject_id])
GO
ALTER TABLE [dbo].[Exam_Schedule] CHECK CONSTRAINT [FKExam_Sched39290]
GO
ALTER TABLE [dbo].[Exam_Schedule]  WITH CHECK ADD  CONSTRAINT [FKExam_Sched511942] FOREIGN KEY([lecture_id])
REFERENCES [dbo].[Lectures] ([lecture_id])
GO
ALTER TABLE [dbo].[Exam_Schedule] CHECK CONSTRAINT [FKExam_Sched511942]
GO
ALTER TABLE [dbo].[Excercies]  WITH CHECK ADD  CONSTRAINT [FKExcercies435330] FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subjects] ([subject_id])
GO
ALTER TABLE [dbo].[Excercies] CHECK CONSTRAINT [FKExcercies435330]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Classes] FOREIGN KEY([class_id])
REFERENCES [dbo].[Classes] ([class_id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Classes]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FKStudents8281] FOREIGN KEY([major_id])
REFERENCES [dbo].[Majors] ([major_id])
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FKStudents8281]
GO
ALTER TABLE [dbo].[Students_Exam_Schedule]  WITH CHECK ADD  CONSTRAINT [FKStudents_E449250] FOREIGN KEY([exam_schedule_id])
REFERENCES [dbo].[Exam_Schedule] ([exam_schedule_id])
GO
ALTER TABLE [dbo].[Students_Exam_Schedule] CHECK CONSTRAINT [FKStudents_E449250]
GO
ALTER TABLE [dbo].[Students_Exam_Schedule]  WITH CHECK ADD  CONSTRAINT [FKStudents_E743912] FOREIGN KEY([student_id])
REFERENCES [dbo].[Students] ([student_id])
GO
ALTER TABLE [dbo].[Students_Exam_Schedule] CHECK CONSTRAINT [FKStudents_E743912]
GO
ALTER TABLE [dbo].[Students_Excercies]  WITH CHECK ADD  CONSTRAINT [FKStudents_E930074] FOREIGN KEY([exercise_name])
REFERENCES [dbo].[Excercies] ([exercise_name])
GO
ALTER TABLE [dbo].[Students_Excercies] CHECK CONSTRAINT [FKStudents_E930074]
GO
ALTER TABLE [dbo].[Students_Excercies]  WITH CHECK ADD  CONSTRAINT [FKStudents_E938209] FOREIGN KEY([student_id])
REFERENCES [dbo].[Students] ([student_id])
GO
ALTER TABLE [dbo].[Students_Excercies] CHECK CONSTRAINT [FKStudents_E938209]
GO
USE [master]
GO
ALTER DATABASE [PRN221_StudentManagementSystem] SET  READ_WRITE 
GO
