SELECT
  (SELECT AVG(rs.TotalShare::NUMERIC / rr.NumRobbers)
   FROM (
     SELECT BankName, City, Date, SUM(Share) AS TotalShare
     FROM Accomplices
     GROUP BY BankName, City, Date
   ) rs
   JOIN (
     SELECT BankName, City, Date, COUNT(*) AS NumRobbers
     FROM Accomplices
     GROUP BY BankName, City, Date
   ) rr
   ON rs.BankName = rr.BankName AND rs.City = rr.City AND rs.Date = rr.Date
   WHERE rs.City = 'Chicago'
  ) AS ChicagoAverage,

  (SELECT MAX(AvgShare)
   FROM (
     SELECT rs.City, AVG(rs.TotalShare::NUMERIC / rr.NumRobbers) AS AvgShare
     FROM (
       SELECT BankName, City, Date, SUM(Share) AS TotalShare
       FROM Accomplices
       GROUP BY BankName, City, Date
     ) rs
     JOIN (
       SELECT BankName, City, Date, COUNT(*) AS NumRobbers
       FROM Accomplices
       GROUP BY BankName, City, Date
     ) rr
     ON rs.BankName = rr.BankName AND rs.City = rr.City AND rs.Date = rr.Date
     WHERE rs.City <> 'Chicago'
     GROUP BY rs.City
   ) AS OtherCities
  ) AS MaxOtherAverage;
