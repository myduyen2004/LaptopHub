CREATE DATABASE LaptopHub;
GO

USE LaptopHub;
GO

-- Create User Table
CREATE TABLE [User] (
    userName NVARCHAR(50) NOT NULL PRIMARY KEY,
    userId INT NOT NULL IDENTITY(1,1),
    fullName NVARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL CHECK (LEN(password) >= 8), -- Password must be at least 8 characters
    roleId INT NOT NULL,
    image NVARCHAR(MAX),
    birthday DATE,
    address NVARCHAR(255),
    phone NVARCHAR(20),
    status BIT NOT NULL
);

-- Create Wallet Table
CREATE TABLE Wallet (
    walletId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    userName NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES [User](userName),
    balance INT
);

-- Create Transaction Table
CREATE TABLE [Transaction] (
    transactionId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    walletId INT NOT NULL FOREIGN KEY REFERENCES Wallet(walletId),
    amount INT,
    createdDate DATE,
    transactionType NVARCHAR(50),
    status BIT
);

-- Create Order Table
CREATE TABLE [Order] (
    orderId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    date DATE NOT NULL,
    userName NVARCHAR(50) NOT NULL FOREIGN KEY REFERENCES [User](userName),
    totalMoney INT NOT NULL,
    status BIT NOT NULL,
    transactionId INT FOREIGN KEY REFERENCES [Transaction](transactionId)
);

-- Create Shipment Table
CREATE TABLE Shipment (
    shipmentId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    orderId INT NOT NULL FOREIGN KEY REFERENCES [Order](orderId),
    status BIT,
    shipmentName NVARCHAR(100),
    shipmentDate DATE,
    deliveryDate DATE,
    carrier INT,
    totalShip INT
);
-- Create Supplier Table
CREATE TABLE Supplier (
    supplierId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    companyName NVARCHAR(100) NOT NULL UNIQUE,
    homePage NVARCHAR(255),
    country NVARCHAR(100),
	imageLogo NVARCHAR(MAX)
);

-- Create Category Table
CREATE TABLE Category (
    categoryId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    categoryName NVARCHAR(100) NOT NULL UNIQUE,
    description NVARCHAR(255),
    imageCat NVARCHAR(255)
);

-- Create Product Table
CREATE TABLE Product (
    productId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    supplierId INT NOT NULL FOREIGN KEY REFERENCES Supplier(supplierId),
    categoryId INT NOT NULL FOREIGN KEY REFERENCES Category(categoryId),
    productName NVARCHAR(100) NOT NULL,
    quantityPerUnit INT,
    unitPrice INT,
    unitInStock INT,
    quantitySold INT,
    starRating SMALLINT,
    isDiscount BIT,
    description NVARCHAR(MAX),
    releaseDate DATE,
    discount FLOAT,
    status BIT NOT NULL
);

-- Create OrderDetails Table
CREATE TABLE OrderDetails (
    orderId INT NOT NULL,
    productId INT NOT NULL,
    quantity INT,
    unitPrice INT,
    discount FLOAT,
    PRIMARY KEY (orderId, productId),
    FOREIGN KEY (orderId) REFERENCES [Order](orderId),
    FOREIGN KEY (productId) REFERENCES Product(productId)
);

-- Create ImageProduct Table
CREATE TABLE ImageProduct (
    imageId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    productId INT NOT NULL FOREIGN KEY REFERENCES Product(productId),
    imageUrl NVARCHAR(MAX),
    description NVARCHAR(255)
);

 -- insert customer account into User Table
insert into [User] (userName,fullName,password,roleId,image,birthday,address,phone,status)
values
(N'anh', N'Quốc Anh', 'password123', 1,'./image/avatar/default.jpg', '2004-05-10', N'Đà Nẵng', N'0945548214', 1),
(N'thang', N'Minh Thắng', 'password123', 1,'./image/avatar/default.jpg', '2004-04-24', N'Đà Nẵng', N'0945362464', 1),
(N'hung', N'Vũ Hưng', 'password123', 1,'./image/avatar/default.jpg', '2004-12-04', N'Đà Nẵng', N'0925548249', 1),
(N'vu', N'Nguyên Vũ', 'password123', 1,'./image/avatar/default.jpg', '2004-06-21', N'Huế', N'0945612355', 1),
(N'duy', N'Đông Duy', 'password123', 1, './image/avatar/default.jpg', '2002-05-23', N'Hà Nội', N'0975165486', 1),
(N'khiem', N'Viết Khiêm', 'password123', 1, './image/avatar/default.jpg', '2004-05-14', N'Sài Gòn', N'0961451426', 1),
(N'huy', N'Hoảng Huy', 'password123', 1, './image/avatar/default.jpg', '2004-06-17', N'Quảng Bình', N'0987458474', 1),
(N'duong', N'Hoàng Dương', 'password123', 1,'./image/avatar/default.jpg', '2004-09-04', N'Nghệ An', N'0931414547', 1),
(N'tuan', N'Quốc Tuấn', 'password123', 1, './image/avatar/default.jpg', '2004-02-08', N'Hà Tĩnh', N'0465321884', 1),
(N'cuong', N'Minh Cường', 'password123', 1,'./image/avatar/default.jpg', '2004-01-02', N'daklak', N'0964668561', 1),
(N'dung', N'Mạnh Dũng', 'password123', 1, './image/avatar/default.jpg', '2004-06-17', N'Hà Nội', N'0986165454', 1),
(N'bao', N'Đình Bảo', 'password123', 1, './image/avatar/default.jpg', '2004-07-18', N'Quảng Nam', N'0978946512', 1),
(N'dong', N'Trịnh Đông', 'password123', 1, './image/avatar/default.jpg', '2004-03-25', N'Nghệ An', N'0465123654', 1),
(N'anhh', N'Mai Anh', 'password123', 1, './image/avatar/default.jpg', '2004-07-29', N'Kỳ Anh', N'0915668512', 1),
(N'linh', N'Dương Linh', 'password123', 1, './image/avatar/default.jpg', '2004-02-01', N'Hà Tĩnh', N'0916548756', 1),
(N'suong', N'Huệ Sương', 'password123', 1, './image/avatar/default.jpg', '2004-04-08', N'Cà Mau', N'0951326511', 1),
(N'nhy', N'Yến Nhy', 'password123', 1, './image/avatar/default.jpg', '2004-06-13', N'Huế', N'0946532165', 1),
(N'quynh', N'Thúy Quỳnh', 'password123', 1, './image/avatar/default.jpg', '2004-04-10', N'Hà Nội', N'0948532145', 1),
(N'ha', N'Thu Hà', 'password123', 1, './image/avatar/default.jpg', '2004-12-11', N'DakLak', N'0921355454', 1),
(N'tung', N'Sơn Tùng', 'password123', 1, './image/avatar/default.jpg', '2004-10-22', N'Sài Gòn', N'0945784654', 1),
(N'chau', N'Châu Bùi', 'password123', 1, './image/avatar/default.jpg', '2004-11-26', N'Quảng Bình', N'0987965491', 1),
(N'nhi', N'Đoàn Nhi', 'password123', 1,'./image/avatar/default.jpg', '2004-10-12', N'Đà Nẵng', N'0942357946', 1),
(N'tu', N'Cẩm Tú', 'password123', 1, './image/avatar/default.jpg', '2004-03-28', N'Hà Nội', N'0945548214', 1);
go
-- insert admin account into User table
insert into [User](userName,fullName,password,roleId,image,birthday,address,phone,status)
values
(N'Admin1', N'Kim Tú', 'password123', 2,'./image/avatar/default.jpg', '2004-06-04', N'Đà Nẵng', N'0942216514', 1),
(N'Admin2', N'Mỹ Duyên', 'password123', 2,'./image/avatar/default.jpg', '2004-03-28', N'Đà Nẵng', N'0949865445', 1),
(N'Admin3', N'Nguyên Vũ', 'password123', 2, './image/avatar/default.jpg', '2004-07-01', N'Đà Nẵng', N'0949352145', 1),
(N'Admin4', N'Hoàng Dương', 'password123', 2, './image/avatar/default.jpg', '2004-09-13', N'Đà Nẵng', N'0978621445', 1),
(N'Admin5', N'Đình Quang', 'password123', 2,'./image/avatar/default.jpg', '2004-08-23', N'Đà Nẵng', N'0946543151', 1);
-- Insert Balance into Wallet Table
INSERT INTO Wallet (userName, balance) VALUES
(N'anh', 10000000.0),
(N'thang', 15000000.0),
(N'hung', 2000000.0),
(N'vu', 2500000.0),
(N'duy', 3000000.0),
(N'khiem', 3500000.0),
(N'huy', 4000000.0),
(N'duong', 45000000.0),
(N'tuan', 5000000.0),
(N'cuong', 5500000.0),
(N'dung', 6000000.0),
(N'bao', 6500000.0),
(N'dong', 7000000.0),
(N'anhh', 7500000.0),
(N'linh', 8000000.0),
(N'suong', 850000.0),
(N'nhy', 900000.0),
(N'quynh', 9500000.0),
(N'ha', 1000000.0),
(N'tung', 1050000.0),
(N'chau', 1100000.0),
(N'nhi', 1150000.0),
(N'tu', 120000.0);
---------------End Create table-------------------------

-- Insert Supplier
INSERT INTO Supplier (companyName, homePage, country, imageLogo)
VALUES (N'DELL', 'https://www.dell.com/en-vn', N'Mỹ', N'./images/suppliers/logo-dell.jpg');
INSERT INTO Supplier (companyName, homePage, country, imageLogo)
VALUES (N'ASUS', 'https://www.asus.com/vn/', N'Đài Loan', N'./images/suppliers/logo-asus.png');
INSERT INTO Supplier (companyName, homePage, country, imageLogo)
VALUES (N'APPLE', 'https://www.apple.com/vn/', N'Mỹ', N'./images/suppliers/logo-apple.jpg');
INSERT INTO Supplier (companyName, homePage, country, imageLogo)
VALUES (N'ACER', 'https://www.acer.com/vn-vi', N'Đài Loan', N'./images/suppliers/logo-acer.png');
INSERT INTO Supplier (companyName, homePage, country, imageLogo)
VALUES (N'LENOVO', 'https://www.lenovo.com/vn/vi/pc/?orgRef=https%253A%252F%252Fwww.google.com%252F', N'Trung Quốc', N'./images/suppliers/logo-lenovo.png');
INSERT INTO Supplier (companyName, homePage, country, imageLogo)
VALUES (N'HP', 'https://www.hp.com/vn-vi/home.html', N'Mỹ', N'./images/suppliers/logo-hp.png');
INSERT INTO Supplier (companyName, homePage, country, imageLogo)
VALUES (N'SAMSUNG', 'https://www.samsung.com/vn/', N'Hàn Quốc', N'./images/suppliers/logo-samsung.png');

-- Insert cartegory
INSERT INTO Category (categoryName, description, imageCat)
VALUES (N'Laptop', N'Máy tính xách tay', N'./images/categories/cate-laptop.jpg');
INSERT INTO Category (categoryName, description, imageCat)
VALUES (N'Tablet', N'Máy tính bảng', N'./images/categories/cate-tablet.jpg');
INSERT INTO Category (categoryName, description, imageCat)
VALUES (N'PC', N'Máy tính để bàn - CPU', N'./images/categories/cate-pc.jpg');
INSERT INTO Category (categoryName, description, imageCat)
VALUES (N'Screen', N'Màn hình rời', N'./images/categories/cate-screen.jpg');

--------------------------------------------------------------------------------------------------------------------------

/*Insert laptop*/
/*Insert Laptop DELL 1-1*/
-- Insert product 1
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (1, 1, N'Laptop Gaming Dell G15 5511', 300, 27490000, 240, 60, 5, 0,
N'MÔ TẢ SẢN PHẨM</br>
Laptop Gaming Dell G15 5511 i5-11400H, 8GB, 256GB, RTX3050 4GB, 15.6" FHD 120Hz, OfficeHS21, Win11, Xám (P105F006)</br>
</br>
Thông Số Kỹ Thuật:</br>	
Dell Gaming G15 5511</br>
Màu Sắc: Xám</br>
CPU: Intel i5-11400H (12MB Cache, 2.7GHz, Turbo Boost 4.5GHz)</br>
RAM: 8GB (1x8GB) DDR4 3200MHz, 2 khe, hỗ trợ tối đa 32GB</br>
Ổ cứng: 256GB M.2 PCIe NVMe SSD</br>
Kích thước màn hình: 15.6 inches</br>
Độ phân giải: 1920 x 1080 (Full HD)</br>
Công nghệ màn hình: Anti-Glare LED Backlit Non-Touch Narrow Border </br>
Tấm nền: WVA</br>
Tần số quét màn hình: 120 Hz</br>
Card đồ họa (onboard): Intel UHD Graphics</br>
Card đồ họa (rời): NVIDIA(R) GeForce RTX3050 4GB GDDR6</br>
Công nghệ âm thanh: Realtek ALC3254 with Nahimic 3D Audio</br>
Số loa: 2</br>
</br>
Cổng kết nối:</br>
- 2 x USB 3.2 Gen 1</br>
- 1 x USB 3.2 Gen 1 with PowerShare</br>
- 1 x USB 3.2 Gen 1 Type-C port with DisplayPort</br>
- 1 x HDMI</br>
- 1 x RJ45</br>
- 1 x Headphones/mic</br>
</br>
Wifi: Wi-Fi 6 (802.11ax)</br>
Bluetooth: v5.2</br>
Khe đọc thẻ nhớ: Không</br>
Webcam: HD camera (1280 x 720)</br>
Bàn phím: US English Orange Qwerty Backlit Keyboard với Numeric Keypad và G-Key</br>
Bảo mật vân tay: Không</br>
Pin (Cell/Whr/): 3-Cell Battery, 56 Whr</br>
Hệ điều hành: Windows 11 Home SL</br>	
Phần mềm khác: Microsoft(R)Office Home and Student 2021</br>
</br>
Kích thước (mm): 357.26 x 272.11 x 21.32 (WxDxH)</br>
Trọng lượng: 2.81 kg</br>
</br>
Phụ kiện đi kèm: dây nguồn</br>',
'2023-10-03', 0.2, 1);

