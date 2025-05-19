SELECT BankName, City
FROM Banks
WHERE NOT EXISTS (
  SELECT 1
  FROM Robberies
  WHERE Robberies.BankName = Banks.BankName
    AND Robberies.City = Banks.City
);

