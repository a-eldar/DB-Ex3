
WITH Parties AS (
    SELECT number, party, COUNT(DISTINCT uid) AS party_size
    FROM memberInKnesset
    GROUP BY number, party
)

SELECT p1.number, p1.party, p1.party_size AS membercount
FROM Parties p1
WHERE p1.party_size >= ALL (
    SELECT p2.party_size
    FROM Parties p2
    WHERE p1.number = p2.number
)
ORDER BY p1.number, p1.party;