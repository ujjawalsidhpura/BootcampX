SELECT  day, COUNT(*) as total_eachday
FROM assignments 
GROUP BY day
ORDER BY day;