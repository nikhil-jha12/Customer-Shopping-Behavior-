use customer_shopping_behavior;
##Total number of customers kitne hain?

   select count(customer_id)
   from customer;
   
##Male aur female customers ki count nikalo.
select gender,count(gender)
from customer
group by gender;

##Dataset mein unique categories kaun-kaun si hain?

select category
from customer 
group by category;

##Har category mein kitne customers hain?
SELECT category, COUNT(customer_id) AS total_customers
FROM customer
GROUP BY category;

##Highest purchase amount kya hai?

select purchase_amount
from customer
order by purchase_amount desc
limit 1;

##Lowest purchase amount kya hai?
select purchase_amount
from customer
order by purchase_amount asc
limit 1;

##Top 10 customers by purchase amount nikalo.
SELECT customer_id, purchase_amount
FROM customer
ORDER BY purchase_amount desc
LIMIT 10;       

##Bottom 10 customers by purchase amount nikalo.
SELECT customer_id, purchase_amount
FROM customer
ORDER BY purchase_amount asc
LIMIT 10;

##Average purchase amount kya hai?
select avg(purchase_amount)as avg_purchase
from customer;

##Total revenue kitna generate hua?
select sum(purchase_amount)as total_revenue
from customer;


------------------------------------------------------------------------------------------

SELECT gender,SUM(purchase_amount) AS total_revenue
FROM customer
WHERE gender = 'Male';

##Sirf female customers ka average purchase amount nikalo.

select gender,sum(purchase_amount)as total_purchase
from customer
where gender = 'female';

##discount use karne wale customers nikalo.

select customer_id,discount_applied
from customer
where discount_applied='yes';



##Discount use karne ke baad bhi average purchase amount se zyada spend karne wale customers nikalo.

SELECT customer_id, purchase_amount, discount_applied
FROM customer
WHERE discount_applied = 'Yes'
  AND purchase_amount > (
      SELECT AVG(purchase_amount)
      FROM customer);
  
##50 se zyada purchase karne wale customers nikalo.
select customer_id,purchase_amount
from customer
where purchase_amount>50;

##18–30 age group ke customers nikalo.
select age,customer_id
from customer
where age between 18 and 30;

SELECT customer_id, item_purchased, category, review_rating
FROM customer
ORDER BY review_rating DESC
LIMIT 10;


##Purchase amount ko descending order mein arrange karo.
select purchase_amount
from customer
order by purchase_amount desc;

##Har category ka total revenue nikalo.
select category,sum(purchase_amount) as total_revenue
from customer
group by category ;


##Har category ka average purchase amount nikalo.
select category,avg(purchase_amount) as avg_revenue
from customer
group by category ;

##Gender-wise average purchase amount nikalo.
select gender, avg( purchase_amount)
from customer 
group by gender;

##Gender-wise total revenue nikalo.
select gender ,sum(purchase_amount)
from customer
group by gender;

##Category-wise total revenue nikalo.

select category,sum(purchase_amount)as total_revenue
from customer
group by category;

##Category-wise average purchase amount nikalo.
select category,avg(purchase_amount)as avg_revenue
from customer
group by category;

##Aisi categories nikalo jinka total revenue average category revenue se zyada hai.
select category, sum(purchase_amount) as total_revenue
from customer
group by category
having total_revenue > (select avg(purchase_amount) from customer);

SELECT category, SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY category
HAVING SUM(purchase_amount) > (
    SELECT AVG(category_revenue)
    FROM (
        SELECT category, SUM(purchase_amount) AS category_revenue
        FROM customer
        GROUP BY category
    ) AS category_totals
);

##Aisi categories nikalo jahan customers ki count 100 se zyada hai.
select category,count(customer_id)as total_customers
from customer
group by category
having total_customers > 100;

##Har category mein maximum purchase amount nikalo.
select category,max(purchase_amount)
from customer
group by category;


##Har category mein minimum purchase amount nikalo.
select category,min(purchase_amount)
from customer
group by category;

##Gender + category ke basis par total revenue nikalo.
SELECT gender, category, SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY gender, category;

----------------------------------------------------------------------------------------------------------------------------------------
