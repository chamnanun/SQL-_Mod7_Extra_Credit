CREATE VIEW isolated_cardholder_transactions AS
SELECT card_holder.id, card_holder.name, transaction.date, transaction.amount
FROM transaction 
JOIN credit_card ON credit_card.card = transaction.card
JOIN card_holder ON card_holder.id = credit_card.cardholder_id
ORDER BY card_holder.id; 

CREATE VIEW cardholder_total_small_transactions AS
SELECT h.id, h.name, COUNT (h.id) AS "Number of Transactions < $2.00"
FROM transaction AS t
JOIN credit_card AS cc
ON cc.card = t.card
JOIN card_holder AS h
ON h.id = cc.cardholder_id
WHERE t.amount < 2.00
GROUP BY h.id
ORDER BY COUNT(*) DESC;

CREATE VIEW high_transactions_7am_thru_9am AS
SELECT t.date, t.amount, m.name, mc.name AS "category"
FROM transaction as t
JOIN merchant AS m
ON m.id = t.id_merchant
JOIN merchant_category AS mc
ON mc.id = m.id_merchant_category
WHERE EXTRACT(HOUR FROM date) >= 7
AND EXTRACT(HOUR FROM date) < 9 
ORDER BY t.amount DESC
LIMIT 100;


CREATE VIEW top5_small_transaction_merchants AS
SELECT m.id, m.name, COUNT (m.id) AS "Number of Transactions <$2.00", mc.name AS "category"
FROM merchant AS m
JOIN transaction as t
ON t.id_merchant = m.id
JOIN merchant_category AS mc
ON mc.id = m.id_merchant_category
WHERE t.amount < 2.00
GROUP BY m.id, mc.name
ORDER BY "Number of Transactions <$2.00" DESC
LIMIT 5; 




