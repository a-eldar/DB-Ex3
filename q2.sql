
SELECT number, avg(startYear - birthYear) AS avgAge
FROM memberInKnesset natural join members natural join knessets
group by number
order by number;