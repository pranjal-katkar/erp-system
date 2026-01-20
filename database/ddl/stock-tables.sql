--stock_transactions table

-- public.stock_transactions definition

-- Drop table

-- DROP TABLE public.stock_transactions;

CREATE TABLE public.stock_transactions (
	transaction_id serial4 NOT NULL,
	item_id int4 NOT NULL,
	quantity_change int4 NOT NULL,
	transaction_type varchar(20) NOT NULL,
	transaction_date timestamp DEFAULT CURRENT_TIMESTAMP NULL,
	reference_po_id int4 NULL,
	remarks text NULL,
	CONSTRAINT chk_transaction_type CHECK (((transaction_type)::text = ANY ((ARRAY['in'::character varying, 'out'::character varying, 'adjustment'::character varying])::text[]))),
	CONSTRAINT stock_transactions_pkey PRIMARY KEY (transaction_id)
);


-- public.stock_transactions foreign keys

ALTER TABLE public.stock_transactions ADD CONSTRAINT fk_stock_item FOREIGN KEY (item_id) REFERENCES public.items(item_id) ON DELETE RESTRICT;
ALTER TABLE public.stock_transactions ADD CONSTRAINT fk_stock_po FOREIGN KEY (reference_po_id) REFERENCES public.purchase_orders(po_id) ON DELETE SET NULL;