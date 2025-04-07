CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(100),
    Publisher VARCHAR(100),
    ISBN VARCHAR(20) UNIQUE,
    Genre VARCHAR(50),
    Language VARCHAR(30),
    TotalCopies INT NOT NULL CHECK (TotalCopies >= 0),
    AvailableCopies INT NOT NULL CHECK (AvailableCopies >= 0),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

---Members table:
CREATE TABLE Members (
    MemberID INT NOT NULL AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    PhoneNumber VARCHAR(20),
    MembershipDate DATE DEFAULT (CURRENT_DATE),
    AddressLine1 VARCHAR(150),
    AddressLine2 VARCHAR(150),
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode VARCHAR(10),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (MemberID)
);
---Transactions table:
CREATE TABLE Transactions (
    TransactionID INT NOT NULL AUTO_INCREMENT,
    BookID INT NOT NULL,
    MemberID INT NOT NULL,
    IssueDate DATE NOT NULL,
    DueDate DATE NOT NULL,
   


 ReturnDate DATE,
    Fine DECIMAL(5,2) DEFAULT 0.00,
    Status ENUM('Issued', 'Returned', 'Overdue') DEFAULT 'Issued',
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE      CURRENT_TIMESTAMP,
    PRIMARY KEY (TransactionID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE
);
---BookOrders table:

    CREATE TABLE BookOrders (
    OrderID INT NOT NULL AUTO_INCREMENT,
    MemberID INT NOT NULL,
    OrderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    ExpectedReturnDate DATE,
    ActualReturnDate DATE,
    Status ENUM('Issued', 'Returned', 'Overdue', 'Cancelled') DEFAULT 'Issued',
    PaymentMethod ENUM('Cash', 'Card', 'UPI', 'Wallet') DEFAULT 'Cash',
    FineAmount DECIMAL(10,2) DEFAULT 0.00,
    Notes TEXT,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID) ON DELETE CASCADE,
    CHECK (FineAmount >= 0)
);
---BookOrderItems TABLE:
 CREATE TABLE BookOrderItems (
    OrderItemID INT NOT NULL AUTO_INCREMENT,
    OrderID INT NOT NULL,
    



BookID INT NOT NULL,
    Quantity INT DEFAULT 1,
    RentalPrice DECIMAL(10,2) NOT NULL,
    TotalPrice DECIMAL(10,2) GENERATED ALWAYS AS (Quantity * RentalPrice) STORED,
    SpecialNotes TEXT,
    IsReturned BOOLEAN DEFAULT FALSE,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    UpdatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (OrderItemID),
    FOREIGN KEY (OrderID) REFERENCES BookOrders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
    CHECK (Quantity > 0),
    CHECK (RentalPrice >= 0)
);
