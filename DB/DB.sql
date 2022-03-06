USE [master]
GO
/****** Object:  Database [Tournament]    Script Date: 06/03/2022 11:04:05 ******/
CREATE DATABASE [Tournament]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tournament', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Tournament.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tournament_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Tournament_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Tournament] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tournament].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tournament] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tournament] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tournament] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tournament] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tournament] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tournament] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tournament] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tournament] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tournament] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tournament] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tournament] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tournament] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tournament] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tournament] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tournament] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tournament] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tournament] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tournament] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tournament] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tournament] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tournament] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tournament] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tournament] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tournament] SET  MULTI_USER 
GO
ALTER DATABASE [Tournament] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tournament] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tournament] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tournament] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tournament] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tournament] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Tournament', N'ON'
GO
ALTER DATABASE [Tournament] SET QUERY_STORE = OFF
GO
USE [Tournament]
GO
/****** Object:  Table [dbo].[Matchup]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matchup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[WinnerId] [int] NULL,
	[MatchupRound] [int] NOT NULL,
	[TournamentId] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Matchup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MatchupEntry]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchupEntry](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MatchupId] [int] NOT NULL,
	[ParentMatchupId] [int] NULL,
	[TeamCompetingId] [int] NULL,
	[Score] [nvarchar](50) NULL,
 CONSTRAINT [PK_MatchupEntry] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](150) NOT NULL,
	[EmailAddress] [nvarchar](250) NOT NULL,
	[CellphoneNumber] [nvarchar](50) NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prize]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prize](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PlaceNumber] [int] NOT NULL,
	[PlaceName] [nvarchar](50) NOT NULL,
	[PrizeAmount] [money] NOT NULL,
	[PrizePercentage] [float] NOT NULL,
 CONSTRAINT [PK_Prizes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_team] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamMember]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMember](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TeamId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
 CONSTRAINT [PK_TeamMember] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournament]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournament](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentName] [nvarchar](50) NOT NULL,
	[EntryFee] [money] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Tournament] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TournamentEntry]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentEntry](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NOT NULL,
	[TeamId] [int] NOT NULL,
 CONSTRAINT [PK_TournamentEntries] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TournamentPrize]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentPrize](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NOT NULL,
	[PrizeId] [int] NOT NULL,
 CONSTRAINT [PK_TournamentPrizes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Matchup]  WITH CHECK ADD  CONSTRAINT [FK_Matchup_Team] FOREIGN KEY([WinnerId])
REFERENCES [dbo].[Team] ([id])
GO
ALTER TABLE [dbo].[Matchup] CHECK CONSTRAINT [FK_Matchup_Team]
GO
ALTER TABLE [dbo].[MatchupEntry]  WITH CHECK ADD  CONSTRAINT [FK_MatchupEntry_Matchup] FOREIGN KEY([MatchupId])
REFERENCES [dbo].[Matchup] ([id])
GO
ALTER TABLE [dbo].[MatchupEntry] CHECK CONSTRAINT [FK_MatchupEntry_Matchup]
GO
ALTER TABLE [dbo].[MatchupEntry]  WITH CHECK ADD  CONSTRAINT [FK_MatchupEntry_Team] FOREIGN KEY([TeamCompetingId])
REFERENCES [dbo].[Team] ([id])
GO
ALTER TABLE [dbo].[MatchupEntry] CHECK CONSTRAINT [FK_MatchupEntry_Team]
GO
ALTER TABLE [dbo].[TeamMember]  WITH CHECK ADD  CONSTRAINT [FK_TeamMember_People] FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([id])
GO
ALTER TABLE [dbo].[TeamMember] CHECK CONSTRAINT [FK_TeamMember_People]
GO
ALTER TABLE [dbo].[TeamMember]  WITH CHECK ADD  CONSTRAINT [FK_TeamMember_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([id])
GO
ALTER TABLE [dbo].[TeamMember] CHECK CONSTRAINT [FK_TeamMember_Team]
GO
ALTER TABLE [dbo].[TournamentEntry]  WITH CHECK ADD  CONSTRAINT [FK_TournamentEntry_Team] FOREIGN KEY([TeamId])
REFERENCES [dbo].[Team] ([id])
GO
ALTER TABLE [dbo].[TournamentEntry] CHECK CONSTRAINT [FK_TournamentEntry_Team]
GO
ALTER TABLE [dbo].[TournamentEntry]  WITH CHECK ADD  CONSTRAINT [FK_TournamentEntry_Tournament] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournament] ([id])
GO
ALTER TABLE [dbo].[TournamentEntry] CHECK CONSTRAINT [FK_TournamentEntry_Tournament]
GO
ALTER TABLE [dbo].[TournamentPrize]  WITH CHECK ADD  CONSTRAINT [FK_TournamentPrize_Prize] FOREIGN KEY([PrizeId])
REFERENCES [dbo].[Prize] ([id])
GO
ALTER TABLE [dbo].[TournamentPrize] CHECK CONSTRAINT [FK_TournamentPrize_Prize]
GO
ALTER TABLE [dbo].[TournamentPrize]  WITH CHECK ADD  CONSTRAINT [FK_TournamentPrize_Tournament] FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournament] ([id])
GO
ALTER TABLE [dbo].[TournamentPrize] CHECK CONSTRAINT [FK_TournamentPrize_Tournament]
GO
/****** Object:  StoredProcedure [dbo].[spMatchup_getByTournament]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--get the prizes for a given tournament
CREATE PROCEDURE [dbo].[spMatchup_getByTournament]

	@TournamentId int
	
AS
BEGIN

	SET NOCOUNT ON;

	select m.*
	from dbo.Matchup m
	where m.TournamentId = @TournamentId
	order by m.MatchupRound;

END
GO
/****** Object:  StoredProcedure [dbo].[spMatchupEntries_Insert]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMatchupEntries_Insert]
	@MatchupId int, 
	@ParentMatchupId int,
	@TeamCompetingId int,
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

	insert into dbo.MatchupEntry (MatchupId, ParentMatchupId, TeamCompetingId)
	values (@MatchupId, @ParentMatchupId, @TeamCompetingId);

	select @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spMatchupEntries_Update]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMatchupEntries_Update]
	@id int,
	@TeamCompetingId int = null,
	@Score float = null
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE dbo.MatchupEntry
	SET TeamCompetingId = @TeamCompetingId, Score = @Score
	WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[spMatchupEntry_GetBuMatchup]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--get the team members for a given team
CREATE PROCEDURE [dbo].[spMatchupEntry_GetBuMatchup]
	
	@MatchupId int

AS
BEGIN

	SET NOCOUNT ON;

	select me.*
	from dbo.MatchupEntry me
	join dbo.Matchup m on me.MatchupId = m.id
	where m.id = @MatchupId;


END
GO
/****** Object:  StoredProcedure [dbo].[spMatchups_Insert]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMatchups_Insert]
	@TournamentId int,
	@MatchupRound int,
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

	insert into dbo.Matchup (TournamentId, MatchupRound)
	values (@TournamentId, @MatchupRound);

	select @id = SCOPE_IDENTITY();
	

END
GO
/****** Object:  StoredProcedure [dbo].[spMatchups_Update]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMatchups_Update]
	@id int,
	@WinnerId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE dbo.Matchup
	SET WinnerId = @WinnerId
	WHERE id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[spPeople_GetAll]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--get the prizes for a given tournament
CREATE PROCEDURE [dbo].[spPeople_GetAll]

	
AS
BEGIN

	SET NOCOUNT ON;

	select * from dbo.People;

END
GO
/****** Object:  StoredProcedure [dbo].[spPeople_Insert]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spPeople_Insert] 
	@FirstName nvarchar(100),
	@LastName nvarchar(100),
	@EmailAddress nvarchar(100),
	@CellphoneNumber varchar(20),
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

    insert into dbo.People (FirstName, LastName, EmailAddress, CellphoneNumber)
	values (@FirstName, @LastName, @EmailAddress, @CellphoneNumber);

	select @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spPrize_GetByTournament]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--get the prizes for a given tournament
CREATE PROCEDURE [dbo].[spPrize_GetByTournament]

	@TournamentId int
	
AS
BEGIN

	SET NOCOUNT ON;

	select p.*
	from dbo.Prize p
	inner join dbo.TournamentPrize t on p.id = t.PrizeId
	where t.TournamentId = @TournamentId;

END
GO
/****** Object:  StoredProcedure [dbo].[spPrizes_Insert]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spPrizes_Insert]
	@PlaceNumber int,
	@PlaceName nvarchar(50),
	@PrizeAmount money,
	@PrizePercentage float,
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

    insert into dbo.Prize (PlaceNumber, PlaceName, PrizeAmount, PrizePercentage)
	values (@PlaceNumber, @PlaceName, @PrizeAmount, @PrizePercentage);

	--in this case, because we didnt specify scope, all the funcion is scope, and which is the identity in this scope? u know
	select @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spTeam_GetAll]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTeam_GetAll]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	select * from dbo.Team
END
GO
/****** Object:  StoredProcedure [dbo].[spTeam_GetByTournament]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--get the team for a given tournament
CREATE PROCEDURE [dbo].[spTeam_GetByTournament]

	@TournamentId int
	
AS
BEGIN

	SET NOCOUNT ON;

	select t.*
	from dbo.Team t
	join dbo.TournamentEntry te on te.TeamId = t.id
	join dbo.Tournament tournament on tournament.id = te.TournamentId
	where tournament.id = @TournamentId


END
GO
/****** Object:  StoredProcedure [dbo].[spTeamMember_GetByTteam]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--get the team members for a given team
CREATE PROCEDURE [dbo].[spTeamMember_GetByTteam]

	@TeamId int
	
AS
BEGIN

	SET NOCOUNT ON;

	select tm.*
	from dbo.TeamMember tm
	join dbo.Team t on t.id = tm.TeamId
	where t.id = @TeamId;


END
GO
/****** Object:  StoredProcedure [dbo].[spTeamMembers_Insert]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTeamMembers_Insert]
	@TeamId int,
	@PersonId int,
	@id INT = 0 output
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO dbo.TeamMember(TeamId, PersonId)
	values (@TeamId, @PersonId);

	select @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spTeams_Insert]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTeams_Insert]
	@TeamName nvarchar(100),
	@id INT = 0 output
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO dbo.Team (TeamName)
	values (@TeamName);

	select @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spTournament_Complete]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[spTournament_Complete]
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    update dbo.Tournament
	set Active = 0
	where id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[spTournament_GetAll]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--get the team members for a given team
CREATE PROCEDURE [dbo].[spTournament_GetAll]
	
AS
BEGIN

	SET NOCOUNT ON;

	select *
	from dbo.Tournament
	where Active = 1;


END
GO
/****** Object:  StoredProcedure [dbo].[spTournamentEntries_Insert]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTournamentEntries_Insert] 
	@TournamentId int,
	@TeamId int,
	@id int = 0 output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    insert into dbo.TournamentEntry (TournamentId, TeamId)
	values (@TournamentId, @TeamId)

	select @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spTournamentPrizes_Insert]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTournamentPrizes_Insert]
	@TournamentId int,
	@PrizeId int,
	@id int = 0 output
AS
BEGIN
	SET NOCOUNT ON;

    insert into dbo.TournamentPrize (TournamentId, PrizeId)
	values (@TournamentId, @PrizeId);

	select @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spTournaments_Insert]    Script Date: 06/03/2022 11:04:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spTournaments_Insert]
	@TournamentName nvarchar(200),
	@EntryFee money,
	@id int = 0 output
AS
BEGIN
	
	SET NOCOUNT ON;

    insert into dbo.Tournament (TournamentName, EntryFee, active)
	values (@TournamentName, @EntryFee, 1);

	select @id = SCOPE_IDENTITY();
END
GO
USE [master]
GO
ALTER DATABASE [Tournament] SET  READ_WRITE 
GO
