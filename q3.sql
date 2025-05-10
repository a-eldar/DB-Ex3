
SELECT name as member_name, 
FROM memberInKnesset natural join members 
group by uid, name
having count(distinct party) = 1 and count(distinct knesset_number) >= 5
order by member_name;