USE [PremierLeague]
GO
/****** Object:  Table [dbo].[Club]    Script Date: 11/13/2023 9:59:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Club](
	[ID] [int] NOT NULL,
	[ClubName] [varchar](150) NOT NULL,
	[Image] [varchar](150) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[ReleaseYear] [int] NOT NULL,
	[Stadium] [nvarchar](50) NULL,
	[CostumeManufacturer] [int] NULL,
	[Sponsor] [int] NULL,
	[RankingID] [int] NULL,
 CONSTRAINT [PK_Clubs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coach]    Script Date: 11/13/2023 9:59:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coach](
	[ID] [uniqueidentifier] NOT NULL,
	[CoachName] [nvarchar](150) NOT NULL,
	[DOB] [date] NOT NULL,
	[Nationality] [nvarchar](50) NOT NULL,
	[ReleaseYearInClub] [date] NOT NULL,
	[Image] [varchar](150) NOT NULL,
	[ClubID] [int] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Coach] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CostumeManufacturer]    Script Date: 11/13/2023 9:59:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CostumeManufacturer](
	[ID] [int] NOT NULL,
	[CostumeManufaturerName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CostumeManufacture] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Match]    Script Date: 11/13/2023 9:59:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Match](
	[ID] [uniqueidentifier] NOT NULL,
	[Time] [datetime] NOT NULL,
	[HomeClubID] [int] NOT NULL,
	[AwayClubID] [int] NOT NULL,
	[HomeClubScore] [int] NOT NULL,
	[AwayClubScore] [int] NOT NULL,
 CONSTRAINT [PK_Match] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 11/13/2023 9:59:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[ID] [uniqueidentifier] NOT NULL,
	[PlayerName] [nvarchar](150) NOT NULL,
	[DOB] [date] NOT NULL,
	[Nationality] [nvarchar](50) NOT NULL,
	[Number] [int] NOT NULL,
	[Image] [varchar](150) NOT NULL,
	[ClubID] [int] NOT NULL,
	[PlayerLocationID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlayerLocation]    Script Date: 11/13/2023 9:59:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerLocation](
	[ID] [int] NOT NULL,
	[PlayerLocationName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_PlayerLocation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ranking]    Script Date: 11/13/2023 9:59:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ranking](
	[ID] [int] NOT NULL,
	[Matches] [int] NOT NULL,
	[Win] [int] NOT NULL,
	[Draw] [int] NOT NULL,
	[Goal] [int] NOT NULL,
	[LoseGoal] [int] NOT NULL,
	[NumberDifference] [int] NOT NULL,
	[Score] [int] NOT NULL,
	[Lose] [int] NULL,
 CONSTRAINT [PK_Ranking] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sponsor]    Script Date: 11/13/2023 9:59:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sponsor](
	[ID] [int] NOT NULL,
	[SponsorName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sponsor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (1, N'Arsenal', N'https://upload.wikimedia.org/wikipedia/vi/thumb/5/53/Arsenal_FC.svg/1200px-Arsenal_FC.svg.png', N'Pháo Thủ', 1885, N'Emirates', 1, 1, 4)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (2, N'AstonVilla', N'https://upload.wikimedia.org/wikipedia/vi/a/a8/Aston_Villa_FC_logo.png', N'1 đội bóng đến từ Birmingham', 1874, N'Villa Park', 5, 2, 5)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (3, N'Bournemouth', N'https://upload.wikimedia.org/wikipedia/vi/5/53/AFC_Bournemouth_%282013%29.png', N'1 đội bóng đến từ Bournemouth', 1899, N'Dean Court', 4, 3, 18)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (4, N'Brentford', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgp8BGtEQfhBmYkGJOXnhoS-wysSuSivdAplME0pIJNA&s', N'1 đội bóng đến từ London', 1889, N'Cộng đồng Brentford', 4, 4, 9)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (5, N'Brighton & Hove Albion', N'https://upload.wikimedia.org/wikipedia/vi/thumb/f/fd/Brighton_%26_Hove_Albion_logo.svg/1200px-Brighton_%26_Hove_Albion_logo.svg.png', N'1 đội bóng đến từ Falmer', 1845, N'Falmer', 2, 5, 7)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (6, N'Burnley', N'https://upload.wikimedia.org/wikipedia/vi/1/1a/Burnley_FC.png', N'1 đội bóng đến từ Burnley', 1888, N'Turf Moor', 4, 6, 19)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (7, N'Chelsea', N'https://upload.wikimedia.org/wikipedia/vi/thumb/5/5c/Chelsea_crest.svg/1200px-Chelsea_crest.svg.png', N'1 đội bóng đến từ London', 1905, N'Stamford Bridge', 2, 7, 10)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (8, N'Crystal Palace', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQY-qGgEppnhpnm4dL8gGUnxKcLZ7487DTXjoqqkdbPg3-mOhwvcBtX7ZlxgLH01EUtDF8&usqp=CAU', N'1 đội bóng đến từ London', 1861, N'Selhurst Park', 6, 8, 11)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (9, N'Everton', N'https://upload.wikimedia.org/wikipedia/vi/thumb/7/7c/Everton_FC_logo.svg/1200px-Everton_FC_logo.svg.png', N'1 đội bóng đến từ Liverpool', 1878, N'Goodison Park', 7, 9, 16)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (10, N'Fulham', N'https://upload.wikimedia.org/wikipedia/vi/8/8d/Fulham_FC.png', N'1 đội bóng đến từ London', 1879, N'Craven Cottage', 1, 10, 15)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (11, N'Liverpool', N'https://upload.wikimedia.org/wikipedia/vi/thumb/0/0c/Liverpool_FC.svg/175px-Liverpool_FC.svg.png', N'1 đội bóng đến từ Liverpool', 1892, N'Alfield', 2, 11, 3)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (12, N'Luton Town', N'https://upload.wikimedia.org/wikipedia/vi/8/8b/LutonTownFC2009.png', N'1 đội bóng đến từ Luton', 1885, N'	Kenilworth Road', 4, 12, 17)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (13, N'Manchester City', N'https://upload.wikimedia.org/wikipedia/vi/thumb/1/1d/Manchester_City_FC_logo.svg/1200px-Manchester_City_FC_logo.svg.png', N'1 đội bóng đến từ Manchester', 1880, N'Etihad', 3, 13, 1)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (14, N'Manchester United', N'https://upload.wikimedia.org/wikipedia/vi/thumb/a/a1/Man_Utd_FC_.svg/1200px-Man_Utd_FC_.svg.png', N'1 đội bóng đến từ Manchester', 1878, N'Old Trafford', 1, 14, 8)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (15, N'Newcastle United', N'https://upload.wikimedia.org/wikipedia/vi/0/0d/Newcastle_United_FC.png', N'1 đội bóng đến từ Newcastle upon Tyne', 1895, N'St James'' Park', 5, 15, 6)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (16, N'Nottingham Forest', N'https://upload.wikimedia.org/wikipedia/vi/a/a2/Nottingham_Forest.png', N'1 đội bóng đến từ West Bridgford', 1865, N'City Ground', 1, 16, 13)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (17, N'Sheffield United', N'https://upload.wikimedia.org/wikipedia/vi/c/c9/Bladeslogo2.png', N'1 đội bóng đến từ Sheffield', 1889, N'Bramall Lane', 8, 17, 20)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (18, N'Tottenham Hotspur', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-VaiaNt6pN5kByEJ5tTTTToHUUXDg9RpMclXfdT3I&s', N'1 đội bóng đến từ London', 1882, N'Tottenham Hotspur', 2, 18, 2)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (19, N'West Ham United', N'https://upload.wikimedia.org/wikipedia/vi/b/b1/WestHam.png', N'1 đội bóng đến từ London', 1892, N'London', 4, 19, 12)
INSERT [dbo].[Club] ([ID], [ClubName], [Image], [Description], [ReleaseYear], [Stadium], [CostumeManufacturer], [Sponsor], [RankingID]) VALUES (20, N'Wolverhampton Wanderers', N'https://upload.wikimedia.org/wikipedia/vi/6/6c/Wolverhampton_Wanderers.png', N'1 đội bóng đến từ Wolverhampton', 1888, N'Molineux', 5, 20, 14)
GO
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-0c5a6d4800e9', N'Mikel Arteta', CAST(N'1982-03-26' AS Date), N'Spain', CAST(N'2019-12-20' AS Date), N'https://library.sportingnews.com/styles/crop_style_16_9_desktop_webp/s3/2023-08/GettyImages-1596841912.jpg.webp', 1, N'Mikel Arteta Amatriain là một cựu cầu thủ và hiện là huấn luyện viên bóng đá chuyên nghiệp người Tây Ban Nha. Anh là huấn luyện viên đương nhiệm của câu lạc bộ Arsenal tại Premier League.')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-0c5a7d4800e9', N'Unai Emery', CAST(N'1971-11-03' AS Date), N'Spain', CAST(N'2022-10-24' AS Date), N'https://library.sportingnews.com/styles/crop_style_16_9_desktop_webp/s3/2022-11/GettyImages-1244553880.jpg.webp', 2, N'A')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-0c6a7d4800e9', N'Andoni Iraola', CAST(N'1982-06-22' AS Date), N'Spain', CAST(N'2023-06-19' AS Date), N'https://library.sportingnews.com/styles/crop_style_16_9_desktop_webp/s3/2023-06/messageImage_1687189588635.jpg.webp', 3, N'A')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-0d6a7d4800e9', N'Thomas Frank', CAST(N'1973-10-09' AS Date), N'Denmark', CAST(N'2018-10-16' AS Date), N'https://static.independent.co.uk/2023/09/16/21/ef2f237acccfeb24007f99f8ac5dcd0fY29udGVudHNlYXJjaGFwaSwxNjk0OTgyNDU2-2.73753343.jpg', 4, N'A')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-0d6a8d4800e9', N'Roberto De Zerbi', CAST(N'1979-06-06' AS Date), N'Italy', CAST(N'2022-09-18' AS Date), N'https://i.dailymail.co.uk/1s/2022/10/30/20/64005063-11371309-image-a-1_1667160292646.jpg', 5, N'A')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8239dd52-71c6-4dce-876e-0d6a9d1234e9', N'Sean Dyche', CAST(N'1971-06-28' AS Date), N'England', CAST(N'2023-01-30' AS Date), N'https://library.sportingnews.com/styles/crop_style_16_9_desktop_webp/s3/2022-04/Sean%20Dyche%20Burnley%20122921_0.jpg.webp', 9, N'A')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-0d6a9d4800e9', N'Vincent Kompany ', CAST(N'1986-04-10' AS Date), N'Belgium', CAST(N'2022-06-14' AS Date), N'https://library.sportingnews.com/styles/crop_style_16_9_desktop_webp/s3/2023-05/Vincent%20Kompany%20Burnley%20Championship%20050923.jpg.webp', 6, N'A')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8239cd52-71c6-4dce-876e-0d6a9d4800e9', N'Mauricio Pochettino', CAST(N'1972-03-02' AS Date), N'Argentina', CAST(N'2023-07-01' AS Date), N'https://library.sportingnews.com/styles/crop_style_16_9_desktop_webp/s3/2023-07/Mauricio%20Pochettino%20Chelsea%20072223_0.jpg.webp', 7, N'A')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8239dd52-71c6-4dce-876e-0d6a9d4800e9', N'Roy Hodgson', CAST(N'1947-08-09' AS Date), N'England', CAST(N'2023-03-21' AS Date), N'https://library.sportingnews.com/styles/crop_style_16_9_desktop_webp/s3/2022-01/roy-hodgson-watford-manager-012522_tyvpqrz1pchl16pn6m7s5cbeb.jpg.webp', 8, N'A')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8239dd52-71c6-4dce-876e-2c6a9aa191e9', N'Erik ten Hag', CAST(N'1970-02-02' AS Date), N'Dutch', CAST(N'2022-05-23' AS Date), N'https://library.sportingnews.com/styles/crop_style_16_9_desktop_webp/s3/2023-07/messageImage_1690797749328.jpg.webp', 14, N'Erik ten Hag là một cựu cầu thủ và huấn luyện viên bóng đá chuyên nghiệp người Hà Lan, hiện là huấn luyện viên của câu lạc bộ Premier League Manchester United.')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8239dd52-71c6-4dce-876e-2c6a9ba369e9', N'Steve Cooper', CAST(N'1979-12-10' AS Date), N'Wales', CAST(N'2021-09-21' AS Date), N'https://static.independent.co.uk/2022/05/29/20/5c09030b21eb9eac03f5d676f4db2eecY29udGVudHNlYXJjaGFwaSwxNjUzOTM5NDQ0-2.67190778.jpg?width=1200', 16, N'A')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8239dd52-71c6-4dce-876e-2c6a9ba391e9', N'Eddie Howe', CAST(N'1977-11-29' AS Date), N'England', CAST(N'2021-11-08' AS Date), N'https://library.sportingnews.com/styles/crop_style_16_9_desktop_webp/s3/2022-11/Eddie%20Howe%20Miguel%20Almiron%20Newcastle%20United.jpg.webp', 15, N'A')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8239dd52-71c6-4dce-876e-2c6a9d0191e9', N'Juergen Klopp', CAST(N'1976-06-16' AS Date), N'Germany', CAST(N'2015-10-08' AS Date), N'https://library.sportingnews.com/styles/crop_style_16_9_desktop_webp/s3/2023-08/GettyImages-1599251210.jpg.webp', 11, N'A')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8239dd52-71c6-4dce-876e-2c6a9d1234e9', N'Marco Silva', CAST(N'1977-07-12' AS Date), N'Portugal', CAST(N'2021-07-01' AS Date), N'https://library.sportingnews.com/styles/crop_style_16_9_desktop_webp/s3/2022-04/Marco%20Silva%20Fulham%20manager%20041522.jpg.webp', 10, N'A')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8239dd52-71c6-4dce-876e-2c6a9ee691e9', N'Pep Guardiola', CAST(N'1971-01-18' AS Date), N'Spain', CAST(N'2016-07-01' AS Date), N'https://library.sportingnews.com/styles/crop_style_16_9_desktop_webp/s3/2023-05/GettyImages-1491076893.jpg.webp', 13, N'A')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8239dd52-71c6-4dce-876e-2c6a9ff191e9', N'Rob Edwards', CAST(N'1982-12-25' AS Date), N'Wales', CAST(N'2022-11-17' AS Date), N'https://images.ctfassets.net/f42pa1j7pq2p/1C0eKszX3gkPA1axLE1yJ9/ddb9dfa8d5f2f5ad9470f0678b2edbd5/FGR-Rob-Edwards-Wolves', 12, N'A')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8239dd52-71c6-4dce-876e-abcd1ba369e9', N'Ange Postecoglou', CAST(N'1965-08-27' AS Date), N'Australia', CAST(N'2023-06-06' AS Date), N'https://library.sportingnews.com/styles/crop_style_16_9_desktop_webp/s3/2023-07/Ange%20Postecoglou%20180723.%20.jpg.webp', 18, N'A')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8239dd52-71c6-4dce-876e-ecca9ba369e9', N'David Moyes', CAST(N'1963-04-25' AS Date), N'Scotland', CAST(N'2019-12-29' AS Date), N'https://static.bongda24h.vn/medias/original/2023/08/04/tieu-su-hlv-david-moyes-0408160945.jpg', 19, N'A')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8239dd52-71c6-4dce-876e-eccabba369e9', N'Gary O''Neil', CAST(N'1983-05-18' AS Date), N'England', CAST(N'2023-08-09' AS Date), N'https://static.independent.co.uk/2023/06/19/13/aae3b9232d74136c58bf7bb7bef24369Y29udGVudHNlYXJjaGFwaSwxNjg3MjYxMjY3-2.72673082.jpg', 20, N'A')
INSERT [dbo].[Coach] ([ID], [CoachName], [DOB], [Nationality], [ReleaseYearInClub], [Image], [ClubID], [Description]) VALUES (N'8239dd52-71c6-4dce-876e-ffff9ba369e9', N'Paul Heckingbottom', CAST(N'1977-07-17' AS Date), N'England', CAST(N'2021-11-25' AS Date), N'https://static.bongda24h.vn/medias/original/2023/08/04/tieu-su-hlv-paul-heckingbottom-0408150559.jpg', 17, N'A')
GO
INSERT [dbo].[CostumeManufacturer] ([ID], [CostumeManufaturerName]) VALUES (1, N'Adidas')
INSERT [dbo].[CostumeManufacturer] ([ID], [CostumeManufaturerName]) VALUES (2, N'Nike')
INSERT [dbo].[CostumeManufacturer] ([ID], [CostumeManufaturerName]) VALUES (3, N'Puma')
INSERT [dbo].[CostumeManufacturer] ([ID], [CostumeManufaturerName]) VALUES (4, N'Umbro')
INSERT [dbo].[CostumeManufacturer] ([ID], [CostumeManufaturerName]) VALUES (5, N'Castore')
INSERT [dbo].[CostumeManufacturer] ([ID], [CostumeManufaturerName]) VALUES (6, N'Macron')
INSERT [dbo].[CostumeManufacturer] ([ID], [CostumeManufaturerName]) VALUES (7, N'Hummel')
INSERT [dbo].[CostumeManufacturer] ([ID], [CostumeManufaturerName]) VALUES (8, N'Erreà')
GO
INSERT [dbo].[Match] ([ID], [Time], [HomeClubID], [AwayClubID], [HomeClubScore], [AwayClubScore]) VALUES (N'8229cd52-71c6-4dce-876e-0c5a6d4726e9', CAST(N'2023-11-25T19:00:00.000' AS DateTime), 13, 11, 0, 0)
INSERT [dbo].[Match] ([ID], [Time], [HomeClubID], [AwayClubID], [HomeClubScore], [AwayClubScore]) VALUES (N'8229cd52-71c6-4dce-876e-0c5a6d4811e9', CAST(N'2023-11-12T20:00:00.000' AS DateTime), 20, 18, 2, 1)
INSERT [dbo].[Match] ([ID], [Time], [HomeClubID], [AwayClubID], [HomeClubScore], [AwayClubScore]) VALUES (N'8229cd52-71c6-4dce-876e-0c5a6d4812e9', CAST(N'2023-11-12T21:00:00.000' AS DateTime), 14, 12, 1, 0)
INSERT [dbo].[Match] ([ID], [Time], [HomeClubID], [AwayClubID], [HomeClubScore], [AwayClubScore]) VALUES (N'8229cd52-71c6-4dce-876e-0c5a6d4813e9', CAST(N'2023-11-12T00:00:00.000' AS DateTime), 1, 6, 3, 1)
INSERT [dbo].[Match] ([ID], [Time], [HomeClubID], [AwayClubID], [HomeClubScore], [AwayClubScore]) VALUES (N'8229cd52-71c6-4dce-876e-0c5a6d4814e9', CAST(N'2023-11-11T23:30:00.000' AS DateTime), 8, 9, 2, 3)
INSERT [dbo].[Match] ([ID], [Time], [HomeClubID], [AwayClubID], [HomeClubScore], [AwayClubScore]) VALUES (N'8229cd52-71c6-4dce-876e-0c5a6d4816e9', CAST(N'2023-11-12T01:00:00.000' AS DateTime), 3, 15, 2, 0)
INSERT [dbo].[Match] ([ID], [Time], [HomeClubID], [AwayClubID], [HomeClubScore], [AwayClubScore]) VALUES (N'8229cd52-71c6-4dce-876e-0c5a6d4820e9', CAST(N'2023-11-12T21:00:00.000' AS DateTime), 2, 10, 3, 1)
INSERT [dbo].[Match] ([ID], [Time], [HomeClubID], [AwayClubID], [HomeClubScore], [AwayClubScore]) VALUES (N'8229cd52-71c6-4dce-876e-0c5a6d4821e9', CAST(N'2023-11-12T21:00:00.000' AS DateTime), 5, 17, 1, 1)
INSERT [dbo].[Match] ([ID], [Time], [HomeClubID], [AwayClubID], [HomeClubScore], [AwayClubScore]) VALUES (N'8229cd52-71c6-4dce-876e-0c5a6d4823e9', CAST(N'2023-11-12T21:00:00.000' AS DateTime), 19, 16, 3, 2)
INSERT [dbo].[Match] ([ID], [Time], [HomeClubID], [AwayClubID], [HomeClubScore], [AwayClubScore]) VALUES (N'8229cd52-71c6-4dce-876e-0c5a6d4824e9', CAST(N'2023-11-12T21:00:00.000' AS DateTime), 11, 4, 3, 0)
INSERT [dbo].[Match] ([ID], [Time], [HomeClubID], [AwayClubID], [HomeClubScore], [AwayClubScore]) VALUES (N'8229cd52-71c6-4dce-876e-0c5a6d4826e9', CAST(N'2023-11-12T21:00:00.000' AS DateTime), 7, 13, 4, 4)
GO
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-0c5a6d4810e9', N'Andre Onana', CAST(N'1996-01-01' AS Date), N'Cameroon', 24, N'https://baobariavungtau.com.vn/dataimages/202310/original/images1889240_10m1.jpg', 14, 1, N'André Onana Onana là một cầu thủ bóng đá chuyên nghiệp người Cameroon hiện chơi ở vị trí thủ môn cho câu lạc bộ Premier League Manchester United. Onana gia nhập lò đào tạo trẻ của Barcelona vào năm 2010. Anh ký hợp đồng với Ajax vào năm 2015, nơi anh có 214 lần ra sân và giành được 3 danh hiệu Eredivisie.')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-0c5a6d4821e9', N'Tom Heaton', CAST(N'1986-01-01' AS Date), N'England', 22, N'https://assets.manutd.com/AssetPicker/images/0/0/18/224/1237164/2023_08_06_18_17_59_UVsUb5ZZ1691345281112_medium.jpg', 14, 1, N'Heaton')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-0d5a5e4829d9', N'Victor Lindelof', CAST(N'1995-01-01' AS Date), N'Sweden', 2, N'https://static.bongda24h.vn/medias/standard/2023/10/08/lindelof-0810173149.jpg', 14, 2, N'Victor Lindelof')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-0d5a6d4821d9', N'Lisandro Martinez', CAST(N'1998-01-01' AS Date), N'Argentina', 6, N'https://prod-media.beinsports.com/image/1682010099389_b4c65a3c-0db7-4b5b-a67f-9bf21d761389.jpg', 14, 2, N'Lisandro Martinez')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-0d5a6d4821e9', N'Altay Bayindir', CAST(N'1998-01-01' AS Date), N'Turkey', 1, N'https://media.tinthethao.com.vn/files/bongda/2023/10/11/bayindir_1693557090-0637jpg.jpg', 14, 1, N'Altay')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-0d5a6d4829d9', N'Raphael Varane', CAST(N'1993-01-01' AS Date), N'French', 19, N'https://static.bongda24h.vn/medias/original/2023/09/18/tieu-su-raphael-varane-1809112803.jpg', 14, 2, N'Raphael Varane')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-0d5a6e4829d9', N'Harry Maguire', CAST(N'1993-01-01' AS Date), N'England', 5, N'https://admin.vov.gov.vn/UploadFolder/KhoTin/Images/UploadFolder/VOVVN/Images/sites/default/files/styles/large/public/2023-08/mu_ban_harry_maguire.jpg', 14, 2, N'Harry Maguire')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1d5abe4122da', N'Mason Mount', CAST(N'1999-01-01' AS Date), N'England', 7, N'https://i2-prod.manchestereveningnews.co.uk/incoming/article28082616.ece/ALTERNATES/s615/0_GettyImages-1772578449.jpg', 14, 3, N'Mason Mount')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1d5abe4132da', N'Bruno Fernandes', CAST(N'1995-01-01' AS Date), N'Portugal', 8, N'https://vcdn-thethao.vnecdn.net/2023/06/27/fernandes-jpeg-1687841122-7451-1687842134.jpg', 14, 3, N'Bruno Fernandes')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1d5abe4144da', N'Sofyan Amrabat', CAST(N'1996-01-01' AS Date), N'Morocco', 4, N'https://static-images.vnncdn.net/files/publish/2023/9/27/amrabat-25.jpg', 14, 3, N'Sofyan Amrabat')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1d5abe4145da', N'Donny van de Beek', CAST(N'1997-01-01' AS Date), N'Dutch', 34, N'https://image.sggp.org.vn/w560/Uploaded/2023/dqmbbcvo/2023_02_08/donny-van-de-beek-9201.jpg', 14, 3, N'Donny van de Beek')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1d5abe4545da', N'Marcus Rashford', CAST(N'1998-01-01' AS Date), N'England', 10, N'https://static.bongda24h.vn/medias/standard/2023/10/14/1-1410171107.png', 14, 4, N'Marcus Rashford')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1d5abe4831d9', N'Sergio Reguilon', CAST(N'1997-01-01' AS Date), N'Spain', 15, N'https://www.thesun.co.uk/wp-content/uploads/2023/10/sergio-reguilon-853420314.jpg', 14, 2, N'Sergio Reguilon')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1d5abe4931d9', N'Casemiro', CAST(N'1992-01-01' AS Date), N'Brazil', 18, N'https://images2.thanhnien.vn/528068263637045248/2023/10/20/casemiro-1697769715350658808454.jpeg', 14, 3, N'Casemiro')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1d5abe4932d9', N'Scott McTominay', CAST(N'1997-01-01' AS Date), N'Scotland', 39, N'https://media.bongda.com.vn/files/hai.phan/2023/06/10/0_gettyimages-1242948536-0927.jpg', 14, 3, N'Scott McTominay')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1d5abe4932da', N'Christian Eriksen', CAST(N'1992-01-01' AS Date), N'Denmark', 14, N'https://cdnphoto.dantri.com.vn/N8AAv1HvFktIp4JXhXhGbk8m2Z4=/thumb_w/1020/2023/09/17/eriksen-2-edited-1694914213628.jpeg', 14, 3, N'Christian Eriksen')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1d5ade4829d9', N'Diogo Dalot', CAST(N'1999-01-01' AS Date), N'Portugal', 20, N'https://image.sggp.org.vn/w560/Uploaded/2023/dqmbbcvo/2023_06_01/dalot-7356.jpeg', 14, 2, N'Diogo Dalot')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1d5ade4830d9', N'Aaron Wan-Bissaka', CAST(N'1998-01-01' AS Date), N'England', 29, N'https://i.dailymail.co.uk/1s/2023/09/18/13/75554297-0-image-a-24_1695039547369.jpg', 14, 2, N'Aaron Wan-Bissaka')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1d5ade4831d9', N'Jonny Evans', CAST(N'1988-01-01' AS Date), N'Ireland', 35, N'https://media-cdn-v2.laodong.vn/storage/newsportal/2023/7/21/1219473/Jonny-Evans-Man-Unit.jpg', 14, 2, N'Jonny Evans')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1d5dbd2045da', N'Anthony Martial', CAST(N'1996-01-01' AS Date), N'French', 9, N'https://static.bongda24h.vn/medias/standard/2023/09/05/6-0509164416.jpg', 14, 4, N'Anthony Martial')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1d5dbd2145da', N'Jadon Sancho', CAST(N'2001-01-01' AS Date), N'England', 25, N'https://prod-media.beinsports.com/image/1697785203819_8763a813-f971-4199-86c4-1f36c82d3981.jpg', 14, 4, N'Jadon Sancho')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1d5dbd4045da', N'Antony', CAST(N'2000-01-01' AS Date), N'Brazil', 21, N'https://media.baoquangninh.vn/upload/image/202309/medium/2130647_e7a1bb20afdcf22dc37600be4d192605.png', 14, 4, N'Antony')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1d5dbe4045da', N'Alejandro Garnacho', CAST(N'2004-01-01' AS Date), N'Argentina', 49, N'https://e0.365dm.com/23/11/2048x1152/skysports-alejandro-garnacho_6351952.jpg?20231107155247', 14, 4, N'Alejandro Garnacho')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1d5dbe4545da', N'Rasmus Hojlund', CAST(N'2003-01-01' AS Date), N'Denmark', 17, N'https://media.bongda.com.vn/files/thach.pham/2023/10/06/rasmus-hojlund-1730.jpg', 14, 4, N'Rasmus Hojlund')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1e5a5e4829d9', N'Luke Shaw', CAST(N'1994-01-01' AS Date), N'England', 23, N'https://prod-media.beinsports.com/image/1697839271194_4062f01b-a2bf-4cd7-ad59-5570d38b0d68.jpg', 14, 2, N'Luke Shaw')
INSERT [dbo].[Player] ([ID], [PlayerName], [DOB], [Nationality], [Number], [Image], [ClubID], [PlayerLocationID], [Description]) VALUES (N'8229cd52-71c6-4dce-876e-1e5ade4829d9', N'Tyrell Malacia', CAST(N'2000-01-01' AS Date), N'Dutch', 12, N'https://media-cdn-v2.laodong.vn/Storage/NewsPortal/2022/9/27/1098177/Tyrell-Malacia.jpg', 14, 2, N'Tyrell Malacia')
GO
INSERT [dbo].[PlayerLocation] ([ID], [PlayerLocationName]) VALUES (1, N'Goalkeeper')
INSERT [dbo].[PlayerLocation] ([ID], [PlayerLocationName]) VALUES (2, N'Defense')
INSERT [dbo].[PlayerLocation] ([ID], [PlayerLocationName]) VALUES (3, N'Middlefield')
INSERT [dbo].[PlayerLocation] ([ID], [PlayerLocationName]) VALUES (4, N'Forward')
GO
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (1, 11, 9, 0, 28, 8, 20, 27, 2)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (2, 11, 8, 2, 23, 13, 10, 26, 1)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (3, 11, 7, 3, 24, 10, 14, 24, 1)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (4, 11, 7, 3, 23, 9, 14, 24, 1)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (5, 11, 7, 1, 26, 16, 10, 22, 3)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (6, 11, 6, 2, 27, 11, 16, 20, 3)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (7, 11, 5, 3, 24, 20, 4, 18, 3)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (8, 11, 6, 0, 12, 16, -4, 18, 5)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (9, 11, 4, 4, 19, 14, 5, 16, 3)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (10, 11, 4, 3, 17, 12, 5, 15, 4)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (11, 11, 4, 3, 10, 13, -3, 15, 4)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (12, 11, 4, 2, 18, 20, -2, 14, 5)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (13, 11, 3, 4, 12, 15, -3, 13, 4)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (14, 11, 3, 3, 14, 19, -5, 12, 5)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (15, 11, 3, 3, 9, 17, -8, 12, 5)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (16, 11, 3, 2, 11, 15, -4, 11, 6)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (17, 11, 1, 3, 10, 21, -11, 6, 7)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (18, 11, 1, 3, 9, 27, -18, 6, 7)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (19, 11, 1, 1, 8, 27, -19, 4, 9)
INSERT [dbo].[Ranking] ([ID], [Matches], [Win], [Draw], [Goal], [LoseGoal], [NumberDifference], [Score], [Lose]) VALUES (20, 11, 1, 1, 9, 30, -21, 4, 9)
GO
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (1, N'Emirates')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (2, N'Dafabet')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (3, N'DK8')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (4, N'Hollywoodbets')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (5, N'American Express')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (6, N'W88')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (7, N'TBA')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (8, N'Cinch')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (9, N'Stake.com')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (10, N'SBOTOP')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (11, N'Standard Chartered')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (12, N'Utilita')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (13, N'Etihad Airways')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (14, N'TeamViewer')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (15, N'Sela')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (16, N'UNHCR')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (17, N'Randox')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (18, N'AIA')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (19, N'Betway')
INSERT [dbo].[Sponsor] ([ID], [SponsorName]) VALUES (20, N'AstroPay')
GO
ALTER TABLE [dbo].[Club]  WITH CHECK ADD  CONSTRAINT [FK_Club_CostumeManufacturer] FOREIGN KEY([CostumeManufacturer])
REFERENCES [dbo].[CostumeManufacturer] ([ID])
GO
ALTER TABLE [dbo].[Club] CHECK CONSTRAINT [FK_Club_CostumeManufacturer]
GO
ALTER TABLE [dbo].[Club]  WITH CHECK ADD  CONSTRAINT [FK_Club_Ranking] FOREIGN KEY([RankingID])
REFERENCES [dbo].[Ranking] ([ID])
GO
ALTER TABLE [dbo].[Club] CHECK CONSTRAINT [FK_Club_Ranking]
GO
ALTER TABLE [dbo].[Club]  WITH CHECK ADD  CONSTRAINT [FK_Club_Sponsor] FOREIGN KEY([Sponsor])
REFERENCES [dbo].[Sponsor] ([ID])
GO
ALTER TABLE [dbo].[Club] CHECK CONSTRAINT [FK_Club_Sponsor]
GO
ALTER TABLE [dbo].[Coach]  WITH CHECK ADD  CONSTRAINT [FK_Coach_Club] FOREIGN KEY([ClubID])
REFERENCES [dbo].[Club] ([ID])
GO
ALTER TABLE [dbo].[Coach] CHECK CONSTRAINT [FK_Coach_Club]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Club] FOREIGN KEY([HomeClubID])
REFERENCES [dbo].[Club] ([ID])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Club]
GO
ALTER TABLE [dbo].[Match]  WITH CHECK ADD  CONSTRAINT [FK_Match_Club1] FOREIGN KEY([AwayClubID])
REFERENCES [dbo].[Club] ([ID])
GO
ALTER TABLE [dbo].[Match] CHECK CONSTRAINT [FK_Match_Club1]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_Club] FOREIGN KEY([ClubID])
REFERENCES [dbo].[Club] ([ID])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Player_Club]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_PlayerLocation] FOREIGN KEY([PlayerLocationID])
REFERENCES [dbo].[PlayerLocation] ([ID])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Player_PlayerLocation]
GO
