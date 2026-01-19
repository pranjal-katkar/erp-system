-- purchase_orders table
-- public.purchase_orders definition

-- Drop table

-- DROP TABLE public.purchase_orders;

CREATE TABLE public.purchase_orders (
	po_id serial4 NOT NULL,
	supplier_id int4 NOT NULL,
	order_date date DEFAULT CURRENT_DATE NULL,
	delivery_date date NULL,
	status varchar(20) DEFAULT 'draft'::character varying NOT NULL,
	created_by int4 NOT NULL,
	approved_by int4 NULL,
	CONSTRAINT chk_po_status CHECK (((status)::text = ANY ((ARRAY['draft'::character varying, 'approved'::character varying, 'ordered'::character varying, 'delivered'::character varying, 'closed'::character varying])::text[]))),
	CONSTRAINT purchase_orders_pkey PRIMARY KEY (po_id)
);


-- public.purchase_orders foreign keys

ALTER TABLE public.purchase_orders ADD CONSTRAINT fk_po_supplier FOREIGN KEY (supplier_id) REFERENCES public.suppliers(supplier_id) ON DELETE RESTRICT;


--purchase_order_items table
-- public.purchase_order_items definition

-- Drop table

-- DROP TABLE public.purchase_order_items;

CREATE TABLE public.purchase_order_items (
	po_item_id serial4 NOT NULL,
	po_id int4 NOT NULL,
	item_id int4 NOT NULL,
	quantity int4 NOT NULL,
	price numeric(10, 2) NOT NULL,
	CONSTRAINT purchase_order_items_pkey PRIMARY KEY (po_item_id),
	CONSTRAINT purchase_order_items_quantity_check CHECK ((quantity > 0))
);


-- public.purchase_order_items foreign keys

ALTER TABLE public.purchase_order_items ADD CONSTRAINT fk_poi_item FOREIGN KEY (item_id) REFERENCES public.items(item_id) ON DELETE RESTRICT;
ALTER TABLE public.purchase_order_items ADD CONSTRAINT fk_poi_po FOREIGN KEY (po_id) REFERENCES public.purchase_orders(po_id) ON DELETE CASCADE;
