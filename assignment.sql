mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| college            |
| information_schema |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| university         |
| world              |
+--------------------+
8 rows in set (0.04 sec)

mysql> use college;
Database changed
mysql> show tables;
+-------------------+
| Tables_in_college |
+-------------------+
| cs_dept           |
| cs_dept_table     |
| cse_student       |
| faculty           |
| student           |
+-------------------+
5 rows in set (0.02 sec)

mysql> alter table faculty add primary key(faculty_id);
ERROR 1062 (23000): Duplicate entry '102' for key 'faculty.PRIMARY'
mysql> select * from faculty;
+------------+-----------------+--------+------+------+------+-------------+
| Faculty_id | Name            | Gender | Age  | DOB  | Dept | Year_joined |
+------------+-----------------+--------+------+------+------+-------------+
| 101        | Rohit Mahajan   | M      |   30 | NULL | ME   |        2008 |
| 106        | Monika Jain     | F      |   25 | NULL | CSE  |        2009 |
| 102        | Karan Singh     | F      |   34 | NULL | IT   |        2012 |
| 102        | Karan Singh     | F      |   34 | NULL | IT   |        2012 |
| 110        | Jitendra Sharma | M      |   45 | NULL | CE   |        2005 |
| 107        | Sheetal Agrawal | F      |   40 | NULL | AU   |        2009 |
| 105        | Rahul Sharma    | M      |   51 | NULL | ME   |        2010 |
+------------+-----------------+--------+------+------+------+-------------+
7 rows in set (0.00 sec)

mysql> alter table cs_dept add primary key(faculty_id);
ERROR 1068 (42000): Multiple primary key defined
mysql> alter table cs_dept_table add primary key(faculty_id);
ERROR 1068 (42000): Multiple primary key defined
mysql> alter table cse_student add primary key(faculty_id);
ERROR 1068 (42000): Multiple primary key defined

mysql> alter table student drop primary key;
Query OK, 10 rows affected (0.08 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> select * from student;
+----------------+-----------------+--------+------+--------+
| enrollment_num | name            | gender | age  | branch |
+----------------+-----------------+--------+------+--------+
|             34 | Garvit Paliwal  | M      |   19 | CSE    |
|             39 | Gaurav Sharma   | M      |   18 | CSBS   |
|             44 | Aayushi Talreja | F      |   18 | EC     |
|             47 | Kratik Mathur   | M      |   18 | ME     |
|             67 | Mohit Singhi    | M      |   18 | IT     |
|            140 | Ram Sharma      | M      |   19 | CSE    |
|            150 | Devansh Singh   | M      |   18 | ME     |
|            155 | Shruti Malviya  | F      |   18 | CE     |
|            159 | Dipika Jain     | F      |   18 | IT     |
|            170 | Sakshi Sharma   | F      |   19 | AU     |
+----------------+-----------------+--------+------+--------+
10 rows in set (0.00 sec)

mysql> desc student;
+----------------+----------+------+-----+---------+-------+
| Field          | Type     | Null | Key | Default | Extra |
+----------------+----------+------+-----+---------+-------+
| enrollment_num | int      | NO   |     | NULL    |       |
| name           | char(20) | YES  |     | NULL    |       |
| gender         | char(1)  | YES  |     | NULL    |       |
| age            | int      | YES  |     | NULL    |       |
| branch         | char(10) | YES  |     | NULL    |       |
+----------------+----------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> alter table student add primary key(name, branch);

mysql> desc student;
+----------------+----------+------+-----+---------+-------+
| Field          | Type     | Null | Key | Default | Extra |
+----------------+----------+------+-----+---------+-------+
| enrollment_num | int      | NO   |     | NULL    |       |
| name           | char(20) | NO   | PRI | NULL    |       |
| gender         | char(1)  | YES  |     | NULL    |       |
| age            | int      | YES  |     | NULL    |       |
| branch         | char(10) | NO   | PRI | NULL    |       |
+----------------+----------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> drop table cs_dept_table;
Query OK, 0 rows affected (0.03 sec)

mysql> drop table cs_dept;
Query OK, 0 rows affected (0.02 sec)

mysql> create table Cultural_Club(Serial_number int, F_name char(20), L_name(20), Activity char(40), Batch varchar(20), Age int, check(age>17));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(20), Activity char(40), Batch varchar(20), Age int, check(age>17))' at line 1
mysql> create table Cultural_Club(Serial_number int, Name char(20), Activity char(40), Batch varchar(20), Age int, check(age>17));
Query OK, 0 rows affected (0.03 sec)

