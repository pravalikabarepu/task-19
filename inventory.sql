CREATE TABLE inventory (
    `Order` varchar(10),
    File_Type VARCHAR(20),
    SKU_number varchar(10),
    SoldFlag varchar(20),
    SoldCount varchar(20),
    MarketingType VARCHAR(20),
    ReleaseNumber varchar(20),
    New_Release_Flag varchar(20),
    StrengthFactor varchar(20),
    PriceReg varchar(20),
    ReleaseYear varchar(20),
    ItemCount varchar(20),
    Low_User_Price varchar(30),
    LowNetPrice varchar(30)
);

SELECT *
FROM inventory
LIMIT 10;

SELECT COUNT(*) AS total_products
FROM inventory;

SELECT File_Type, COUNT(*) AS product_count
FROM inventory
GROUP BY File_Type;

SELECT
    File_Type,
    SUM(ItemCount) AS total_inventory,
    SUM(SoldCount) AS total_units_sold
FROM inventory
GROUP BY File_Type;

SELECT
    SKU_number,
    File_Type,
    SoldCount,
    ItemCount,
    ROUND(
        SoldCount / NULLIF(ItemCount, 0),
        2
    ) AS inventory_turnover
FROM inventory;

CREATE TABLE turnover_analysis AS
SELECT
    SKU_number,
    File_Type,
    SoldFlag,
    SoldCount,
    ItemCount,
    ROUND(
        SoldCount / NULLIF(ItemCount, 0),
        2
    ) AS inventory_turnover
FROM inventory;

SELECT *
FROM turnover_analysis
ORDER BY inventory_turnover DESC;

SELECT
    SKU_number,
    File_Type,
    SoldCount,
    ItemCount,
    inventory_turnover,
    CASE
        WHEN inventory_turnover = 0 THEN 'No Movement'
        WHEN inventory_turnover < 0.25 THEN 'Slow Mover'
        WHEN inventory_turnover < 0.50 THEN 'Moderate Mover'
        ELSE 'Fast Mover'
    END AS movement_status
FROM turnover_analysis
ORDER BY inventory_turnover ASC;

SELECT
    SKU_number,
    File_Type,
    SoldCount,
    ItemCount,
    inventory_turnover
FROM turnover_analysis
WHERE inventory_turnover < 0.25
ORDER BY inventory_turnover ASC;

SELECT
    SKU_number,
    File_Type,
    ItemCount,
    SoldCount
FROM inventory
WHERE SoldCount = 0
ORDER BY ItemCount DESC;

SELECT
    SKU_number,
    SoldCount,
    ItemCount,
    inventory_turnover
FROM turnover_analysis
ORDER BY inventory_turnover DESC
LIMIT 10;

SELECT
    SKU_number,
    SoldCount,
    ItemCount,
    inventory_turnover
FROM turnover_analysis
ORDER BY inventory_turnover ASC
LIMIT 10;

SELECT
    File_Type,
    COUNT(*) AS product_count,
    SUM(ItemCount) AS total_inventory,
    SUM(SoldCount) AS total_sold,
    ROUND(
        SUM(SoldCount) / NULLIF(SUM(ItemCount), 0),
        2
    ) AS inventory_turnover
FROM inventory
GROUP BY File_Type
ORDER BY inventory_turnover DESC;

SELECT
    MarketingType,
    COUNT(*) AS product_count,
    SUM(SoldCount) AS total_sold,
    SUM(ItemCount) AS total_inventory,
    ROUND(
        SUM(SoldCount) / NULLIF(SUM(ItemCount), 0),
        2
    ) AS inventory_turnover
FROM inventory
GROUP BY MarketingType
ORDER BY inventory_turnover DESC;

SELECT
    SKU_number,
    File_Type,
    SoldCount,
    ItemCount,
    ROUND(
        SoldCount / NULLIF(ItemCount, 0),
        2
    ) AS inventory_turnover
FROM inventory
WHERE ItemCount > 100
  AND SoldCount < 5
ORDER BY ItemCount DESC;

SELECT
    SKU_number,
    ItemCount,
    PriceReg,
    ROUND(ItemCount * PriceReg, 2) AS inventory_value
FROM inventory
ORDER BY inventory_value DESC;

SELECT
    SKU_number,
    File_Type,
    SoldCount,
    ItemCount,
    PriceReg,
    ROUND(ItemCount * PriceReg, 2) AS inventory_value,
    ROUND(
        SoldCount / NULLIF(ItemCount, 0),
        2
    ) AS inventory_turnover
FROM inventory
WHERE SoldCount = 0
ORDER BY inventory_value DESC;