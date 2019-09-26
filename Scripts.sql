Create Database CodeMaze

CREATE TABLE [dbo].[Owners] (
    [Id]      UNIQUEIDENTIFIER NOT NULL,
    [Name]    NVARCHAR (MAX)   NOT NULL,
    [Address] NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Owners] PRIMARY KEY CLUSTERED ([Id] ASC)
);

CREATE TABLE [dbo].[Accounts] (
    [Id]          UNIQUEIDENTIFIER NOT NULL,
    [Type]        INT              NOT NULL,
    [Description] NVARCHAR (MAX)   NULL,
    [OwnerId]     UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Accounts_Owners_OwnerId] FOREIGN KEY ([OwnerId]) REFERENCES [dbo].[Owners] ([Id]) ON DELETE CASCADE
);


GO
CREATE NONCLUSTERED INDEX [IX_Accounts_OwnerId]
    ON [dbo].[Accounts]([OwnerId] ASC);



INSERT INTO [dbo].[Owners] ([Id], [Name], [Address]) VALUES (N'514c3bc3-14df-4515-bc13-256e75dd2e9f', N'John Doe', N'John Doe''s address')
INSERT INTO [dbo].[Owners] ([Id], [Name], [Address]) VALUES (N'791716be-7eff-4370-814e-3884d27ae682', N'Jane Doe', N'Jane Doe''s address')
INSERT INTO [dbo].[Owners] ([Id], [Name], [Address]) VALUES (N'04ecac6c-544a-414e-8059-a538c3b6968c', N'My Name', N'My Address')


INSERT INTO [dbo].[Accounts] ([Id], [Type], [Description], [OwnerId]) VALUES (N'c810d02e-5235-45ff-80b4-34bca427479f', 3, N'Income account for our users', N'791716be-7eff-4370-814e-3884d27ae682')
INSERT INTO [dbo].[Accounts] ([Id], [Type], [Description], [OwnerId]) VALUES (N'cb9ffd28-1fb2-4ce9-9f39-497bdf8a5096', 0, N'Cash account for our users', N'514c3bc3-14df-4515-bc13-256e75dd2e9f')
INSERT INTO [dbo].[Accounts] ([Id], [Type], [Description], [OwnerId]) VALUES (N'4855d973-eb70-48f1-a619-a2d62ce124d3', 1, N'Savings account for our users', N'791716be-7eff-4370-814e-3884d27ae682')



