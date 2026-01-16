-- Departments
-- public.departments definition

-- Drop table

-- DROP TABLE public.departments;

CREATE TABLE public.departments (
	department_id serial NOT NULL,
	department_name varchar(100) NOT NULL,
	CONSTRAINT departments_department_name_key UNIQUE (department_name),
	CONSTRAINT departments_pkey PRIMARY KEY (department_id)
);

-- Roles
-- public.roles definition

-- Drop table

-- DROP TABLE public.roles;

CREATE TABLE public.roles (
	role_id serial NOT NULL,
	role_name varchar(100) NOT NULL,
	description text NULL,
	CONSTRAINT roles_pkey PRIMARY KEY (role_id),
	CONSTRAINT roles_role_name_key UNIQUE (role_name)
);

-- Employees
-- public.employees definition

-- Drop table

-- DROP TABLE public.employees;

CREATE TABLE public.employees (
	employee_id serial NOT NULL,
	first_name varchar(100) NOT NULL,
	last_name varchar(100) NOT NULL,
	email varchar(50) NOT NULL,
	phone varchar(20) NULL,
	department_id int4 NOT NULL,
	role_id int4 NOT NULL,
	join_date date NOT NULL,
	status varchar(20) DEFAULT 'active'::character varying NOT NULL,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	updated_at timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	CONSTRAINT chk_status CHECK (((status)::text = ANY ((ARRAY['active'::character varying, 'inactive'::character varying])::text[]))),
	CONSTRAINT employees_email_key UNIQUE (email),
	CONSTRAINT employees_pkey PRIMARY KEY (employee_id)
);


-- public.employees foreign keys

ALTER TABLE public.employees ADD CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES public.departments(department_id) ON DELETE RESTRICT;
ALTER TABLE public.employees ADD CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON DELETE RESTRICT;
