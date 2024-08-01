create database Project;
use Project;
CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    Publisher VARCHAR(255) NOT NULL,
    Genre VARCHAR(100),
    Price DECIMAL(10, 2) NOT NULL,
    Category_ID INT,
    Publisher_ID INT,
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID),
    FOREIGN KEY (Publisher_ID) REFERENCES Publishers(Publisher_ID)
);
CREATE TABLE Customers (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Phone VARCHAR(20)
);
CREATE TABLE Orders (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    Order_Date DATETIME NOT NULL,
    Status VARCHAR(50) NOT NULL,
    Total_Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);
CREATE TABLE OrderDetails (
    Order_ID INT,
    ISBN VARCHAR(13),
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (Order_ID, ISBN),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN)
);
CREATE TABLE Employees (
    Employee_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Position VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Phone VARCHAR(20)
);
CREATE TABLE Categories (
    Category_ID INT AUTO_INCREMENT PRIMARY KEY,
    Category_Name VARCHAR(100) NOT NULL
);
CREATE TABLE Publishers (
    Publisher_ID INT AUTO_INCREMENT PRIMARY KEY,
    Publisher_Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(255) UNIQUE
);
CREATE TABLE Reviews (
    Review_ID INT AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(13),
    Customer_ID INT,
    Rating INT CHECK (Rating >= 1 AND Rating <= 5),
    Comment TEXT,
    Review_Date DATETIME NOT NULL,
    FOREIGN KEY (ISBN) REFERENCES Books(ISBN),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

INSERT INTO Categories (Category_Name) VALUES
('Fiction'),
('Non-Fiction'),
('Science Fiction'),
('Fantasy'),
('Mystery'),
('Biography'),
('History'),
('Children'),
('Romance'),
('Self-Help');

INSERT INTO Publishers (Publisher_Name, Address, Phone, Email) VALUES
('Penguin Random House', '1745 Broadway, New York, NY 10019', '212-782-9000', 'info@penguinrandomhouse.com'),
('HarperCollins', '195 Broadway, New York, NY 10007', '212-207-7000', 'info@harpercollins.com'),
('Simon & Schuster', '1230 Avenue of the Americas, New York, NY 10020', '212-698-7000', 'info@simonandschuster.com'),
('Hachette Book Group', '1290 Avenue of the Americas, New York, NY 10104', '212-364-1100', 'info@hachettebookgroup.com'),
('Macmillan Publishers', '120 Broadway, New York, NY 10271', '646-307-5151', 'info@macmillan.com'),
('Scholastic', '557 Broadway, New York, NY 10012', '212-343-6100', 'info@scholastic.com'),
('Cengage', '200 Pier 4 Blvd, Boston, MA 02210', '800-354-9706', 'info@cengage.com'),
('Pearson', '221 River St, Hoboken, NJ 07030', '201-236-7000', 'info@pearson.com'),
('Wiley', '111 River St, Hoboken, NJ 07030', '201-748-6000', 'info@wiley.com'),
('Reilly Media', '1005 Gravenstein Hwy North, Sebastopol, CA 95472', '707-827-7000', 'info@oreilly.com');

INSERT INTO Books (ISBN, Title, Author, Publisher, Genre, Price, Category_ID, Publisher_ID) VALUES
('9780143128540', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Penguin Random House', 'Fiction', 10.99, 1, 1),
('9780062316097', 'To Kill a Mockingbird', 'Harper Lee', 'HarperCollins', 'Fiction', 7.99, 1, 2),
('9781501100335', 'The Martian', 'Andy Weir', 'Simon & Schuster', 'Science Fiction', 9.99, 3, 3),
('9780316417292', 'The Hobbit', 'J.R.R. Tolkien', 'Hachette Book Group', 'Fantasy', 8.99, 4, 4),
('9780307277671', 'The Da Vinci Code', 'Dan Brown', 'Penguin Random House', 'Mystery', 12.99, 5, 1),
('9781451648539', 'Steve Jobs', 'Walter Isaacson', 'Simon & Schuster', 'Biography', 15.99, 6, 3),
('9780307387943', 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'HarperCollins', 'History', 14.99, 7, 2),
('9780545582889', 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'Scholastic', 'Children', 6.99, 8, 6),
('9780345803481', 'Fifty Shades of Grey', 'E.L. James', 'Penguin Random House', 'Romance', 9.99, 9, 1),
('9780399184413', 'Atomic Habits', 'James Clear', 'Penguin Random House', 'Self-Help', 11.99, 10, 1);

INSERT INTO Customers (Name, Address, Email, Phone) VALUES
('John Doe', '123 Maple St, Springfield, IL 62704', 'johndoe@example.com', '217-555-1234'),
('Jane Smith', '456 Oak St, Springfield, IL 62704', 'janesmith@example.com', '217-555-5678'),
('Alice Johnson', '789 Pine St, Springfield, IL 62704', 'alicej@example.com', '217-555-9101'),
('Bob Brown', '101 Elm St, Springfield, IL 62704', 'bobbrown@example.com', '217-555-1122'),
('Charlie Davis', '202 Cedar St, Springfield, IL 62704', 'charlied@example.com', '217-555-3344'),
('Diana Evans', '303 Birch St, Springfield, IL 62704', 'dianae@example.com', '217-555-5566'),
('Ethan Harris', '404 Walnut St, Springfield, IL 62704', 'ethanh@example.com', '217-555-7788'),
('Fiona Green', '505 Chestnut St, Springfield, IL 62704', 'fionag@example.com', '217-555-9900'),
('George Hill', '606 Maple St, Springfield, IL 62704', 'georgeh@example.com', '217-555-2233'),
('Hannah Clark', '707 Oak St, Springfield, IL 62704', 'hannahc@example.com', '217-555-4455');

INSERT INTO Orders (Customer_ID, Order_Date, Status, Total_Amount) VALUES
(1, '2023-01-15 10:00:00', 'Shipped', 29.97),
(2, '2023-02-20 11:30:00', 'Processing', 15.99),
(3, '2023-03-25 12:45:00', 'Delivered', 23.98),
(4, '2023-04-30 14:00:00', 'Canceled', 0.00),
(5, '2023-05-05 15:15:00', 'Shipped', 44.97),
(6, '2023-06-10 16:30:00', 'Delivered', 18.98),
(7, '2023-07-15 17:45:00', 'Processing', 14.99),
(8, '2023-08-20 19:00:00', 'Delivered', 19.98),
(9, '2023-09-25 20:15:00', 'Shipped', 30.97),
(10, '2023-10-30 21:30:00', 'Processing', 9.99);

INSERT INTO OrderDetails (Order_ID, ISBN, Quantity, Price) VALUES
(1, '9780143128540', 1, 10.99),
(1, '9780062316097', 2, 7.99),
(2, '9781501100335', 1, 15.99),
(3, '9780316417292', 2, 8.99),
(3, '9780307277671', 1, 12.99),
(5, '9781451648539', 3, 15.99),
(6, '9780307387943', 2, 14.99),
(7, '9780545582889', 1, 6.99),
(8, '9780345803481', 2, 9.99),
(9, '9780399184413', 3, 11.99);

INSERT INTO Employees (Name, Position, Email, Phone) VALUES
('Alice Walker', 'Manager', 'alicew@example.com', '217-555-1212'),
('Bob Stone', 'Cashier', 'bobs@example.com', '217-555-2323'),
('Carol Baker', 'Stock Clerk', 'carolb@example.com', '217-555-3434'),
('David Lee', 'Customer Service', 'davidl@example.com', '217-555-4545'),
('Emma White', 'Cashier', 'emmaw@example.com', '217-555-5656'),
('Frank Green', 'Manager', 'frankg@example.com', '217-555-6767'),
('Grace Harris', 'Stock Clerk', 'graceh@example.com', '217-555-7878'),
('Henry Adams', 'Customer Service', 'henrya@example.com', '217-555-8989'),
('Isabel Young', 'Manager', 'isabely@example.com', '217-555-9090'),
('Jack Turner', 'Cashier', 'jackt@example.com', '217-555-1010');

INSERT INTO Reviews (ISBN, Customer_ID, Rating, Comment, Review_Date) VALUES
('9780143128540', 1, 5, 'An amazing book!', '2023-01-20 10:30:00'),
('9780062316097', 2, 4, 'Really enjoyed it.', '2023-02-25 11:45:00'),
('9781501100335', 3, 5, 'A fantastic read!', '2023-03-30 12:50:00'),
('9780316417292', 4, 3, 'Good, but a bit slow.', '2023-04-05 14:05:00'),
('9780307277671', 5, 4, 'Very engaging.', '2023-05-10 15:20:00'),
('9781451648539', 6, 5, 'Incredibly inspiring.', '2023-06-15 16:35:00'),
('9780307387943', 7, 4, 'Thought-provoking.', '2023-07-20 17:50:00'),
('9780545582889', 8, 5, 'Magical!', '2023-08-25 19:05:00'),
('9780345803481', 9, 3, 'Not my cup of tea.', '2023-09-30 20:20:00'),
('9780399184413', 10, 5, 'Life-changing.', '2023-10-05 21:35:00');

DESC BOOKS;
DESC CATEGORIES;
DESC ORDERS;
DESC ORDERDETAILS;
DESC EMPLOYEES;
DESC PUBLISHERS;
DESC REVIEWS;
DESC CUSTOMERS;

SELECT * FROM BOOKS;
SELECT DISTINCT Author FROM BOOKS;
SELECT * FROM CATEGORIES;
SELECT * FROM ORDERS;
SELECT * FROM ORDERDETAILS;
SELECT * FROM EMPLOYEES;
SELECT * FROM PUBLISHERS;
SELECT * FROM REVIEWS;
SELECT * FROM CUSTOMERS;

SELECT * FROM BOOKS WHERE AUTHOR LIKE 'HARPER LEE';
SELECT * FROM BOOKS WHERE AUTHOR LIKE 'J%';
SELECT TITLE, AUTHOR FROM BOOKS WHERE AUTHOR LIKE '%N';

SELECT * FROM ORDERS;

SELECT DATE_FORMAT(Order_Date, '%Y-%m') AS Month, SUM(Total_Amount) AS Total_Sales FROM Orders WHERE Status = 'Shipped' OR Status = 'Delivered'
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m') ORDER BY Month;

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;

SELECT CUSTOMERS.NAME, ORDERS.CUSTOMER_ID, ORDERS.TOTAL_AMOUNT FROM CUSTOMERS
JOIN ORDERS ON CUSTOMERS.CUSTOMER_ID= ORDERS.CUSTOMER_ID  WHERE TOTAL_AMOUNT> 20;

SELECT * FROM BOOKS;
SELECT * FROM PUBLISHERS;

SELECT BOOKS.TITLE, BOOKS.AUTHOR, REVIEWS.RATING FROM BOOKS JOIN REVIEWS
ON BOOKS.ISBN = REVIEWS.ISBN WHERE REVIEWS.RATING=5;

SELECT * FROM ORDERS WHERE STATUS = 'PROCESSING';

SELECT * FROM ORDERS WHERE TOTAL_AMOUNT>(SELECT TOTAL_AMOUNT FROM ORDERS WHERE TOTAL_AMOUNT=19.98);

SELECT * FROM CUSTOMERS;
SELECT * FROM ORDERS;

SELECT * FROM BOOKS WHERE ISBN NOT IN(SELECT ISBN FROM ORDERDETAILS);

SELECT * FROM CUSTOMERS JOIN ORDERS ON CUSTOMERS.CUSTOMER_ID = ORDERS.CUSTOMER_ID;

SELECT BOOKS.TITLE, BOOKS.AUTHOR, PUBLISHERS.* FROM BOOKS JOIN PUBLISHERS ON BOOKS.PUBLISHER = PUBLISHERS.PUBLISHER_NAME;

/*CREATE VIEW ORDERS_CUSTOMERS AS SELECT * FROM CUSTOMERS JOIN ORDERS ON CUSTOMERS.CUSTOMER_ID = ORDERS.CUSTOMER_ID;*/

CREATE VIEW ORDERS_CUSTOMERS AS SELECT o.Order_ID, o.Customer_ID, c.Name AS Customer_Name, c.Address AS Customer_Address, c.Email AS Customer_Email, c.Phone AS Customer_Phone, o.Order_Date, 
o.Status, o.Total_Amount FROM Orders o JOIN Customers c ON o.Customer_ID = c.Customer_ID;

SELECT * FROM ORDERS_CUSTOMERS;
SELECT * FROM ORDERS WHERE STATUS = 'PROCESSING';
SELECT * FROM ORDERS WHERE STATUS = 'Canceled';