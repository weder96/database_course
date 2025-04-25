create table tb_employee;

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+


id is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.
 

Write a solution to find the firts highest distinct salary from the Employee table. If there is no second highest salary.

The result format is in the following example.

 

Example 1:

Input: (select * from tb_employee)
tb_employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+


Output: 
+---------------------+
|      salary         |
+---------------------+
| 300                 |
+---------------------+