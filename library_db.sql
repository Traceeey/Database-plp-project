
-- Drop tables in reverse order of dependencies (safe reset)
DROP TABLE IF EXISTS Borrowings;
DROP TABLE IF EXISTS BookAuthors;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Members;


-- Table: Members
CREATE TABLE Members (
  MemberID INT AUTO_INCREMENT PRIMARY KEY,
  FullName VARCHAR(100) NOT NULL,
  Email VARCHAR(100) UNIQUE NOT NULL,
  JoinDate DATE NOT NULL
);


-- Table: Authors
CREATE TABLE Authors (
  AuthorID INT AUTO_INCREMENT PRIMARY KEY,
  FullName VARCHAR(100) NOT NULL,
  Bio TEXT
);


-- Table: Books
CREATE TABLE Books (
  BookID INT AUTO_INCREMENT PRIMARY KEY,
  Title VARCHAR(150) NOT NULL,
  ISBN VARCHAR(20) UNIQUE NOT NULL,
  PublishedYear YEAR,
  Genre VARCHAR(50)
);


-- Table: BookAuthors (M:M)
CREATE TABLE BookAuthors (
  BookID INT,
  AuthorID INT,
  PRIMARY KEY (BookID, AuthorID),
  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);


-- Table: Borrowings
CREATE TABLE Borrowings (
  BorrowingID INT AUTO_INCREMENT PRIMARY KEY,
  MemberID INT NOT NULL,
  BookID INT NOT NULL,
  BorrowDate DATE NOT NULL,
  ReturnDate DATE,
  FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
  FOREIGN KEY (BookID) REFERENCES Books(BookID)
);
