SELECT r.RobberId, r.Nickname, r.Age, s.Description
FROM Robbers r
JOIN HasSkills hs ON r.RobberId = hs.RobberId
JOIN Skills s ON hs.SkillId = s.SkillId
WHERE r.Age >= 35;
