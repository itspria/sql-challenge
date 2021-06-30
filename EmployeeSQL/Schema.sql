--Create employee table
CREATE  TABLE employee ( 
	emp_no               varchar(12) NOT NULL,
	emp_title_id         varchar(12)   ,
	birth_date           varchar(12)   ,
	first_name           varchar(50)   ,
	last_name            varchar(50)   ,
	sex                  varchar(5)   ,
	hire_date            varchar(12)   ,
	CONSTRAINT pk_employee_emp_no PRIMARY KEY ( emp_no )
);
 
 --Create titles table
CREATE  TABLE titles ( 
	title_id             varchar(12)  NOT NULL ,
	title                varchar(50)   ,
	CONSTRAINT pk_titles_title_id PRIMARY KEY ( title_id )
);

--Create salaries table
CREATE  TABLE salaries ( 
	emp_no               varchar(12)   ,
	salary               integer   
 );

--Create department table
CREATE  TABLE department ( 
	dept_no              varchar(10)  NOT NULL ,
	dept_name            varchar(100)   ,
	CONSTRAINT pk_department_dept_no PRIMARY KEY ( dept_no )
 );

--Create dept_manager table
CREATE  TABLE dept_manager ( 
	dept_no              varchar(10)   ,
	emp_no               varchar(12)   
 );

--Create dept_employee table
CREATE  TABLE dept_emp ( 
	emp_no               varchar(12)   ,
	dept_no              varchar(10)   
 );

--Adding foreign key ref to dept_no in dept_emp table
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_department FOREIGN KEY ( dept_no ) REFERENCES department( dept_no );

--Adding foreign key ref to emp_no in dept_emp table
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_employee FOREIGN KEY ( emp_no ) REFERENCES employee( emp_no );

--Adding foreign key ref to emp_no in dept_manager table
ALTER TABLE dept_manager ADD CONSTRAINT fk_emp_no FOREIGN KEY ( emp_no ) REFERENCES employee( emp_no );

--Adding foreign key ref to dept_no in dept_manager table
ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_department FOREIGN KEY ( dept_no ) REFERENCES department( dept_no );

--Adding foreign key to emp_no in salaries table
ALTER TABLE salaries ADD CONSTRAINT fk_salaries_employee FOREIGN KEY ( emp_no ) REFERENCES employee( emp_no ); 
 
--Adding foreign key to title id in employee table
ALTER TABLE employee ADD CONSTRAINT fk_employee_titles FOREIGN KEY ( emp_title_id ) REFERENCES titles( title_id );