mysql> desc Cultural_Club;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| Serial_number | int         | YES  |     | NULL    |       |
| Name          | char(20)    | YES  |     | NULL    |       |
| Activity      | char(40)    | YES  |     | NULL    |       |
| Batch         | varchar(20) | YES  |     | NULL    |       |
| Age           | int         | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> insert into values(1, "Mohit Jain", "Singing", "CSE-F", 13);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'values(1, "Mohit Jain", "Singing", "CSE-F", 13)' at line 1
mysql> insert into values(1, "Mohit Jain", "Singing", "CSE-F", 18);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'values(1, "Mohit Jain", "Singing", "CSE-F", 18)' at line 1
mysql> insert into values(1, "Mohit", "Singing", "CSE-F", 18);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'values(1, "Mohit", "Singing", "CSE-F", 18)' at line 1
mysql> insert into Cultural_Club values(1, "Mohit Jain", "Singing", "CSE-F", 18);
Query OK, 1 row affected (0.01 sec)

mysql> insert into Cultural_Club values(4, "Gauri Shukla", "Dancing", "CE-A", 13);
ERROR 3819 (HY000): Check constraint 'cultural_club_chk_1' is violated.
mysql> insert into Cultural_Club values(4, "Gauri Shukla", "Dancing", "CE-A", 19);
Query OK, 1 row affected (0.02 sec)

mysql> insert into Cultural_Club values(3, "Ram Mathur", "Singing", "ME-B", 17);
ERROR 3819 (HY000): Check constraint 'cultural_club_chk_1' is violated.
mysql> insert into Cultural_Club values(3, "Ram Mathur", "Singing", "ME-B", 20);
Query OK, 1 row affected (0.01 sec)

mysql> select
    -> select * from Cultural_Club;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select * from Cultural_Club' at line 2
mysql> select * from Cultural_Club;
+---------------+--------------+----------+-------+------+
| Serial_number | Name         | Activity | Batch | Age  |
+---------------+--------------+----------+-------+------+
|             1 | Mohit Jain   | Singing  | CSE-F |   18 |
|             4 | Gauri Shukla | Dancing  | CE-A  |   19 |
|             3 | Ram Mathur   | Singing  | ME-B  |   20 |
+---------------+--------------+----------+-------+------+
3 rows in set (0.00 sec)

mysql> desc student;
+----------------+----------+------+-----+---------+-------+
| Field          | Type     | Null | Key | Default | Extra |
+----------------+----------+------+-----+---------+-------+
| enrollment_num | int      | NO   |     | NULL    |       |
| name           | char(20) | NO   | PRI | NULL    |       |
| gender         | char(1)  | YES  |     | NULL    |       |
| age            | int      | YES  |     | NULL    |       |
| branch         | char(10) | NO   | PRI | NULL    |       |
+----------------+----------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> select * from student;
+----------------+-----------------+--------+------+--------+
| enrollment_num | name            | gender | age  | branch |
+----------------+-----------------+--------+------+--------+
|             44 | Aayushi Talreja | F      |   18 | EC     |
|            150 | Devansh Singh   | M      |   18 | ME     |
|            159 | Dipika Jain     | F      |   18 | IT     |
|             34 | Garvit Paliwal  | M      |   19 | CSE    |
|             39 | Gaurav Sharma   | M      |   18 | CSBS   |
|             47 | Kratik Mathur   | M      |   18 | ME     |
|             67 | Mohit Singhi    | M      |   18 | IT     |
|            140 | Ram Sharma      | M      |   19 | CSE    |
|            170 | Sakshi Sharma   | F      |   19 | AU     |
|            155 | Shruti Malviya  | F      |   18 | CE     |
+----------------+-----------------+--------+------+--------+
10 rows in set (0.01 sec)

mysql> select * from student where gender = 'F';
+----------------+-----------------+--------+------+--------+
| enrollment_num | name            | gender | age  | branch |
+----------------+-----------------+--------+------+--------+
|             44 | Aayushi Talreja | F      |   18 | EC     |
|            159 | Dipika Jain     | F      |   18 | IT     |
|            170 | Sakshi Sharma   | F      |   19 | AU     |
|            155 | Shruti Malviya  | F      |   18 | CE     |
+----------------+-----------------+--------+------+--------+
4 rows in set (0.01 sec)

