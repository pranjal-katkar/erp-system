-- categories table
-- public.categories definition

-- Drop table

-- DROP TABLE public.categories;

CREATE TABLE public.categories (
	category_id serial4 NOT NULL,
	category_name varchar(100) NOT NULL,
	CONSTRAINT categories_category_name_key UNIQUE (category_name),
	CONSTRAINT categories_pkey PRIMARY KEY (category_id)
);

-- suppliers table
-- public.suppliers definition

-- Drop table

-- DROP TABLE public.suppliers;

CREATE TABLE public.suppliers (
	supplier_id serial4 NOT NULL,
	supplier_name varchar(150) NOT NULL,
	contact_person varchar(100) NULL,
	phone varchar(20) NULL,
	email varchar(100) NULL,
	CONSTRAINT suppliers_email_key UNIQUE (email),
	CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id)
);

-- items table
-- public.items definition

-- Drop table

-- DROP TABLE public.items;

CREATE TABLE public.items (
	item_id serial4 NOT NULL,
	item_name varchar(150) NOT NULL,
	category_id int4 NOT NULL,
	sku varchar(50) NOT NULL,
	description text NULL,
	cost_price numeric(10, 2) NOT NULL,
	selling_price numeric(10, 2) NOT NULL,
	current_stock int4 DEFAULT 0 NULL,
	min_stock int4 DEFAULT 0 NULL,
	max_stock int4 DEFAULT 0 NULL,
	CONSTRAINT items_pkey PRIMARY KEY (item_id),
	CONSTRAINT items_sku_key UNIQUE (sku)
);


-- public.items foreign keys

ALTER TABLE public.items ADD CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES public.categories(category_id) ON DELETE RESTRICT;

