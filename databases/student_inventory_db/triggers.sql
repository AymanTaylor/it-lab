CREATE TRIGGER borrow_audit

AFTER INSERT ON borrow_transactions

FOR EACH ROW

INSERT INTO audit_logs(

action_type,
table_name,
record_id

)

VALUES(

'INSERT',
'borrow_transactions',
NEW.transaction_id

);



DELIMITER //

CREATE TRIGGER late_penalty

BEFORE UPDATE ON borrow_transactions

FOR EACH ROW

BEGIN

IF NEW.return_date > NEW.due_date THEN

SET NEW.status='late';

SET NEW.penalty =
DATEDIFF(
NEW.return_date,
NEW.due_date
) * 1.50;

ELSE

SET NEW.status='returned';

END IF;

END//

DELIMITER ;