mysql> select top 5 * from student where enrollment_num>=100;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '5 * from student where enrollment_num>=100' at line 1
mysql> select top 5 * from student where enrollment_num >= '100';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '5 * from student where enrollment_num >= '100'' at line 1
mysql> select top 5 * from student where enrollment_num >= '100';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '5 * from student where enrollment_num >= '100'' at line 1
mysql> select top 40 percent * from student;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '40 percent * from student' at line 1
mysql> select * top 5 from student where enrollment_num >= '100';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'top 5 from student where enrollment_num >= '100'' at line 1
mysql> select * from student fetch first 40 percent rows only;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'fetch first 40 percent rows only' at line 1
mysql> select * from student fetch first 50 percent rows only;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'fetch first 50 percent rows only' at line 1
mysql> select top 5 * from student where enrollment_num = 100;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '5 * from student where enrollment_num = 100' at line 1
mysql> select top 5 * from student where branch = 'CSE' limit 3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '5 * from student where branch = 'CSE' limit 3' at line 1
mysql> select * from student where branch = 'CSE' limit 3;
+----------------+----------------+--------+------+--------+
| enrollment_num | name           | gender | age  | branch |
+----------------+----------------+--------+------+--------+
|             34 | Garvit Paliwal | M      |   19 | CSE    |
|            140 | Ram Sharma     | M      |   19 | CSE    |
+----------------+----------------+--------+------+--------+
2 rows in set (0.01 sec)

mysql>  select * from faculty;
+------------+-----------------+--------+------+------+------+-------------+
| Faculty_id | Name            | Gender | Age  | DOB  | Dept | Year_joined |
+------------+-----------------+--------+------+------+------+-------------+
| 101        | Rohit Mahajan   | M      |   30 | NULL | ME   |        2008 |
| 106        | Monika Jain     | F      |   25 | NULL | CSE  |        2009 |
| 102        | Karan Singh     | F      |   34 | NULL | IT   |        2012 |
| 102        | Karan Singh     | F      |   34 | NULL | IT   |        2012 |
| 110        | Jitendra Sharma | M      |   45 | NULL | CE   |        2005 |
| 107        | Sheetal Agrawal | F      |   40 | NULL | AU   |        2009 |
| 105        | Rahul Sharma    | M      |   51 | NULL | ME   |        2010 |
+------------+-----------------+--------+------+------+------+-------------+
7 rows in set (0.01 sec)

mysql>  select * from faculty where Name like R[a-z]a;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '[a-z]a' at line 1
mysql>  select * from faculty where Name R[a-z]a;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'R[a-z]a' at line 1
mysql>  select * from faculty where Name = 'R[a-z]a';
Empty set (0.00 sec)

mysql>  select * from faculty where Name = 'R[a-z]n';
Empty set (0.00 sec)

mysql>  select * from faculty where Dept = 'C[a-z]E';
Empty set (0.00 sec)

mysql>  select * from faculty where Dept = 'C[S]E';
Empty set (0.00 sec)

mysql>  select * from faculty where Dept = 'C[^S]E';
Empty set (0.00 sec)

mysql>  select * from student;
+----------------+-----------------+--------+------+--------+
| enrollment_num | name            | gender | age  | branch |
+----------------+-----------------+--------+------+--------+
|             44 | Aayushi Talreja | F      |   18 | EC     |
|            150 | Devansh Singh   | M      |   18 | ME     |
|            159 | Dipika Jain     | F      |   18 | IT     |
|             34 | Garvit Paliwal  | M      |   19 | CSE    |
|             39 | Gaurav Sharma   | M      |   18 | CSBS   |
|             47 | Kratik Mathur   | M      |   18 | ME     |
|             67 | Mohit Singhi    | M      |   18 | IT     |
|            140 | Ram Sharma      | M      |   19 | CSE    |
|            170 | Sakshi Sharma   | F      |   19 | AU     |
|            155 | Shruti Malviya  | F      |   18 | CE     |
+----------------+-----------------+--------+------+--------+
10 rows in set (0.00 sec)

mysql> insert into sutdent values(78, Keshav, M, 20, ME);
ERROR 1146 (42S02): Table 'college.sutdent' doesn't exist
mysql> insert into student values(78, Keshav, M, 20, ME);
ERROR 1054 (42S22): Unknown column 'Keshav' in 'field list'
mysql> insert into student values(78, "Keshav", "M", 20, "ME");
Query OK, 1 row affected (0.01 sec)

mysql>  select * from student where name = 'K[a-z]v'
    ->  select * from student where name = 'K[a-z]v';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select * from student where name = 'K[a-z]v'' at line 2
mysql>  select * from student;
+----------------+-----------------+--------+------+--------+
| enrollment_num | name            | gender | age  | branch |
+----------------+-----------------+--------+------+--------+
|             44 | Aayushi Talreja | F      |   18 | EC     |
|            150 | Devansh Singh   | M      |   18 | ME     |
|            159 | Dipika Jain     | F      |   18 | IT     |
|             34 | Garvit Paliwal  | M      |   19 | CSE    |
|             39 | Gaurav Sharma   | M      |   18 | CSBS   |
|             78 | Keshav          | M      |   20 | ME     |
|             47 | Kratik Mathur   | M      |   18 | ME     |
|             67 | Mohit Singhi    | M      |   18 | IT     |
|            140 | Ram Sharma      | M      |   19 | CSE    |
|            170 | Sakshi Sharma   | F      |   19 | AU     |
|            155 | Shruti Malviya  | F      |   18 | CE     |
+----------------+-----------------+--------+------+--------+
11 rows in set (0.00 sec)

