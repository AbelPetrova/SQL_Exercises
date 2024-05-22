-- Question 1  What year was the youngest person born in the company?
_Query:_

SELECT max(birth_date) 
FROM employees;



-- Question 2: What is the average population for cities in the netherlands?
_Query:_

SELECT AVG(population) 
FROM city
WHERE countrycode = 'NLD';


-- Question 3: Who between the ages of 30 and 50 has an income less than 50 000?
_Query:_

SELECT *
FROM customers
WHERE age BETWEEN 30 AND 50 AND income < 50000;


-- Question 4: How many female customers do we have from the state of Oregon (OR)?
_Query:_

SELECT COUNT(firstName)
FROM customers
WHERE gender = 'F' and state = 'OR';


-- Question 5:  How many employees where hired in February?
_Query:_

SELECT count(emp_no) 
FROM employees
WHERE EXTRACT (MONTH FROM hire_date) = 2;


-- Question 6: Who is the oldest employee?
_Query:_

SELECT MAX(AGE(birth_date)) 
FROM employees;


-- Question 7:  How many cities are in the district of Zuid-Holland, Noord-Brabant and Utrecht?
_Query:_

SELECT COUNT(id)
FROM city
WHERE district IN ('Zuid-Holland', 'Noord-Brabant', 'Utrecht');


-- Question 8:  Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
_Query:_

SELECT c.firstname, c.lastname, o.orderid 
FROM orders AS o
INNER JOIN customers AS c ON o.customerid = c.customerid
WHERE c.state IN ('NY', 'OH', 'OR')
ORDER BY o.orderid;


-- Question 9: Show me all the employees, hired after 1991 and count the amount of positions they've had
_Query:_

SELECT e.emp_no, count(t.title) as "amount of titles"
FROM employees as e
JOIN titles as t USING(emp_no)
WHERE EXTRACT (YEAR FROM e.hire_date) > 1991
GROUP BY e.emp_no
ORDER BY e.emp_no;


-- Question 10: How many people's zipcode have a 2 in it?.
_Query:_

SELECT count(customerid) 
FROM customers
WHERE zip::text LIKE '%2%';