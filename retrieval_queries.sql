---1. List All Books by a Specific Genre

SELECT * FROM Books
WHERE Genre = 'Fiction';

---2. Count of Books by Each Genre

SELECT Genre, COUNT(*) AS TotalBooks
FROM Books
GROUP BY Genre;


---3. List Books of a Genre That Are Currently Available

SELECT *
FROM Books
WHERE Genre = 'Self-help' AND AvailableCopies > 0;



---4. Get All Issued Books by Genre

SELECT b.Title, b.Genre, t.Status
FROM Transactions t
JOIN Books b ON t.BookID = b.BookID
WHERE t.Status = 'Issued' AND b.Genre = 'Business';


 
 
---5. Genres With Low Availability (e.g., < 3 Copies Left)

SELECT Genre, Title, AvailableCopies
FROM Books
WHERE AvailableCopies < 3
ORDER BY AvailableCopies ASC;

---6. Top 3 Genres by Total Number of Books

SELECT Genre, SUM(TotalCopies) AS TotalBooks
FROM Books
GROUP BY Genre
ORDER BY TotalBooks DESC
LIMIT 3;