-- Insert ImageProduct 1
INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (1,N'./images/products/prd1/general.jpg', N'Thông tin tổng quát');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (1,N'./images/products/prd1/front.jpg', N'Mặt trước');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (1,N'./images/products/prd1/right.jpg', N'Bên phải');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (1,N'./images/products/prd1/left.jpg', N'Bên trái');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (1,N'./images/products/prd1/back.jpg', N'Mặt sau');

-- Insert product 2
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (1, 1, N'Laptop Dell Inspiron 5620', 300, 22990000, 230, 70, 5, 0,
N'MÔ TẢ SẢN PHẨM</br>
Laptop Dell Inspiron 5620 i5-1235U, 8GD4, 256SSD, 16" FHD+, FP, LED_KB, OfficeHS21, Win 11, Bạc (P1WKN)</br>
</br>
Thông Số Kỹ Thuật:</br>	
Dell Inspiron 5620</br>
Màu Sắc: Bạc</br>
CPU:  i5-1235U (up to 4.40 GHz / 12MB Cache)</br>
RAM: 1 x 8GB DDR4 3200MHz (2 slots), Max: 32GB </br>
Ổ cứng: 256GB SSD M.2 NVMe</br>
Kích thước màn hình: 16 inches</br>
Độ phân giải: 1920 x 1200 (FHD+)</br>
Công nghệ màn hình: Anti-glare Non-Touch</br>
Tấm nền: WVA </br>
Tần số quét màn hình: 60Hz</br>
Card đồ họa (onboard): Intel Iris Xe Graphics</br>
Công nghệ âm thanh: Realtek High Definition Audio (speaker 2 x 2W)</br>
</br>
Cổng kết nối:</br>
- 2 x USB 3.2 Gen 1 Type-A ports</br>
- 1 x USB 3.2 Gen 2x1 Type-C port with Power Delivery and DisplayPort</br>
- 1 x Audio jack</br>
- 1 x HDMI 1.4 port HDMI 1.4 (Maximum resolution supported over HDMI is 1920x1080 @60Hz. No 4K/2K output)</br>
- 1 x Power-adapter port</br>
</br>
Wifi: WiFi 802.11ax</br>
Bluetooth: Bluetooth 5.2</br>
Khe đọc thẻ nhớ: SD-card</br>
Webcam: HD webcam</br>
Bảo mật vân tay: Có</br>
Bàn phím: bàn phím thường, không có phím số</br></br>
</br>
Pin (Cell/Whr/): 4 Cell, 54WHr</br>
Hệ điều hành: Windows 11 Home Single Language</br>
Phần mềm khác: Office Home and Student 2021</br>
</br>
Kích thước (mm): 356.78 x 251.90 x 17.3 (WxDxH)</br>
Trọng lượng: 1.87 kg</br>
</br>
Phụ kiện đi kèm: dây nguồn</br>
Có túi tặng kèm</br>',
'2023-09-10', 0.3, 1);

-- Insert ImageProduct 2
INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (2,N'./images/products/prd2/general.png', N'Thông tin tổng quát');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (2,N'./images/products/prd2/front.jpg', N'Mặt trước');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (2,N'./images/products/prd2/right.jpg', N'Bên phải');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (2,N'./images/products/prd2/left.jpg', N'Bên trái');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (2,N'./images/products/prd2/back.jpg', N'Mặt sau');

-- Insert product 3
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (1, 1, N'Laptop Dell Vostro 5320', 300, 28990000, 230, 70, 5, 0,
N'MÔ TẢ SẢN PHẨM</br>
Laptop Dell Vostro 5320 i7 - 1260P, 16GB, 512GB, 13.3" QHD, FP, Win11, OfficeHS2021, Xám (V3I7007W)</br>
</br>
Thông Số Kỹ Thuật:	</br>
Dell Vostro 5320</br>
Màu Sắc: Xám</br>
CPU: 12th Gen Intel Core i7 - 1260P (3.40 GHz up to 4.70 GHz / 18MB Cache)</br>
RAM: 1 x 16GB LPDDR5 4800MHz (2 slots) - Max 32GB</br>
Ổ cứng: 512GB SSD M.2 NVMe</br>
Kích thước màn hình: 13.3 inches</br>
Độ phân giải: 2560x1600 (QHD+)</br>
Công nghệ màn hình: Anti-Glare, Non-Touch with ComfortView Plus</br>
Tấm nền: WVA </br>
Tần số quét màn hình: 60Hz</br>
Gam màu: 100% (sRGB) - typical</br>
Card đồ họa (onboard): Intel Iris Xe Graphics</br>
Công nghệ âm thanh: Realtek High Definition Audio (speaker 2 x 2W)</br>
</br>
Cổng kết nối:</br>
- 1 x USB 3.2 Gen 1 Type-A</br>
- 2 x USB Type-C Thunderbolt 4.0 (PowerDelivery & DisplayPort)​</br>
- 1 x Audio Jack</br>
- 1 x HDMI 1.4 port</br>

Wifi: WiFi 802.11ax</br>
Bluetooth: Bluetooth 5.2</br>
Khe đọc thẻ nhớ: SD-card</br>
Webcam: FHD webcam</br>
Bảo mật vân tay: Có</br>
Bàn phím: bàn phím thường, không phím số</br>
</br>
Pin (Cell/Whr/): 4 Cell, 54WHr</br>
Hệ điều hành: Windows 11 Home Single Language</br>
Phần mềm khác: Office Home and Student 2021</br>
</br>
Kích thước (mm): 296.68 x 213.5 x 15.65 (WxDxH)</br>
Trọng lượng: 1.25 kg</br>
</br>
Phụ kiện đi kèm: dây nguồn</br>',
'2023-07-10', 0.25, 1);

-- Insert ImageProduct 3
INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (3,N'./images/products/prd3/general.png', N'Thông tin tổng quát');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (3,N'./images/products/prd3/front.jpg', N'Mặt trước');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (3,N'./images/products/prd3/right.jpg', N'Bên phải');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (3,N'./images/products/prd3/left.jpg', N'Bên trái');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (3,N'./images/products/prd3/back.jpg', N'Mặt sau');

/*Insert Laptop ASUS 2-1*/
-- Insert product 4
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (2, 1, N'Laptop ASUS VivoBook 15 OLED', 310, 23390000, 210, 100, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
THÔNG TIN SẢN PHẨM</br>
</br>
Thông số kỹ thuật</br>
</br>
•	CPU	Intel Core i9-13900H 2.6GHz up to 5.4GHz 24MB</br>
•	RAM	16GB (8GB Onboard + 8GB) DDR4 3200MHz (1x SO-DIMM socket, up to 16GB SDRAM)</br>
•	Ổ cứng	512GB M.2 NVMe™ PCIe® 3.0 SSD (1 slot, support M.2 2280 PCIe 4.0x4)</br>
•	Card đồ họa	Intel® Iris Xe Graphics</br>
•	Màn hình	15.6" FHD (1920 x 1080) OLED 16:9 aspect ratio, 0.2ms response time, 600nits peak brightness, 100% DCI-P3 color gamut, Gamut mapping, Contrast ratio: 1,000,000:1, VESA CERTIFIED Display HDR True Black 600, 1.07 billion colors, PANTONE Validated, Glossy display, 70% less harmful blue light, SGS Eye Care Display, Screen-to-body ratio: 86%</br>
•	Cổng giao tiếp	1x USB 3.2 Gen 1 Type-C support power delivery</br>
•	2x USB 3.2 Gen 1 Type-A</br>
•	1x USB 2.0 Type-A</br>
•	1x HDMI 1.4</br>
•	1x 3.5mm Combo Audio Jack</br>
•	1x DC-in</br>
•	Led-Keyboard	None</br>
•	Audio	SonicMaster</br>
•	Đọc thẻ nhớ	None</br>
•	Chuẩn LAN	None</br>
•	Chuẩn WIFI	Wi-Fi 6E(802.11ax) (Dual band) (1x1)</br>
•	Bluetooth	v5.0</br>
•	Webcam	720p HD camera With privacy shutter</br>
•	Hệ điều hành	Windows 11 Home</br>
•	Pin	3 Cells 50WHrs</br>
•	Trọng lượng	1.7 kg</br>
•	Màu sắc	Cool Silver</br>
•	Kích thước	35.68 x 22.76 x 1.99 cm</br>
</br>
• Bảo hành 24 tháng chính hãng</br>
• Xuất xứ: Trung Quốc</br>
• Bảo hành chính hãng 24 tháng tại TTBH của Asus</br>
• Sản phẩm full box (Sản phẩm + sạc + hướng dẫn sử dụng )</br>',
'2023-07-10', 0.06, 1);

-- Insert ImageProduct 4
INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (4,N'./images/products/prd4/general.jpg', N'Thông tin tổng quát');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (4,N'./images/products/prd4/front.jpg', N'Mặt trước');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (4,N'./images/products/prd4/right.jpg', N'Bên phải');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (4,N'./images/products/prd4/left.jpg', N'Bên trái');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (4,N'./images/products/prd4/back.jpg', N'Mặt sau');

-- Insert product 5
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (2, 1, N'Laptop ASUS VivoBook 14 OLED A1405VA-KM257W', 300, 20990000, 200, 100, 5, 0,
N'MÔ TẢ SẢN PHẨM </br>
</br>
THÔNG SỐ KỸ THUẬT</br>
</br>
•	CPU	Intel Core i5-13500H 2.6GHz up to 4.7GHz 18MB</br>
•	RAM	16GB (8GB Onboard + 8GB) DDR4 3200MHz (1x SO-DIMM socket, up to 16GB SDRAM)</br>
•	Ổ cứng	512GB M.2 NVMe™ PCIe® 3.0 SSD (1 slot, support M.2 2280 PCIe 3.0x4)</br>
•	Card đồ họa	Intel® Iris Xe Graphics</br>
•	Màn hình	14" 2.8K (2880 x 1800) OLED 16:10 aspect ratio, 90Hz/0.2ms response time, 600nits peak brightness, 100% DCI-P3 color gamut, Contrast ratio: 1,000,000:1, VESA CERTIFIED Display HDR True Black 600, 1.07 billion colors, Glossy display, 70% less harmful blue light, SGS Eye Care Display, Screen-to-body ratio: 86%</br>
•	Cổng giao tiếp	1x USB 3.2 Gen 1 Type-C support power delivery</br>
•	2x USB 3.2 Gen 1 Type-A</br>
•	1x USB 2.0 Type-A</br>
•	1x HDMI 1.4</br>
•	1x 3.5mm Combo Audio Jack</br>
•	1x DC-in</br>
•	Finger Print</br>
•	Led-Keyboard	None</br>
•	Audio	SonicMaster</br>
•	Đọc thẻ nhớ	None</br>
•	Chuẩn LAN	None</br>
•	Chuẩn WIFI	Wi-Fi 6E(802.11ax) (Dual band) (1x1)</br>
•	Bluetooth	v5.0</br>
•	Webcam	720p HD camera With privacy shutter</br>
•	Hệ điều hành	Windows 11 Home</br>
•	Pin	3 Cells 50WHrs</br>
•	Trọng lượng	1.6 kg</br>
•	Màu sắc	Indie Black</br>
•	Kích thước	31.71 x 22.20 x 1.99 cm</br>
•	Bảo hành chính hãng 24 tháng</br>',
'2022-07-12', 0.16, 1);

-- Insert ImageProduct 5
INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (5,N'./images/products/prd5/general.jpg', N'Thông tin tổng quát');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (5,N'./images/products/prd5/front.jpg', N'Mặt trước');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (5,'./images/products/prd5/right.jpg', N'Bên phải');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (5,N'./images/products/prd5/left.jpg', N'Bên trái');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (5,N'./images/products/prd5/back.jpg', N'Mặt sau');

-- Insert product 6
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (2, 1, N'Laptop ASUS TUF Gaming A15', 300, 19990000, 230, 70, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
THÔNG SỐ KỸ THUẬT</br>
</br>
•	CPU	AMD Ryzen™ 5 7535HS 3.3GHz up to 4.55GHz 16MB</br>
•	RAM	8GB DDR5 4800MHz (2x SO-DIMM socket, up to 32GB SDRAM)</br>
•	Ổ cứng	512GB PCIe® 4.0 NVMe™ M.2 SSD (2230) (Còn trống 1 khe SSD M.2 PCIE)</br>
•	Card đồ họa	NVIDIA® GeForce RTX 2050 4GB GDDR6</br>
•	Màn hình	15.6" FHD (1920 x 1080) IPS, 144Hz, Wide View, 250nits, Narrow Bezel, Non-Glare with 45% NTSC, 63% sRGB, Adaptive-Sync</br>
•	Cổng giao tiếp	</br>
</br>
1x USB 3.2 Gen 2 Type-C support DisplayPort™ / power delivery / G-SYNC</br>
2x USB 3.2 Gen 1 Type-A</br>
1x RJ-45 LAN</br>
1x HDMI 2.1 FRL</br>
1x COMBO audio jack</br>
1x Type C USB 4 support DisplayPort™ / G-SYNC</br>
</br>
•	Audio	Dolby Atmos</br>
•	Led-Keyboard	Backlit Chiclet Keyboard 1-Zone RGB</br>
•	Chuẩn LAN	10/100/1000 Mbps</br>
•	Chuẩn WIFI	Wi-Fi 6(802.11ax) (2x2)</br>
•	Bluetooth	v5.3</br>
•	Webcam	720P HD camera</br>
•	Hệ điều hành	Windows 11 Home</br>
•	Pin	4 Cell 90WHrs</br>
•	Trọng lượng	2.3 kg</br>
•	Màu sắc	Graphite Black</br>
•	Kích thước	35.9 x 25.6 x 2.28 ~ 2.45 cm</br>
•	Bảo hành chính hãng 24 tháng tại TTBH của ASUS</br>
•	Sản phẩm full box đầy đủ phụ kiện từ nhà sản xuất</br>',
'2022-11-12', 0.12, 1);

