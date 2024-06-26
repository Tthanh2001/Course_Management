
Create database CM
Go
USE [CM]
Go
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 3/23/2024 3:24:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assignment]    Script Date: 3/23/2024 3:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assignment](
	[AssignmentId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Display] [bit] NOT NULL,
	[Deadline] [datetime] NULL,
	[File] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[AssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 3/23/2024 3:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[LecturerId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseEnrollment]    Script Date: 3/23/2024 3:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseEnrollment](
	[EnrollmentId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[EnrollmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 3/23/2024 3:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[QuizId] [int] NOT NULL,
	[Question] [nvarchar](max) NULL,
	[OptionA] [nvarchar](max) NULL,
	[OptionB] [nvarchar](max) NULL,
	[OptionC] [nvarchar](max) NULL,
	[OptionD] [nvarchar](max) NULL,
	[CorrectOption] [nvarchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 3/23/2024 3:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[QuizId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[Title] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[QuizId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuizAttendance]    Script Date: 3/23/2024 3:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuizAttendance](
	[AttendanceId] [int] IDENTITY(1,1) NOT NULL,
	[QuizId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[Score] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AttendanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentAssignment]    Script Date: 3/23/2024 3:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentAssignment](
	[SubmissionId] [int] IDENTITY(1,1) NOT NULL,
	[AssignmentId] [int] NOT NULL,
	[StudentId] [int] NOT NULL,
	[File] [nvarchar](255) NULL,
	[SubmissionDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubmissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/23/2024 3:24:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Username] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[Role] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK__User__1788CC4C99350363] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Assignment] ON 

INSERT [dbo].[Assignment] ([AssignmentId], [CourseId], [Title], [Description], [Display], [Deadline], [File]) VALUES (4, 5, N'Computer Networking', N'Computer Networking', 0, CAST(N'2024-03-24T00:34:00.000' AS DateTime), N'20231114003446_Assignment_03_Security,  Ajax with RESTful API.pdf')
INSERT [dbo].[Assignment] ([AssignmentId], [CourseId], [Title], [Description], [Display], [Deadline], [File]) VALUES (5, 5, N'Web Design 2', N'Web Design 2', 0, CAST(N'2024-03-23T00:34:00.000' AS DateTime), N'20231114003458_Assignment_03_Security,  Ajax with RESTful API.pdf')
INSERT [dbo].[Assignment] ([AssignmentId], [CourseId], [Title], [Description], [Display], [Deadline], [File]) VALUES (6, 5, N'Programming Course 2', N'Description for Programming Course 2', 0, CAST(N'2024-03-23T00:34:00.000' AS DateTime), N'20231114003622_7.1.23.txt')
INSERT [dbo].[Assignment] ([AssignmentId], [CourseId], [Title], [Description], [Display], [Deadline], [File]) VALUES (7, 4, N'ASM1 - Basic Cross-Platform Application Programming With .NET', N'Basic Cross-Platform Application Programming With .NET', 0, CAST(N'2024-03-23T00:34:00.000' AS DateTime), N'20231114010602_Assignment.txt')
INSERT [dbo].[Assignment] ([AssignmentId], [CourseId], [Title], [Description], [Display], [Deadline], [File]) VALUES (8, 4, N'ASM2 - Advanced Platform Application Programming With .NET ', N'Advanced Cross-Platform Application Programming With .NET ', 1, CAST(N'2024-03-23T00:34:00.000' AS DateTime), N'20231114010620_Assignment.txt')
INSERT [dbo].[Assignment] ([AssignmentId], [CourseId], [Title], [Description], [Display], [Deadline], [File]) VALUES (9, 4, N'ASM3 - Building Cross-Platform Back-End Application With .NET', N'Building Cross-Platform Back-End Application With .NET', 1, CAST(N'2024-03-23T00:34:00.000' AS DateTime), N'20231114010638_Assignment.txt')
INSERT [dbo].[Assignment] ([AssignmentId], [CourseId], [Title], [Description], [Display], [Deadline], [File]) VALUES (10, 4, N'ASM4 - Front-End web development with React', N'Document made by Minh Anh dep trai vcl', 1, CAST(N'2024-03-23T00:34:00.000' AS DateTime), N'20231114010701_Assignment.txt')
INSERT [dbo].[Assignment] ([AssignmentId], [CourseId], [Title], [Description], [Display], [Deadline], [File]) VALUES (11, 4, N'ASM5 - Object-Oriented Programming', N'RESTful API là một tiêu chuẩn được sử dụng trong việc thiết kế API cho các phần mềm, ứng dụng và dịch vụ web để tạo sự thuận tiện cho việc quản lý các resource. Các tài nguyên hệ thống như tệp văn bản, ảnh, video, âm thanh hay dữ liệu di động là mục tiêu mà nó hướng tới, bao gồm các trạng thái tài nguyên được định dạng và truyền tải qua HTTP.', 1, CAST(N'2024-03-24T00:34:00.000' AS DateTime), N'20231114010034_Assignment.txt')
INSERT [dbo].[Assignment] ([AssignmentId], [CourseId], [Title], [Description], [Display], [Deadline], [File]) VALUES (12, 8, N'Project 1', N'1', 0, CAST(N'2024-03-24T00:34:00.000' AS DateTime), N'20231114011103_Assignment.txt')
INSERT [dbo].[Assignment] ([AssignmentId], [CourseId], [Title], [Description], [Display], [Deadline], [File]) VALUES (13, 8, N'Project 2', N'2', 1, CAST(N'2024-03-24T00:34:00.000' AS DateTime), N'20231114011116_Assignment.txt')
INSERT [dbo].[Assignment] ([AssignmentId], [CourseId], [Title], [Description], [Display], [Deadline], [File]) VALUES (14, 3, N'Project 1', N'Excel Skills for Business', 1, CAST(N'2024-03-24T00:34:00.000' AS DateTime), N'20231114011611_Assignment.txt')
INSERT [dbo].[Assignment] ([AssignmentId], [CourseId], [Title], [Description], [Display], [Deadline], [File]) VALUES (15, 3, N'Project 2', N'Excel Skills for Business', 1, CAST(N'2024-03-24T00:34:00.000' AS DateTime), N'20231114011624_12thang9.txt')
INSERT [dbo].[Assignment] ([AssignmentId], [CourseId], [Title], [Description], [Display], [Deadline], [File]) VALUES (16, 5, N'ASM99', N'00', 0, CAST(N'2024-03-23T00:34:00.000' AS DateTime), N'20231114014820_Assignment.txt')
SET IDENTITY_INSERT [dbo].[Assignment] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseId], [Title], [Description], [LecturerId]) VALUES (3, N'PRN221', N'Advanced Cross-Platform Application Programming With .NET', 1)
INSERT [dbo].[Course] ([CourseId], [Title], [Description], [LecturerId]) VALUES (4, N'PRN231', N'Building Cross-Platform Back-End Application With .NET 123123', 4)
INSERT [dbo].[Course] ([CourseId], [Title], [Description], [LecturerId]) VALUES (5, N'Introduction to Programming', N'A fundamental course in programming concepts.', 1)
INSERT [dbo].[Course] ([CourseId], [Title], [Description], [LecturerId]) VALUES (8, N'MAS291', N'Cung cấp cho sinh viên những kiến thức cơ bản về xác suất là các khái niệm và quy tắc suy diễn xác suất', 4)
INSERT [dbo].[Course] ([CourseId], [Title], [Description], [LecturerId]) VALUES (9, N'Cour4', N'Cour4', 1)
INSERT [dbo].[Course] ([CourseId], [Title], [Description], [LecturerId]) VALUES (10, N'Cour5', N'Cour4', 1)
INSERT [dbo].[Course] ([CourseId], [Title], [Description], [LecturerId]) VALUES (11, N'New Cour', N'1
', 1)
INSERT [dbo].[Course] ([CourseId], [Title], [Description], [LecturerId]) VALUES (14, N'Web api', N'23123', 4)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseEnrollment] ON 

INSERT [dbo].[CourseEnrollment] ([EnrollmentId], [CourseId], [StudentId]) VALUES (5, 3, 3)
INSERT [dbo].[CourseEnrollment] ([EnrollmentId], [CourseId], [StudentId]) VALUES (8, 4, 2)
INSERT [dbo].[CourseEnrollment] ([EnrollmentId], [CourseId], [StudentId]) VALUES (9, 5, 2)
INSERT [dbo].[CourseEnrollment] ([EnrollmentId], [CourseId], [StudentId]) VALUES (14, 4, 3)
INSERT [dbo].[CourseEnrollment] ([EnrollmentId], [CourseId], [StudentId]) VALUES (16, 3, 2)
INSERT [dbo].[CourseEnrollment] ([EnrollmentId], [CourseId], [StudentId]) VALUES (18, 10, 2)
INSERT [dbo].[CourseEnrollment] ([EnrollmentId], [CourseId], [StudentId]) VALUES (22, 8, 3)
INSERT [dbo].[CourseEnrollment] ([EnrollmentId], [CourseId], [StudentId]) VALUES (23, 8, 2)
INSERT [dbo].[CourseEnrollment] ([EnrollmentId], [CourseId], [StudentId]) VALUES (24, 3, 6)
INSERT [dbo].[CourseEnrollment] ([EnrollmentId], [CourseId], [StudentId]) VALUES (25, 5, 3)
INSERT [dbo].[CourseEnrollment] ([EnrollmentId], [CourseId], [StudentId]) VALUES (26, 14, 3)
SET IDENTITY_INSERT [dbo].[CourseEnrollment] OFF
GO
SET IDENTITY_INSERT [dbo].[Question] ON 

INSERT [dbo].[Question] ([QuestionId], [QuizId], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption]) VALUES (2, 2, N'Choose the INCORRECT information about .NET Standard', N' All of the others.', N'The .NET Standard is a formal specification of .NET APIs that are intended to be available on .NET Core, .NET6. The motivation behind the .NET Standard is establishing greater uniformity in the .NET ecosystem.', N'None of the others', N'The .NET Standard is a formal specification of .NET APIs that are intended to be available on all .NET implementations (.NET Core, .NET Framework, etc.) The motivation behind the .NET Standard is establishing greater uniformity in the .NET ecosystem.', N'B')
INSERT [dbo].[Question] ([QuestionId], [QuizId], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption]) VALUES (3, 2, N'Choose the correct information about Protocol buffers.', N'None of the others.', N'Parsing Protocol Buffers (binary format) is less CPU intensive because it''s closer to how a machine represents data.', N'All ofthe others.', N'Protocol buffers, also known as Protobuf, is a protocol that Google developed internally to enable serialization and deserialization of structured data between different services.', N'C')
INSERT [dbo].[Question] ([QuestionId], [QuizId], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption]) VALUES (4, 2, N'Which utility can be used to create WSDL from WCF services?', N'Svcutil.exe', N'Wcf.exe', N'ILDASM.exe', N'Svc.exe', N'A')
INSERT [dbo].[Question] ([QuestionId], [QuizId], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption]) VALUES (5, 2, N'What is complex model binder?', N'In the case the response is complex, pass data in response body as an entity with the desired content-type, then such kind of response is mapped by Complex model binder.', N'If the request is simple, input parameter are of type int. string, Boolean, GUID, decimal, etc. and is available in the URL, then such kind of request is mapped to complex model binder.', N'None of the others.', N'In the case the request is complex, pass data in request body as an entity with the desired content-type, then such kind of request is mapped by Complex model binder.', N'D')
INSERT [dbo].[Question] ([QuestionId], [QuizId], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption]) VALUES (6, 2, N'Which one is NOT a benefit of gRPC?', N'Supports client, server, but does not allow bi-directional streaming calls.', N'Modern, high-performance, lightweight RPC framework.', N'Tooling available for many languages to generate strongly-typed servers and clients.', N'Contract-first API development, using Protocol Buffers by default, allowing for language agnostic implementations.', N'A')
INSERT [dbo].[Question] ([QuestionId], [QuizId], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption]) VALUES (7, 4, N'Choose the correct information about the JSON Web Token', N' All of the others.', N'With JSON Web Token, the data sent between two parties using JWT is digitally signed and can be ea', N'JSON Web Token is an open, industry-standard technique for securely conveying claims between two parties.', N'None of the others', N'B')
INSERT [dbo].[Question] ([QuestionId], [QuizId], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption]) VALUES (8, 4, N'Which of the following is a security issue with web services?
', N'None of the others.', N'All of the others.', N'Authentication', N'Network Security', N'B')
INSERT [dbo].[Question] ([QuestionId], [QuizId], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption]) VALUES (9, 5, N'Which of the following is a security issue with web services?', N'None of the others.', N'All of the others.', N'Authentication', N'Network Security', N'B')
INSERT [dbo].[Question] ([QuestionId], [QuizId], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption]) VALUES (10, 5, N'What is the purpose of interface IGrpcServerBuilder?', N'Options used to configure service instances.', N'A builder abstraction for configuring gRPC servers.', N'Metadata for a gRPC method endpoint.', N'Provides access to the gRPC server call context for the current HTTP request.', N'A')
INSERT [dbo].[Question] ([QuestionId], [QuizId], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption]) VALUES (11, 7, N'1', N'1', N'1', N'1', N'1', N'A')
INSERT [dbo].[Question] ([QuestionId], [QuizId], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption]) VALUES (12, 7, N'2', N'2', N'2', N'2', N'2', N'A')
INSERT [dbo].[Question] ([QuestionId], [QuizId], [Question], [OptionA], [OptionB], [OptionC], [OptionD], [CorrectOption]) VALUES (14, 13, N'12', N'1', N'2', N'33', N'4', N'B')
SET IDENTITY_INSERT [dbo].[Question] OFF
GO
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([QuizId], [CourseId], [Title]) VALUES (2, 5, N'Quiz 1')
INSERT [dbo].[Quiz] ([QuizId], [CourseId], [Title]) VALUES (3, 5, N'Quiz 2')
INSERT [dbo].[Quiz] ([QuizId], [CourseId], [Title]) VALUES (4, 4, N'Quiz 1')
INSERT [dbo].[Quiz] ([QuizId], [CourseId], [Title]) VALUES (5, 4, N'Quiz 2')
INSERT [dbo].[Quiz] ([QuizId], [CourseId], [Title]) VALUES (6, 4, N'Quiz 3')
INSERT [dbo].[Quiz] ([QuizId], [CourseId], [Title]) VALUES (7, 8, N'Quiz 1')
INSERT [dbo].[Quiz] ([QuizId], [CourseId], [Title]) VALUES (8, 8, N'Quiz 2')
INSERT [dbo].[Quiz] ([QuizId], [CourseId], [Title]) VALUES (9, 3, N'Quiz 1')
INSERT [dbo].[Quiz] ([QuizId], [CourseId], [Title]) VALUES (10, 3, N'Quiz 2')
INSERT [dbo].[Quiz] ([QuizId], [CourseId], [Title]) VALUES (11, 5, N'Quiz 2')
INSERT [dbo].[Quiz] ([QuizId], [CourseId], [Title]) VALUES (12, 4, N'Quiz 4')
INSERT [dbo].[Quiz] ([QuizId], [CourseId], [Title]) VALUES (13, 4, N'Qiz 5')
SET IDENTITY_INSERT [dbo].[Quiz] OFF
GO
SET IDENTITY_INSERT [dbo].[QuizAttendance] ON 

