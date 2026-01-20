--expenses table

-- public.expenses definition

-- Drop table

-- DROP TABLE public.expenses;

CREATE TABLE public.expenses (
	expense_id serial4 NOT NULL,
	expense_category varchar(100) NOT NULL,
	amount numeric(12, 2) NOT NULL,
	expense_date date DEFAULT CURRENT_DATE NULL,
	description text NULL,
	payment_method varchar(50) NULL,
	linked_po_id int4 NULL,
	CONSTRAINT expenses_amount_check CHECK ((amount > (0)::numeric)),
	CONSTRAINT expenses_pkey PRIMARY KEY (expense_id)
);


-- public.expenses foreign keys

ALTER TABLE public.expenses ADD CONSTRAINT fk_expense_po FOREIGN KEY (linked_po_id) REFERENCES public.purchase_orders(po_id) ON DELETE SET NULL;