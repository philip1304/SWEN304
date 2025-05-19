SELECT s.Description, r.RobberId, r.Nickname
FROM HasSkills hs
JOIN Skills s ON hs.SkillId = s.SkillId
JOIN Robbers r ON hs.RobberId = r.RobberId
ORDER BY s.Description;
