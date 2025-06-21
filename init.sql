SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blacklist_token_table](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[expiry] [datetime2](6) NOT NULL,
	[token] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[budget_table]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[budget_table](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[category] [varchar](255) NULL,
	[current_spending] [numeric](38, 5) NULL,
	[money_limit] [numeric](38, 5) NULL,
	[user_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contact_us_table]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contact_us_table](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NULL,
	[images] [text] NULL,
	[message] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[user_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[expense_table]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[expense_table](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[amount] [numeric](38, 10) NULL,
	[category] [varchar](255) NULL,
	[date] [date] NULL,
	[description] [varchar](255) NULL,
	[is_deleted] [bit] NOT NULL,
	[recurring] [bit] NOT NULL,
	[user_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedback_table]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedback_table](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[comments] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[rating] [int] NOT NULL,
	[user_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[goal_table]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[goal_table](
	[current_amount] [numeric](38, 5) NULL,
	[dead_line] [date] NULL,
	[is_deleted] [bit] NOT NULL,
	[target_amount] [numeric](38, 5) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NULL,
	[category] [varchar](255) NULL,
	[expense_ids] [varchar](255) NULL,
	[goal_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[income_table]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[income_table](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[amount] [numeric](38, 10) NULL,
	[category] [varchar](255) NULL,
	[date] [date] NULL,
	[is_deleted] [bit] NOT NULL,
	[recurring] [bit] NOT NULL,
	[source] [varchar](255) NULL,
	[user_id] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[income_table_deleted]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[income_table_deleted](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[expiry_date_time] [datetime2](6) NULL,
	[income_id] [bigint] NULL,
	[start_date_time] [datetime2](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[otp_temp_table]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[otp_temp_table](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[email] [varchar](255) NULL,
	[expiration_time] [datetime2](6) NULL,
	[otp] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[session_token_table]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[session_token_table](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[created_time] [datetime2](6) NULL,
	[expire_time] [datetime2](6) NULL,
	[is_active] [bit] NULL,
	[token] [varchar](255) NULL,
	[username] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_auth_table]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_auth_table](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[otp_count] [int] NOT NULL,
	[password] [varchar](255) NULL,
	[username] [varchar](255) NULL,
	[verification_code] [varchar](255) NULL,
	[verification_code_expiration] [datetime2](6) NULL,
	[is_deleted] [bit] NULL,
	[is_blocked] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_profile_details_table]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_profile_details_table](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[address] [varchar](255) NULL,
	[date_of_birth] [date] NULL,
	[email] [varchar](255) NULL,
	[gender] [varchar](255) NULL,
	[income_range] [float] NOT NULL,
	[marital_status] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[phone] [varchar](255) NULL,
	[profile_image] [text] NULL,
	[user_id] [bigint] NULL,
	[created_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[getAllBudgetsByUserId]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllBudgetsByUserId] (
	@userId BIGINT,
	@month INT,
	@year INT
	)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT id
		,category
		,currentSpending
		,moneyLimit
		,CAST((currentSpending/moneyLimit)*100 AS BIGINT) AS progressPercentage
	FROM (
		SELECT bt.id AS id
		,bt.category AS category
		,SUM(ISNULL(et.amount, 0)) AS currentSpending
		,bt.money_limit AS moneyLimit
		FROM budget_table bt WITH (NOLOCK)
		LEFT JOIN expense_table et WITH (NOLOCK) ON et.user_id = bt.user_id 
			AND bt.category = et.category
			AND MONTH(et.date) = @month
			AND YEAR(et.date) = @year
			AND et.is_deleted = 0
		WHERE bt.user_id = @userId
		GROUP BY 
        bt.id, bt.category, bt.money_limit
				) AS tempTable

		ORDER BY id
END
GO
/****** Object:  StoredProcedure [dbo].[getAllBudgetsByUserIdAndByCategory]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllBudgetsByUserIdAndByCategory] (
	@userId BIGINT,
	@month INT,
	@year INT,
	@category VARCHAR(100)
	)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT id
		,category
		,currentSpending
		,moneyLimit
		,CAST((currentSpending/moneyLimit)*100 AS BIGINT) AS progressPercentage
	FROM (
		SELECT bt.id as id
			,bt.category as category
			,SUM(ISNULL(et.amount, 0)) AS currentSpending
			,bt.money_limit as moneyLimit
		FROM budget_table bt WITH (NOLOCK)
		LEFT JOIN expense_table et WITH (NOLOCK) ON et.user_id = bt.user_id
			AND et.category = bt.category
			AND MONTH(et.date) = @month
			AND YEAR(et.date) = @year
			AND et.is_deleted = 0
		WHERE bt.user_id = @userId
			AND bt.category = @category

		GROUP BY bt.id, bt.category, bt.money_limit
				) AS tempTable

		ORDER BY id
END
GO
/****** Object:  StoredProcedure [dbo].[getAllExpensesByMonthAndYear]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllExpensesByMonthAndYear] (
	@userId BIGINT,
	@month INT,
	@year INT,
	@deleteStatus BIT
	)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT et.id as id
		,et.category as category
		,et.amount as amount
		,et.date as date
		,et.recurring as recurring
		,et.description as description
		,et.is_deleted as is_deleted
	FROM expense_table et WITH (NOLOCK)
	WHERE et.user_id = @userId
		AND MONTH(et.date) = @month
		AND YEAR(et.date) = @year
		AND et.is_deleted = @deleteStatus
END
GO
/****** Object:  StoredProcedure [dbo].[getAllExpensesByMonthAndYearAndByCategory]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllExpensesByMonthAndYearAndByCategory] (
	@userId BIGINT,
	@month INT,
	@year INT,
	@deleteStatus BIT,
	@category VARCHAR(100)
	)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT et.id as id
		,et.category as category
		,et.amount as amount
		,et.date as date
		,et.recurring as recurring
		,et.description as description
		,et.is_deleted as is_deleted
	FROM expense_table et WITH (NOLOCK)
	WHERE et.user_id = @userId
		AND MONTH(et.date) = @month
		AND YEAR(et.date) = @year
		AND et.is_deleted = @deleteStatus
		AND et.category = @category
END
GO
/****** Object:  StoredProcedure [dbo].[getAllExpensesByUserId]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllExpensesByUserId] (
	@userId BIGINT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM expense_table et WITH (NOLOCK)
	WHERE et.user_id = @userId;
END
GO
/****** Object:  StoredProcedure [dbo].[getAllExpensesByYear]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllExpensesByYear] (
	@userId BIGINT,
	@year INT,
	@deleteStatus BIT
	)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT et.id as id
		,et.category as category
		,et.amount as amount
		,et.date as date
		,et.recurring as recurring
		,et.description as description
		,et.is_deleted as is_deleted
	FROM expense_table et WITH (NOLOCK)
	WHERE et.user_id = @userId
		AND YEAR(et.date) = @year
		AND et.is_deleted = @deleteStatus
END
GO
/****** Object:  StoredProcedure [dbo].[getAllExpensesByYearAndByCategory]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllExpensesByYearAndByCategory] (
	@userId BIGINT,
	@year INT,
	@deleteStatus BIT,
	@category VARCHAR(100)
	)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT et.id as id
		,et.category as category
		,et.amount as amount
		,et.date as date
		,et.recurring as recurring
		,et.description as description
		,et.is_deleted as is_deleted
	FROM expense_table et WITH (NOLOCK)
	WHERE et.user_id = @userId
		AND YEAR(et.date) = @year
		AND et.is_deleted = @deleteStatus
		AND et.category = @category
END
GO
/****** Object:  StoredProcedure [dbo].[getAllGoalsByUserId]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllGoalsByUserId] (
	@userId BIGINT
	)
AS
BEGIN

	SET NOCOUNT ON;
	
	DECLARE @today DATE = GETDATE();
	
	SELECT id
		,goalName
		,currentAmount
		,targetAmount
		,deadLine
		,category
		,isDeleted
		,daysRemaining
		,progressPercentage
		,CASE
			WHEN progressPercentage >= 100 AND daysRemaining > 0 
				THEN 'completed-early'
			WHEN progressPercentage >= 100 AND daysRemaining <=0
				THEN 'completed-on-time'
			WHEN daysRemaining <= 0
				THEN 'overdue'
			ELSE 'in-progress' 
			END AS goalStatus
	FROM (

		SELECT gt.id as id
			,gt.goal_name as goalName
			,gt.current_amount as currentAmount
			,gt.target_amount as targetAmount
			,gt.dead_line as deadLine
			,gt.category as category
			,gt.is_deleted as isDeleted
			,CAST(DATEDIFF(DAY, @today, CAST(gt.dead_line AS DATE)) AS BIGINT) AS daysRemaining
			,CAST(((gt.current_amount / gt.target_amount) * 100) AS BIGINT) AS progressPercentage
		FROM goal_table gt WITH (NOLOCK)
		WHERE gt.user_id = @userId
			AND gt.is_deleted = 0

			) AS tempTable

		
	ORDER BY id
END
GO
/****** Object:  StoredProcedure [dbo].[getAllIncomesByMonthAndYear]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllIncomesByMonthAndYear] (
	@userId BIGINT,
	@month INT,
	@year INT,
	@deleteStatus BIT
	)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT it.id as id
		,it.amount as amount
		,it.source as source
		,it.date as date
		,it.category as category
		,it.recurring as recurring
	FROM income_table it WITH (NOLOCK)
	WHERE it.user_id = @userId
	AND MONTH(it.date) = @month
	AND YEAR(it.date) = @year
	AND it.is_deleted = @deleteStatus

	ORDER BY id
END
GO
/****** Object:  StoredProcedure [dbo].[getAllIncomesByMonthAndYearAndByCategory]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllIncomesByMonthAndYearAndByCategory] (
	@userId BIGINT,
	@month INT,
	@year INT,
	@category VARCHAR(100),
	@deleteStatus BIT
	)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT it.id as id
		,it.amount as amount
		,it.source as source
		,it.date as date
		,it.category as category
		,it.recurring as recurring
	FROM income_table it WITH (NOLOCK)
	WHERE it.user_id = @userId
		AND MONTH(it.date) = @month
		AND YEAR(it.date) = @year
		AND it.is_deleted = @deleteStatus
		AND it.category = @category

	ORDER BY id
END
GO
/****** Object:  StoredProcedure [dbo].[getAllIncomesByYear]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllIncomesByYear] (
	@userId BIGINT,
	@year INT,
	@deleteStatus BIT
	)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT it.id as id
		,it.amount as amount
		,it.source as source
		,it.date as date
		,it.category as category
		,it.recurring as recurring
	FROM income_table it WITH (NOLOCK) 
	WHERE it.user_id = @userId 
		AND YEAR(it.date) = @year
		AND it.is_deleted = @deleteStatus

	ORDER BY id
END
GO
/****** Object:  StoredProcedure [dbo].[getAllIncomesByYearAndByCategory]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllIncomesByYearAndByCategory] (
	@userId BIGINT,
	@year INT,
	@category VARCHAR(100),
	@deleteStatus BIT
	)
AS
BEGIN

	SET NOCOUNT ON;

	SELECT it.id as id
		,it.amount as amount
		,it.source as source
		,it.date as date
		,it.category as category
		,it.recurring as recurring
	FROM income_table it WITH (NOLOCK) 
	WHERE it.user_id = @userId 
		AND YEAR(it.date) = @year
		AND it.is_deleted = @deleteStatus
		AND it.category = @category

	ORDER BY id
END
GO
/****** Object:  StoredProcedure [dbo].[getAllIncomesOfUser]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAllIncomesOfUser] (
	@userId BIGINT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM income_table it WITH (NOLOCK)
	WHERE it.user_id = @userId;
END
GO
/****** Object:  StoredProcedure [dbo].[getAvailableBalanceOfUser]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getAvailableBalanceOfUser] (
	@userId BIGINT
	)
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @totalIncome NUMERIC(38,10) = ( 
		SELECT ISNULL(SUM(amount), 0) 
		FROM income_table 
		WHERE user_id = @userId 
			AND is_deleted = 0
			);

    DECLARE @totalExpense NUMERIC(38,10) = (
		SELECT ISNULL(SUM(amount), 0) 
		FROM expense_table 
		WHERE user_id = @userId 
			AND is_deleted = 0
			);

    DECLARE @remaining NUMERIC(38,10) = @totalIncome - @totalExpense;

    SELECT @remaining AS RemainingAmount;

END
GO
/****** Object:  StoredProcedure [dbo].[getBlackListTokenDetailsByToken]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getBlackListTokenDetailsByToken] (
	@token VARCHAR(1000)
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM blacklist_token_table btt WITH (NOLOCK)
	WHERE btt.token = @token;
END
GO
/****** Object:  StoredProcedure [dbo].[getDeletedIncomesInAMonth]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getDeletedIncomesInAMonth] (
	@userId BIGINT,
	@month INT,
	@year INT
	)
AS
BEGIN

	SET NOCOUNT ON;

    SELECT
	it.id,
	it.amount,
	it.source,
	it.date,
	it.category,
	it.recurring,
	CASE 
		WHEN GETDATE() < itd.expiry_date_time
			THEN DATEDIFF(DAY, GETDATE(), itd.expiry_date_time)
		ELSE 0
	END AS daysRemained
	FROM income_table it WITH (NOLOCK)
	JOIN income_table_deleted itd WITH (NOLOCK) ON it.id = itd.income_id
	WHERE it.user_id = @userId
	AND MONTH(it.date) = @month
	AND YEAR(it.date) = @year
	AND it.is_deleted = 1
END
GO
/****** Object:  StoredProcedure [dbo].[getIncomeByIncomeId]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getIncomeByIncomeId] (
	@incomeId BIGINT
	)
AS
BEGIN

	SET NOCOUNT ON;

    SELECT amount from income_table it WITH (NOLOCK)
	WHERE it.id = @incomeId;
END
GO
/****** Object:  StoredProcedure [dbo].[getIncomeBySourceAndCategory]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getIncomeBySourceAndCategory] (
	@userId BIGINT,
	@source VARCHAR(50),
	@category VARCHAR(50),
	@date DATE 
	)
AS
BEGIN

	SET NOCOUNT ON;

    SELECT * 
	FROM income_table it WITH (NOLOCK) 
	WHERE it.user_id = @userId
	AND it.source = @source
	AND it.category = @category
	AND it.is_deleted = 0
	AND MONTH(it.date) = MONTH(@date)
	AND YEAR(it.date) = YEAR(@date);
END
GO
/****** Object:  StoredProcedure [dbo].[getMonthlyExpensesListInAYear]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getMonthlyExpensesListInAYear] (
	@userId BIGINT,
	@year INT,
	@deleteStatus BIT
	)

AS
BEGIN

	SET NOCOUNT ON;

    SELECT MONTH(et.date) as month
	, SUM(et.amount)
	FROM expense_table et WITH (NOLOCK)
	WHERE et.user_id = @userId
	AND YEAR(et.date) = @year
	AND et.is_deleted = @deleteStatus
	GROUP BY MONTH(et.date)
	ORDER BY month ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[getMonthlyIncomesListInAYear]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getMonthlyIncomesListInAYear] (
	@userId BIGINT,
	@year INT,
	@deleteStatus BIT
	)

AS
BEGIN

	SET NOCOUNT ON;

    SELECT MONTH(it.date) as month
	, SUM(it.amount)
	FROM income_table it WITH (NOLOCK)
	WHERE it.user_id = @userId
	AND YEAR(it.date) = @year
	AND it.is_deleted = @deleteStatus
	GROUP BY MONTH(it.date)
	ORDER BY month ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[getNameFromProfileModelByUserId]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getNameFromProfileModelByUserId] (
	@userId BIGINT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT updt.name FROM user_profile_details_table updt WITH (NOLOCK)
	WHERE updt.user_id = @userId;
END
GO
/****** Object:  StoredProcedure [dbo].[getProfileDetailsByUserId]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getProfileDetailsByUserId] (
	@userId BIGINT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM user_profile_details_table updt WITH (NOLOCK)
	WHERE updt.user_id = @userId;
END
GO
/****** Object:  StoredProcedure [dbo].[getRemainingIncomeUpToPreviousMonthByMonthAndYear]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getRemainingIncomeUpToPreviousMonthByMonthAndYear] (
	@userId BIGINT,
	@month INT,
	@year INT
	)
AS
BEGIN

	SET NOCOUNT ON;

    SELECT SUM(it.amount) 
	FROM income_table it WITH (NOLOCK)
	WHERE it.user_id = @userId
	AND YEAR(it.date) = @year
	AND MONTH(it.date) < @month
	AND it.is_deleted = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[getSessionTokenModelByToken]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getSessionTokenModelByToken] (
	@token VARCHAR(1000)
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT stt.* FROM session_token_table stt WITH (NOLOCK)
	where stt.token = @token;
END
GO
/****** Object:  StoredProcedure [dbo].[getSessionTokenModelByUsername]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getSessionTokenModelByUsername] (
	@username VARCHAR(1000)
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM session_token_table stt WITH (NOLOCK)
	where stt.username = @username;
END
GO
/****** Object:  StoredProcedure [dbo].[getTotalCurrentGoalIncome]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getTotalCurrentGoalIncome] (
	@userId BIGINT
	)
AS
BEGIN

	SET NOCOUNT ON;

    SELECT SUM(gt.current_amount)
	FROM goal_table gt WITH (NOLOCK)
	WHERE gt.user_id = @userId
		AND gt.is_deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[getTotalExpenseInMonthAndYear]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getTotalExpenseInMonthAndYear] (
	@userId BIGINT,
	@month INT,
	@year INT
	)
AS
BEGIN

	SET NOCOUNT ON;

    SELECT SUM(et.amount) FROM expense_table et WITH (NOLOCK) 
	WHERE et.user_id = @userId
	AND MONTH(et.date) = @month
	AND YEAR(et.date) = @year
	AND et.is_deleted = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[getTotalExpensesUpToPreviousMonth]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getTotalExpensesUpToPreviousMonth] (
	@userId BIGINT,
	@month INT,
	@year INT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT SUM(et.amount) 
	FROM expense_table et WITH (NOLOCK)
	WHERE et.user_id = @userId
	AND YEAR(et.date) = @year
	AND MONTH(et.date) < @month
	AND et.is_deleted = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[getTotalIncomeInMonthAndYear]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getTotalIncomeInMonthAndYear] (
	@userId BIGINT,
	@month INT,
	@year INT
	)
AS
BEGIN

	SET NOCOUNT ON;

    SELECT SUM(it.amount) 
	FROM income_table it WITH (NOLOCK) 
	WHERE it.user_id = @userId
		AND MONTH(it.date) = @month
		AND YEAR(it.date) = @year
		AND it.is_deleted = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[getTotalTargetGoalIncome]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getTotalTargetGoalIncome] (
	@userId BIGINT
	)
AS
BEGIN

	SET NOCOUNT ON;

    SELECT SUM(gt.target_amount)
	FROM goal_table gt WITH (NOLOCK)
	WHERE gt.user_id = @userId
		AND gt.is_deleted = 0
END
GO
/****** Object:  StoredProcedure [dbo].[getUserAuthDetailsByUsername]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getUserAuthDetailsByUsername] (
	@username VARCHAR(100)
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM user_auth_table uat WITH (NOLOCK)
	WHERE uat.username = @username;
END
GO
/****** Object:  StoredProcedure [dbo].[getUserAuthDetailsListWhoseOtpCountGreaterThanThree]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getUserAuthDetailsListWhoseOtpCountGreaterThanThree] (
	@startOfToday DATETIME2
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM user_auth_table uat WITH (NOLOCK)
	WHERE uat.otp_count > 0 AND
	uat.verification_code_expiration < @startOfToday;
END
GO
/****** Object:  StoredProcedure [dbo].[getUserDetailsByUserId]    Script Date: 28-05-2025 23:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getUserDetailsByUserId] (
	@userId BIGINT
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM user_details_table udt WITH (NOLOCK)
	WHERE udt.user_id = @userId;
END
GO
USE [master]
GO
ALTER DATABASE [moneyfi_db] SET  READ_WRITE 
GO



/****** Object:  Trigger [dbo].[trg_UpdateExpenseFromGoal]    Script Date: 28-05-2025 23:30:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateExpenseFromGoal]
ON [dbo].[goal_table] 
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Temporary table to hold split ids
    ;WITH SplitExpenses AS (
        SELECT 
            gt.goal_name,
            TRIM(value) AS expense_id
        FROM INSERTED gt
        CROSS APPLY STRING_SPLIT(gt.expense_ids, ',')
        WHERE value IS NOT NULL AND TRY_CAST(value AS BIGINT) IS NOT NULL
    )
    UPDATE et
    SET et.description = se.goal_name
    FROM expense_table et
    INNER JOIN SplitExpenses se ON et.id = CAST(se.expense_id AS BIGINT);
END;

GO

ALTER TABLE [dbo].[goal_table] ENABLE TRIGGER [trg_UpdateExpenseFromGoal]
GO