-- Insert ImageProduct 6
INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (6,N'./images/products/prd6/general.jpg', N'Thông tin tổng quát');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (6,N'./images/products/prd6/front.jpg', N'Mặt trước');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (6,N'./images/products/prd6/right.jpg', N'Bên phải');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (6,N'./images/products/prd6/left.jpg', N'Bên trái');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (6,N'./images/products/prd6/back.jpg', N'Mặt sau');

/*Insert laptop - apple 3-1*/
-- Insert product 7
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (3, 1, N'Máy tính xách tay Apple MacBook Air M3 Chip', 200, 27990000, 120, 80, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
"Cỗ máy M3. Gọn bâng. Cân mọi việc.</br>
</br>
MacBook Air dễ dàng xử lý cả công việc lẫn giải trí và chip M3 mang đến năng lực tuyệt vời cho chiếc máy tính xách tay siêu gọn nhẹ này. Với thời lượng pin lên đến 18 giờ,1 bạn có thể mang theo chiếc MacBook Air siêu gọn nhẹ này đi bất cứ nơi đâu và nhanh chóng hoàn thành mọi việc bạn muốn.</br>
</br>
THIẾT KẾ GỌN NHẸ: Được thiết kế để đi muôn nơi.</br>
</br>
Siêu nhẹ và mỏng dưới 0,5 inch, MacBook Air dễ dàng thích ứng với cuộc sống của bạn và còn có thiết kế thân thiện với môi trường. MacBook Air với M3 được tạo nên với 50% vật liệu tái chế – lần đầu tiên tại Apple. Và tất cả máy tính xách tay MacBook Air đều có vỏ bằng nhôm tái chế bền bỉ.</br>
Hai kích cỡ gọn nhẹ hoàn hảo. Phiên bản 13 inch là chiếc máy tính xách tay tuyệt vời để mang theo đi bất cứ nơi đâu và phiên bản 15 inch mang đến cho bạn nhiều không gian hơn trên màn hình để đa nhiệm thoải mái.</br> 
Bốn màu tuyệt đẹp. Màu nào cũng đẹp không thể tả và đều đi kèm cáp sạc MagSafe phù hợp.</br>
Chế Độ Trò Chơi giúp giảm đáng kể độ trễ, mang tới độ phản hồi mà bạn có thể cảm nhận rõ khi chơi game với các phụ kiện không dây.</br>
HIỆU NĂNG VÀ THỜI LƯỢNG PIN: Một con chip đầy sức mạnh.</br>
</br>
Ngay khi bạn mở MacBook Air, máy đã sẵn sàng cho mọi việc bạn cần xử lý. Và bất kể khối lượng công việc nặng nề đến đâu, máy vẫn vận hành hoàn toàn yên tĩnh nhờ thiết kế không quạt. Dù bạn đang đa nhiệm giữa các ứng dụng, chỉnh sửa video trong iMovie hay chơi Baldur’s Gate 3 trong Chế Độ Trò Chơi, chip M3 vẫn mang đến tốc độ và sự mượt mà cho mọi thứ bạn làm.</br></br>
</br>
MacBook Air với M3 tận dụng hiệu năng AI đáng kinh ngạc của Neural Engine để mang đến các tính năng thông minh trên macOS, qua đó giúp nâng cao năng suất và khả năng sáng tạo, bao gồm các tính năng camera mạnh mẽ, chuyển lời nói thành văn bản theo thời gian thực, và tính năng nhận biết hình ảnh.</br>
</br>
Và với khả năng tiếp cận một hệ sinh thái ứng dụng rộng lớn hỗ trợ cho các tính năng AI tiên tiến, người dùng có thể làm mọi thứ, từ kiểm tra bài tập về nhà với AI Math Assistance trong Goodnotes, tự động cải thiện hình ảnh trong Pixelmator Pro, cho đến loại bỏ tiếng ồn trong nền khỏi video bằng CapCut.</br>
</br>
Pin chạy suốt cả ngày. Cả MacBook Air với M2 và MacBook Air với M3 đều có thời lượng pin lên đến 18 giờ, vì vậy bạn có thể để bộ tiếp hợp nguồn ở nhà.</br>
MÀN HÌNH, CAMERA VÀ ÂM THANH: Rõ ràng là rực rỡ.</br>
Màn hình Liquid Retina trên MacBook Air đẹp ấn tượng, với khả năng hỗ trợ 1 tỷ màu và độ phân giải cao hơn đến 2x so với máy tính xách tay PC tương đương. Ảnh và video sống động với độ tương phản phong phú và chi tiết sắc nét, đồng thời văn bản hiển thị siêu nét giúp dễ đọc.</br>
</br>
CÁC CỔNG VÀ KẾT NỐI: Đầy đủ cổng kết nối.</br>
Cáp sạc MagSafe cắm vào và rút ra dễ dàng nhờ nam châm, phòng tránh các sự cố rơi vỡ. Hai cổng Thunderbolt giúp bạn kết nối phụ kiện tốc độ cao và sạc máy Mac của mình. Và jack cắm tai nghe hỗ trợ các tai nghe trở kháng cao. Với phiên bản M3, bạn có thể truy cập Wi‑Fi 6E, với thông lượng nhanh hơn Wi‑Fi 6 đến 2x.</br>
</br>
MAGIC KEYBOARD VỚI TOUCH ID: Chạm ngón tay, mở khóa ngay.</br>
Magic Keyboard có đèn nền, tĩnh lặng và thoải mái khi gõ, đi kèm với hàng phím chức năng có chiều cao tiêu chuẩn cùng Touch ID, giúp bạn mở khóa máy Mac đồng thời đăng nhập vào các ứng dụng và trang web một cách nhanh chóng, dễ dàng và an toàn. Chỉ cần chạm ngón tay là thực hiện tất cả.</br>
THÔNG SỐ KỸ THUẬT</br>
</br>
Chip Apple M3 với CPU 8 lõi, GPU 8 lõi và Neural Engine 16 lõi</br>
Bộ nhớ thống nhất 8GB</br>
Ổ lưu trữ SSD 256GB</br>
Màn hình Liquid Retina 13,6 inch với True Tone²</br>
Camera FaceTime HD 1080p</br>
Cổng sạc MagSafe 3</br>
Hai cổng Thunderbolt / USB 4</br>
Bộ Tiếp Hợp Nguồn USB-C 30W</br>
Bàn phím Magic Keyboard có đèn nền với Touch ID - Tiếng Anh (Mỹ)"</br>',
'2023-10-25', 0.01, 1);

-- Insert ImageProduct 7
INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (7,N'./images/products/prd7/general.jpg', N'Thông tin tổng quát');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (7,N'./images/products/prd7/front.jpg', N'Mặt trước');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (7,N'./images/products/prd7/right.jpg', N'Bên phải');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (7,N'./images/products/prd7/left.jpg', N'Bên trái');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (7,N'./images/products/prd7/back.jpg', N'Mặt sau');

-- Insert product 8
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (3, 1, N'Máy tính xách tay Apple Macbook Air (2022) M2 chip', 200, 24990000, 120, 80, 5, 0,
N'MÔ TẢ SẢN PHẨM</br>
Apple Macbook Air (2022) M2 chip  (năm SX 2022), 13.6 inches, 8GB, 256GB SSD</br>
SPG (Space Gray), STL (Starlight), MDN (Midnight). </br>
Bộ xử lý</br>
Hãng CPU: Apple</br>
Công nghệ CPU: M2</br>
Loại CPU: 8 - Core</br>
Tốc độ CPU: 100GB/s memory bandwidth</br>
</br>
RAM & Ổ cứng</br>
Dung lượng RAM: 8 GB</br>
Dung lượng ổ cứng: 256GB SSD</br>
</br>
Màn hình</br>
Kích thước màn hình: 13.6 inches</br>
Công nghệ màn hình: Liquid Retina, True Tone Technology, Wide color (P3)</br>
Độ phân giải: 2560 x 1664 Pixels</br>
Loại màn hình: LED</br>
Độ sáng: 500 nits</br>
Colors: 1 triệu màu</br>
</br>
Đồ họa</br>
Card onboard</br>
Hãng: Apple</br>
Model GPU: 8 - Core</br>
</br>
Bảo mật</br>
Mở khóa vân tay</br>
Mật khẩu</br>
</br>
Giao tiếp & kết nối</br>
Cổng giao tiếp	</br>
2 x Thunderbolt 3/USB 4</br>
1 x Jack tai nghe 3.5 mm</br>
1 x MagSafe 3</br>
</br>
Wifi: 802.11ax</br>
Bluetooth: v5.0</br>
Webcam: 1080p FaceTime HD camera</br>
</br>
 m thanh</br>
Số lượng loa: 4</br>
Số lượng microphones: 3</br>
Công nghệ âm thanh: Spatial Audio, Dolby Atmos</br>
</br>
Bàn phím & TouchPad</br>
Kiểu bàn phím: Backlit Magic Keyboard</br>
Bàn phím số: Không</br>
Đèn bàn phím: Có</br>
Touch ID: Có</br>
TouchPad: Multi-touch touchpad</br>
</br>
Thông tin pin & Sạc</br>
Loại PIN: Lithium polymer</br>
Nguồn vào: 30W USB-C Power Adapter </br>
Dung lượng pin: </br>
- Lên tới 18 giờ Apple TV app movie playback</br>
- Lên tới 15 giờ wireless web</br>
</br>
Hệ điều hành</br>
OS: macOS</br>',
'2022-10-25', 0.24, 1);

-- Insert ImageProduct 8
INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (8,N'./images/products/prd8/general.jpg', N'Thông tin tổng quát');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (8,N'./images/products/prd8/front.jpg', N'Mặt trước');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (8,N'./images/products/prd8/right.jpg', N'Bên phải');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (8,N'./images/products/prd8/left.jpg', N'Bên trái');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (8,N'./images/products/prd8/back.jpg', N'Mặt sau');

--Insert product 9
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (3, 1, N'Máy tính xách tay MacBook Pro- M3 Pro Chip', 200, 62990000, 120, 80, 5, 0,
N'MÔ TẢ SẢN PHẨM</br>
Thông số kỹ thuật</br>
- Chip Apple M3 Pro với CPU 12 lõi, GPU 18 lõi và Neural Engine 16 lõi</br>
- Bộ nhớ thống nhất 18GB</br>
- Ổ lưu trữ SSD 512GB</br>
- Màn hình Liquid Retina XDR 16 inch²</br>
- Bộ Tiếp Hợp Nguồn USB-C 140W</br>
- Ba cổng Thunderbolt 4, cổng HDMI, khe thẻ nhớ SDXC, giắc cắm tai nghe, cổng MagSafe 3</br>
- Bàn phím Magic Keyboard có đèn nền với Touch ID - Tiếng Anh (Mỹ)</br>',
'2023-10-25', 0.03, 1);

-- Insert ImageProduct 9
INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (9,N'./images/products/prd9/general.jpg', N'Thông tin tổng quát');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (9,N'./images/products/prd9/front.jpg', N'Mặt trước');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (9,N'./images/products/prd9/right.jpg', N'Bên phải');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (9,N'./images/products/prd9/left.jpg', N'Bên trái');

INSERT INTO ImageProduct(productId, imageUrl, description)
VALUES (9,N'./images/products/prd9/back.jpg', N'Mặt sau');


/*Insert laptop - Acer 4-1*/
--Insert product 10
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (4, 1, N'Laptop Acer Gaming Aspire 5 A515-58GM-53PZ', 200, 16290000, 120, 80, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
THÔNG SỐ KỸ THUẬT</br></br>
•	CPU	Intel® Core™ i5-13420H 3.4GHz up to 4.6GHz 12MB</br>
•	RAM	8GB DDR4 3200MHz (2x SO-DIMM socket, up to 32GB SDRAM)</br>
•	Ổ cứng	512GB SSD PCIe Gen4, 16 Gb/s, NVMe (Còn trống 1 khe SSD M.2 PCIE)</br>
•	Card đồ họa	NVIDIA® GeForce RTX™ 2050 4GB GDDR6</br>
•	Màn hình	15.6" FHD (1920 x 1080), IPS SlimBezel, 60Hz, Acer ComfyView™</br>
•	Cổng giao tiếp	1x USB Type-C™ port (supporting USB 3.2 Gen 2 (up to 10 Gbps); Thunderbolt™ 4; USB charging 5 V-3 A; DC-in port 20 V-65 W)</br>
•	1x USB 3.2 Gen 1</br>
•	1x USB 3.2 Gen 1 featuring power off USB charging</br>
•	1x HDMI® 2.1 port with HDCP support</br>
•	1x 3.5 mm headphone/speaker jack, supporting headsets with built-in microphone</br>
•	1x Ethernet (RJ-45) port</br>
•	1x DC-in jack for AC adapter</br>
•	FingerPrint</br>
•	Ổ quang	None</br>
•	Audio	Acer Purified.Voice technology</br>
•	Led-Keyboard	Có</br>
•	Đọc thẻ nhớ	None</br>
•	Chuẩn LAN	None</br>
•	Chuẩn WIFI	Wifi 6E (2x2)</br>
•	Bluetooth	v5.1</br>
•	Webcam	1080p HD video at 60 fps with Temporal Noise Reduction</br>
•	Hệ điều hành	Windows 11 Home</br>
•	Pin	3 Cell 50WHrs</br>
•	Trọng lượng	1.7 kg</br>
•	Màu sắc	Steel Gray </br>
•	Kích thước	361 x 237 x 17.9 (mm)</br>
•	Bảo hành chính hãng 12 tháng tại TTBH của ACER</br>
•	Sản phẩm full box đầy đủ phụ kiện từ nhà sản xuất</br>',
'2023-10-05', 0.2, 1);

INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (10, './images/products/prd10/general.jpg', N'Thông tin tổng quát'),
    (10, './images/products/prd10/front.jpg', N'Mặt trước'),
    (10, './images/products/prd10/right.jpg', N'Bên phải'),
    (10, './images/products/prd10/left.jpg', N'Bên trái'),
    (10, './images/products/prd10/back.jpg', N'Mặt sau');

/*Insert laptop - Lenovo 5-1*/
--Insert product 11
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (5, 1, N'Laptop Lenovo ThinkPad E14 Gen 4 21E300E3VN', 200, 27990000, 120, 80, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
THÔNG SỐ KỸ THUẬT</br>
</br>
•	CPU	Intel Core i7-1255U 1.7GHz up to 4.7GHz 12MB</br>
•	RAM	8GB Onboard DDR4 3200MHz (1x SO-DIMM socket, up to 40GB SDRAM)</br>
•	Ổ cứng	512GB SSD M.2 2242 PCIe® 4.0x4 NVMe® Opal 2.0 (Còn trống 1 slot M.2 2242 PCIe Gen 3x4 slot, supports M.2 2242 SSD)</br>
•	Card đồ họa	Intel® Iris® Xe Graphics</br>
•	Màn hình	14" FHD (1920x1080) IPS 300nits Anti-glare, 45% NTSC</br>
•	Cổng giao tiếp	1x Thunderbolt 4 / USB 4 40Gbps (support data transfer, Power Delivery 3.0, and DisplayPort 1.4)</br>
•	1x USB 3.2 Gen 1 (Always On)</br>
•	1x USB 2.0</br>
•	1x HDMI, up to 4K/60Hz</br>
•	1x Headphone / microphone combo jack (3.5mm)</br>
•	1x Ethernet (RJ-45)</br>
•	FingerPrint</br>
•	Led-Keyboard	Có</br>
•	Audio	Stereo speakers, 2W x2, Dolby Audio, audio by HARMAN</br>
•	Đọc thẻ nhớ	None</br>
•	Chuẩn LAN	100/1000M</br>
•	Chuẩn WIFI	Intel® Wi-Fi® 6E AX211 (2x2)</br>
•	Bluetooth	v5.1</br>
•	Webcam	FHD 1080p + IR Hybrid with Privacy Shutter</br>
•	Hệ điều hành	Windows 11 Home</br>
•	Pin	3 Cells 45Whr</br>
•	Trọng lượng	1.64 kg</br>
•	Màu sắc	Black Aluminium</br>
•	Kích thước	324 x 220.7 x 17.9 mm</br>
•	Xuất xứ: Trung Quốc</br>
•	Bảo hành chính hãng 24 tháng tại TTBH của Lenovo</br>
•	Sản phẩm full box đầy đủ phụ kiện từ nhà sản xuất</br>',
'2022-07-05', 0.31, 1);

-- Insert ImageProduct 11
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (11, './images/products/prd11/general.jpg', N'Thông tin tổng quát'),
    (11, './images/products/prd11/front.jpg', N'Mặt trước'),
    (11, './images/products/prd11/right.jpg', N'Bên phải'),
    (11, './images/products/prd11/left.jpg', N'Bên trái'),
    (11, './images/products/prd11/back.jpg', N'Mặt sau');
/*Insert laptop - HP 6-1*/
--Insert product 12
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (6, 1, N'Laptop Gaming HP Victus 16-r0129TX 8C5N4PA', 200, 33990000, 120, 80, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
THÔNG SỐ KỸ THUẬT</br></br>

•	CPU	Intel Core i7-13700H 2.4GHz up to 5.0GHz 24MB</br>
•	RAM	16GB (8x2) DDR5 5200MHz (2x SO-DIMM socket, up to 32GB SDRAM)</br>
•	Ổ cứng	512 GB PCIe® Gen4 NVMe™ TLC M.2 SSD (1 slot)</br>
•	Card đồ họa	NVIDIA® GeForce RTX™ 3050 6GB GDDR6</br>
•	Màn hình	16.1" FHD (1920 x 1080), 144 Hz, IPS, micro-edge, anti-glare, 250 nits, 45% NTSC
•	Cổng giao tiếp	1x USB Type-C® 5Gbps signaling rate (USB Power Delivery, DisplayPort™ 1.4, HP Sleep and Charge)</br>
•	1x USB Type-A 5Gbps signaling rate (HP Sleep and Charge)</br>
•	2x USB Type-A 5Gbps signaling rate</br>
•	1x HDMI 2.1</br>
•	1x RJ-45</br>
•	1x AC smart pin</br>
•	1x headphone/microphone combo</br>
•	Led-Keyboard	Full-size, 1-zone RGB backlit, moonstone grey keyboard with numeric keypad</br>
•	Audio	Audio by B&O; Dual speakers; HP Audio Boost</br>
•	Đọc thẻ nhớ	multi-format SD media card reader</br>
•	Chuẩn LAN	10/100/1000 GbE LAN</br>
•	Chuẩn WIFI	Intel® Wi-Fi 6E AX211 (2x2)</br>
•	Bluetooth	v5.3</br>
•	Webcam	HP True Vision 1080p FHD camera with temporal noise reduction and integrated dual array digital microphones</br>
•	Hệ điều hành	Windows 11 Home</br>
•	Pin	4 Cell 70WHr</br>
•	Trọng lượng	2.31 kg</br>
•	Màu sắc	Mica silver, dark chrome logo</br>
•	Kích thước	36.9 x 25.94 x 2.29~2.39 cm</br>
•	Xuất xứ: Trung Quốc</br>
•	Bảo hành chính hãng 12 tháng tại TTBH của HP</br>
•	Sản phẩm full box đầy đủ phụ kiện từ nhà sản xuất</br>',
'2023-07-05', 0.1, 1);

-- Insert ImageProduct 12
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (12, './images/products/prd12/general.jpg', N'Thông tin tổng quát'),
    (12, './images/products/prd12/front.jpg', N'Mặt trước'),
    (12, './images/products/prd12/right.jpg', N'Bên phải'),
    (12, './images/products/prd12/left.jpg', N'Bên trái'),
    (12, './images/products/prd12/back.jpg', N'Mặt sau');

/*Insert laptop - Samsung 7-1*/
--Insert product 13
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (7, 1, N'Siêu Phẩm Samsung Galaxy Book 4', 200, 28990000, 120, 80, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
Điểm nhấn của Samsung Galaxy Book4 360 là màn hình Super AMOLED 15.6 inch với độ chuẩn màu 120% DCI-P3. Mang lại hình ảnh sống động với màu sắc phong phú và độ tương phản sâu. Màn hình cảm ứng mượt mà, tần số quét cao mang lại trải nghiệm tốt. Dù bạn xem video, chỉnh sửa ảnh hay thuyết trình thì màn hình luôn giúp bạn có được trải nghiệm tối đa.</br>

*Cấu hình chi tiết:</br>
</br>
- CPU: Intel® Intel Core 7 (12 MB cache, 10 cores, 12 threads, up to 5.4 GHz Turbo)</br>
- Ram: 16GB</br>
- Ổ cứng: 512 GB PCIe® NVMe™ M.2 SSD</br>
- Màn hình: 15.6" FHD AMOLED Display (1920 x 1080) </br>
- Card đồ họa: Intel® Iris® Xe Graphics</br>
- Cổng kết nối: 1 HDMI 1 Thunderbolt™ 4, 1 USB Type-C, 1 USB3.2 MicroSD Multi-media Card Reader, 1 Headphone out/Mic-in Combo, Wi-Fi® 6, Bluetooth 5.2</br>
- Pin: 4Cell</br>
- Khối lượng: 1.55kg</br>
- Hệ điều hành: Windows 11 bản quyền</br>',
'2024-01-05', 0.28, 1);

-- Insert ImageProduct 13
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (13, './images/products/prd13/general.jpg', N'Thông tin tổng quát'),
    (13, './images/products/prd13/front.jpg', N'Mặt trước'),
    (13, './images/products/prd13/right.jpg', N'Bên phải'),
    (13, './images/products/prd13/left.jpg', N'Bên trái'),
    (13, './images/products/prd13/back.jpg', N'Mặt sau');


---------- End Insert Product - laptop ------------------------

/*Insert tablet*/
/*Insert Tablet - APPLE 3-2*/

--Insert product 14
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (3, 2, N'Apple iPad Air 5 10.9 inch Wi-Fi 256GB', 100, 18890000, 60, 40, 5, 0,
N'MÔ TẢ SẢN PHẨM</br>
Nhiều màu sắc. Mạnh mẽ. Nhẹ tênh.</br>
Siêu mạnh mẽ với M1.</br>
</br>
iPad Air. Với màn hình Liquid Retina 10.9 inch sống động.1 Chip Apple M1 đột phá cho hiệu năng nhanh hơn, giúp iPad Air trở nên siêu mạnh mẽ để sáng tạo và chơi game di động. Sở hữu Touch ID, camera tiên tiến, 5G2 và Wi-Fi 6 nhanh như chớp, cổng USB-C, cùng khả năng hỗ trợ Magic Keyboard và Apple Pencil (thế hệ thứ 2).3</br>
</br>
Tính năng nổi bật</br>
Màn hình Liquid Retina 10.9 inch1 với True Tone, dải màu rộng P3 và lớp phủ chống phản chiếu</br>
Chip Apple M1 với Neural Engine</br>
Camera Wide 12MP </br>
Camera trước Ultra Wide 12MP với tính năng Trung Tâm Màn Hình</br>
Hiện có màu Xanh Dương (Blue), Tím (Purple), Hồng (Pink), Ánh Sao (Starlight) và Xám Bạc (Space Grey)</br>
Loa stereo ở cạnh trên và cạnh dưới</br>
Xác thực bảo mật với Touch ID </br>
Pin dùng cả ngày4</br>
Wi-Fi 6 và mạng 5G2</br>
Cổng kết nối USB-C để sạc và kết nối phụ kiện</br>
Tương thích với Magic Keyboard, Smart Keyboard Folio và Apple Pencil (thế hệ thứ 2)3
iPadOS 15 sở hữu sức mạnh độc đáo, dễ sử dụng và được thiết kế cho tính đa năng của iPad </br>
</br>
Pháp lý</br>
Ứng dụng có sẵn trên App Store. Nội dung được cung cấp có thể thay đổi.</br>
1Màn hình có các góc bo tròn. Khi tính theo đường chéo hình chữ nhật, kích thước màn hình iPad Air là 10.86 inch. Diện tích hiển thị thực tế nhỏ hơn.</br>
2Cần có gói cước dữ liệu. Mạng 5G chỉ khả dụng ở một số thị trường và được cung cấp qua một số nhà mạng. Tốc độ có thể thay đổi tùy địa điểm và nhà mạng. Để biết thông tin về hỗ trợ mạng 5G, vui lòng liên hệ nhà mạng và truy cập apple.com/ipad/cellular.</br>
3Phụ kiện được bán riêng. Khả năng tương thích tùy thuộc thế hệ sản phẩm.</br>
4Thời lượng pin khác nhau tùy theo cách sử dụng và cấu hình. Truy cập apple.com/batteries để biết thêm thông tin.</br>
</br>
Thông số kỹ thuật</br>
Truy cập apple.com/ipad-air/specs để xem cấu hình đầy đủ.</br>
</br>
Bộ sản phẩm bao gồm: </br>
•	iPad </br>
•	Bộ Sạc USB-C</br>
•	Cáp Sạc USB-C</br>',
'2022-01-06', 0.1, 1);

-- Insert ImageProduct 14
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (14, './images/products/prd14/general.jpg', N'Thông tin tổng quát'),
    (14, './images/products/prd14/front.jpg', N'Mặt trước'),
    (14, './images/products/prd14/right.jpg', N'Bên phải'),
    (14, './images/products/prd14/left.jpg', N'Bên trái'),
    (14, './images/products/prd14/back.jpg', N'Mặt sau');


