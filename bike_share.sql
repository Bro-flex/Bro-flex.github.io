WITH cte AS( 
SELECT *
FROM bike_share_yr_0
UNION
SELECT *
FROM bike_share_yr_1)

SELECT 
dteday,
season,
cte.yr,
weekday,
hr,
rider_type,
riders,
price,
COGS,
riders * price AS revenue,
riders * price - COGS AS profit
FROM cte
LEFT JOIN cost_table
ON cte.yr = cost_table.yr;
