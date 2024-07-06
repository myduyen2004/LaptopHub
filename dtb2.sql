ALTER TABLE [dbo].[User] ADD Email VARCHAR(255);

INSERT INTO [User] (userName,fullName,password,roleId,image,birthday,address,phone,status,Email) VALUES
(N'duyen', N'Duyên', 'password123', 1,'./images/avatar/default.jpg', '2004-03-31', N'Nghệ An', N'0945548214', 1, 'vtmyduyen3103@gmail.com')

UPDATE [dbo].[User]
SET password = '12345678'
WHere userName = 'duyen'

UPDATE [dbo].[User]
SET image = './images/avatar/default.jpg'
WHere userName = 'duyen'

UPDATE [dbo].[User]
SET birthday = '2004-11-15'
WHere userName = 'duyen'

SELECT * FROM [dbo].[User] WHERE userName = 'duyen'
SELECT * FROM [dbo].[Product]
SELECT * FROM [dbo].[ImageProduct]