mysql>  select * from student where name = 'K[a-z]v';
Empty set (0.01 sec)

mysql> select enrollment_num as studentID from student;
+-----------+
| studentID |
+-----------+
|        44 |
|       150 |
|       159 |
|        34 |
|        39 |
|        78 |
|        47 |
|        67 |
|       140 |
|       170 |
|       155 |
+-----------+
11 rows in set (0.00 sec)

mysql> select faculty_id from faculty as Teachers;
+------------+
| faculty_id |
+------------+
| 101        |
| 106        |
| 102        |
| 102        |
| 110        |
| 107        |
| 105        |
+------------+
7 rows in set (0.00 sec)

mysql> select Name from faculty as Teachers;
+-----------------+
| Name            |
+-----------------+
| Rohit Mahajan   |
| Monika Jain     |
| Karan Singh     |
| Karan Singh     |
| Jitendra Sharma |
| Sheetal Agrawal |
| Rahul Sharma    |
+-----------------+
7 rows in set (0.00 sec)

mysql> select enrollment_num as studentID, name as Full_Name from student;
+-----------+-----------------+
| studentID | Full_Name       |
+-----------+-----------------+
|        44 | Aayushi Talreja |
|       150 | Devansh Singh   |
|       159 | Dipika Jain     |
|        34 | Garvit Paliwal  |
|        39 | Gaurav Sharma   |
|        78 | Keshav          |
|        47 | Kratik Mathur   |
|        67 | Mohit Singhi    |
|       140 | Ram Sharma      |
|       170 | Sakshi Sharma   |
|       155 | Shruti Malviya  |
+-----------+-----------------+
11 rows in set (0.00 sec)

mysql> select * from student;
+----------------+-----------------+--------+------+--------+
| enrollment_num | name            | gender | age  | branch |
+----------------+-----------------+--------+------+--------+
|             44 | Aayushi Talreja | F      |   18 | EC     |
|            150 | Devansh Singh   | M      |   18 | ME     |
|            159 | Dipika Jain     | F      |   18 | IT     |
|             34 | Garvit Paliwal  | M      |   19 | CSE    |
|             39 | Gaurav Sharma   | M      |   18 | CSBS   |
|             78 | Keshav          | M      |   20 | ME     |
|             47 | Kratik Mathur   | M      |   18 | ME     |
|             67 | Mohit Singhi    | M      |   18 | IT     |
|            140 | Ram Sharma      | M      |   19 | CSE    |
|            170 | Sakshi Sharma   | F      |   19 | AU     |
|            155 | Shruti Malviya  | F      |   18 | CE     |
+----------------+-----------------+--------+------+--------+
11 rows in set (0.00 sec)

mysql> select enrollment_num, concat(name, " , ", branch);
ERROR 1054 (42S22): Unknown column 'enrollment_num' in 'field list'
mysql> select name, concat(name, " , ", branch);
ERROR 1054 (42S22): Unknown column 'name' in 'field list'
mysql> select enrollment_num, concat(name, " , ", branch) as Student_Name from student;
+----------------+----------------------+
| enrollment_num | Student_Name         |
+----------------+----------------------+
|             44 | Aayushi Talreja , EC |
|            150 | Devansh Singh , ME   |
|            159 | Dipika Jain , IT     |
|             34 | Garvit Paliwal , CSE |
|             39 | Gaurav Sharma , CSBS |
|             78 | Keshav , ME          |
|             47 | Kratik Mathur , ME   |
|             67 | Mohit Singhi , IT    |
|            140 | Ram Sharma , CSE     |
|            170 | Sakshi Sharma , AU   |
|            155 | Shruti Malviya , CE  |
+----------------+----------------------+
11 rows in set (0.01 sec)

mysql> select * from faculty limit 3;
+------------+---------------+--------+------+------+------+-------------+
| Faculty_id | Name          | Gender | Age  | DOB  | Dept | Year_joined |
+------------+---------------+--------+------+------+------+-------------+
| 101        | Rohit Mahajan | M      |   30 | NULL | ME   |        2008 |
| 106        | Monika Jain   | F      |   25 | NULL | CSE  |        2009 |
| 102        | Karan Singh   | F      |   34 | NULL | IT   |        2012 |
+------------+---------------+--------+------+------+------+-------------+
3 rows in set (0.00 sec)

mysql> select * from faculty d;