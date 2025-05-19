SELECT r.RobberId, r.Nickname
FROM Robbers r
WHERE NOT EXISTS (
  SELECT 1
  FROM HasAccounts ha
  JOIN Accomplices a ON ha.RobberId = a.RobberId
                    AND ha.BankName = a.BankName
                    AND ha.City = a.City
  WHERE ha.RobberId = r.RobberId
);
