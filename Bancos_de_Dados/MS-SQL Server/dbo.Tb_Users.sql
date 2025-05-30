USE [dbMultUS]
GO

/****** Object:  Table [dbo].[Tb_Users]    Script Date: 15/05/2025 20:35:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tb_Users](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [nchar](40) NOT NULL,
	[User_Password] [nchar](8) NOT NULL,
 CONSTRAINT [PK_TbUsers] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

