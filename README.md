# Inventory Efficiency and Slow-Moving Product Analysis Using SQL

## Project Overview

This project analyzes inventory movement and identifies slow-moving products using SQL. The analysis focuses on inventory turnover, product movement, sales performance, and inventory value to understand how efficiently inventory is being managed.

## Objective

The main objectives of this project are:

* Calculate inventory turnover for products
* Identify slow-moving products
* Identify products with no recorded movement
* Compare inventory performance across marketing types
* Compare historical and active inventory
* Identify products with high inventory but low sales
* Analyze inventory value tied up in unsold products

## Dataset

Dataset: Historical Sales and Active Inventory

Source: Kaggle

The dataset contains historical sales and active inventory information, including SKU numbers, sold quantities, inventory counts, marketing type, pricing, release information, and other product attributes.

## Tools Used

* MySQL

## Key Columns

* SKU_number
* File_Type
* SoldFlag
* SoldCount
* MarketingType
* ReleaseNumber
* New_Release_Flag
* StrengthFactor
* PriceReg
* ReleaseYear
* ItemCount
* Low_User_Price
* LowNetPrice

## Inventory Turnover Formula

For this project, a simplified quantity-based turnover formula is used:

Inventory Turnover = SoldCount / ItemCount

Average inventory was not available in the dataset, so current inventory was used as the denominator. This assumption is clearly stated for the analysis.

## Analysis Performed

### 1. Inventory Turnover Analysis

Calculated the turnover ratio for each SKU to measure product movement.

### 2. Slow-Moving Products

Identified products with low inventory turnover.

Products with turnover below 0.25 were classified as slow movers for this analysis.

### 3. No-Movement Products

Identified products where SoldCount is zero.

These products may represent inventory that has not generated recorded sales.

### 4. Historical vs Active Inventory

Compared historical and active inventory based on:

* Product count
* Total inventory
* Total units sold
* Inventory turnover

### 5. Marketing Type Analysis

Compared inventory turnover across different marketing types to identify differences in product movement.

### 6. High Inventory and Low Sales

Identified products holding significant inventory while generating very few sales.

### 7. Inventory Value Analysis

Estimated inventory value using:

Inventory Value = ItemCount × PriceReg

This helps identify products where substantial inventory value may be tied up in slow-moving or unsold stock.

## Key Business Insights

* Low inventory turnover can indicate slow-moving products or excess inventory.
* Products with zero recorded sales may require further investigation.
* High inventory combined with low sales can tie up working capital.
* Inventory turnover can vary across different marketing types.
* Very high turnover is not always positive because insufficient inventory can lead to stockouts and lost sales.

## Conclusion

This SQL project demonstrates how inventory data can be analyzed to measure inventory efficiency and identify slow-moving products. The analysis can help businesses reduce excess inventory, improve stock management, and make better inventory planning decisions.
