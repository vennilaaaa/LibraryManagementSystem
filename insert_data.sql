USE advancedlibrary;
INSERT INTO Books (Title, Author, Publisher, ISBN, Genre, Language, TotalCopies, AvailableCopies)
VALUES
('The Alchemist', 'Paulo Coelho', 'HarperCollins', '9780061122415', 'Fiction', 'English', 10, 8),
('Atomic Habits', 'James Clear', 'Penguin', '9780735211292', 'Self-help', 'English', 15, 12),
('Wings of Fire', 'A.P.J. Abdul Kalam', 'Universities Press', '9788173711466', 'Autobiography', 'English', 20, 17),
('Zero to One', 'Peter Thiel', 'Crown Business', '9780804139298', 'Business', 'English', 8, 6),
('Think and Grow Rich', 'Napoleon Hill', 'The Ralston Society', '9781585424337', 'Motivation', 'English', 12, 10);
INSERT INTO Members (FullName, Email, PhoneNumber, AddressLine1, City, State, PostalCode)
VALUES
('Anjali Sharma', 'anjali@example.com', '9876543210', '12 MG Road', 'Delhi', 'Delhi', '110001'),
('Rahul Verma', 'rahulv@example.com', '9123456780', '23 Park Avenue', 'Mumbai', 'Maharashtra', '400001'),
('Priya Kumar', 'priyak@example.com', '9988776655', '45 Gandhi Street', 'Chennai', 'Tamil Nadu', '600001'),
('Karan Mehta', 'karanm@example.com', '9345678912', '67 Ring Road', 'Bangalore', 'Karnataka', '560001'),
('Sneha Iyer', 'sneha@example.com', '9871234567', '89 Lotus Enclave', 'Hyderabad', 'Telangana', '500001');
INSERT INTO Transactions (BookID, MemberID, IssueDate, DueDate, ReturnDate, Fine, Status)
VALUES
(1, 1, '2025-04-01', '2025-04-10', NULL, 0.00, 'Issued'),
(2, 2, '2025-03-25', '2025-04-04', '2025-04-03', 0.00, 'Returned'),
(3, 3, '2025-03-28', '2025-04-07', NULL, 0.00, 'Overdue'),
(4, 4, '2025-04-02', '2025-04-12', NULL, 0.00, 'Issued'),
(5, 5, '2025-03-30', '2025-04-08', '2025-04-08', 0.00, 'Returned');
INSERT INTO BookOrders (MemberID, OrderDate, ExpectedReturnDate, ActualReturnDate, Status, PaymentMethod, FineAmount, Notes)
VALUES
(1, '2025-04-01 10:00:00', '2025-04-10', NULL, 'Issued', 'Card', 0.00, 'Urgent delivery requested'),
(2, '2025-03-25 14:30:00', '2025-04-04', '2025-04-03', 'Returned', 'UPI', 0.00, ''),
(3, '2025-03-28 09:15:00', '2025-04-07', NULL, 'Overdue', 'Cash', 20.00, 'Returned late'),
(4, '2025-04-02 11:45:00', '2025-04-12', NULL, 'Issued', 'Card', 0.00, 'First-time borrower'),
(5, '2025-03-30 13:00:00', '2025-04-08', '2025-04-08', 'Returned', 'Wallet', 0.00, '');
INSERT INTO BookOrderItems (OrderID, BookID, Quantity, RentalPrice, SpecialNotes, IsReturned)
VALUES
(1, 1, 1, 50.00, 'Hardcover preferred', FALSE),
(2, 2, 2, 40.00, '', TRUE),
(3, 3, 1, 30.00, 'Please wrap', FALSE),
(4, 4, 1, 45.00, '', FALSE),
(5, 5, 1, 35.00, '', TRUE);

