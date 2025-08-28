WITH RegionalSales AS (
     SELECT r.RegionName,
      SUM(s.QuantitySold) AS TotalQuantitySold
    FROM
      Stores AS s
      inner JOIN Regions AS r ON s.RegionID = r.RegionID
    GROUP BY r.RegionName
  ),
  AverageSales AS (
    SELECT
      AVG(TotalQuantitySold) AS AvgRegionalSale
    FROM RegionalSales
  )
SELECT
  rs.RegionName,  rs.TotalQuantitySold
FROM  RegionalSales rs
  order by 2
 
