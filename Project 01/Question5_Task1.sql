SELECT a.RobberId, r.Nickname, SUM(a.Share) AS TotalEarnings
FROM Accomplices a
JOIN Robbers r ON a.RobberId = r.RobberId
WHERE (a.BankName, a.City, a.Date) IN (
  SELECT BankName, City, Date
  FROM Robberies
  WHERE Amount = (
    SELECT MAX(Amount)
    FROM Robberies
  )
)
GROUP BY a.RobberId, r.Nickname
ORDER BY TotalEarnings DESC;
