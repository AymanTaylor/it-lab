DELIMITER //

CREATE PROCEDURE borrow_item(

IN s_id INT,
IN i_id INT,
IN qty INT

)

BEGIN

DECLARE available INT;

SELECT available_quantity

INTO available

FROM available_inventory

WHERE item_id=i_id;

IF available >= qty THEN

INSERT INTO borrow_transactions(

student_id,
item_id,
quantity,
borrow_date,
due_date

)

VALUES(

s_id,
i_id,
qty,
CURDATE(),
DATE_ADD(CURDATE(),INTERVAL 7 DAY)

);

ELSE

SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='Not enough inventory';

END IF;

END//

DELIMITER ;