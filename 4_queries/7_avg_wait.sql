SELECT 
AVG(assistance_requests.started_at - assistance_requests.created_at ) AS 
avg_wait_time
FROM assistance_requests
