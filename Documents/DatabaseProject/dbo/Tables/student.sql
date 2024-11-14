CREATE TABLE [dbo].[student] (
    [studentid]   INT            NOT NULL,
    [studentname] NVARCHAR (50)  NOT NULL,
    [age]         INT            NULL,
    [address]     NVARCHAR (100) NULL,
    [class]       NVARCHAR (20)  NULL,
    PRIMARY KEY CLUSTERED ([studentid] ASC),
    CHECK ([age]>=(1) AND [age]<=(120))
);


GO

