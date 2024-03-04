--Selects analysts that created more than 5 insights
SELECT 
    i.analyst_id,
    COUNT(*) AS insight_count
FROM 
    Insights i
GROUP BY 
    i.analyst_id
HAVING 
    COUNT(*) > 5;
