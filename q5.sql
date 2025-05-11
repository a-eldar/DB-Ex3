WITH PartyWomen(party, number, femaleCount) AS (
    SELECT party, number, count(*) AS femaleCount
    FROM memberInKnesset NATURAL JOIN members
    WHERE gender = 'female'
    GROUP BY party, number
)
SELECT party, number, femaleCount * 1.0 / count(*) * 100 AS femalePercent
FROM memberInKnesset NATURAL JOIN PartyWomen
GROUP BY party, number, femaleCount
HAVING femaleCount * 1.0 / count(*) >= 0.3
ORDER BY party, number;