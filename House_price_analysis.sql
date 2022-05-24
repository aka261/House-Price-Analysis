-- selecting the database
use house_prices;

-- selecting the whole dataset
select * from house_data;

-- What is the average and total sale price based on sale condition & SaleType
select SaleCondition, SaleType, avg(SalePrice), sum(SalePrice) from house_data
group by SaleCondition, SaleType;

-- What is the Average Sale Price based on Overall Condition 
select distinct overallCond from house_data;
select overallCond, avg(SalePrice) as Avg_House_Price from house_data
group by overallCond;

-- Which year has the Lowest and highest selling price of houses
select distinct YrSold from house_data;
select Yrsold, max(SalePrice) as Max_Sale_price from house_data
group by Yrsold order by Max_Sale_price desc;

-- Which month in year 2007 had highest number of houses sold
select distinct MoSold from house_data where YrSold = 2007;
select YrSold, MoSold, count(MoSold) as Count_houses from house_data where YrSold = 2007
group by MoSold order by Count_houses desc;

-- Which month in year 2008 had lowest number of houses sold
select distinct MoSold from house_data where YrSold = 2008;
select YrSold, MoSold, count(MoSold) as Count_houses from house_data where YrSold = 2008
group by MoSold order by MoSold asc;

-- What is the average selling price of house which has pool area greater than 500 and overall condition is less than 6
select distinct PoolArea from house_data;
select PoolArea, OverallCond, avg(SalePrice) from house_data 
where PoolArea > 500 and OverallCond <6  group by PoolArea,OverallCond
order by avg(SalePrice);
  
-- What is average selling price of house which has one basement bathroom and two full bathrooms
select distinct BsmtFullBath, FullBath from house_data;
select BsmtFullBath, FullBath, avg(SalePrice) from house_data
where BSmtFullBath = 1 and FullBath = 2 group by BsmtFullBath, FullBath;

-- What is average selling price of house which has two basement bathroom and two full bathrooms
select BsmtFullBath, FullBath, avg(SalePrice) from house_data
where BSmtFullBath = 2 and FullBath = 2 group by BsmtFullBath, FullBath;

-- What is the average selling price of house which has GargeArea greater than 500 square feet and 
-- Garage quality is Excellent and has pave street
select GarageArea, GarageQual, Street, avg(SalePrice) from house_data
where GarageArea > 500 and GarageQual = "Ex" and Street = "Pave" group by GarageArea, GarageQual;

-- What is average selling price of house which was built between the year 2005 and 2010? What is average house price
-- for each year between 2005 and 2010
select distinct YearBuilt from house_data order by YearBuilt asc;
select avg(SalePrice) as avg_sale_price from house_data
where YearBuilt between 2005 and 2010; 
select YearBuilt, avg(SalePrice) as avg_sale_price from house_data
where YearBuilt between 2005 and 2010 group by YearBuilt; 

-- What is average selling price of house which was built in the year beween 2008 and 2010 and also has 
-- garage capacity of 3 or 2 cars 
select YearBuilt, GarageCars,avg(SalePrice) as avg_sale_price from house_data
where YearBuilt between 2008 and 2010 and (GarageCars = 2 or GarageCars = 3) group by YearBuilt, GarageCars;

-- What is average selling price of house which has garage of excellent quality has two full bathrooms 
select distinct Utilities from house_data;
select GarageQual, FullBath, Avg(SalePrice) from house_data
where GarageQual = "Ex" and FullBath = 2;  

