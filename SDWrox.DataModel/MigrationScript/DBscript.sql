USE [SDWroxModel]
GO
/****** Object:  Table [dbo].[TbOrder]    Script Date: 5/2/2024 11:53:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShopId] [int] NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[description] [nvarchar](max) NULL,
	[DeliveryDate] [datetime] NULL,
	[Owner] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_TbOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbOrderDetail]    Script Date: 5/2/2024 11:53:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbOrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [float] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Discount] [decimal](18, 0) NULL,
 CONSTRAINT [PK_TbOrderDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbProduct]    Script Date: 5/2/2024 11:53:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_TbProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TbShop]    Script Date: 5/2/2024 11:53:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TbShop](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Address] [nvarchar](1000) NULL,
	[PhoneNumber] [nvarchar](16) NULL,
	[EmailAddress] [nvarchar](500) NULL,
 CONSTRAINT [PK_TbShop] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TbOrder] ON 

INSERT [dbo].[TbOrder] ([Id], [ShopId], [Number], [Date], [Title], [description], [DeliveryDate], [Owner]) VALUES (4, 1, N'0', CAST(N'2024-05-02T04:57:02.657' AS DateTime), N'Order 1', N'Test Order Creation 1', CAST(N'2024-05-23T00:00:00.000' AS DateTime), N'Behnam M')
INSERT [dbo].[TbOrder] ([Id], [ShopId], [Number], [Date], [Title], [description], [DeliveryDate], [Owner]) VALUES (5, 1, N'0', CAST(N'2024-05-02T04:59:22.400' AS DateTime), N'Order 5', N'Test Order', CAST(N'2024-05-28T00:00:00.000' AS DateTime), N'Behnam M')
SET IDENTITY_INSERT [dbo].[TbOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[TbOrderDetail] ON 

INSERT [dbo].[TbOrderDetail] ([Id], [OrderId], [ProductId], [Count], [Price], [Discount]) VALUES (4, 4, 1, 6, CAST(600 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)))
INSERT [dbo].[TbOrderDetail] ([Id], [OrderId], [ProductId], [Count], [Price], [Discount]) VALUES (5, 5, 2, 4, CAST(400 AS Decimal(18, 0)), CAST(100 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[TbOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[TbProduct] ON 

INSERT [dbo].[TbProduct] ([Id], [Title], [Description]) VALUES (1, N'TestProduct', N'Test Product ')
INSERT [dbo].[TbProduct] ([Id], [Title], [Description]) VALUES (2, N'TestProduct2', N'Test Product 2')
SET IDENTITY_INSERT [dbo].[TbProduct] OFF
GO
SET IDENTITY_INSERT [dbo].[TbShop] ON 

INSERT [dbo].[TbShop] ([Id], [Name], [Address], [PhoneNumber], [EmailAddress]) VALUES (1, N'DefaultShop', N'Finland', N'+358445555555', N'test@gmail.om')
SET IDENTITY_INSERT [dbo].[TbShop] OFF
GO
ALTER TABLE [dbo].[TbOrder]  WITH CHECK ADD  CONSTRAINT [FK_TbOrder_TbShop] FOREIGN KEY([ShopId])
REFERENCES [dbo].[TbShop] ([Id])
GO
ALTER TABLE [dbo].[TbOrder] CHECK CONSTRAINT [FK_TbOrder_TbShop]
GO
ALTER TABLE [dbo].[TbOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_TbOrderDetail_TbOrder] FOREIGN KEY([OrderId])
REFERENCES [dbo].[TbOrder] ([Id])
GO
ALTER TABLE [dbo].[TbOrderDetail] CHECK CONSTRAINT [FK_TbOrderDetail_TbOrder]
GO
ALTER TABLE [dbo].[TbOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_TbOrderDetail_TbProduct] FOREIGN KEY([ProductId])
REFERENCES [dbo].[TbProduct] ([Id])
GO
ALTER TABLE [dbo].[TbOrderDetail] CHECK CONSTRAINT [FK_TbOrderDetail_TbProduct]
GO
