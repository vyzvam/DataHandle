USE [TEST]
GO
/****** Object:  Table [dbo].[UserAccessTypes]    Script Date: 9/16/2015 3:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccessTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Type] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserAccessTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserGroupModuleAccesses]    Script Date: 9/16/2015 3:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroupModuleAccesses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserGroupId] [int] NOT NULL,
	[UserModuleAccessTypeId] [int] NOT NULL,
	[hasAccess] [bit] NOT NULL,
	[Type] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserGroupModuleAccesses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserGroups]    Script Date: 9/16/2015 3:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Level] [tinyint] NOT NULL,
	[Type] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.UserGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserModuleAccessTypes]    Script Date: 9/16/2015 3:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserModuleAccessTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserModuleId] [int] NOT NULL,
	[UserAccessTypeId] [int] NOT NULL,
	[IsAllowed] [bit] NOT NULL,
	[Type] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserModuleAccessTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserModules]    Script Date: 9/16/2015 3:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserModules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[UserModuleId] [int] NULL,
	[ListOrder] [int] NOT NULL,
	[CssIcon] [nvarchar](50) NULL,
	[MvcController] [nvarchar](50) NULL,
	[MvcAction] [nvarchar](50) NULL,
	[Type] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UserModule_Id] [int] NULL,
 CONSTRAINT [PK_dbo.UserModules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/16/2015 3:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NULL,
	[Password] [nvarchar](max) NULL,
	[GroupId] [int] NOT NULL,
	[Type] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[UserGroups] ADD  CONSTRAINT [DF__UserGroup__Level__778AC167]  DEFAULT ((0)) FOR [Level]
GO
ALTER TABLE [dbo].[UserModules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserModules_dbo.UserModules_UserModule_Id] FOREIGN KEY([UserModule_Id])
REFERENCES [dbo].[UserModules] ([Id])
GO
ALTER TABLE [dbo].[UserModules] CHECK CONSTRAINT [FK_dbo.UserModules_dbo.UserModules_UserModule_Id]
GO
ALTER TABLE [dbo].[UserModules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.UserModules_dbo.UserModules_UserModuleId] FOREIGN KEY([UserModuleId])
REFERENCES [dbo].[UserModules] ([Id])
GO
ALTER TABLE [dbo].[UserModules] CHECK CONSTRAINT [FK_dbo.UserModules_dbo.UserModules_UserModuleId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Users_dbo.UserGroups_GroupId] FOREIGN KEY([GroupId])
REFERENCES [dbo].[UserGroups] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_dbo.Users_dbo.UserGroups_GroupId]
GO
