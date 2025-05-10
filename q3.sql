
SELECT name
FROM memberInKnesset NATURAL JOIN members 
GROUP BY uid, name
HAVING count(DISTINCT party) = 1 and count(DISTINCT number) >= 5
ORDER BY name;