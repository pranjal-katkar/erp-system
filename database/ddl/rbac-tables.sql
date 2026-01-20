--users table
-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (
	user_id serial4 NOT NULL,
	username varchar(50) NOT NULL,
	email varchar(100) NOT NULL,
	password_hash varchar(255) NOT NULL,
	role_id int4 NOT NULL,
	is_active bool DEFAULT true NULL,
	CONSTRAINT users_email_key UNIQUE (email),
	CONSTRAINT users_pkey PRIMARY KEY (user_id),
	CONSTRAINT users_username_key UNIQUE (username)
);


-- public.users foreign keys

ALTER TABLE public.users ADD CONSTRAINT fk_user_role FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON DELETE RESTRICT;


--permissions table
-- public.permissions definition

-- Drop table

-- DROP TABLE public.permissions;

CREATE TABLE public.permissions (
	permission_id serial4 NOT NULL,
	permission_name varchar(100) NOT NULL,
	CONSTRAINT permissions_permission_name_key UNIQUE (permission_name),
	CONSTRAINT permissions_pkey PRIMARY KEY (permission_id)
);


--role_permissions table
-- public.role_permissions definition

-- Drop table

-- DROP TABLE public.role_permissions;

CREATE TABLE public.role_permissions (
	role_id int4 NOT NULL,
	permission_id int4 NOT NULL,
	CONSTRAINT role_permissions_pkey PRIMARY KEY (role_id, permission_id)
);


-- public.role_permissions foreign keys

ALTER TABLE public.role_permissions ADD CONSTRAINT fk_rp_permission FOREIGN KEY (permission_id) REFERENCES public.permissions(permission_id) ON DELETE CASCADE;
ALTER TABLE public.role_permissions ADD CONSTRAINT fk_rp_role FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON DELETE CASCADE;