WITH RECURSIVE member_network(uid, name, distance) AS (
    -- Base case: Menachem Begin with distance 0
    SELECT m.uid, m.name, 0 AS distance
    FROM members m
    WHERE m.name = 'Menachem Begin'
    
    UNION ALL
    
    -- Recursive case: find members connected to those already in our network
    SELECT m.uid, m.name, n.distance + 1
    FROM member_network n
    INNER JOIN memberInKnesset mk1 ON (n.uid = mk1.uid)
    INNER JOIN memberInKnesset mk2 ON (mk1.number = mk2.number AND mk1.party = mk2.party)
    INNER JOIN members m ON (mk2.uid = m.uid)
    WHERE m.uid != n.uid -- Avoid self-loops
    AND n.distance < 3   -- Limit to distance 3 since we want to find those > 3
    AND NOT EXISTS (     -- Avoid cycles by ensuring we haven't seen this member already
        SELECT 1
        FROM member_network n2
        WHERE n2.uid = m.uid AND n2.distance <= n.distance + 1
    )
)

-- Main query: select members with distance > 3 or unreachable
SELECT m.uid, m.name
FROM members m
WHERE NOT EXISTS (
    -- Check if the member exists in our network with distance <= 3
    SELECT 1 
    FROM member_network n 
    WHERE n.uid = m.uid
)
ORDER BY m.uid;