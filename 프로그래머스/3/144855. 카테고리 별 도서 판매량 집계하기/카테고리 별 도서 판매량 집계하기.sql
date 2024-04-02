SELECT B1.CATEGORY, SUM(B2.SALES) AS TOTAL_SALES
FROM BOOK B1
JOIN BOOK_SALES B2 ON B1.BOOK_ID = B2.BOOK_ID
WHERE DATE_FORMAT(B2.SALES_DATE, '%Y-%m') = '2022-01'
GROUP BY B1.CATEGORY
ORDER BY B1.CATEGORY