SELECT r.RobberId, r.Nickname, s.Description
FROM HasSkills hs
JOIN Robbers r ON hs.RobberId = r.RobberId
JOIN Skills s ON hs.SkillId = s.SkillId
WHERE hs.Preference = (
  SELECT MIN(hs2.Preference)
  FROM HasSkills hs2
  WHERE hs2.RobberId = hs.RobberId
)
AND hs.RobberId IN (
  SELECT RobberId
  FROM HasSkills
  GROUP BY RobberId
  HAVING COUNT(*) >= 2
);
