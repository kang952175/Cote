WITH G_TABLE AS (
    SELECT FISH_TYPE, count(FISH_TYPE) AS FISH_COUNT
    FROM FISH_INFO
    GROUP BY FISH_TYPE
)

SELECT G.FISH_COUNT, N.FISH_NAME
FROM G_TABLE AS G
LEFT JOIN FISH_NAME_INFO AS N ON G.FISH_TYPE = N.FISH_TYPE
ORDER BY G.FISH_COUNT DESC