SELECT day, COUNT(*) as total_a_day
FROM assignments
GROUP BY day
HAVING COUNT(*) >= 10
ORDER BY day;