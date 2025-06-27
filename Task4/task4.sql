-- View all customers
SELECT * FROM Customer;

-- List all invoices
SELECT * FROM Invoice;

-- Find all tracks in the 'Rock' genre
SELECT Track.Name 
FROM Track
JOIN Genre ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = 'Rock';

-- Customer who spent the most
SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName, SUM(Invoice.Total) AS TotalSpent
FROM Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId
ORDER BY TotalSpent DESC
LIMIT 1;

-- Most popular genre by number of tracks sold
SELECT Genre.Name, COUNT(InvoiceLine.InvoiceLineId) AS TracksSold
FROM InvoiceLine
JOIN Track ON InvoiceLine.TrackId = Track.TrackId
JOIN Genre ON Track.GenreId = Genre.GenreId
GROUP BY Genre.Name
ORDER BY TracksSold DESC;

-- Average invoice amount
SELECT AVG(Total) AS AverageInvoice
FROM Invoice;

-- Total sales per country
SELECT BillingCountry, SUM(Total) AS TotalSales
FROM Invoice
GROUP BY BillingCountry
ORDER BY TotalSales DESC;

-- Artists with the most albums
SELECT Artist.Name, COUNT(Album.AlbumId) AS TotalAlbums
FROM Artist
JOIN Album ON Artist.ArtistId = Album.ArtistId
GROUP BY Artist.Name
ORDER BY TotalAlbums DESC;

-- Employees and the customers they support
SELECT Employee.FirstName || ' ' || Employee.LastName AS EmployeeName,
       Customer.FirstName || ' ' || Customer.LastName AS CustomerName
FROM Customer
JOIN Employee ON Customer.SupportRepId = Employee.EmployeeId
ORDER BY EmployeeName;

-- Find the most sold track
SELECT Name, TrackId
FROM Track
WHERE TrackId = (
    SELECT TrackId
    FROM InvoiceLine
    GROUP BY TrackId
    ORDER BY COUNT(*) DESC
    LIMIT 1
);

-- Invoices per year
SELECT strftime('%Y', InvoiceDate) AS Year, COUNT(InvoiceId) AS TotalInvoices
FROM Invoice
GROUP BY Year
ORDER BY Year;

-- Create a view for customer spending
CREATE VIEW CustomerSpending AS
SELECT Customer.CustomerId, Customer.FirstName, Customer.LastName, SUM(Invoice.Total) AS TotalSpent
FROM Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId;

-- Query the view
SELECT * FROM CustomerSpending
ORDER BY TotalSpent DESC;

-- Top 5 highest paying customers with country
SELECT Customer.FirstName || ' ' || Customer.LastName AS CustomerName,
       Customer.Country,
       SUM(Invoice.Total) AS TotalSpent
FROM Customer
JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId
GROUP BY Customer.CustomerId
ORDER BY TotalSpent DESC
LIMIT 5;

