USE [Hanime];
GO

EXEC [sp_create_account] 
'admin', 
'f98d80dbb48c6cfffd51fc698c6d8fb9a666a5135ff9f9df227098a51f90ac74', 
'yuyu2711@outlook.com',
0, 
1;

-- Categories
INSERT INTO [Category]([Name], [Description]) VALUES 
(N'Shonen', N''),
(N'Shoujo', N''),
(N'Seinen', N''),
(N'Josei', N''),
(N'Ecchi', N''),
(N'Harem', N''),
(N'Isekai', N''),
(N'Mecha', N''),
(N'Slice of Life', N''),
(N'Kodomomuke', N''),
(N'Iyashikei', N'')

-- Films
INSERT INTO [Film]([Name], [Description], [ThumbnailURL])
VALUES
(N'SPYxFAMILY', N'Vì những lý do riêng, một điệp viên, một sát thủ và một nhà ngoại cảm bắt tay đóng giả làm một gia đình trong khi che giấu danh tính thật của họ với nhau.', 'https://res.cloudinary.com/quang2002/image/upload/spy-x-family_phgcz5')

-- Videos
INSERT INTO [Video]([Name], [ThumbnailURL], [VideoURL], [ReleaseDate], [Length], [View], [FilmID]) 
VALUES
(N'SPY x FAMILY - Tập 1', NULL, 'https://mega.nz/embed/D15BnYKb#l71Zb6rQ7vvt-etkutYUv07eGRkfVnv5v6M30ppygNE', GETDATE(), 30, 0, (SELECT [ID] FROM [Film] WHERE [Name] = N'SPYxFAMILY')),
(N'SPY x FAMILY - Tập 2', NULL, 'https://mega.nz/embed/m5QzyRxB#bfFm2UWdVUjPZczeh0yO2YlctwiXv1mLukGdt_eIRVg', GETDATE(), 30, 0, (SELECT [ID] FROM [Film] WHERE [Name] = N'SPYxFAMILY')),
(N'SPY x FAMILY - Tập 3', NULL, 'https://mega.nz/embed/uxoCRZJC#wXNgLQ984_Ynqnr-YJP7dZM2Ntpbz8Nsd_cyYLAd20A', GETDATE(), 30, 0, (SELECT [ID] FROM [Film] WHERE [Name] = N'SPYxFAMILY')),
(N'SPY x FAMILY - Tập 4', NULL, 'https://mega.nz/embed/G0Bm3YJJ#iZ08o9UKejzJoVsMAA9HZR6_BYRPSwxYi0vVsQPK9EU', GETDATE(), 30, 0, (SELECT [ID] FROM [Film] WHERE [Name] = N'SPYxFAMILY')),
(N'SPY x FAMILY - Tập 5', NULL, 'https://mega.nz/embed/2pBhGJRR#J4kMOG85CDSYniHm1F7mZkTEWQ9tIeRMjbUynFpZovI', GETDATE(), 30, 0, (SELECT [ID] FROM [Film] WHERE [Name] = N'SPYxFAMILY')),
(N'SPY x FAMILY - Tập 6', NULL, 'https://mega.nz/embed/a05HDaqZ#3QyS-x_ssP5-oNxOgJGlNToWih7baE4mdNC7CxgjbSg', GETDATE(), 30, 0, (SELECT [ID] FROM [Film] WHERE [Name] = N'SPYxFAMILY')),
(N'SPY x FAMILY - Tập 7', NULL, 'https://mega.nz/embed/bkBwVYLA#QbQ0WOEXUz1T86CpfZMhPmVma3N7ZLpibcu-lKZk_6E', GETDATE(), 30, 0, (SELECT [ID] FROM [Film] WHERE [Name] = N'SPYxFAMILY')),
(N'SPY x FAMILY - Tập 8', NULL, 'https://mega.nz/embed/3xgSSQqZ#czPW8wOcN8DFllr8DKuYJEZegwuBpwe-Hc9kJQfV9Hk', GETDATE(), 30, 0, (SELECT [ID] FROM [Film] WHERE [Name] = N'SPYxFAMILY')),
(N'SPY x FAMILY - Tập 9', NULL, 'https://mega.nz/embed/r9IEgQzT#T2xWm03M_znH2f6MfjPw7jo9kGh5pS5n51mEerYr5pw', GETDATE(), 30, 0, (SELECT [ID] FROM [Film] WHERE [Name] = N'SPYxFAMILY')),
(N'SPY x FAMILY - Tập 10', NULL, 'https://mega.nz/embed/msRVlQBJ#-SE7PKVSXoK0DR4G6Gq_sueB2RUY8MjRy_n8UJUXYhA', GETDATE(), 30, 0, (SELECT [ID] FROM [Film] WHERE [Name] = N'SPYxFAMILY')),
(N'SPY x FAMILY - Tập 11', NULL, 'https://mega.nz/embed/KwAEXLjJ#FaossxmWntnbdYld2meXcIrqMYF8qAOAQTdWdc-W2ck', GETDATE(), 30, 0, (SELECT [ID] FROM [Film] WHERE [Name] = N'SPYxFAMILY'))
