--  for each kenneset we need to return the distinct number of parties which members of the kenneset are members of them

SELECT number, count(distinct party) AS partyCount
FROM memberInKnesset
GROUP BY number
ORDER BY number;