-- 1. Total Content by Type
Select type, count(title) as Total 
From netflix
group by type
order by Total Desc;

-- 2.Revenue by Country
Select country, 
SUM(cast(replace(Subscription_Revenue_Millions,'$','') as decimal(4,1))) as 'Total Revenue'
-- Here "Subscription_Revenue_Millions" contains string data which we can't use to preform math on it
-- so first we need to convert it into integer,
--  Replace function remove the $ sign from the Data, now convert the data into numeric data type for ex. decimal
 from netflix 
 group by country 
 order by 'Total Revenue' Desc; 
 
 -- 3. Top 10 most streamed titles
 Select title, Views_Millions
 from netflix
 order by Views_Millions Desc
 limit 10;

-- 4. Average rating by genre
Select genre, 
Round(avg(rating),1) as 'Rating'
from netflix
group by genre 
order by Rating Desc;

-- 5. Best performing genre (by views)
Select genre , Round(AVG(Views_Millions),1) as 'view'
from netflix
group by genre 
order by view Desc
limit 1;
 
 -- 6. Highest Rated Title
 Select Title, Rating
 from netflix
 order by rating desc
 limit 1;
 
 -- 7. Countries with most content 
 Select country, count(title) as 'Total Content'
 from netflix 
 group by country 
 Order by 'Total Content' desc;

-- 8. High views but low revenue 
Select title, Views_Millions, Subscription_Revenue_Millions
from netflix
order by Views_Millions Desc
limit 20;

