-- SELECT d1.name AS n1, d2.name AS n2 
-- FROM donors d1, donors d2
-- WHERE d1.cause = d2.cause and d1.name < d2.name
-- GROUP BY n1, n2
-- HAVING COUNT(DISTINCT d1.cause) = COUNT(DISTINCT d2.cause)
-- ORDER BY n1, n2


SELECT d1.name AS n1, d2.name AS n2
FROM (SELECT DISTINCT name FROM donors) d1, (SELECT DISTINCT name FROM donors) d2
WHERE
  -- Ensure d1 and d2 are different names
  d1.name < d2.name
  -- Ensure they have the same causes
  AND NOT EXISTS (
    SELECT cause
    FROM donors
    WHERE name = d1.name
    EXCEPT
    SELECT cause
    FROM donors
    WHERE name = d2.name
  )
 -- Ensure they have the same causes
  AND NOT EXISTS (
    SELECT cause
    FROM donors
    WHERE name = d2.name
    EXCEPT
    SELECT cause
    FROM donors
    WHERE name = d1.name
  )
ORDER BY 
  n1, n2;