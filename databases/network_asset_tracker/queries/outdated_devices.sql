SELECT hostname, last_patch_date
FROM devices
WHERE last_patch_date < CURRENT_DATE - INTERVAL '30 days';