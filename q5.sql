WITH PartyWomen AS (
    SELECT party, number, count(*) AS femaleCount
    FROM memberInKnesset NATURAL JOIN members
    WHERE gender = 'female'
    GROUP BY party, number;
)
SELECT party, number, femaleCount / count(*) * 100
FROM memberInKnesset NATURAL JOIN PartyWomen
GROUP BY party, number, femaleCount
ORDER BY party, number;