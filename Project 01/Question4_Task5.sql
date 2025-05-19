SELECT a.RobberId, r.Nickname, SUM(a.Share) AS TotalEarnings
FROM Accomplices a
JOIN Robbers r ON a.RobberId = r.RobberId
GROUP BY a.RobberId, r.Nickname
HAVING SUM(a.Share) >= 50000
ORDER BY TotalEarnings DESC;