--Insert product 15
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (3, 2, N'Apple iPad Gen 9th 10.2-inch Wi-Fi 256GB', 100, 13390000, 70, 30, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
Mạnh mẽ. Dễ sử dụng. Đa năng. iPad mới có màn hình Retina 10.2 inch tuyệt đẹp, chip A13 Bionic mạnh mẽ, camera trước Ultra Wide có tính năng Trung Tâm Màn Hình, tương thích với Apple Pencil và Smart Keyboard (1). iPad giúp bạn dễ dàng làm được nhiều việc hơn nữa. Tất cả tính năng với mức giá ấn tượng.</br>
</br>
Tính năng nổi bật</br>
•	Màn hình Retina 10.2 inch sống động với True Tone</br>
•	Chip A13 Bionic với Neural Engine</br>
•	Camera sau Wide 8MP, camera trước Ultra Wide 12MP với tính năng Trung Tâm Màn Hình</br>
•	Ổ lưu trữ lên tới 256GB</br>
•	Loa stereo</br>
•	Xác thực bảo mật với Touch ID</br>
•	Wi-Fi 802.11ac và dữ liệu di động LTE chuẩn Gigabit (2)</br>
•	Thời lượng pin lên tới 10 giờ (3)</br>
•	Cổng kết nối Lightning để sạc và kết nối phụ kiện</br>
•	Tương thích với Apple Pencil (thế hệ thứ 1) và Smart Keyboard (1)</br>
•	iPadOS 15 sở hữu sức mạnh độc đáo, dễ sử dụng và được thiết kế cho tính đa năng của iPad</br>
</br>
Pháp lý </br>
Ứng dụng có sẵn trên App Store. Nội dung được cung cấp có thể thay đổi.</br>
(1) Phụ kiện được bán riêng. Khả năng tương thích tùy thuộc thế hệ sản phẩm.</br>
(2) Thời lượng pin khác nhau tùy theo cách sử dụng và cấu hình. Truy cập apple.com/batteries để biết thêm thông tin.</br>
</br>
Bộ sản phẩm bao gồm: </br>
•	iPad</br>
•	Dây sạc Lighting to USB-C</br>
•	20W USB Power Adaper</br>
•	HDSD Bảo hành điện tử 12 tháng.</br>',
'2022-04-07', 0.19, 1);

-- Insert ImageProduct 15
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (15, './images/products/prd15/general.jpg', N'Thông tin tổng quát'),
    (15, './images/products/prd15/front.jpg', N'Mặt trước'),
    (15, './images/products/prd15/right.jpg', N'Bên phải'),
    (15, './images/products/prd15/left.jpg', N'Bên trái'),
    (15, './images/products/prd15/back.jpg', N'Mặt sau');


--Insert product 16
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (3, 2, N'Máy tính bảng Apple iPad Gen 10 10.9 inch 2022 Wifi 64GB', 100, 11490000, 57, 43, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
Thiết kế trẻ trung</br>
</br>
iPad 10 sẽ có một thiết kế khá quen thuộc khi được hoàn thiện với phần vật liệu chủ yếu là kim loại ở phần mặt lưng, các cạnh và hai mặt đều được vát phẳng để mang lại cái nhìn sang trọng. Đi kèm với đó là các góc được bo tròn giúp cho tổng thể máy tính bảng trở nên thanh thoát và hiện đại hơn thay vì vuông vức trông như một cuốn tập.</br>
</br>
Với iPad thế hệ thứ 10 thì nhà Apple mang đến cho chúng ta 4 phiên bản với các màu sắc như: Bạc, hồng, vàng và xanh. Trong đó các tone màu của năm nay được làm đậm hơn đôi chút so với những thế hệ trước đó, đây có thể xem là đặc điểm nhận dạng giúp người dùng phân biệt iPad 10 các đàn anh của mình.</br>
</br>
Điểm vượt trội hơn so với phiên bản iPad 9 WiFi 64GB vào năm ngoái là phần viền màn hình giờ đây đã được tối ưu và làm đều ở 4 cạnh, nó mang lại cho máy một cái nhìn cân đối và hài hòa hơn, cảm giác sử dụng cũng trở nên cực kỳ dễ chịu khi mà chúng ta nhìn vào màn hình.</br>
</br>
Làm việc hiệu quả với màn hình chất lượng</br></br>
</br>
iPad 10 sẽ có kích thước màn hình là 10.9 inch, đây có thể xem là con số khá phù hợp với hầu hết mọi người dùng, nó không quá to và cồng kềnh hay quá nhỏ để ta nheo mắt mỗi khi nhìn. </br>
</br>
Màn hình 10.9 inch được xem là chuẩn màn hình lý tưởng cho khách hàng đang là học sinh, sinh viên, dân văn phòng hay những bạn đam mê vẽ vời bởi ta có thể dễ dàng mang theo đến bất cứ nơi đâu mà không sợ bị vướng hay cảm thấy chật chội.
</br>
Sở hữu hiệu năng ổn định</br>
</br>
Theo như truyền thống của những mẫu iPhone và iPad từ trước đến nay, chiếc máy tính bảng lần này cũng sẽ được trang bị con chip được sản xuất bởi chính nhà Apple và đó là bộ vi xử lý A14 Bionic.</br>
</br>
Tích hợp camera chất lượng</br>
</br>
Từ trước cho đến nay thì việc quay phim, chụp ảnh được xem là một điểm không thuộc vào thế mạnh của tablet, bởi nhu cầu sử dụng của người dùng thường thiên về các tác vụ văn phòng và học tập. </br>
</br>
Thế nhưng trên iPad 10 thì lại khác, máy hoàn toàn có thể quay phim với chất lượng 4K và chụp được những bức ảnh góc rộng, kèm với đó là công nghệ Smart HDR 3 trên camera 12 MP giúp chụp đêm hay ngược sáng trở nên tuyệt vời hơn.
</br>
Thời lượng sử dụng dài lâu</br>
</br>
iPad 10 được trang bị một viên pin có dung lượng 28.6 Wh hay còn có thể đổi thành con số xấp xỉ 7587 mAh, với một mức pin tương đối cao nên người dùng hoàn toàn có thể an tâm sử dụng thiết bị cho cả ngày dài mà không cần quá lo lắng đến những vấn đề như cạn pin giữa chừng chẳng hạn.</br>
</br>
Thông số kỹ thuật</br>
Màn hình: 10.9"Retina IPS LCD</br>
Hệ điều hành: iPadOS 16</br>
Chip: Apple A14 Bionic</br>
RAM: 4 GB</br>
Dung lượng lưu trữ: 64 GB</br>
Kết nối: Nghe gọi qua FaceTime</br>
Camera sau: 12 MP</br>
Camera trước: 12 MP</br>
Pin, Sạc: 28.6 Wh (~ 7587 mAh)20 W</br>
Loại pin: Li-Po</br>
Hỗ trợ sạc tối đa: 20 W</br>
Chất liệu: Khung & Mặt lưng kim loại</br>
Kích thước, khối lượng: Dài 248.6 mm - Ngang 179.5 mm - Dày 7 mm - Nặng 477 g</br>',
'2022-06-11', 0.12, 1);

-- Insert ImageProduct 16
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (16, './images/products/prd16/general.jpg', N'Thông tin tổng quát'),
    (16, './images/products/prd16/front.jpg', N'Mặt trước'),
    (16, './images/products/prd16/right.jpg', N'Bên phải'),
    (16, './images/products/prd16/left.jpg', N'Bên trái'),
    (16, './images/products/prd16/back.jpg', N'Mặt sau');


/*Insert Tablet - SAMSUNG 7-2*/
--Insert product 17
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (7, 2, N'Máy tính bảng Samsung Galaxy Tab S9 Plus Wifi', 100, 25990000, 60, 40, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
Thông số kỹ thuật</br>
</br>
Kích thước màn hình:12.4 inches</br>
Công nghệ màn hình: Dynamic AMOLED 2X</br>
Camera sau: 13 MP + 8 MP UW</br>
Camera trước: 12 MP UW</br>
Chipset: Snapdragon 8 Gen 2 for Galaxy</br>
Dung lượng RAM: 12 GB</br>
Bộ nhớ : 256 GB</br>
Pin: 10.090 mAh</br>
Thẻ SIM: 2 SIM (nano‑SIM và eSIM) + khe thẻ nhớ với bản 5G. Còn bản wifi chỉ có khe thẻ nhớ. </br>
Hệ điều hành: Android 13</br>
Độ phân giải màn hình: 1752 x 2800 pixel</br>
Tính năng màn hình: 120 Hz, Hình ảnh nâng cao HDR10+</br>
Tương thích: Bút S-pen (Độ trễ 2.8ms, 4096 cảm ứng lực)</br>
Thông số kỹ thuật: Màn hình</br>
Kích thước màn hình: 12.4 inches</br>
Công nghệ màn hình: Dynamic AMOLED 2X</br>
Độ phân giải màn hình: 1752 x 2800 pixel</br>
Tính năng màn hình: 120 Hz, Hình ảnh nâng cao HDR10+</br>
Tần số quét: 120Hz</br>
Camera sau: 13 MP + 8 MP UW</br>
Quay video: 4K 2160p@30fps</br>
Tính năng camera: Làm đẹp, HDR, Đèn Flash, Góc siêu rộng, Zoom kỹ thuật số, Tua nhanh thời gian (Time‑lapse), Xóa phông, Toàn cảnh (Panorama), Chuyên nghiệp (Pro), Tự động lấy nét</br>
</br>
Camera trước: 12 MP UW, Quay video trước, HDR, Quay video Full HD, Quay video HD, Live Photos, Bộ lọc màu, Xóa phông, Hẹn giờ chụp, Làm đẹp, Góc siêu rộng</br>
</br>
Vi xử lý & đồ họa</br>
</br>
Chipset: Snapdragon 8 Gen 2 for Galaxy</br>
</br>
Loại CPU: 1 nhân 3.36 GHz, 4 nhân 2.8 GHz & 3 nhân 2 GHz</br>',
'2023-01-06', 0.35, 1);

-- Insert ImageProduct 17
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (17, './images/products/prd17/general.jpg', N'Thông tin tổng quát'),
    (17, './images/products/prd17/front.jpg', N'Mặt trước'),
    (17, './images/products/prd17/right.jpg', N'Bên phải'),
    (17, './images/products/prd17/left.jpg', N'Bên trái'),
    (17, './images/products/prd17/back.jpg', N'Mặt sau');


--Insert product 18
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (7, 2, N'Máy tính bảng Samsung Galaxy Tab S9 5G 256GB', 100, 24990000, 72, 28, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
Thông số kỹ thuật</br>
</br>
Kích thước màn hình:12.4 inches</br>
Công nghệ màn hình: Dynamic AMOLED 2X</br>
Camera sau: 13 MP + 8 MP UW</br>
Camera trước: 12 MP UW</br>
Chipset: Snapdragon 8 Gen 2 for Galaxy</br>
Dung lượng RAM: 12 GB</br>
Bộ nhớ : 256 GB</br>
Pin: 10.090 mAh</br>
Thẻ SIM: 2 SIM (nano‑SIM và eSIM) + khe thẻ nhớ với bản 5G. Còn bản wifi chỉ có khe thẻ nhớ. </br>
Hệ điều hành: Android 13</br>
Độ phân giải màn hình: 1752 x 2800 pixel</br>
Tính năng màn hình: 120 Hz, Hình ảnh nâng cao HDR10+</br>
Tương thích: Bút S-pen (Độ trễ 2.8ms, 4096 cảm ứng lực)</br>
Thông số kỹ thuật: Màn hình</br>
Kích thước màn hình: 12.4 inches</br>
Công nghệ màn hình: Dynamic AMOLED 2X</br>
Độ phân giải màn hình: 1752 x 2800 pixel</br>
Tính năng màn hình: 120 Hz, Hình ảnh nâng cao HDR10+</br>
Tần số quét: 120Hz</br>
Camera sau: 13 MP + 8 MP UW</br>
Quay video: 4K 2160p@30fps</br>
Tính năng camera: Làm đẹp, HDR, Đèn Flash, Góc siêu rộng, Zoom kỹ thuật số, Tua nhanh thời gian (Time‑lapse), Xóa phông, Toàn cảnh (Panorama), Chuyên nghiệp (Pro), Tự động lấy nét</br>
</br>
Camera trước: 12 MP UW, Quay video trước, HDR, Quay video Full HD, Quay video HD, Live Photos, Bộ lọc màu, Xóa phông, Hẹn giờ chụp, Làm đẹp, Góc siêu rộng</br>
</br>
Vi xử lý & đồ họa</br>
</br>
Chipset: Snapdragon 8 Gen 2 for Galaxy</br>
</br>
Loại CPU: 1 nhân 3.36 GHz, 4 nhân 2.8 GHz & 3 nhân 2 GHz</br>',
'2023-07-06', 0.13, 1);

-- Insert ImageProduct 18
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (18, './images/products/prd18/general.jpg', N'Thông tin tổng quát'),
    (18, './images/products/prd18/front.jpg', N'Mặt trước'),
    (18, './images/products/prd18/right.jpg', N'Bên phải'),
    (18, './images/products/prd18/left.jpg', N'Bên trái'),
    (18, './images/products/prd18/back.jpg', N'Mặt sau');

