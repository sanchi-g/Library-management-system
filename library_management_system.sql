CREATE DATABASE library_db;
USE library_db;

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Genre VARCHAR(100),
    Price DECIMAL(5,2),
    Available BOOLEAN
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(255),
    Phone VARCHAR(20),
    Email VARCHAR(255)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    Position VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE IssuedBooks (
    IssueID INT PRIMARY KEY,
    BookID INT,
    CustomerID INT,
    EmployeeID INT,
    IssueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Employees VALUES
(201, 'Karan Malhotra', 'Librarian', '9901122334'),
(202, 'Meena Gupta', 'Assistant', '8809988776'),
(203, 'Rajeev Saxena', 'Manager', '9912233445'),
(204, 'Radhika Ghosh', 'Clerk', '9922344556'),
(205, 'Shivani Taneja', 'Technician', '9932455667'),
(206, 'Ajay Ahuja', 'Helper', '9942566778'),
(207, 'Tanvi Bansal', 'Assistant Librarian', '9952677889'),
(208, 'Saurabh Khanna', 'Inventory Officer', '9962788990'),
(209, 'Snehal Pawar', 'System Admin', '9972899001'),
(210, 'Akshay Kulkarni', 'Database Admin', '9982900112'),
(211, 'Mansi Patel', 'Support Staff', '9993011223'),
(212, 'Aditya Rana', 'Cleaner', '9003122334'),
(213, 'Priya Das', 'Receptionist', '9013233445'),
(214, 'Rohit Kumar', 'Security', '9023344556'),
(215, 'Ananya Roy', 'Maintenance', '9033455667');

INSERT INTO Customers VALUES
(101, 'Riya Sharma', '9876543210', 'riya@example.com'),
(102, 'Aman Verma', '9812345678', 'aman@example.com'),
(103, 'Divya Singh', '9823456789', 'divya@example.com'),
(104, 'Neha Mehta', '9811122334', 'neha@example.com'),
(105, 'Rahul Jain', '9833445566', 'rahul@example.com'),
(106, 'Sneha Kapoor', '9844556677', 'sneha@example.com'),
(107, 'Varun Bhatia', '9855667788', 'varun@example.com'),
(108, 'Anjali Chauhan', '9866778899', 'anjali@example.com'),
(109, 'Rakesh Kumar', '9877889900', 'rakesh@example.com'),
(110, 'Mehul Desai', '9888990011', 'mehul@example.com'),
(111, 'Kriti Deshmukh', '9899001122', 'kriti@example.com'),
(112, 'Nikhil Reddy', '9812233445', 'nikhil@example.com'),
(113, 'Ishita Bhardwaj', '9822344556', 'ishita@example.com'),
(114, 'Deepak Soni', '9832455667', 'deepak@example.com'),
(115, 'Preeti Yadav', '9842566778', 'preeti@example.com');

INSERT INTO Books VALUES
(1, 'The Alchemist', 'Paulo Coelho', 'Fiction', 299.00, TRUE),
(2, 'Clean Code', 'Robert C. Martin', 'Programming', 550.00, FALSE),
(3, 'Sapiens', 'Yuval Noah Harari', 'History', 450.00, FALSE),
(4, 'Atomic Habits', 'James Clear', 'Self-help', 320.00, TRUE),
(5, 'Intro to Algorithms', 'CLRS', 'CS', 799.00, TRUE),
(6, 'Python Crash Course', 'Eric Matthes', 'Programming', 499.00, TRUE),
(7, 'The Power of Habit', 'Charles Duhigg', 'Self-help', 350.00, TRUE),
(8, '1984', 'George Orwell', 'Fiction', 280.00, TRUE),
(9, 'Deep Work', 'Cal Newport', 'Productivity', 390.00, TRUE),
(10, 'Thinking Fast and Slow', 'Daniel Kahneman', 'Psychology', 460.00, FALSE),
(11, 'Design Patterns', 'Erich Gamma', 'Software Engineering', 600.00, TRUE),
(12, 'Zero to One', 'Peter Thiel', 'Startup', 420.00, TRUE),
(13, 'Mindset', 'Carol Dweck', 'Psychology', 310.00, TRUE),
(14, 'Start With Why', 'Simon Sinek', 'Leadership', 370.00, TRUE),
(15, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 'Finance', 330.00, TRUE);

show tables;
select * from books;
select * from customers;
select * from employees;

INSERT INTO IssuedBooks VALUES
(301, 2, 101, 201, '2024-05-01', '2024-05-10'),
(302, 3, 102, 202, '2024-06-01', '2024-06-15'),
(303, 2, 103, 201, '2024-06-05', '2024-06-12');

SELECT * FROM issuedbooks;

#sample queries
# 1. To Show all available books
SELECT * FROM Books WHERE Available = TRUE;

# 2. to show details of books currently issued
SELECT b.Title, c.Name AS Customer, i.IssueDate, i.ReturnDate
FROM IssuedBooks as i
left JOIN Books as b ON i.BookID = b.BookID
left JOIN Customers as c ON i.CustomerID = c.CustomerID;

# 3. to List all books with their availability status
SELECT Title, Author, Available FROM Books;

# 4.To Show how many books each customer has issued
SELECT c.Name, COUNT(i.IssueID) AS TotalIssued
FROM Customers c
LEFT JOIN IssuedBooks i ON c.CustomerID = i.CustomerID
GROUP BY c.Name;
