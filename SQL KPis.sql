

-- -------------------------------------1st KPI------------------------------------------
SELECT
case
when DAYOFWEEK(order_purchase_timestamp) in (1, 7) then 'Weekend'
else 'Weekday'
end as DayType,
round(sum(op.payment_value))
from olist_orders_dataset o
join olist_order_payments_dataset op on o.order_id = op.order_id
group by DayType
order by
daytype;


-- ------------------------------------------KPI 2--------------------------------
select * from olist_order_reviews_dataset;
select * from olist_order_payments_dataset;

select count(*) as Number_Of_Orders, review_score
from olist_order_reviews_dataset o
join olist_order_payments_dataset p ON o.order_id = p.order_id
WHERE o.review_score = 5
AND p.payment_type = 'credit_card';

-- ---------------------------------------KPI 3----------------------------------------------

select * from olist_orders_dataset;
select * from olist_products_dataset;
select* from olist_order_items_dataset;


SELECT round(AVG(DATEDIFF(orders.order_delivered_customer_date, orders.order_purchase_timestamp))) AS Average_no_of_days_for_Pet_shop
FROM olist_orders_dataset AS orders
JOIN olist_order_items_dataset AS order_items ON orders.order_id = order_items.order_id
JOIN olist_products_dataset AS products ON order_items.product_id = products.product_id
WHERE products.product_category_name = 'pet_shop';



-- ---------------------------------------------------KPI 4-------------------------------------------
select * from olist_customer_dataset;
select * from olist_order_payments_dataset;
select * from olist_order_items_dataset;

SELECT
round(avg(order_items.price)) as average_price,
round(avg(order_payments.payment_value)) as average_payment_value

from olist_order_items_dataset as order_items
join olist_order_payments_dataset as order_payments
on order_items.order_id = order_payments.order_id
join olist_orders_dataset as orders
on order_items.order_id = orders.order_id
join olist_customer_dataset as customers
on orders.customer_id = customers.customer_id
where customers.customer_city = 'Sao Paulo';




----------


select c.customer_city ,round(avg(p.payment_value))  as average_payment_values,round(avg(i.price)) as average_price
from olist_order_items_dataset i
join olist_order_payments_dataset p
on i.order_id=p.order_id
join olist_orders_dataset o
on i.order_id=o.order_id
join olist_customers_dataset c
on o.customer_id=c.customer_id
where c.customer_city='sao paulo';



-- -----------------------------------------------KPI 5-----------------------------------
select * from olist_orders_dataset;
select * from olist_order_reviews_dataset;

select
round(avg(DATEDIFF(orders.order_delivered_customer_date, orders.order_purchase_timestamp))) as avg_shipping_days,
round(avg(reviews.review_score)) as avg_review_score
from olist_orders_dataset as orders
join olist_order_reviews_dataset as reviews
on orders.order_id = reviews.order_id
group by
reviews.review_score
order by
reviews.review_score;