--Insert product 19
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (7, 2, N'Máy tính bảng Samsung Galaxy Tab S9 5G 8GB_128GB', 100, 22990000, 40, 60, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
Thông số kỹ thuật</br>
</br>
Kích thước màn hình:12.4 inches</br>
Công nghệ màn hình: Dynamic AMOLED 2X</br>
Camera sau: 13 MP + 8 MP UW</br>
Camera trước: 12 MP UW</br>
Chipset: Snapdragon 8 Gen 2 for Galaxy</br>
Dung lượng RAM: 12 GB</br>
Bộ nhớ : 256 GB</br>
Pin: 10.090 mAh</br>
Thẻ SIM: 2 SIM (nano‑SIM và eSIM) + khe thẻ nhớ với bản 5G. Còn bản wifi chỉ có khe thẻ nhớ. </br>
Hệ điều hành: Android 13</br>
Độ phân giải màn hình: 1752 x 2800 pixel</br>
Tính năng màn hình: 120 Hz, Hình ảnh nâng cao HDR10+</br>
Tương thích: Bút S-pen (Độ trễ 2.8ms, 4096 cảm ứng lực)</br>
Thông số kỹ thuật: Màn hình</br>
Kích thước màn hình: 12.4 inches</br>
Công nghệ màn hình: Dynamic AMOLED 2X</br>
Độ phân giải màn hình: 1752 x 2800 pixel</br>
Tính năng màn hình: 120 Hz, Hình ảnh nâng cao HDR10+</br>
Tần số quét: 120Hz</br>
Camera sau: 13 MP + 8 MP UW</br>
Quay video: 4K 2160p@30fps</br>
Tính năng camera: Làm đẹp, HDR, Đèn Flash, Góc siêu rộng, Zoom kỹ thuật số, Tua nhanh thời gian (Time‑lapse), Xóa phông, Toàn cảnh (Panorama), Chuyên nghiệp (Pro), Tự động lấy nét</br>
</br>
Camera trước: 12 MP UW, Quay video trước, HDR, Quay video Full HD, Quay video HD, Live Photos, Bộ lọc màu, Xóa phông, Hẹn giờ chụp, Làm đẹp, Góc siêu rộng</br>
</br>
Vi xử lý & đồ họa</br>
</br>
Chipset: Snapdragon 8 Gen 2 for Galaxy</br>
</br>
Loại CPU: 1 nhân 3.36 GHz, 4 nhân 2.8 GHz & 3 nhân 2 GHz</br>',
'2024-02-06', 0.20, 1);

-- Insert ImageProduct 19
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (19, './images/products/prd19/general.jpg', N'Thông tin tổng quát'),
    (19, './images/products/prd19/front.jpg', N'Mặt trước'),
    (19, './images/products/prd19/right.jpg', N'Bên phải'),
    (19, './images/products/prd19/left.jpg', N'Bên trái'),
    (19, './images/products/prd19/back.jpg', N'Mặt sau');

/*Insert Tablet - lenovo 5-2*/
--Insert product 20
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (5, 2, N'Máy tính bảng Lenovo Xiaoxin Pad Pro 12.7 ', 100, 8000000, 50, 50, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
💙 Thông số kỹ thuật : </br>
🔸 Chip : snap dragon 870</br>
🔸 Ram : </br>
🔸 Rom : </br>
🔸 Sim : không</br>
🔸 Thẻ nhớ : micro sd 1TB</br>
🔸 Màn hình : OLED</br>
- 12.7 inch độ phân giải 3K 2944 x 1840 ppi</br>
- Tần số quét 144Hz</br>
- Dolby Vision, HDR10</br>
🔸 Camera sau : 8 Mpx</br>
🔸 Camera trước : 13 Mpx</br>
🔸 Pin : 10200 mAh</br>
🔸 Sạc : 20W</br>
🔸 Bảo mật : </br>
🔸 Tính năng khác : hỗ trợ bút và phím</br>
🔸 Kich thước : 290.3 x 190.7 x6.9 mm</br>
🔸 Trọng lượng : 615g</br>
🔸 Chất liệu : kim loại + kính</br>
🔸 Màu sắc : Xanh + Xám</br>
🔸 Phiên bản : 8/128 gb và 8/256 gb</br>
🔸 Đóng gói : Máy + sạc + cáp</br>
🔸 Phần mềm : </br>
- Nguyên bản chạy rom nội địa Zui 15 china tiếng Anh . </br>
- Hỗ trợ cài Việt hóa 90% và google trên nền rom gốc China .</br>',
'2022-03-06', 0.15, 1);

-- Insert ImageProduct 20
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (20, './images/products/prd20/general.jpg', N'Thông tin tổng quát'),
    (20, './images/products/prd20/front.jpg', N'Mặt trước'),
    (20, './images/products/prd20/right.jpg', N'Bên phải'),
    (20, './images/products/prd20/left.jpg', N'Bên trái'),
    (20, './images/products/prd20/back.jpg', N'Mặt sau');

--Insert product 21
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (5, 2, N'Máy tính bảng Lenovo Tab P11 Plus Xám ', 100, 8190000, 64, 36, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
💙 Thông số kỹ thuật : </br>
🔸 Chip : snap dragon 870</br>
🔸 Ram : </br>
🔸 Rom : </br>
🔸 Sim : không</br>
🔸 Thẻ nhớ : micro sd 1TB</br>
🔸 Màn hình : OLED</br>
- 12.7 inch độ phân giải 3K 2944 x 1840 ppi</br>
- Tần số quét 144Hz</br>
- Dolby Vision, HDR10</br>
🔸 Camera sau : 8 Mpx</br>
🔸 Camera trước : 13 Mpx</br>
🔸 Pin : 10200 mAh</br>
🔸 Sạc : 20W</br>
🔸 Bảo mật : </br>
🔸 Tính năng khác : hỗ trợ bút và phím</br>
🔸 Kich thước : 290.3 x 190.7 x6.9 mm</br>
🔸 Trọng lượng : 615g</br>
🔸 Chất liệu : kim loại + kính</br>
🔸 Màu sắc : Xanh + Xám</br>
🔸 Phiên bản : 8/128 gb và 8/256 gb</br>
🔸 Đóng gói : Máy + sạc + cáp</br>
🔸 Phần mềm : </br>
- Nguyên bản chạy rom nội địa Zui 15 china tiếng Anh . </br>
- Hỗ trợ cài Việt hóa 90% và google trên nền rom gốc China .</br>',
'2023-03-06', 0.32, 1);

-- Insert ImageProduct 21
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (21, './images/products/prd21/general.jpg', N'Thông tin tổng quát'),
    (21, './images/products/prd21/front.jpg', N'Mặt trước'),
    (21, './images/products/prd21/right.jpg', N'Bên phải'),
    (21, './images/products/prd21/left.jpg', N'Bên trái'),
    (21, './images/products/prd21/back.jpg', N'Mặt sau');

--Insert product 22
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (5, 2, N'Máy tính bảng Lenovo Tab M11', 100, 5690000, 64, 36, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
💙 Thông số kỹ thuật : </br>
🔸 Chip : snap dragon 870</br>
🔸 Ram : </br>
🔸 Rom : </br>
🔸 Sim : không</br>
🔸 Thẻ nhớ : micro sd 1TB</br>
🔸 Màn hình : OLED</br>
- 12.7 inch độ phân giải 3K 2944 x 1840 ppi</br>
- Tần số quét 144Hz</br>
- Dolby Vision, HDR10</br>
🔸 Camera sau : 8 Mpx</br>
🔸 Camera trước : 13 Mpx</br>
🔸 Pin : 10200 mAh</br>
🔸 Sạc : 20W</br>
🔸 Bảo mật : </br>
🔸 Tính năng khác : hỗ trợ bút và phím</br>
🔸 Kich thước : 290.3 x 190.7 x6.9 mm</br>
🔸 Trọng lượng : 615g</br>
🔸 Chất liệu : kim loại + kính</br>
🔸 Màu sắc : Xanh + Xám</br>
🔸 Phiên bản : 8/128 gb và 8/256 gb</br>
🔸 Đóng gói : Máy + sạc + cáp</br>
🔸 Phần mềm : </br>
- Nguyên bản chạy rom nội địa Zui 15 china tiếng Anh . </br>
- Hỗ trợ cài Việt hóa 90% và google trên nền rom gốc China .</br>',
'2022-12-12', 0.11, 1);

-- Insert ImageProduct 22
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (22, './images/products/prd22/general.jpg', N'Thông tin tổng quát'),
    (22, './images/products/prd22/front.jpg', N'Mặt trước'),
    (22, './images/products/prd22/right.jpg', N'Bên phải'),
    (22, './images/products/prd22/left.jpg', N'Bên trái'),
    (22, './images/products/prd22/back.jpg', N'Mặt sau');

------------ End Insert Tablet -----------------------------

/*Insert PC*/
/*Insert PC - APPLE 3-3*/
--Insert Product 23 
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (3, 3, N'Apple iMac M1 2021 24 inch with Retina 4.5K display', 100, 34570000, 64, 36, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
Bảo hành chính hãng 12 tháng</br>
</br>
Bộ sản phẩm gồm: màn hình + bàn phím</br>
</br>
iMac M1 2021 24 inch</br>
</br>
Chip Apple M1 trên dòng iMac 24 inch 2021 cho trải nghiệm hiệu suất ấn tượng và hoàn toàn mới, kết hợp RAM và ổ cứng SSD tối ưu, tận dụng tối đa macOS và nhiều ứng dụng Apple khác, không chỉ mạnh hơn mà còn có thiết kế vuông vức nhỏ gọn hoàn toàn mới</br>
</br>
▼ iMac 24 inch M1 2021 có gì đáng chú ý:- Chip M1 kết hợp macOS Big Sur đưa iMac 24 inch lên một tầm cao mới về hiệu suất, hiệu năng và bảo mật.</br>
</br>
- CPU nhanh hơn đến 85%, hiệu suất đồ họa nhanh hơn gấp 2 lần dòng iMac 21.5" tiêu chuẩn.</br>
</br>
- iMac 2021 có hai tùy chọn GPU 7 nhân và 8 nhân phù hợp nhu cầu sử dụng khác nhau.</br>
</br>
- Màn hình Retina 4.5K 4480 x 2520 mang đến hơn 1 tỷ màu và độ sáng 500 nit, hỗ trợ P3 wide color gamut, True Tone cho trải nghiệm xem tự nhiên, sống động.</br>
</br>
- Camera Full HD 1080p FaceTime HD kết hợp chip xử lý tín hiệu hình ảnh tiên tiến trên chip M1 cho hình ảnh sắc nét và nhiều chi tiết hơn ở cả vùng tối và vùng sáng khi gọi video.</br>
</br>
- Chất lượng âm thanh xuất sắc như ở rạp chiếu nhờ cụm 3 mic chất lượng phòng thu và 6 loa trung thực cao, hỗ trợ Spatial Audio khi phát video với Dolby Atmos cho chất âm stereo dải rộng.</br>
</br>
- Kết nối mạng với Wi-Fi 6 (802.11ax), sử dụng thiết bị ngoại vi và phụ kiện không dây với Bluetooth 5.0. Liên kết mở rộng linh hoạt với 2 cổng Thunderbolt 3 / USB 4; cấu hình GPU 8 nhân có thêm 2 cổng USB Type-C.</br>',
'2023-12-12', 0.14, 1);

-- Insert ImageProduct 23
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (23, './images/products/prd23/general.jpg', N'Thông tin tổng quát'),
    (23, './images/products/prd23/front.jpg', N'Mặt trước'),
    (23, './images/products/prd23/right.jpg', N'Bên phải'),
    (23, './images/products/prd23/left.jpg', N'Bên trái'),
    (23, './images/products/prd23/back.jpg', N'Mặt sau');

--Insert Product 24
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (3, 3, N'Apple iMac M3 8-Core CPU/10-Core GPU/8GB RAM/256GB', 100, 43679000, 70, 30, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
ĐẶC ĐIỂM NỔI BẬT</br>
</br>
Chip M3 mạnh mẽ xử lý tốt mọi tác vụ đồ hoạ, làm việc hằng ngàyXử lý nhiều tác vụ cùng lúc vô cùng hiệu quả với 8GB Ram cùng 256GB bộ nhớ trongHình ảnh hiển thị sống động trên màn hình Retina sắc nétTích hợp Webcam 1080P cho phép họp, trò chuyện online tiện lợi</br></br>
iMac M3 2023 24 inch là mẫu iMac thế hệ mới sở hữu một cấu hình vượt trội với con CPU 8 lõi Apple M3 cùng với bộ nhớ RAM 8GB và dung lượng lưu trữ 256GB. iMac M3 mới được trang bị tới bảy phiên bản màu khác nhau bao gồm: Xanh dương, Xanh lá, Hồng, Bạc, Vàng, Cam và Tím. Cùng với đó, mẫu iMac này được trong bị màn hình 24 inch Retina 4,5K mang lại khả năng hiển thị vượt trội.
Siêu mạnh mẽ với chip M3</br>
</br>
Chip M3 mang đến bước nhảy vọt lớn về hiệu năng cho iMac, trang bị CPU 8 lõi, GPU lên đến 10 lõi và hỗ trợ bộ nhớ thống nhất lên đến 24GB. iMac mới nhanh hơn gấp hai lần so với thế hệ trước trang bị chip M1.1 Người dùng sẽ cảm nhận được tốc độ và sức mạnh của chip M3 khi thực hiện mọi công việc, từ đa nhiệm trên các ứng dụng năng suất hàng ngày đến khám phá niềm đam mê sáng tạo khi chỉnh sửa ảnh chất lượng cao hoặc nhiều luồng video 4K. Với việc trang bị GPU thế hệ mới trong chip M3, iMac hỗ trợ công nghệ đổ bóng dạng lưới và dò tia tốc độ cao bằng phần cứng, qua đó cho ánh sáng, phản chiếu và vùng tối chính xác hơn để mang lại trải nghiệm chơi game vô cùng chân thực, đồng thời giúp tác vụ sáng tạo và thiết kế ba chiều trở nên nhanh hơn nữa. Với Neural Engine 16 lõi và media engine mới nhất, iMac cũng mang đến khả năng máy học và hiệu năng video đáng kinh ngạc.</br>
</br>
iMac mang đến năng suất ấn tượng cho các doanh nghiệp nhỏ, sinh viên, game thủ và người tiêu dùng hàng ngày. Khi so sánh với iMac 24 inch thế hệ trước:1</br>
</br>
Safari, trình duyệt nhanh nhất thế giới, hoạt động nhanh hơn đến 30%.</br>
</br>
Các ứng dụng năng suất như Microsoft Excel hoạt động nhanh hơn đến 30%.</br>
</br>
Tốc độ tải trò chơi nhanh hơn, và người dùng sẽ được trải nghiệm tốc độ khung hình nhanh hơn đến 50%.</br>',
'2022-10-12', 0.14, 1);

