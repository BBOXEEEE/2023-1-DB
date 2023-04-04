USE classicmodels;

/* 고객테이블에서 고객번호, 고객 lastName정보를 얻은 결과와 직원테이블에서 직원번호, 직원 lastName정보를 합치고 
	번호에 대하여 오름차순으로 정렬한 결과를 출력*/
SELECT customerNumber as num, contactLastName as lastName FROM customers
UNION ALL SELECT employeeNumber, lastName FROM employees
ORDER BY num;

-- 주문의 상태와 그 상태를 갖는 주문의 수를 출력 (상태를 갖는 주문의 수가 많은 순으로 출력)
SELECT status, count(orderNumber) as count
FROM orders
GROUP BY status
ORDER BY count DESC;

/* 상세주문 테이블에서 주문번호별 총 주문수,총 개당 가격을 추출
	총주문수는 1000건 이상이고 총 개당 가격은 600이상인 ROW만 추출*/
SELECT orderNumber, sum(quantityOrdered) as quantityOrdered, sum(priceEach) as priceEach
FROM orderdetails
GROUP BY orderNumber
HAVING quantityOrdered>=1000 and priceEach>=600;

-- InnerJoin을 활용하여 priceEach가 가장 작은 물품의 이름과 priceEach를 검색하시오.
SELECT products.productName, orderdetails.priceEach
FROM products
INNER JOIN orderdetails ON products.productCode = orderdetails.productCode
WHERE orderdetails.priceEach = (SELECT MIN(priceEach) FROM orderdetails);

-- 주문 테이블과 상세 주문 테이블로부터 주문번호 별로 주문번호, 상태, 총 주문금액을 검색하시오
SELECT orders.orderNumber, orders.status, 
	SUM(orderdetails.quantityOrdered * orderdetails.priceEach) AS sum
FROM orders
JOIN orderdetails ON orders.orderNumber = orderdetails.orderNumber
GROUP BY orderdetails.orderNumber
LIMIT 10;

-- 모든 고객의 주문 정보를 검색 (추출해야 할 정보는 고객번호, 고객이름, 주문번호, 상품상태)
SELECT C.customerNumber, C.customerName, O.orderNumber, O.status
FROM customers AS C
LEFT JOIN orders AS O
ON C.customerNumber = O.customerNumber;

-- 고객 중 주문을 하지 않은 고객의 고객번호와 고객이름을 추출
SELECT C.customerNumber, C.customerName
FROM customers AS C
LEFT JOIN orders AS O 
ON C.customerNumber = O.customerNumber
WHERE O.customerNumber IS NULL;