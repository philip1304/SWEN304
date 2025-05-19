SELECT Security,
       COUNT(*) AS NumRobberies,
       AVG(Amount)::NUMERIC AS AvgAmount
FROM Robberies r
JOIN Banks b
  ON r.BankName = b.BankName AND r.City = b.City
GROUP BY Security;
