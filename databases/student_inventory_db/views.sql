CREATE VIEW available_inventory AS

SELECT

 item_id,
 item_name,

 total_quantity -
 damaged_quantity -

 IFNULL(
 (
  SELECT SUM(quantity)
  FROM borrow_transactions bt
  WHERE bt.item_id = inventory_items.item_id
  AND status='borrowed'
 ),0)

 AS available_quantity

FROM inventory_items

WHERE deleted = FALSE;