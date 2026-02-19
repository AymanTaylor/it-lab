SELECT ip_address, COUNT(*)
FROM ip_assignments
GROUP BY ip_address
HAVING COUNT(*) > 1;