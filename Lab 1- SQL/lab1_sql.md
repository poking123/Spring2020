# COSI 132- Spring 2020 Lab 1: SQL

Due date: Friday, January 24th, 2020, 11:59pm
    
## Introduction
In this lab, you'll get experience using SQL to perform basic join operations on a small dataset of the TPC-H benchmark. This lab will show you how a relational data model, combined with a powerful query processing language, can greatly simplify finding answers to complex questions.

## Installing Vertica Engine 
We have assumed you have successfully install Vertica Community Edition with 3 nodes on your persomal machine. If you have any issues with please visit the instructions we posted on LATTE on how to set up Vertica. 

## Setting up the database

Please note that, you can skip this start and  start your assingment (see below),  if you have set up the TPC database while following the tutorials on setting up Vertica. If you only installed Vertica but have not set up a TPC-H Database you will need to follow the instructions [here](https://docs.google.com/document/d/13J0ONA0yXx_7UrMz9Frn0NpdwoBZHOJvaIZP4T82Ilc/edit?usp=sharing). 


## Your assignment

**Writing your first selection queries**: To get started, let's run a basic SQL query to list all the customers. Since you are working with a large dataset, your queries will return 1000s of rows which might slow down on your machine - to avoid this  ALWAYS include a LIMIT clause at the end of your query. The LIMIT clause indicates the upper limit of rows you want your query to return. Your first query statement should be the following:

```sql
SELECT * FROM customer LIMIT 10;
```

... and then press the enter button. The results should appear, and give you a table showing the result of your query -- in this case, listing up to 10 cutomers fron the `customer` relation.

To get only customers with an account balance greater than 6000 , we can add a `WHERE` clause to our query:

```sql
SELECT * FROM customer WHERE c_acctbal > 6000 LIMIT 10;
```

To get only the name of customers with an account balance greater than 6000 , we can add add only the   `name` attribute in the SELECT clause

```sql
SELECT name FROM customer WHERE c_acctbal > 6000 LIMIT 10;
```

**Writing your first `JOIN` query**: Let's expand our listing of customers with information about their nation.  In order to do this, we want to join together the `customer` relation with the `nation` relation, matching on the `nationkey` attributes (sometimes called "columns") of both relations. To do this, enter the following SQL query:

```sql
SELECT * FROM customer, nation WHERE c_nationkey =n_nationkey LIMIT 10;
```

**Writing your first `ORDER BY` query**: Let's sort the previous results based on the nation name. We need to add a ORDER BY clause in our query. To do this, execute the following SQL query:

```sql
SELECT * FROM customer, nation WHERE c_nationkey =n_nationkey 
ORDER BY n_name LIMIT 10;
```

**Writing your first `GROUP BY` query**:  Each customer may have many orders and we are interested in the calculating the average price of each customer's  orders per each customer. This is an aggregation query that requires a GROUP BY clause that joins the `orders` and `customer` tables, groups the results by the customerkey and calculates the average price within each group. To do this, enter the following SQL query. 

```sql
SELECT c_custkey, avg(o_totalprice) 
FROM customer, orders 
WHERE c_custkey = o_custkey
GROUP BY c_custkey
LIMIT 10;
```


**Writing some more queries**: For the rest of this assignment, you should write SQL queries to answer the following questions. Each question can be answered by a single query **Always add LIMIT clause at the end your script**.

1. List the addresses and customer names  of every customer from China(nationkey = 18).  
2. List the order status for orders placed by customer from China. The results should be sorted by the orderdate.  
3. List the  customers from China having more than 10 orders. You will need to use the HAVING clause (see [here](https://www.vertica.com/docs/9.2.x/HTML/Content/Authoring/SQLReferenceManual/Statements/SELECT/HAVINGClause.htm)). 
4. List the distinct nations of the customers that placed orders with a total price >$1,000. You will need to use the DISTINCT keyword - see [here](https://www.vertica.com/docs/9.2.x/HTML/Content/Authoring/SQLReferenceManual/Statements/SELECT/SELECT.htm?tocpath=SQL%20Reference%20Manual%7CSQL%20Statements%7CSELECT%7C_____0)


**Submitting your work**: Once you have finalized your work. Submit following documents in .zip on LATTE:
1. Run SQL query below and save the result in screenshot. the query below will check if 3 nodes are used. 
```SELECT node_name, node_state FROM nodes ORDER BY 1;```
2. Run SQL query below and save the result in screenshot. the query below will check size of database.
```select round((total_used_bytes/(1024^3)),3.3)||' Gb' as DB_Size  from system;```
3. Answer 4 questions above, submit your SQL query and screenshots. 





