--1 Crcreate a table named "Employees" with columns for ID (integer), Name (varchar), and Salary (decimal).--
--7 Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").--
CREATE TABLE EMPLOYEES
(
EMP_ID INT,
PROJECT_ID INT,
EMP_NAME VARCHAR(20),
EMP_SALARY DECIMAL(20,2) NOT NULL,
CONSTRAINT EMPLOYEES_PK PRIMARY KEY(EMP_ID),
CONSTRAINT PROJECTS_FK FOREIGN KEY(PROJECT_ID)
REFERENCES PROJECTS(PROJECT_ID)
);
--2 Add a new column named "Department" to the "Employees" table with data type varchar(50).--
ALTER TABLE EMPLOYEES
ADD DEPARTMENT VARCHAR(50) NOT NULL;

--3 Remove the "Salary" column from the "Employees" table--
ALTER TABLE EMPLOYEES
DROP COLUMN SALARY;

--4 Rename the "Department" column in the "Employees" table to "DeptName".--

EXEC SP_RENAME 'EMPLOYEES.Department', 'DeptName', 'COLUMN';

--5 Create a new table called "Projects" with columns for ProjectID (integer) and ProjectName (varchar).--
--7	Create a foreign key relationship between the "Employees" table (referencing "ID") and the "Projects" table (referencing "ProjectID").--
CREATE TABLE PROJECTS
(
EMP_ID INT,
PROJECT_ID INT,
PROJECT_NAME VARCHAR (20),
CONSTRAINT EMPLOYEES_FK FOREIGN KEY(EMP_ID)
REFERENCES EMPLOYEES(EMP_ID)
);

--6 Add a primary key constraint to the "Employees" table for the "ID" column.--
ALTER TABLE EMPLOYEES
ADD CONSTRAINT EMPLOYEES_PK PRIMARY KEY (EMP_ID)

--8 Remove the foreign key relationship between "Employees" and "Projects."--
ALTER TABLE EMPLOYEES
DROP CONSTRAINT EMPLOYEES_FK;

ALTER TABLE PROJECTS
DROP CONSTRAINT PROJECTS_FK;

--9 Add a unique constraint to the "Name" column in the "Employees" table.--
ALTER TABLE EMPLOYEES
ADD CONSTRAINT EMP_NAME_UQ UNIQUE (EMP_NAME);

-- 10 Create a table named "Customers" with columns for CustomerID (integer), FirstName (varchar), LastName (varchar),
--and Email (varchar), and Status (varchar).--
CREATE TABLE CUSTOMERS
(
CASTOMER_ID INT,
FIRST_NAME VARCHAR(20),
LAST_NAME VARCHAR (20),
EMAIL VARCHAR(20),
STATUS VARCHAR (20)
);

-- 11 Add a unique constraint to the combination of "FirstName" and "LastName" columns in the "Customers" table--
ALTER TABLE CUSTOMERS
ADD CONSTRAINT FIRST_NAME_LAST_NAME UNIQUE(FIRST_NAME,LAST_NAME);

--12 Add a default value of 'Active' for the "Status" column in the "Customers" table, where the default value should be applied when a new record is inserted.--
ALTER TABLE Customers
ADD CONSTRAINT DF_Status DEFAULT 'Active' FOR Status;
-- 13 Create a table named "Orders" with columns for OrderID (integer), CustomerID (integer), OrderDate (datetime), and TotalAmount (decimal).--
CREATE TABLE ORDERS
(
ORDER_ID INT,
Customer_ID INT,
ORDER_DATE DATETIME,
TOTAL_AMOUNT DECIMAL(10,3)
);

--14 Add a check constraint to the "TotalAmount" column in the "Orders" table to ensure that it is greater than zero.
ALTER TABLE ORDERS
ADD CONSTRAINT ORDERS_CH CHECK(TOTAL_AMOUNT>0);

--15 Create a schema named "Sales" and move the "Orders" table into this schema.--
CREATE SCHEMASALES.ORDERS;

--16 Rename the "Orders" table to "SalesOrders."--
EXEC sp_rename 'Orders', 'SalesOrders';




