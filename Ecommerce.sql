use ecommerce;
select * from master_data;
desc master_data;


-- KPI1: Weekday Vs Weekend (order_purchase_timestamp) Payment Statistics
select Weekday_Weekend, concat(round(sum(payment_value)/1000000,2),' M') as total_payment 
from master_data group by Weekday_Weekend;


-- KPI2: Number of Orders with review score 5 and payment type as credit card.
select Review_Score, payment_type, concat(round(count(order_id)/1000,2),' K') as No_of_Orders 
from master_data group by review_score, payment_type 
having review_score = 5 and payment_type = 'Credit_Card';


-- KPI3: Average number of days taken for order_delivered_customer_date for pet_shop
select Product_category_name, concat(round(avg(shipping_days),0),'  Days') as Avg_Shipping_days 
from master_data group by product_category_name 
having product_category_name = 'Pet_Shop';


-- KPI4: Average price and payment values from customers of sao paulo city
select customer_city, CONCAT('$ ',round(avg(Price),2)) as average_Price,
CONCAT('$ ',round(avg(Payment_Value),2)) as average_Payments from master_data
group by customer_city having customer_city = "Sao Paulo" ;


-- KPI5 : Relationship between shipping days Vs review scores.
select review_score, concat(round(avg(Shipping_Days),0),' Days') as Average_Shipping_Days
from master_data group by review_score order by review_score;


-- Top 5 Products by Payment
select product_category_name, concat(round(sum(payment_value)/1000000,2),'M') as Total_payment 
from master_data group by product_category_name order by total_payment desc limit 5;


-- Bottom 5 Products by payment 
select product_category_name, concat(round(sum(payment_value)/1000,2),'K') as Total_payment 
from master_data group by product_category_name order by total_payment limit 5;

