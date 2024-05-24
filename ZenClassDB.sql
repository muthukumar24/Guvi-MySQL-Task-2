---- Batch Table ------
---- Create ----
CREATE TABLE Batch_Data (
    Batch_ID INT AUTO_INCREMENT PRIMARY KEY,
    Batch_Name VARCHAR(100)
);
---- Insert ----
INSERT INTO Batch_Data (Batch_Name) VALUES
('Batch A'),
('Batch B'),
('Batch C');
---- Fetch ----
SELECT * FROM Batch_Data;

-- Users Table
---- Create ----
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(100) NOT NULL,
    Password VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    FullName VARCHAR(100),
    Batch INT,
    FOREIGN KEY (Batch) REFERENCES Batch_Data(Batch_ID)
);
---- Insert ----
INSERT INTO Users (UserName, Password, Email, FullName, Batch) VALUES
('john_doe', 'password123', 'john.doe@example.com', 'John Doe', 1),
('jane_smith', 'password456', 'jane.smith@example.com', 'Jane Smith', 2),
('mike_jones', 'password789', 'mike.jones@example.com', 'Mike Jones', 1);
---- Fetch ----
SELECT * FROM Users;

-- Mentors TABLE
---- Create ----
CREATE TABLE Mentors (
    Mentor_ID INT AUTO_INCREMENT PRIMARY KEY,
    Mentor_Name VARCHAR(100),
    Mentor_Email VARCHAR(100),
    FOREIGN KEY (Mentor_ID) REFERENCES Users(UserID)
);
---- Insert ----
INSERT INTO Mentors (Mentor_Name, Mentor_Email) VALUES
('Alice Johnson', 'alice.johnson@example.com'),
('Bob Smith', 'bob.smith@example.com'),
('Charlie Brown', 'charlie.brown@example.com');
---- Fetch ----
SELECT * FROM Mentors;

-- Sesssion Topics TABLE
---- Create ----
CREATE TABLE Session_Topics (
    Topic_ID INT AUTO_INCREMENT PRIMARY KEY,
    SessionLink VARCHAR(500),
    SessionTopic VARCHAR(200),
    Mentor_ID INT,
    FOREIGN KEY (Mentor_ID) REFERENCES Mentors(Mentor_ID)
);
---- Insert ----
INSERT INTO Session_Topics (SessionLink, SessionTopic, Mentor_ID) VALUES
('link1', 'Introduction to Databases', 1),
('link2', 'Advanced SQL Queries', 2),
('link3', 'Database Optimization Techniques', 1);
---- Fetch ----
SELECT * FROM Session_Topics;

-- Codekata TABLE
---- Create ----
CREATE TABLE CodeKata (
    Code_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT,
    Num_of_Problems INT,
    Problem_Status VARCHAR(100),
    FOREIGN KEY (User_ID) REFERENCES Users(UserID)
);
---- Insert ----
INSERT INTO CodeKata (User_ID, Num_of_Problems, Problem_Status) VALUES
(1, 10, 'Completed'),
(2, 15, 'In Progress'),
(3, 8, 'Not Started');
---- Fetch ----
SELECT * FROM CodeKata;

-- Task TABLE
---- Create ----
CREATE TABLE Tasks (
    Task_ID INT AUTO_INCREMENT PRIMARY KEY,
    Topic_ID INT,
    Task VARCHAR(1000),
    Batch_ID INT,
    FOREIGN KEY (Topic_ID) REFERENCES Session_Topics(Topic_ID),
    FOREIGN KEY (Batch_ID) REFERENCES Batch_Data(Batch_ID)
);
---- Insert ----
INSERT INTO Tasks (Topic_ID, Task, Batch_ID) VALUES
(1, 'Complete the database schema design', 1),
(2, 'Write advanced SQL queries based on provided data', 2),
(3, 'Optimize the existing database for better performance', 1);
---- Fetch ----
SELECT * FROM Tasks;

-- Company Drives
---- Create ----
CREATE TABLE Company_Drives (
    Drive_ID INT AUTO_INCREMENT PRIMARY KEY,
    User_ID INT,
    Drive_Date DATETIME,
    Company VARCHAR(100),
    FOREIGN KEY (User_ID) REFERENCES Users(UserID)
);
---- Insert ----
INSERT INTO Company_Drives (User_ID, Drive_Date, Company) VALUES
(1, '2024-06-15 10:00:00', 'Google'),
(2, '2024-06-20 09:30:00', 'Microsoft'),
(3, '2024-07-01 14:00:00', 'Amazon');
---- Fetch ----
SELECT * FROM Company_Drives;

-- Attendance Table
---- Create ----
CREATE TABLE Attendance (
    Attendance_ID INT AUTO_INCREMENT PRIMARY KEY,
    Student_ID INT,
    Topic_ID INT,
    Attended VARCHAR(50),
    FOREIGN KEY (Student_ID) REFERENCES Users(UserID),
    FOREIGN KEY (Topic_ID) REFERENCES Session_Topics(Topic_ID)
);
---- Insert ----
INSERT INTO Attendance (Student_ID, Topic_ID, Attended) VALUES
(1, 1, 'Yes'),
(2, 2, 'Yes'),
(3, 3, 'No');
---- Fetch ----
SELECT * FROM Attendance;