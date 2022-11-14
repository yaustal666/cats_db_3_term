SELECT (LastName  || " " || FirstName) SellerFullName,
       SUM(QuantitySold * SellingPrice) TotalRevenue,
       COUNT(DISTINCT SaleID) CountOfSales
FROM
Sellers
INNER JOIN Sales ON Sales.SellerID = Sellers.ID
INNER JOIN SalesItems ON Sales.ID = SalesItems.SaleID
INNER JOIN Products ON Products.ID = SalesItems.ProductID
GROUP BY SellerFullName
ORDER BY TotalRevenue DESC
LIMIT 10;