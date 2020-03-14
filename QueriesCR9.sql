1.
SELECT country, state, first_name, last_name
FROM customer_country
INNER JOIN customer on fk_customer_id = customer_id

2.
SELECT country, state, first_name, last_name, address
FROM recipient_country
INNER JOIN recipient on fk_recipient_id = recipient_id

3.
SELECT first_name, last_name, birthdate, name, location
FROM mdscompany
INNER JOIN employee on fk_employee_id = employee_id