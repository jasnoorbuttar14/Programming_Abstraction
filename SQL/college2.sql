Windows PowerShell
Copyright (C) Microsoft Corporation. All rights reserved.

PS C:\Users\HP> mysql -u root -p
Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 12
Server version: 8.0.46 MySQL Community Server - GPL

Copyright (c) 2000, 2026, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| college            |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

mysql> CREATE DATABASE college2;
Query OK, 1 row affected (0.05 sec)

mysql> USE college2;
Database changed
mysql> SELECT DATABASE();
+------------+
| DATABASE() |
+------------+
| college2   |
+------------+
1 row in set (0.00 sec)

mysql> CREATE TABLE students(
    ->     id INT PRIMARY KEY,
    ->     name VARCHAR(30),
    ->     age INT,
    ->     course_id INT
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> DESC students;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| id        | int         | NO   | PRI | NULL    |       |
| name      | varchar(30) | YES  |     | NULL    |       |
| age       | int         | YES  |     | NULL    |       |
| course_id | int         | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> INSERT INTO students VALUES
    -> (1,'Rahul',20,101),
    -> (2,'Vishal',21,101),
    -> (3,'Akash',22,102),
    -> (4,'Yogya',23,103);
Query OK, 4 rows affected (0.01 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM students;
+----+--------+------+-----------+
| id | name   | age  | course_id |
+----+--------+------+-----------+
|  1 | Rahul  |   20 |       101 |
|  2 | Vishal |   21 |       101 |
|  3 | Akash  |   22 |       102 |
|  4 | Yogya  |   23 |       103 |
+----+--------+------+-----------+
4 rows in set (0.00 sec)

mysql> CREATE TABLE courses(
    ->     course_id INT PRIMARY KEY,
    ->     course_name VARCHAR(30)
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE courses(
    ->     course_id INT PRIMARY KEY,
    ->     course_name VARCHAR(30)
    -> DESC courses;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'DESC courses' at line 4
mysql> DESC courses;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| course_id   | int         | NO   | PRI | NULL    |       |
| course_name | varchar(30) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> INSERT INTO courses VALUES
    -> (101,'Java'),
    -> (102,'PA'),
    -> (103,'DSA');
Query OK, 3 rows affected (0.04 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM courses;
+-----------+-------------+
| course_id | course_name |
+-----------+-------------+
|       101 | Java        |
|       102 | PA          |
|       103 | DSA         |
+-----------+-------------+
3 rows in set (0.00 sec)

mysql> SELECT students.id,
    ->        students.name,
    ->        courses.course_name
    -> FROM students
    -> INNER JOIN courses
    -> ON students.course_id = courses.course_id;
+----+--------+-------------+
| id | name   | course_name |
+----+--------+-------------+
|  1 | Rahul  | Java        |
|  2 | Vishal | Java        |
|  3 | Akash  | PA          |
|  4 | Yogya  | DSA         |
+----+--------+-------------+
4 rows in set (0.00 sec)

mysql> SELECT students.id,
    ->        students.name,
    ->        courses.course_name
    -> FROM students
    -> LEFT JOIN courses
    -> ON students.course_id = courses.course_id;
+----+--------+-------------+
| id | name   | course_name |
+----+--------+-------------+
|  1 | Rahul  | Java        |
|  2 | Vishal | Java        |
|  3 | Akash  | PA          |
|  4 | Yogya  | DSA         |
+----+--------+-------------+
4 rows in set (0.00 sec)

mysql> SELECT students.id,
    ->        students.name,
    ->        courses.course_name
    -> FROM students
    -> RIGHT JOIN courses
    -> ON students.course_id = courses.course_id;
+------+--------+-------------+
| id   | name   | course_name |
+------+--------+-------------+
|    2 | Vishal | Java        |
|    1 | Rahul  | Java        |
|    3 | Akash  | PA          |
|    4 | Yogya  | DSA         |
+------+--------+-------------+
4 rows in set (0.00 sec)

mysql> SELECT students.name,
    ->        courses.course_name
    -> FROM students
    -> CROSS JOIN courses;
+--------+-------------+
| name   | course_name |
+--------+-------------+
| Rahul  | DSA         |
| Rahul  | PA          |
| Rahul  | Java        |
| Vishal | DSA         |
| Vishal | PA          |
| Vishal | Java        |
| Akash  | DSA         |
| Akash  | PA          |
| Akash  | Java        |
| Yogya  | DSA         |
| Yogya  | PA          |
| Yogya  | Java        |
+--------+-------------+
12 rows in set (0.00 sec)

mysql> EXIT;
Bye
PS C:\Users\HP>