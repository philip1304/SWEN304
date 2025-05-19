SELECT RobberId, Nickname, NoYears
FROM Robbers
WHERE (Age - NoYears) > (Age / 2);
