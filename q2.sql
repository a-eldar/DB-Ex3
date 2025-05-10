
SELECT number, avg(startYear - birthYear) AS avgAge
FROM memberInKnesset NATURAL JOIN members NATURAL JOIN knessets
GROUP BY number
ORDER BY number;