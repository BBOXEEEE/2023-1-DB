USE classicmodels;

-- employees의 lastname, firstname, jobtitle의 정보 검색
SELECT lastName, firstName, jobTitle 
FROM employees 
LIMIT 10;

-- customers 중 country가 USA면서 NYC라는 city에 살고 있으며, creditlimit이 200미만인 사람의 이름 검색
SELECT customerName 
FROM customers 
WHERE country="USA" AND city="NYC" AND creditLimit<200;

-- buyPrice가 50이하이거나 100이상인 products의 productCode, productName, buyPrice 검색
SELECT productCode, productName, buyPrice 
FROM products 
WHERE buyPrice>=100 or buyPrice<=50 
LIMIT 10;

-- lastName에 am이 들어가고 firstName이 er로 끝나는 employees의 employeeNumber와 lastName, firstName 검색
SELECT employeeNumber, lastName, firstName 
FROM employees 
WHERE lastName 
LIKE '%am%' AND firstName LIKE '%er';

-- customers의 lastName은 사전의 역순으로, 고객의 firstName은 사전순으로 정렬될 수 있도록 검색
SELECT contactLastName, contactFirstName 
FROM customers 
ORDER BY contactLastName DESC, contactFirstName 
LIMIT 10;

-- buyprice가 가장 높은 products의 productName과 buyPrice를 10위까지 추출
SELECT productName, buyPrice 
FROM products 
ORDER BY buyPrice DESC 
LIMIT 10;

-- priceEach가 가장 낮은 products의 productName과 priceEach 검색
SELECT products.productName, MIN(orderdetails.priceEach) priceEach
FROM products
INNER JOIN orderdetails ON products.productCode = orderdetails.productCode
WHERE priceEach = (SELECT MIN(priceEach) FROM orderdetails)
GROUP BY orderdetails.productCode;

-- amount가 40000이상인 customers가 사는 city를 모두 나열
SELECT city 
FROM customers 
WHERE customerNumber 
IN (SELECT customerNumber 
	FROM payments 
	WHERE amount>=40000) 
LIMIT 10;
