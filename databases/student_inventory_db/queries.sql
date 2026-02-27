SELECT s.full_name,
bt.penalty

FROM borrow_transactions bt

JOIN students s

ON s.student_id = bt.student_id

WHERE bt.status='late';



SELECT item_id,
SUM(quantity) AS total_borrowed

FROM borrow_transactions

GROUP BY item_id

ORDER BY total_borrowed DESC;