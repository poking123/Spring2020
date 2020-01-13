# COSI 132 Lab 1: Joins

Due date: TBD
    
## Introduction
In this lab, you'll get experience using SQL to perform basic join operations on a small dataset. This lab will show you how a relational data model, combined with a powerful query processing language, can greatly simplify finding answers to complex questions.

## Instructions

**Getting the schema**: the left hand side of the DB Fiddle site is used to store the schema and data of your database. We've defined a database schema for you, which you should copy/paste into this section. To get the schema, go to: [http://rm.cab/sql](http://rm.cab/sql). Afterwards, your session should look like this:

![Screenshot](http://cs.brandeis.edu/~rcmarcus/cs132/lab1/shot1.png)

The schema represents a simple university. Each entity (student, professor, course, enrollment, teaching assignment) is represented by a relation (sometimes called a "table"), and most entities have an ID (for example, student's have a student ID field, `sid`).

**Writing your first query**: to get started, let's run a basic SQL query to list all the students in our university. On the right hand side of DB Fiddle, in the section labeled "Query SQL", enter the following:

```sql
SELECT * FROM student;
```

... and then press the "Run" button at the top of DB Fiddle. The results pane should appear, and give you a table showing the result of your query -- in this case, listing all of the students in the `student` relation.

To get only students with a certain last name (say, "Lovelace"), we can add a `WHERE` clause to our query:

```sql
SELECT * FROM student
WHERE 
slast = "Lovelace";
```

**Writing your first (few) `join` query**: Let's expand our listing of students to also include their majors. In order to do this, we want to join together the `student` relation with the `major` relation, matching on the `sid` attributes (sometimes called "columns") of both relations. To do this, enter the following SQL query:

```sql
SELECT * FROM
student, major
WHERE
student.sid = major.sid;
```
This query can be read as follows: take the Cartesian product of the student and major relations, and then return only the elements which have a matching `student.sid` and `major.sid` values. You'll notice that a few of our students (for example, Solomon Garber) disappeared, because they do not yet have majors. To remedy this, and to list all students including those who are undecided, we need to do "left outer join." The syntax for this is:

```sql
SELECT * FROM
(student LEFT JOIN major ON student.sid = major.sid);
```

You'll notice that now, when you click the "Run" button, the listing of students is complete, and those who are undecided are listed with a "null" major. Suppose we wanted to clean up our results a little bit and only show the last name and major of each student. We can do this projection like so:

```sql
SELECT slast, major FROM
(student LEFT JOIN major ON student.sid = major.sid);
```

**Writing some more queries**: For the rest of this assignment, you should write SQL queries to answer the following questions. Put all your answers into the same DB Fiddle. You can mark which SQL statement matches which question with a SQL comment, which is any line that starts with two dashes (`--`). There is a small bug in DB Fiddle that causes a `SQLITE_MISUSE: not an error` message to appear if you end your "Query SQL" section with a comment, so make sure not to do that.

1. Find the email addresses of every computer science major. 
2. Find the first name, last name, and email address of everyone who is undeclared (has no major).
3. Find the last name and email address of every student who is enrolled in CS132, [sorted by their last name](https://www.w3schools.com/SQL/sql_orderby.asp) (see link for hint).
4. Find the [*distinct*](https://www.w3schools.com/Sql/sql_distinct.asp) email addresses for all the students who are currently enrolled in a class taught by Olga.
5. Find the *distinct* first and last names of all *professors* who are teaching any student who is a mathematics major.

**Submitting your work**: Once you have finalized your work (and *only* at this point), click the "Save" button in DB Fiddle. The URL in your browser's address bar will be updated to give you a unique link to your work. Test that this URL works by opening a new window and entering the URL. Once you have verified that your URL works, submit it in a text file along with your SQL statements.

## Answers
Here is a snapshot of the correct query output, which you can use to ensure you have the correct results. Note that we will test your code with the same schema, but with different data, so do not hard-code your answers.

![Answer screenshot](http://cs.brandeis.edu/~rcmarcus/cs132/lab1/shot2.png)
