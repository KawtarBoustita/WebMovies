CREATE TABLE [dbo].[Movie](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [text] NOT NULL,
	[Duration] [int] NOT NULL,
	[Image] [nvarchar](250) NULL,
	[ReleaseDate] [datetime] NOT NULL,
	[Rating] [float] NOT NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK__Movie__3214EC27F5219BFA] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/6/2022 7:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[isActive] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Movie] ON 

INSERT [dbo].[Movie] ([ID], [Title], [Description], [Duration], [Image], [ReleaseDate], [Rating], [Country]) VALUES (4, N'The Shawshank Redemption', N'Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.', 142, N'gUgdoneM2fzsT6Qx7GhGU4kxUgx.jpg', CAST(N'1994-09-23T00:00:00.000' AS DateTime), 8.7, N'USA')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Duration], [Image], [ReleaseDate], [Rating], [Country]) VALUES (5, N'The Godfather', N'Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.', 175, N'eEslKSwcqmiNS6va24Pbxf2UKmJ.jpg', CAST(N'1972-03-15T00:00:00.000' AS DateTime), 8.7, N'USA')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Duration], [Image], [ReleaseDate], [Rating], [Country]) VALUES (6, N'Parasite', N'All unemployed, Ki-taek''s family takes peculiar interest in the wealthy and glamorous Parks for their livelihood until they get entangled in an unexpected incident.', 133, N'7IiTTgloJzvGI1TAYymCfbfl3vT.jpg', CAST(N'2019-05-30T00:00:00.000' AS DateTime), 8.5, N'South Korea')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Duration], [Image], [ReleaseDate], [Rating], [Country]) VALUES (7, N'The Good, the Bad and the Ugly', N'While the Civil War rages between the Union and the Confederacy, three men – a quiet loner, a ruthless hit man and a Mexican bandit – comb the American Southwest in search of a strongbox containing $200,000 in stolen gold.', 161, N'bX2xnavhMYjWDoZp1VM6VnU1xwe.jpg', CAST(N'1966-12-23T00:00:00.000' AS DateTime), 8.5, N'USA')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Duration], [Image], [ReleaseDate], [Rating], [Country]) VALUES (8, N'Pulp Fiction', N'A burger-loving hit man, his philosophical partner, a drug-addled gangster''s moll and a washed-up boxer converge in this sprawling, comedic crime caper. Their adventures unfurl in three stories that ingeniously trip back and forth in time.', 154, N'5icxR4X8GFVVWmJ88NFu8LX8B1Z.jpg', CAST(N'1994-10-14T00:00:00.000' AS DateTime), 8.5, N'USA')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Duration], [Image], [ReleaseDate], [Rating], [Country]) VALUES (9, N'The Lord of the Rings: The Return of the King', N'Aragorn is revealed as the heir to the ancient kings as he, Gandalf and the other members of the broken fellowship struggle to save Gondor from Sauron''s forces. Meanwhile, Frodo and Sam take the ring closer to the heart of Mordor, the dark lord''s realm.', 201, N'rCzpDGLbOoPwLjy3OAm5NUPOTrC.jpg', CAST(N'2003-12-01T00:00:00.000' AS DateTime), 8.5, N'New Zealand')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Duration], [Image], [ReleaseDate], [Rating], [Country]) VALUES (11, N'The Dark Knight', N'Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.', 152, N'qJ2tW6WMUDux911r6m7haRef0WH.jpg', CAST(N'2008-07-18T00:00:00.000' AS DateTime), 8.5, N'USA')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Duration], [Image], [ReleaseDate], [Rating], [Country]) VALUES (12, N'Forrest Gump', N'
A man with a low IQ has accomplished great things in his life and been present during significant historic events—in each case, far exceeding what anyone imagined he could do. But despite all he has achieved, his one true love eludes him.', 142, N'saHP97rTPS5eLmrLQEcANmKrsFl.jpg', CAST(N'1994-07-06T00:00:00.000' AS DateTime), 8.5, N'USA')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Duration], [Image], [ReleaseDate], [Rating], [Country]) VALUES (13, N'GoodFellas', N'
The true story of Henry Hill, a half-Irish, half-Sicilian Brooklyn kid who is adopted by neighbourhood gangsters at an early age and climbs the ranks of a Mafia family under the guidance of Jimmy Conway.', 145, N'aKuFiU82s5ISJpGZp7YkIr3kCUd.jpg', CAST(N'1990-09-21T00:00:00.000' AS DateTime), 8.5, N'USA')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Duration], [Image], [ReleaseDate], [Rating], [Country]) VALUES (14, N'Fight Club', N'A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground "fight clubs" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.', 139, N'pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg', CAST(N'1999-10-15T00:00:00.000' AS DateTime), 8.4, N'USA')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Duration], [Image], [ReleaseDate], [Rating], [Country]) VALUES (15, N'The Pianist', N'The true story of pianist Wladyslaw Szpilman''s experiences in Warsaw during the Nazi occupation. When the Jews of the city find themselves forced into a ghetto, Szpilman finds work playing in a café; and when his family is deported in 1942, he stays behind, works for a while as a laborer, and eventually goes into hiding in the ruins of the war-torn city.', 150, N'2hFvxCCWrTmCYwfy7yum0GKRi3Y.jpg', CAST(N'2003-03-28T00:00:00.000' AS DateTime), 8.4, N'USA')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Duration], [Image], [ReleaseDate], [Rating], [Country]) VALUES (16, N'The Lord of the Rings: The Fellowship of the Ring', N'Young hobbit Frodo Baggins, after inheriting a mysterious ring from his uncle Bilbo, must leave his home in order to keep it from falling into the hands of its evil creator. Along the way, a fellowship is formed to protect the ringbearer and make sure that the ring arrives at its final destination: Mt. Doom, the only place where it can be destroyed.', 179, N'6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg', CAST(N'2001-12-19T00:00:00.000' AS DateTime), 8.4, N'USA')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Duration], [Image], [ReleaseDate], [Rating], [Country]) VALUES (17, N'American History X', N'Derek Vineyard is paroled after serving 3 years in prison for killing two African-American men. Through his brother, Danny Vineyard''s narration, we learn that before going to prison, Derek was a skinhead and the leader of a violent white supremacist gang that committed acts of racial crime throughout L.A. and his actions greatly influenced Danny. Reformed and fresh out of prison, Derek severs contact with the gang and becomes determined to keep Danny from going down the same violent path as he did.', 119, N'c2gsmSQ2Cqv8zosqKOCwRS0GFBS.jpg', CAST(N'1998-11-20T00:00:00.000' AS DateTime), 8.4, N'USA')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Duration], [Image], [ReleaseDate], [Rating], [Country]) VALUES (18, N'Interstellar', N'The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.', 169, N'gEU2QniE6E77NI6lCU6MxlNBvIx.jpg', CAST(N'2014-11-07T00:00:00.000' AS DateTime), 8.4, N'USA')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Duration], [Image], [ReleaseDate], [Rating], [Country]) VALUES (19, N'The Lord of the Rings: The Two Towers', N'Frodo and Sam are trekking to Mordor to destroy the One Ring of Power while Gimli, Legolas and Aragorn search for the orc-captured Merry and Pippin. All along, nefarious wizard Saruman awaits the Fellowship members at the Orthanc Tower in Isengard.

', 179, N'5VTN0pR8gcqV3EPUHHfMGnJYN9L.jpg', CAST(N'2002-12-18T00:00:00.000' AS DateTime), 8.4, N'New Zealand')
INSERT [dbo].[Movie] ([ID], [Title], [Description], [Duration], [Image], [ReleaseDate], [Rating], [Country]) VALUES (20, N'Léon: The Professional', N'Léon, the top hit man in New York, has earned a rep as an effective "cleaner". But when his next-door neighbors are wiped out by a loose-cannon DEA agent, he becomes the unwilling custodian of 12-year-old Mathilda. Before long, Mathilda''s thoughts turn to revenge, and she considers following in Léon''s footsteps.', 111, N'yI6X2cCM5YPJtxMhUd3dPGqDAhw.jpg', CAST(N'1994-09-14T00:00:00.000' AS DateTime), 8.3, N'France')
SET IDENTITY_INSERT [dbo].[Movie] OFF
GO
USE [master]
GO
ALTER DATABASE [Movies] SET  READ_WRITE 
GO
