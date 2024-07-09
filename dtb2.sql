ALTER TABLE [dbo].[User] ADD Email VARCHAR(255);

INSERT INTO [User] (userName,fullName,password,roleId,image,birthday,address,phone,status,Email) VALUES
(N'duyen', N'Duyên', 'password123', 1,'./image/avatar/default.jpg', '2004-03-31', N'Nghệ An', N'0945548214', 1, 'vtmyduyen3103@gmail.com')

UPDATE [dbo].[User]
SET password = '12345678'
WHere userName = 'duyen'

SELECT * FROM [dbo].[User] WHERE userName = 'duyen'
SELECT * FROM [dbo].[Product]
SELECT * FROM [dbo].[ImageProduct]
SELECT * FROM [dbo].[Transaction]
SELECT * FROM [dbo].[Wallet]
SELECT * FROM [dbo].[Order]
SELECT * FROM [dbo].[OrderDetails]
SELECT * FROM [dbo].[Shipment]
INSERT INTO [dbo].[Transaction](walletId,amount, createdDate, transactionType, status) VALUES
(1,23, '2024-02-25', N'Thanh toán online', 0);

CREATE TRIGGER tr_subtract_wallet_balance
ON [dbo].[Transaction]
AFTER INSERT
AS
BEGIN
    UPDATE [dbo].[Wallet]
    SET [dbo].[Wallet].balance = [dbo].[Wallet].balance - i.amount
    FROM [dbo].[Wallet]
    INNER JOIN inserted i ON [dbo].[Wallet].walletId = i.walletId
    WHERE i.status = 1;
END;

CREATE TRIGGER tr_plus_wallet_balance
ON [dbo].[Transaction]
AFTER INSERT
AS
BEGIN
    UPDATE [dbo].[Wallet]
    SET [dbo].[Wallet].balance = [dbo].[Wallet].balance + i.amount
    FROM [dbo].[Wallet]
    INNER JOIN inserted i ON [dbo].[Wallet].walletId = i.walletId
    WHERE i.status = 0;
END;

ALTER TABLE [dbo].[Order] DROP COLUMN transactionId;
ALTER TABLE [dbo].[Transaction] DROP COLUMN transactionType;
ALTER TABLE [dbo].[Order] ADD payment NVARCHAR(255);

ALTER TABLE [dbo].[Order] DROP COLUMN time;
ALTER TABLE [dbo].[Transaction] ADD time VARCHAR(50);

ALTER TABLE [dbo].[Order] ADD address NVARCHAR(250);
ALTER TABLE [dbo].[Order] ADD ward NVARCHAR(250);
ALTER TABLE [dbo].[Order] ADD province NVARCHAR(250);
ALTER TABLE [dbo].[Order] ADD district NVARCHAR(250);
ALTER TABLE [dbo].[Order] ADD phone NVARCHAR(20);
