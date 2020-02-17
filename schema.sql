### Schema

CREATE DATABASE employeeTracker_db;
USE employeeTracker_db;

CREATE TABLE `employeeTracker_db`.`department_table` (
  `dept_id_int` INT NOT NULL,
  `name_varchar` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`dept_id_int`));


CREATE TABLE `employeeTracker_db`.`role_table` (
  `role_id_int` INT NOT NULL AUTO_INCREMENT,
  `title_varcher` VARCHAR(30) NOT NULL,
  `salary_decimal` DECIMAL(8,2) NOT NULL,
  `dept_id_int` INT NOT NULL, 
	FOREIGN KEY (`dept_id_int`) REFERENCES `department_table`(`dept_id_int`),
  PRIMARY KEY (`role_id_int`));
  
  CREATE TABLE `employeeTracker_db`.`employee_table` (
  `emp_id_int` INT NOT NULL AUTO_INCREMENT,
  `first_name_varcher` VARCHAR(30) NOT NULL,
  `last_name_varcher` VARCHAR(30) NOT NULL,
  `role_id_int` INT NOT NULL, 
  `manager_id_int` INT NULL, 
	FOREIGN KEY (`role_id_int`) REFERENCES `role_table`(`role_id_int`),
  PRIMARY KEY (`emp_id_int`));


###not working...
ALTER TABLE `employee_table`
ADD CONSTRAINT `FK_employee_table`
FOREIGN KEY (`manager_id_int`) REFERENCES `employee_table`(`manager_id_int`);


  
  
