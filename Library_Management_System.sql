CREATE DATABASE Library;
USE Library;

# Create branch table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);
USE Library;


# Create Employee table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

# Create Books table
CREATE TABLE Books (
    ISBN VARCHAR(20) PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

# Create Customer table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

# Create IssueStatus table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book VARCHAR(20),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

# Create ReturnStatus table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 VARCHAR(20),
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

SHOW TABLES;

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(01, 1011, 'Ernakulam', '9895999901'),
(02, 1012, 'Trivandram', '9895999902'),
(03, 1013, 'Thrissur', '9895999903'),
(04, 1014, 'Palakkad', '9895999904'),
(05, 1015, 'Kozhikode', '9895999905'),
(06, 1016, 'Kollam', '9895999906'),
(07, 1017, 'Alappuzha', '9895999907'),
(08, 1018, 'Kottayam', '9895999908'),
(09, 1019, 'Pathanamthitta', '9895999909'),
(10, 1110, 'Idukki', '9895999911');

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(1011, 'Joseph Philip', 'Manager', 50000.00, 01),
(1012, 'John Chandy', 'Manager', 60000.00, 02),
(1013, 'Milen Michael', 'Manger', 50000.00, 03),
(1014, 'Jolly John', 'Manager', 53000.00, 04),
(1015, 'Wilson Joseph', 'Manager', 52000.00, 05),
(1017, 'Jisna John', 'Manager', 50000.00, 07),
(1016, 'Fabi Francis', 'Manager', 50000.00, 06),
(1018, 'Fency Francis', 'Manager', 50000.00, 08),
(1019, 'Tera Francis', 'Manager', 50000.00, 09),
(1110, 'Nithin Francis', 'Manager', 50000.00, 09),
(2441, 'Daniel Jecob', 'Librarian', 36000.00, 01),
(2442, 'Jessica John', 'Librarian', 33000.00, 02),
(2443, 'Christy Thomas', 'Librarian', 31000.00, 03),
(2444, 'Lissy Jackson', 'Librarian', 37000.00, 04),
(2445, 'Tomy Thomas', 'Librarian', 37000.00, 05),
(2446, 'Jomy Peter', 'Librarian', 37000.00, 06),
(2447, 'Sreenath Sreekalam', 'Librarian', 37000.00, 07),
(2448, 'Subin Suresh', 'Librarian', 37000.00, 08),
(2449, 'Manu Manoj', 'Librarian', 37000.00, 09),
(2500, 'Venu Jose', 'Librarian', 37000.00, 10);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
('978-81-264-2776-2', 'Randamoozham', 'Fiction', 25.00, 'yes', 'M. T. Vasudevan Nair', 'DC Books'),
('978-81-7201-828-1', 'Khasakkinte Itihasam', 'Fiction', 22.00, 'yes', 'O. V. Vijayan', 'DC Books'),
('978-81-264-0119-9', 'Mayyazhippuzhayude Theerangalil', 'Historical Fiction', 20.00, 'no', 'M. Mukundan', 'DC Books'),
('978-81-7958-046-7', 'Aarachar', 'Historical Fiction', 30.00, 'yes', 'K. R. Meera', 'DC Books'),
('978-81-264-1527-7', 'Oru Sankeerthanam Pole', 'Fiction', 18.00, 'yes', 'Perumbadavam Sreedharan', 'DC Books'),
('978-81-264-2367-8', 'Yakshi', 'Psychological Fiction', 16.00, 'yes', 'Malayattoor Ramakrishnan', 'DC Books'),
('978-81-264-2476-7', 'Manju', 'Fiction', 15.00, 'yes', 'M. T. Vasudevan Nair', 'DC Books'),
('978-81-264-2137-7', 'Balyakalasakhi', 'Romance', 18.00, 'yes', 'Vaikom Muhammad Basheer', 'DC Books'),
('978-81-264-2006-7', 'Pathummayude Aadu', 'Autobiographical Fiction', 17.00, 'yes', 'Vaikom Muhammad Basheer', 'DC Books'),
('978-81-264-2626-7', 'Chemmeen', 'Fiction', 19.00, 'no', 'Thakazhi Sivasankara Pillai', 'DC Books');

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(3001, 'Rani Jacob', 'Aluva Ekm', '2020-01-15'),
(3002, 'Anil Anto', 'Paravur Ekm', '2023-11-20'),
(3003, 'Varun Joy', 'Paravur Ekm', '2024-03-05'),
(3004, 'Dany Wilson', 'Edappally Ekm', '2018-02-10'),
(3005, 'Thanu Thambi', 'Aluva Ekm', '2023-12-30'),
(3006, 'Clint Johnson', 'Mala Thr', '2024-04-01'),
(3007, 'Hilton Johnson', 'Mala Thr', '2024-01-20'),
(3008, 'Vipin Jacob', 'Cherthala Alp', '2023-10-25'),
(3009, 'Jackson Jose', 'Paravur Ekm', '2022-05-01'),
(3100, 'Sebi sEBU', 'Pravur Ekm', '2022-03-15');

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(9001, 3001, 'Randamoozham', '2024-02-01', '978-81-264-2776-2'),
(9002, 3002, 'Khasakkinte Itihasam', '2024-01-20', '978-81-7201-828-1'),
(9003, 3003, 'Mayyazhippuzhayude Theerangalil', '2024-03-10', '978-81-264-0119-9'),
(9004, 3004, 'Aarachar', '2024-02-15', '978-81-7958-046-7'),
(9005, 3005, 'Oru Sankeerthanam Pole', '2024-02-28', '978-81-264-1527-7'),
(9006, 3006, 'Yakshi', '2024-04-05', '978-81-264-2367-8'),
(9007, 3007, 'Manju', '2024-03-01', '978-81-264-2476-7'),
(9008, 3008, 'Balyakalasakhi', '2024-01-25', '978-81-264-2137-7'),
(9009, 3009, 'Pathummayude Aadu', '2024-05-05', '978-81-264-2006-7'),
(9010, 3100, 'Chemmeen', '2024-03-20', '978-81-264-2626-7');

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(8001, 3001, 'Randamoozham', '2024-02-20', '978-81-264-2776-2'),
(8002, 3002, 'Khasakkinte Itihasam', '2024-02-25', '978-81-7201-828-1'),
(8003, 3003, 'Mayyazhippuzhayude Theerangalil', '2024-03-15', '978-81-264-0119-9'),
(8004, 3004, 'Aarachar', '2024-03-10', '978-81-7958-046-7'),
(8005, 3005, 'Oru Sankeerthanam Pole', '2024-03-15', '978-81-264-1527-7'),
(8006, 3006, 'Yakshi', '2024-04-10', '978-81-264-2367-8'),
(8007, 3007, 'Manju', '2024-03-10', '978-81-264-2476-7'),
(8008, 3008, 'Balyakalasakhi', '2024-02-28', '978-81-264-2137-7'),
(8009, 3009, 'Pathummayude Aadu', '2024-05-10', '978-81-264-2006-7'),
(8010, 3100, 'Chemmeen', '2024-03-30', '978-81-264-2626-7');

SELECT * FROM Branch;
SELECT * FROM Employee;
SELECT * FROM Books;
SELECT * FROM Customer;
SELECT * FROM IssueStatus;
SELECT * FROM ReturnStatus;

SELECT Book_title, Category, Rental_Price
FROM Books
WHERE Status = 'yes';	

SELECT Emp_name, Salary
FROM Employee
ORDER BY Salary DESC;

SELECT Books.Book_title, Customer.Customer_name
FROM IssueStatus
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

SELECT Category, COUNT(*) AS Total_Books
FROM Books
GROUP BY Category;

SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

SELECT Customer.Customer_name
FROM Customer
LEFT JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
WHERE IssueStatus.Issued_cust IS NULL AND Customer.Reg_date < '2022-01-01';

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(3012, 'Vinil Paul', 'Aluva Ekm', '2018-01-15');

SELECT Customer.Customer_name
FROM Customer
LEFT JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
WHERE IssueStatus.Issued_cust IS NULL AND Customer.Reg_date < '2022-01-01';

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(8001, 3012, 'Randamoozham', '2023-06-05', '978-81-264-2776-2');

SELECT DISTINCT Customer.Customer_name
FROM Customer
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
WHERE IssueStatus.Issue_date >= '2023-06-01' AND IssueStatus.Issue_date < '2023-07-01';

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) 
VALUES ('978-1-1234-5678-9', 'Malayalam History Book Title', 'History', 20.00, 'yes', 'Author Name', 'Publisher Name');

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) 
VALUES ('978-1-1234-5678-9', 'Malayaliyude Ormakal', 'History', 20.00, 'yes', 'Jacob', 'DC Books');

SELECT Book_title
FROM Books
WHERE Category = 'History';

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(2422, 'Ancy Jocob', 'Admin', 35000.00, 09),
(2423, 'Mani Paul', 'Jr. Librarian', 20000.00, 09);

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(2424, 'Femin George', 'Jr. Librarian', 20000.00, 09);

SELECT Branch_no, COUNT(*) AS Total_Employees
FROM Employee
GROUP BY Branch_no
HAVING COUNT(*) > 5;

SELECT Employee.Emp_name, Branch.Branch_address
FROM Employee
JOIN Branch ON Employee.Branch_no = Branch.Branch_no
WHERE Employee.Position = 'Manager';

SELECT DISTINCT Customer.Customer_name
FROM Customer
JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
WHERE Books.Rental_Price > 25;



















