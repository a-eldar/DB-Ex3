
SELECT number AS knesset_number, avg(startYear - birthYear) AS avg_age
FROM memberInKnesset natural join members natural join kennesets
group by knesset_number
order by knesset_number;