-- Insert ImageProduct 24
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (24, './images/products/prd24/general.jpg', N'Thông tin tổng quát'),
    (24, './images/products/prd24/front.jpg', N'Mặt trước'),
    (24, './images/products/prd24/right.jpg', N'Bên phải'),
    (24, './images/products/prd24/left.jpg', N'Bên trái'),
    (24, './images/products/prd24/back.jpg', N'Mặt sau');

--Insert Product 25
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (3, 3, N'Apple iMac M3 8CPU/8GPU 8GB/256GB | 8CPU/10GPU 8GB/512GB', 100, 38479000, 60, 40, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
ĐẶC ĐIỂM NỔI BẬT</br>
</br>
Chip M3 mạnh mẽ xử lý tốt mọi tác vụ đồ hoạ, làm việc hằng ngàyXử lý nhiều tác vụ cùng lúc vô cùng hiệu quả với 8GB Ram cùng 256GB bộ nhớ trongHình ảnh hiển thị sống động trên màn hình Retina sắc nétTích hợp Webcam 1080P cho phép họp, trò chuyện online tiện lợi</br></br>
iMac M3 2023 24 inch là mẫu iMac thế hệ mới sở hữu một cấu hình vượt trội với con CPU 8 lõi Apple M3 cùng với bộ nhớ RAM 8GB và dung lượng lưu trữ 256GB. iMac M3 mới được trang bị tới bảy phiên bản màu khác nhau bao gồm: Xanh dương, Xanh lá, Hồng, Bạc, Vàng, Cam và Tím. Cùng với đó, mẫu iMac này được trong bị màn hình 24 inch Retina 4,5K mang lại khả năng hiển thị vượt trội.
Siêu mạnh mẽ với chip M3</br>
</br>
Chip M3 mang đến bước nhảy vọt lớn về hiệu năng cho iMac, trang bị CPU 8 lõi, GPU lên đến 10 lõi và hỗ trợ bộ nhớ thống nhất lên đến 24GB. iMac mới nhanh hơn gấp hai lần so với thế hệ trước trang bị chip M1.1 Người dùng sẽ cảm nhận được tốc độ và sức mạnh của chip M3 khi thực hiện mọi công việc, từ đa nhiệm trên các ứng dụng năng suất hàng ngày đến khám phá niềm đam mê sáng tạo khi chỉnh sửa ảnh chất lượng cao hoặc nhiều luồng video 4K. Với việc trang bị GPU thế hệ mới trong chip M3, iMac hỗ trợ công nghệ đổ bóng dạng lưới và dò tia tốc độ cao bằng phần cứng, qua đó cho ánh sáng, phản chiếu và vùng tối chính xác hơn để mang lại trải nghiệm chơi game vô cùng chân thực, đồng thời giúp tác vụ sáng tạo và thiết kế ba chiều trở nên nhanh hơn nữa. Với Neural Engine 16 lõi và media engine mới nhất, iMac cũng mang đến khả năng máy học và hiệu năng video đáng kinh ngạc.</br>
</br>
iMac mang đến năng suất ấn tượng cho các doanh nghiệp nhỏ, sinh viên, game thủ và người tiêu dùng hàng ngày. Khi so sánh với iMac 24 inch thế hệ trước:1</br>
</br>
Safari, trình duyệt nhanh nhất thế giới, hoạt động nhanh hơn đến 30%.</br>
</br>
Các ứng dụng năng suất như Microsoft Excel hoạt động nhanh hơn đến 30%.</br>
</br>
Tốc độ tải trò chơi nhanh hơn, và người dùng sẽ được trải nghiệm tốc độ khung hình nhanh hơn đến 50%.</br>',
'2023-10-12', 0.03, 1);

-- Insert ImageProduct 25
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (25, './images/products/prd25/general.jpg', N'Thông tin tổng quát'),
    (25, './images/products/prd25/front.jpg', N'Mặt trước'),
    (25, './images/products/prd25/right.jpg', N'Bên phải'),
    (25, './images/products/prd25/left.jpg', N'Bên trái'),
    (25, './images/products/prd25/back.jpg', N'Mặt sau');

/*Insert PC - HP 6-3*/
--Insert Product 26 
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (6, 3, N'Máy tính để bàn HP S01-PF2034D 6L605PA', 100, 10189800, 64, 36, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
Máy tính để bàn HP S01-PF2034D 6L605PA (i3-12100(4*3.3)/ Ram 8GD4/ 256GSSD/ DVDWR/ Windowns 11 home)</br>
</br>
HP S01-PF2034D 6L605PA với thiết kế hướng tương lai, bộ vi xử lý mạnh mẽ cùng tích hợp nhiều công nghệ bảo mật hàng đầu của HP sẽ là máy tính để bàn đa năng cực kỳ linh hoạt dành cho doanh nghiệp của bạn. </br>
THÔNG SỐ KỸ THUẬT</br></br>
Sản phẩm: Máy tính để bàn</br>
Tên Hãng: HP</br>
Model: S01-PF2034D 6L605PA</br>
Bộ VXL: Intel® Core™ i3-12100 (up to 4.3 GHz with Intel® Turbo Boost Technology, 12 MB L3 cache, 4 cores, 8 threads)</br>
Cạc đồ họa: VGA onboard, Intel® UHD Graphics 730</br>
Bộ nhớ: 8 GB DDR4-2933 MHz RAM (1 x 8 GB)</br>
Ổ cứng:256 GB PCIe® NVMe™ M.2 SSD</br>
Kết nối mạng: Network Interface: Integrated 10/100/1000 GbE LAN, Wireless: Realtek RTL8822CE 802.11a/b/g/n/ac (2x2) Wi-Fi® and Bluetooth® 5 combo</br>
Ổ quang:Không có </br>
Phụ kiện : Key/mouse: HP 125 USB Black Wired Keyboard - HP 125 USB Black Wired MouseCổng giao tiếpExpansion Slots: 2 M.2; 1 PCIe x16; 1 PCIe x1</br>
Ports: 4 SuperSpeed USB Type-A 5Gbps signaling rate; 1 headphone/microphone combo</br>
Network Interface: Integrated 10/100/1000 GbE LAN</br>
Wireless: Realtek RTL8822CE 802.11a/b/g/n/ac (2x2) Wi-Fi® and Bluetooth® 5 combo</br>
Hệ điều hành: Windows 11 home</br>
Kiểu dáng" case đứng nhỏ</br>
Kích thước: 9.5 x 30.3 x 27 cm</br>
Khối lượng:3.2 kg</br>',
'2022-06-12', 0.09, 1);

-- Insert ImageProduct 26
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (26, './images/products/prd26/general.jpg', N'Thông tin tổng quát'),
    (26, './images/products/prd26/front.jpg', N'Mặt trước'),
    (26, './images/products/prd26/right.jpg', N'Bên phải'),
    (26, './images/products/prd26/left.jpg', N'Bên trái'),
    (26, './images/products/prd26/back.jpg', N'Mặt sau');

--Insert Product 27
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (6, 3, N'Máy tính để bàn HP Pavilion TP01-3008D 6K7A9PA Snow white', 100, 17190000, 64, 36, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
Máy tính để bàn HP S01-PF2034D 6L605PA (i3-12100(4*3.3)/ Ram 8GD4/ 256GSSD/ DVDWR/ Windowns 11 home)</br>
</br>
HP S01-PF2034D 6L605PA với thiết kế hướng tương lai, bộ vi xử lý mạnh mẽ cùng tích hợp nhiều công nghệ bảo mật hàng đầu của HP sẽ là máy tính để bàn đa năng cực kỳ linh hoạt dành cho doanh nghiệp của bạn. </br>
THÔNG SỐ KỸ THUẬT</br></br>
Sản phẩm: Máy tính để bàn</br>
Tên Hãng: HP</br>
Model: S01-PF2034D 6L605PA</br>
Bộ VXL: Intel® Core™ i3-12100 (up to 4.3 GHz with Intel® Turbo Boost Technology, 12 MB L3 cache, 4 cores, 8 threads)</br>
Cạc đồ họa: VGA onboard, Intel® UHD Graphics 730</br>
Bộ nhớ: 8 GB DDR4-2933 MHz RAM (1 x 8 GB)</br>
Ổ cứng:256 GB PCIe® NVMe™ M.2 SSD</br>
Kết nối mạng: Network Interface: Integrated 10/100/1000 GbE LAN, Wireless: Realtek RTL8822CE 802.11a/b/g/n/ac (2x2) Wi-Fi® and Bluetooth® 5 combo</br>
Ổ quang:Không có </br>
Phụ kiện : Key/mouse: HP 125 USB Black Wired Keyboard - HP 125 USB Black Wired MouseCổng giao tiếpExpansion Slots: 2 M.2; 1 PCIe x16; 1 PCIe x1</br>
Ports: 4 SuperSpeed USB Type-A 5Gbps signaling rate; 1 headphone/microphone combo</br>
Network Interface: Integrated 10/100/1000 GbE LAN</br>
Wireless: Realtek RTL8822CE 802.11a/b/g/n/ac (2x2) Wi-Fi® and Bluetooth® 5 combo</br>
Hệ điều hành: Windows 11 home</br>
Kiểu dáng" case đứng nhỏ</br>
Kích thước: 9.5 x 30.3 x 27 cm</br>
Khối lượng:3.2 kg</br>',
'2023-06-12', 0.29, 1);

-- Insert ImageProduct 27
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (27, './images/products/prd27/general.jpg', N'Thông tin tổng quát'),
    (27, './images/products/prd27/front.jpg', N'Mặt trước'),
    (27, './images/products/prd27/right.jpg', N'Bên phải'),
    (27, './images/products/prd27/left.jpg', N'Bên trái'),
    (27, './images/products/prd27/back.jpg', N'Mặt sau');

--Insert Product 28
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (6, 3, N'PC HP M01-F3006d (8C5S2PA) 8C5S2PA', 100, 15890000, 71, 29, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
Máy tính để bàn HP S01-PF2034D 6L605PA (i3-12100(4*3.3)/ Ram 8GD4/ 256GSSD/ DVDWR/ Windowns 11 home)</br>
</br>
HP S01-PF2034D 6L605PA với thiết kế hướng tương lai, bộ vi xử lý mạnh mẽ cùng tích hợp nhiều công nghệ bảo mật hàng đầu của HP sẽ là máy tính để bàn đa năng cực kỳ linh hoạt dành cho doanh nghiệp của bạn. </br>
THÔNG SỐ KỸ THUẬT</br></br>
Sản phẩm: Máy tính để bàn</br>
Tên Hãng: HP</br>
Model: S01-PF2034D 6L605PA</br>
Bộ VXL: Intel® Core™ i3-12100 (up to 4.3 GHz with Intel® Turbo Boost Technology, 12 MB L3 cache, 4 cores, 8 threads)</br>
Cạc đồ họa: VGA onboard, Intel® UHD Graphics 730</br>
Bộ nhớ: 8 GB DDR4-2933 MHz RAM (1 x 8 GB)</br>
Ổ cứng:256 GB PCIe® NVMe™ M.2 SSD</br>
Kết nối mạng: Network Interface: Integrated 10/100/1000 GbE LAN, Wireless: Realtek RTL8822CE 802.11a/b/g/n/ac (2x2) Wi-Fi® and Bluetooth® 5 combo</br>
Ổ quang:Không có </br>
Phụ kiện : Key/mouse: HP 125 USB Black Wired Keyboard - HP 125 USB Black Wired MouseCổng giao tiếpExpansion Slots: 2 M.2; 1 PCIe x16; 1 PCIe x1</br>
Ports: 4 SuperSpeed USB Type-A 5Gbps signaling rate; 1 headphone/microphone combo</br>
Network Interface: Integrated 10/100/1000 GbE LAN</br>
Wireless: Realtek RTL8822CE 802.11a/b/g/n/ac (2x2) Wi-Fi® and Bluetooth® 5 combo</br>
Hệ điều hành: Windows 11 home</br>
Kiểu dáng" case đứng nhỏ</br>
Kích thước: 9.5 x 30.3 x 27 cm</br>
Khối lượng:3.2 kg</br>',
'2021-06-12', 0.09, 1);

-- Insert ImageProduct 28
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (28, './images/products/prd28/general.jpg', N'Thông tin tổng quát'),
    (28, './images/products/prd28/front.jpg', N'Mặt trước'),
    (28, './images/products/prd28/right.jpg', N'Bên phải'),
    (28, './images/products/prd28/left.jpg', N'Bên trái'),
    (28, './images/products/prd28/back.jpg', N'Mặt sau');
