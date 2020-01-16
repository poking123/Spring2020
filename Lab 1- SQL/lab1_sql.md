# COSI 132 Lab 1: SQL

Due date: TBD
    
## Introduction
In this lab, you'll get experience using SQL to perform basic join operations on a small dataset of the TPC-H benchmark. This lab will show you how a relational data model, combined with a powerful query processing language, can greatly simplify finding answers to complex questions.

## Installing Vertica Engine 
We have assumed you have successfully install Vertica Community Edition with 3 nodes on your persomal machine. If you have any issues with please visit the instructions we posted on LATTE on how to set up Vertica. 

## Setting up the database

**Getting the schema**:  We've defined the TPC-H relational database schema for you, which you should setup on your local Vertica engine. The schema represents a repository of orders of parts provider by suppliers. It recordes the information about customers placing the orders (Customer table), suppliers that provided the parts (table Supplier) and demographis for them (Nation and Region tables). The Part table provides info for the parts and the Orders table info for orders (customer placing the order, order time, etc).  This is a data analytics star-based schema with the Lineitem table being the fact table that captures the relationship between orders, parts and suppliers. This is by far the biggest table in your database. 
To see a presentation of the relational schema, go [here](https://github.com/COSI132a/Spring2020/blob/master/Lab%201-%20SQL/sample-data-tpch-schema.png). You can get the sql statement that generates the TPC-H schema here [Schema SQL](https://github.com/COSI132a/Spring2020/blob/master/Lab%201-%20SQL/tpch.sql).

**Loading Data into your DB**: Once you have set up with schema which means every table is created, you need to load **10G** TPC-H data into database. All instructions on loading data are included in our tutorials on LATTE. If you cannot deploy this amount of data please do reach out to us. 


##Your assingment##

**Writing your first query**:To get started, let's run a basic SQL query to list all the customers. Since you are working with a large dataset, your queries will return 1000s of rows which slow down things on your machine - to avoid this  ALWAYS include a LIMIT clause at the end of your query. The LIMIT clause indicates the upper limit of rows you want your query to return. Your first query statement should be the following:

```sql
SELECT * FROM customer LIMIT 10;
```

... and then press the enter button. The results should appear, and give you a table showing the result of your query -- in this case, listing up to 10 cutomers fron the `customer` relation.

To get only customers who are from China (indicated by the value 18 in the attribute Nationkey), we can add a `WHERE` clause to our query:

```sql
SELECT * FROM customer WHERE c_nationkey = 18 LIMIT 10;
```

**Writing your first (few) `JOIN` query**: Let's expand our listing of customers who are from China(nationkey = 18). In order to do this, we want to join together the `customer` relation with the `order` relation, matching on the `custkey` attributes (sometimes called "columns") of both relations. To do this, enter the following SQL query:

```sql
SELECT * FROM customer, orders WHERE c_nationkey =18 and c_custkey = o_custkey LIMIT 10;
```
**Writing your first (few) `GROUP BY` query**: Let's continue to expand our senario, since each customer may have many orders, in order to see average price of their orders for each customer, it is necessary to apply  group by clause. To do this, enter the following SQL query. 

```sql
SELECT c_custkey, avg(o_totalprice) 
FROM customer, orders 
WHERE c_nationkey =18 and c_custkey = o_custkey
GROUP BY c_custkey
LIMIT 10;
```


**Writing some more queries**: For the rest of this assignment, you should write SQL queries to answer the following questions **Always add LIMIT clause at the end your script**.

1. Find the addresses of every customer from Argentina. 
2. Find order status for each customer from China. 
3. Find the customer from Argentina with largest number of orders.
4. Find which customer has the highest total value of orders(totalprice).


**Submitting your work**: Once you have finalized your work. Submit following documents in .zip on LATTE:
1. Run SQL query below and save the result in screenshot. the query below will check if 3 nodes are used. 
```SELECT node_name, node_state FROM nodes ORDER BY 1;```
2. Run SQL query below and save the result in screenshot. the query below will check size of database.
```select round((total_used_bytes/(1024^3)),3.3)||' Gb' as DB_Size  from system;```
3. Answer 4 questions above, submit your SQL query and screenshots. 





