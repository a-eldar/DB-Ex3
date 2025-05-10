# for each kenneset we need to return the distinct number of parties which members of the kenneset are members of them

SELECT number AS knesset_number, count(distinct party) AS parties_count
FROM memberInKnesset
group by number
order by knesset_number;  