/*Insert PC - LENOVO 5-3*/
--Insert Product 29
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (5, 3, N'PC Lenovo ThinkCentre Neo 50S Gen4 12JH0006VA', 100, 14990000, 64, 36, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
BỘ XỬ LÝ</br></br>
Dòng CPU	Core i5</br>
Công nghệ CPU	</br>
Mã CPU	Core i5-13400</br>
Tốc độ CPU	2.50 GHz</br>
Tần số turbo tối đa	4.60 GHz</br>
Số lõi CPU	10 Cores</br>
Số luồng	16 Threads</br>
Bộ nhớ đệm	20Mb</br>
Chipset	Intel B660</br>
BỘ NHỚ RAM</br>
Dung lượng RAM	8Gb</br>
Loại RAM	DDR4</br>
Tốc độ Bus RAM	3200 MHz</br>
Hỗ trợ RAM tối đa	64GB</br>
Khe cắm RAM	2</br>
Card đồ họa	Intel UHD Graphics 730</br>
Card tích hợp	VGA onboard</br>
Ổ CỨNG</br>
Dung lượng ổ cứng	512GB</br>
Loại ổ cứng	SSD</br>
Chuẩn ổ cứng	512GB SSD M.2 2280 PCIe® 4.0x4 NVMe®</br>
Up to two drives, 1x 3.5 inch HDD + 1x M.2 SSD</br>
• 3.5 inch HDD up to 2TB</br>
• M.2 SSD up to 1TB</br>
Ổ quang	NO DVD</br>
KẾT NỐI</br>
Kết nối không dây	Intel® Wi-Fi® 6 AX201, 11ax 2x2 + BT5.1</br>
Thông số (Lan/Wireless)	Integrated 100/1000M</br>
Cổng giao tiếp trước	1x USB-C® 3.2 Gen 1 (support data transfer and 5V@3A charging)</br>
2x USB 3.2 Gen 1</br>
1x headphone / microphone combo jack (3.5mm)</br>
1x microphone (3.5mm)</br>
Cổng giao tiếp sau	2x USB 2.0</br>
2x USB 3.2 Gen 1 (one supports Smart Power On)</br>
1x HDMI® 2.1 TMDS</br>
1x DisplayPort™ 1.4</br>
1x VGA</br>
1x Ethernet (RJ-45)</br>
1x line-out (3.5mm)</br>
Khe cắm mở rộng	1 PCIe® 4.0 x16, low-profie (length < 167.65mm, height < 68.90mm)</br>
1PCIe® 3.0 x1, low-profie (length < 167.65mm, height < 68.90mm)</br>
2 M.2 slots (one for WLAN, one for SSD)</br>
PHẦN MỀM</br>
Hệ điều hành	NoOS</br>
THÔNG TIN KHÁC</br>
Bộ nguồn	180W 85%</br>
Phụ kiện	USB Calliope Keyboard, Black, English</br>
Kiểu dáng	Form Factor SFF (7.4L)</br>
Kích thước	100 x 308 x 274.8 mm (3.9 x 12.1 x 10.8 inches)</br>
Trọng lượng	Khoảng 4,5 kg (9,9 lbs)</br>',
'2023-09-12', 0.19, 1);

-- Insert ImageProduct 29
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (29, './images/products/prd29/general.jpg', N'Thông tin tổng quát'),
    (29, './images/products/prd29/front.jpg', N'Mặt trước'),
    (29, './images/products/prd29/right.jpg', N'Bên phải'),
    (29, './images/products/prd29/left.jpg', N'Bên trái'),
    (29, './images/products/prd29/back.jpg', N'Mặt sau');

--Insert prduct 30
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (5, 3, N'Mini PC Lenovo ThinkCentre M70q gen 3 tiny i5-12500T', 100, 9990000, 64, 36, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
BỘ XỬ LÝ</br></br>
Dòng CPU	Core i5</br>
Công nghệ CPU	</br>
Mã CPU	Core i5-13400</br>
Tốc độ CPU	2.50 GHz</br>
Tần số turbo tối đa	4.60 GHz</br>
Số lõi CPU	10 Cores</br>
Số luồng	16 Threads</br>
Bộ nhớ đệm	20Mb</br>
Chipset	Intel B660</br>
BỘ NHỚ RAM</br>
Dung lượng RAM	8Gb</br>
Loại RAM	DDR4</br>
Tốc độ Bus RAM	3200 MHz</br>
Hỗ trợ RAM tối đa	64GB</br>
Khe cắm RAM	2</br>
Card đồ họa	Intel UHD Graphics 730</br>
Card tích hợp	VGA onboard</br>
Ổ CỨNG</br>
Dung lượng ổ cứng	512GB</br>
Loại ổ cứng	SSD</br>
Chuẩn ổ cứng	512GB SSD M.2 2280 PCIe® 4.0x4 NVMe®</br>
Up to two drives, 1x 3.5 inch HDD + 1x M.2 SSD</br>
• 3.5 inch HDD up to 2TB</br>
• M.2 SSD up to 1TB</br>
Ổ quang	NO DVD</br>
KẾT NỐI</br>
Kết nối không dây	Intel® Wi-Fi® 6 AX201, 11ax 2x2 + BT5.1</br>
Thông số (Lan/Wireless)	Integrated 100/1000M</br>
Cổng giao tiếp trước	1x USB-C® 3.2 Gen 1 (support data transfer and 5V@3A charging)</br>
2x USB 3.2 Gen 1</br>
1x headphone / microphone combo jack (3.5mm)</br>
1x microphone (3.5mm)</br>
Cổng giao tiếp sau	2x USB 2.0</br>
2x USB 3.2 Gen 1 (one supports Smart Power On)</br>
1x HDMI® 2.1 TMDS</br>
1x DisplayPort™ 1.4</br>
1x VGA</br>
1x Ethernet (RJ-45)</br>
1x line-out (3.5mm)</br>
Khe cắm mở rộng	1 PCIe® 4.0 x16, low-profie (length < 167.65mm, height < 68.90mm)</br>
1PCIe® 3.0 x1, low-profie (length < 167.65mm, height < 68.90mm)</br>
2 M.2 slots (one for WLAN, one for SSD)</br>
PHẦN MỀM</br>
Hệ điều hành	NoOS</br>
THÔNG TIN KHÁC</br>
Bộ nguồn	180W 85%</br>
Phụ kiện	USB Calliope Keyboard, Black, English</br>
Kiểu dáng	Form Factor SFF (7.4L)</br>
Kích thước	100 x 308 x 274.8 mm (3.9 x 12.1 x 10.8 inches)</br>
Trọng lượng	Khoảng 4,5 kg (9,9 lbs)</br>',
'2023-11-12', 0.19, 1);

-- Insert ImageProduct 30
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (30, './images/products/prd30/general.jpg', N'Thông tin tổng quát'),
    (30, './images/products/prd30/front.jpg', N'Mặt trước'),
    (30, './images/products/prd30/right.jpg', N'Bên phải'),
    (30, './images/products/prd30/left.jpg', N'Bên trái'),
    (30, './images/products/prd30/back.jpg', N'Mặt sau');

/*Insert PC - DELL 1-3*/
--Insert Product 31
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (1, 3, N'Case máy tính Dell Optiplex 3050 SFF core i5 6500', 100, 4614000, 64, 36, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
BỘ XỬ LÝ</br></br>
Dòng CPU	Core i5</br>
Công nghệ CPU	</br>
Mã CPU	Core i5-13400</br>
Tốc độ CPU	2.50 GHz</br>
Tần số turbo tối đa	4.60 GHz</br>
Số lõi CPU	10 Cores</br>
Số luồng	16 Threads</br>
Bộ nhớ đệm	20Mb</br>
Chipset	Intel B660</br>
BỘ NHỚ RAM</br>
Dung lượng RAM	8Gb</br>
Loại RAM	DDR4</br>
Tốc độ Bus RAM	3200 MHz</br>
Hỗ trợ RAM tối đa	64GB</br>
Khe cắm RAM	2</br>
Card đồ họa	Intel UHD Graphics 730</br>
Card tích hợp	VGA onboard</br>
Ổ CỨNG</br>
Dung lượng ổ cứng	512GB</br>
Loại ổ cứng	SSD</br>
Chuẩn ổ cứng	512GB SSD M.2 2280 PCIe® 4.0x4 NVMe®</br>
Up to two drives, 1x 3.5 inch HDD + 1x M.2 SSD</br>
• 3.5 inch HDD up to 2TB</br>
• M.2 SSD up to 1TB</br>
Ổ quang	NO DVD</br>
KẾT NỐI</br>
Kết nối không dây	Intel® Wi-Fi® 6 AX201, 11ax 2x2 + BT5.1</br>
Thông số (Lan/Wireless)	Integrated 100/1000M</br>
Cổng giao tiếp trước	1x USB-C® 3.2 Gen 1 (support data transfer and 5V@3A charging)</br>
2x USB 3.2 Gen 1</br>
1x headphone / microphone combo jack (3.5mm)</br>
1x microphone (3.5mm)</br>
Cổng giao tiếp sau	2x USB 2.0</br>
2x USB 3.2 Gen 1 (one supports Smart Power On)</br>
1x HDMI® 2.1 TMDS</br>
1x DisplayPort™ 1.4</br>
1x VGA</br>
1x Ethernet (RJ-45)</br>
1x line-out (3.5mm)</br>
Khe cắm mở rộng	1 PCIe® 4.0 x16, low-profie (length < 167.65mm, height < 68.90mm)</br>
1PCIe® 3.0 x1, low-profie (length < 167.65mm, height < 68.90mm)</br>
2 M.2 slots (one for WLAN, one for SSD)</br>
PHẦN MỀM</br>
Hệ điều hành	NoOS</br>
THÔNG TIN KHÁC</br>
Bộ nguồn	180W 85%</br>
Phụ kiện	USB Calliope Keyboard, Black, English</br>
Kiểu dáng	Form Factor SFF (7.4L)</br>
Kích thước	100 x 308 x 274.8 mm (3.9 x 12.1 x 10.8 inches)</br>
Trọng lượng	Khoảng 4,5 kg (9,9 lbs)</br>',
'2022-09-12', 0.25, 1);

-- Insert ImageProduct 31
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (31, './images/products/prd31/general.jpg', N'Thông tin tổng quát'),
    (31, './images/products/prd31/front.jpg', N'Mặt trước'),
    (31, './images/products/prd31/right.jpg', N'Bên phải'),
    (31, './images/products/prd31/left.jpg', N'Bên trái'),
    (31, './images/products/prd31/back.jpg', N'Mặt sau');

--------------- END INSERT PC ---------------------------------

/*Insert screen*/
/*Insert Screen - Lenovo 5-4*/
--Insert product 32 
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (5, 4, N'Màn hình Lenovo Think Vision S27i-30 63DFKAR4WW', 100, 3690000, 62, 38, 5, 0,
N'MÔ TẢ SẢN PHẨM</br></br>
Cấu hình Màn hình Lenovo Think Vision S27i-30 63DFKAR4WW (27Inch/ Full HD/ 4ms/ 100HZ/ 300 cd/m2/ IPS)</br>
MÀN HÌNH</br>
</br>
Kiểu màn hình	Màn hình văn phòng</br>
Kích thước màn hình	27Inch</br>
Độ phân giải	Full HD (1920x1080)</br>
Thời gian đáp ứng	4ms</br>
Tần số quét	100HZ</br>
Độ sáng	300 cd/m2</br>
Tỷ lệ tương phản	1300:1</br>
Góc nhìn	178°(H)/178°(V)</br>
Tấm nền	IPS</br>
Loa tích hợp	Không</br>
KẾT NỐI</br>
Cổng giao tiếp	2*HDMI, 1*VGA, 1*audio out</br>
Phụ kiện kèm theo	Cáp nguồn, Cáp HDMI</br>
THÔNG TIN KHÁC</br>
Tính năng khác	3 mặt đường viền siêu mảnh, màn hình chống lóa</br>
Xuất xứ	Chính hãng</br>',
'2021-09-12', 0.15, 1);

-- Insert ImageProduct 32
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (32, './images/products/prd32/general.jpg', N'Thông tin tổng quát'),
    (32, './images/products/prd32/front.jpg', N'Mặt trước'),
    (32, './images/products/prd32/right.jpg', N'Bên phải'),
    (32, './images/products/prd32/left.jpg', N'Bên trái'),
    (32, './images/products/prd32/back.jpg', N'Mặt sau');

/*Insert Screen - DELL 1-4*/
--Insert product 33
INSERT INTO Product(supplierId, categoryId, productName, quantityPerUnit, unitPrice, unitInStock, 
					quantitySold, starRating, isDiscount, description, releaseDate, discount, status)
VALUES (1, 4, N'Màn Hình Dell UltraSharp U2424H', 100, 6490000, 62, 38, 5, 0,
N'MÔ TẢ SẢN PHẨM</br>
</br>
"THƯƠNG HIỆU: Dell</br>
</br>
BẢO HÀNH: 36 tháng</br>
</br>
KÍCH CỠ: 23.8 inch</br>
</br>
KIỂU MÀN HÌNH: Màn hình phẳng</br>
</br>
ĐỘ PHÂN GIẢI: FHD (1920 x 1080)</br>
</br>
TỶ LỆ KHUNG HÌNH: 16:9</br>
</br>
TẤM NỀN: IPS</br>
</br>
MÀU SẮC MÀN HÌNH: 16.7M, 100% BT.709, 100% sRGB, 85% DCI-P3</br>
</br>
ĐỘ SÁNG MÀN HÌNH: 250 cd/m²</br>
</br>
ĐỘ TƯƠNG PHẢN: 1000:1</br>
</br>
TẦN SỐ QUÉT: 120Hz</br>
</br>
THỜI GIAN PHẢN HỒI: 5 ms</br>
</br>
CỔNG KẾT NỐI MÀN HÌNH: 1 x HDMI, 2 x DisplayPort, 2 x USB-C</br>
</br>
VESA: 100 x 100 mm</br>
</br>
PHÂN LOẠI MÀN HÌNH: Đồ họa, Phổ thông"</br>',
'2022-11-12', 0.12, 1);

-- Insert ImageProduct 33
INSERT INTO ImageProduct (productId, imageUrl, description)
VALUES
    (33, './images/products/prd33/general.jpg', N'Thông tin tổng quát'),
    (33, './images/products/prd33/front.jpg', N'Mặt trước'),
    (33, './images/products/prd33/right.jpg', N'Bên phải'),
    (33, './images/products/prd33/left.jpg', N'Bên trái'),
    (33, './images/products/prd33/back.jpg', N'Mặt sau');


UPDATE [dbo].[User]
SET image = './images/avatar/default.jpg'
WHERE status = 'True';
