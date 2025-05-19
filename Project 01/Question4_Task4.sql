SELECT DISTINCT ha.BankName, ha.City
FROM Robbers r
JOIN HasAccounts ha ON r.RobberId = ha.RobberId
WHERE r.Nickname = 'Al Capone';