INSERT [dbo].[QuizAttendance] ([AttendanceId], [QuizId], [StudentId], [Score]) VALUES (4, 5, 2, 0)
INSERT [dbo].[QuizAttendance] ([AttendanceId], [QuizId], [StudentId], [Score]) VALUES (6, 2, 3, 0)
INSERT [dbo].[QuizAttendance] ([AttendanceId], [QuizId], [StudentId], [Score]) VALUES (7, 5, 3, 2)
INSERT [dbo].[QuizAttendance] ([AttendanceId], [QuizId], [StudentId], [Score]) VALUES (10, 4, 3, 0)
INSERT [dbo].[QuizAttendance] ([AttendanceId], [QuizId], [StudentId], [Score]) VALUES (11, 13, 3, 0)
INSERT [dbo].[QuizAttendance] ([AttendanceId], [QuizId], [StudentId], [Score]) VALUES (12, 7, 3, 2)
SET IDENTITY_INSERT [dbo].[QuizAttendance] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentAssignment] ON 

INSERT [dbo].[StudentAssignment] ([SubmissionId], [AssignmentId], [StudentId], [File], [SubmissionDate]) VALUES (1, 11, 3, N'20240323124440_G_Connect.txt', CAST(N'2024-03-23T12:44:40.000' AS DateTime))
INSERT [dbo].[StudentAssignment] ([SubmissionId], [AssignmentId], [StudentId], [File], [SubmissionDate]) VALUES (2, 12, 2, N'20240323132420_Book1.xlsx', CAST(N'2024-03-23T13:24:20.000' AS DateTime))
INSERT [dbo].[StudentAssignment] ([SubmissionId], [AssignmentId], [StudentId], [File], [SubmissionDate]) VALUES (3, 12, 3, N'20240323152027_20240323132420_Book1.xlsx', CAST(N'2024-03-23T15:20:27.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[StudentAssignment] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Email], [Username], [Password], [Role], [Status]) VALUES (1, N'admin@fe.edu.vn', N'Admin', N'123', N'Lecture', N'Active')
INSERT [dbo].[User] ([UserId], [Email], [Username], [Password], [Role], [Status]) VALUES (2, N'nghiald@fpt.edu.vn', N'Duy Nghia(K16_HL)', N'123', N'Student', N'Active')
INSERT [dbo].[User] ([UserId], [Email], [Username], [Password], [Role], [Status]) VALUES (3, N'anhpmhe161347@fpt.edu.vn', N'Pham Minh Anh (K16_HL)', N'123', N'Student', N'Active')
INSERT [dbo].[User] ([UserId], [Email], [Username], [Password], [Role], [Status]) VALUES (4, N'tuanvm@fe.edu.vn', N'TuanVM2', N'123', N'Lecturer', N'Active')
INSERT [dbo].[User] ([UserId], [Email], [Username], [Password], [Role], [Status]) VALUES (6, N'chien@fe.edu.vn', N'chien', N'123', N'Admin', N'Active')
INSERT [dbo].[User] ([UserId], [Email], [Username], [Password], [Role], [Status]) VALUES (8, N'chienhvhe163678@fpt.edu.vn', N'chien', N'123', N'Student', N'Active')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  Index [UC_QuizAttendance]    Script Date: 3/23/2024 3:24:52 PM ******/
ALTER TABLE [dbo].[QuizAttendance] ADD  CONSTRAINT [UC_QuizAttendance] UNIQUE NONCLUSTERED 
(
	[QuizId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UC_StudentAssignment]    Script Date: 3/23/2024 3:24:52 PM ******/
ALTER TABLE [dbo].[StudentAssignment] ADD  CONSTRAINT [UC_StudentAssignment] UNIQUE NONCLUSTERED 
(
	[AssignmentId] ASC,
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Assignment]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK__Course__Lecturer__267ABA7A] FOREIGN KEY([LecturerId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK__Course__Lecturer__267ABA7A]
GO
ALTER TABLE [dbo].[CourseEnrollment]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[CourseEnrollment]  WITH CHECK ADD  CONSTRAINT [FK__CourseEnr__Stude__2A4B4B5E] FOREIGN KEY([StudentId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[CourseEnrollment] CHECK CONSTRAINT [FK__CourseEnr__Stude__2A4B4B5E]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD FOREIGN KEY([QuizId])
REFERENCES [dbo].[Quiz] ([QuizId])
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([CourseId])
GO
ALTER TABLE [dbo].[QuizAttendance]  WITH CHECK ADD FOREIGN KEY([QuizId])
REFERENCES [dbo].[Quiz] ([QuizId])
GO
ALTER TABLE [dbo].[QuizAttendance]  WITH CHECK ADD  CONSTRAINT [FK__QuizAtten__Stude__34C8D9D1] FOREIGN KEY([StudentId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[QuizAttendance] CHECK CONSTRAINT [FK__QuizAtten__Stude__34C8D9D1]
GO
ALTER TABLE [dbo].[StudentAssignment]  WITH CHECK ADD FOREIGN KEY([AssignmentId])
REFERENCES [dbo].[Assignment] ([AssignmentId])
GO
ALTER TABLE [dbo].[StudentAssignment]  WITH CHECK ADD  CONSTRAINT [FK__StudentAs__Stude__3C69FB99] FOREIGN KEY([StudentId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[StudentAssignment] CHECK CONSTRAINT [FK__StudentAs__Stude__3C69FB99]
GO
