# task3_iykra
with A as (
  SELECT DISTINCT 
  channelGrouping,
  date, 
  geoNetwork_country,
  SUM(totals_transactions) as TRANSACTIONS
  FROM `data-to-insights.ecommerce.rev_transactions`
  GROUP BY 1, 2, 3
  ORDER BY date, geoNetwork_country ASC
)

SELECT 
channelGrouping as CHANNEL,
 ARRAY_AGG(date) as DATE,
  ARRAY_AGG(geoNetwork_country) as COUNTRY,
   ARRAY_AGG(TRANSACTIONS) as TOTAL_TRANSACTION,
    from A
  GROUP BY channelGrouping;
