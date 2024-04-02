WITH BookAuthor AS (
  SELECT 
    A.BOOK_ID,
    A.AUTHOR_ID, 
    A.CATEGORY,
    B.AUTHOR_NAME,
    A.PRICE
  FROM 
    BOOK A
  JOIN 
    AUTHOR B ON A.AUTHOR_ID = B.AUTHOR_ID
), BookSalesPeriod AS (
  SELECT 
    C.BOOK_ID,
    SUM(C.SALES) AS TOTAL_SALES
  FROM 
    BOOK_SALES C
  WHERE 
    C.SALES_DATE BETWEEN '2022-01-01' AND '2022-01-31'
  GROUP BY 
    C.BOOK_ID
)

SELECT 
  BA.AUTHOR_ID, 
  BA.AUTHOR_NAME, 
  BA.CATEGORY,
  SUM(BA.PRICE * BSP.TOTAL_SALES) AS TOTAL_SALES
FROM 
  BookAuthor BA
JOIN 
  BookSalesPeriod BSP ON BA.BOOK_ID = BSP.BOOK_ID
GROUP BY 
  BA.AUTHOR_ID, 
  BA.CATEGORY
ORDER BY 
  BA.AUTHOR_ID ASC, 
  BA.CATEGORY DESC;
