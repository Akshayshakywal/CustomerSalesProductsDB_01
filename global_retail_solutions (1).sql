use global_retail_solutions;
#create_product_table
create table product (product_id int primary key,product_name varchar(20),category varchar(20),price int);


#create_customer_table
create table customers (customer_id int primary key,customer_name varchar(20),region varchar(20),customer_segment varchar(20));


#create_sales_table
create table sales (sales_id int primary key,order_date date,customer_id int,FOREIGN KEY (customer_id) REFERENCES 
customers(customer_id),product_id int,foreign key (product_id) references product (product_id),quantity varchar(20),amount float);


#task 3.1
select sum(sales.amount) as total_sales,sum(sales.quantity),customers.region from sales join customers on 
sales.sales_id = customers.customer_id group by region;


#task3.2
select product.product_name,sum(sales.amount) as total_sales from 
sales join product on sales.sales_id = product.product_id group by product_name order by total_sales desc limit 3;

#task3.3


select customers.customer_segment,sum(sales.amount) as total_sales from sales join customers on 
sales.sales_id = customers.customer_id group by customer_segment limit 1;


#task3.4
select product.category,avg(sales.amount) as order_value from sales join product on sales.sales_id = product.product_id group by category;


#task3.5

select product.product_name,sales.amount from sales join product on sales.sales_id = product.product_id where quantity > 2 and category = "electronics" ;