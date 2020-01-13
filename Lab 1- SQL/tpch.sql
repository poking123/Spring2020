CREATE TABLE public.region
(
    r_regionkey int NOT NULL,
    r_name char(25),
    r_comment varchar(152)
);

ALTER TABLE public.region ADD CONSTRAINT region_pkey PRIMARY KEY (r_regionkey);

CREATE TABLE public.nation
(
    n_nationkey int NOT NULL,
    n_name char(25),
    n_regionkey int NOT NULL,
    n_comment varchar(152)
);

ALTER TABLE public.nation ADD CONSTRAINT nation_pkey PRIMARY KEY (n_nationkey);

CREATE TABLE public.supplier
(
    s_suppkey int NOT NULL,
    s_name char(25),
    s_address varchar(40),
    s_nationkey int NOT NULL,
    s_phone char(15),
    s_acctbal float,
    s_comment varchar(101)
);

ALTER TABLE public.supplier ADD CONSTRAINT supplier_pkey PRIMARY KEY (s_suppkey);

CREATE TABLE public.part
(
    p_partkey int NOT NULL,
    p_name varchar(55),
    p_mfgr char(25),
    p_brand char(10),
    p_type varchar(25),
    p_size int,
    p_container char(10),
    p_retailprice float,
    p_comment varchar(23)
);

ALTER TABLE public.part ADD CONSTRAINT part_pkey PRIMARY KEY (p_partkey);

CREATE TABLE public.partsupp
(
    ps_partkey int NOT NULL,
    ps_suppkey int NOT NULL,
    ps_availqty int,
    ps_supplycost float,
    ps_comment varchar(199)
);

ALTER TABLE public.partsupp ADD CONSTRAINT partsupp_pkey PRIMARY KEY (ps_partkey, ps_suppkey);

CREATE TABLE public.customer
(
    c_custkey int NOT NULL,
    c_name varchar(25),
    c_address varchar(40),
    c_nationkey int NOT NULL,
    c_phone char(15),
    c_acctbal float,
    c_mktsegment char(10),
    c_comment varchar(117)
);

ALTER TABLE public.customer ADD CONSTRAINT customer_pkey PRIMARY KEY (c_custkey);

CREATE TABLE public.orders
(
    o_orderkey int NOT NULL,
    o_custkey int NOT NULL,
    o_orderstatus char(1),
    o_totalprice float,
    o_orderdate date,
    o_orderpriority char(15),
    o_clerk char(15),
    o_shippriority int,
    o_comment varchar(79)
);

ALTER TABLE public.orders ADD CONSTRAINT orders_pkey PRIMARY KEY (o_orderkey);

CREATE TABLE public.lineitem
(
    l_orderkey int NOT NULL,
    l_partkey int NOT NULL,
    l_suppkey int NOT NULL,
    l_linenumber int NOT NULL,
    l_quantity float,
    l_extendedprice float,
    l_discount float,
    l_tax float,
    l_returnflag char(1),
    l_linestatus char(1),
    l_shipdate date,
    l_commitdate date,
    l_receiptdate date,
    l_shipinstruct char(25),
    l_shipmode char(10),
    l_comment varchar(44)
);

ALTER TABLE public.lineitem ADD CONSTRAINT lineitem_pkey PRIMARY KEY (l_orderkey, l_linenumber);
ALTER TABLE public.nation ADD CONSTRAINT nation_fkey_region FOREIGN KEY (n_regionkey) references public.region (r_regionkey);
ALTER TABLE public.supplier ADD CONSTRAINT supplier_fkey_nation FOREIGN KEY (s_nationkey) references public.nation (n_nationkey);
ALTER TABLE public.partsupp ADD CONSTRAINT partsupp_fkey_part FOREIGN KEY (ps_partkey) references public.part (p_partkey);
ALTER TABLE public.partsupp ADD CONSTRAINT partsupp_fkey_supplier FOREIGN KEY (ps_suppkey) references public.supplier (s_suppkey);
ALTER TABLE public.customer ADD CONSTRAINT customer_fkey_nation FOREIGN KEY (c_nationkey) references public.nation (n_nationkey);
ALTER TABLE public.orders ADD CONSTRAINT orders_fkey_customer FOREIGN KEY (o_custkey) references public.customer (c_custkey);
ALTER TABLE public.lineitem ADD CONSTRAINT lineitem_fkey_orders FOREIGN KEY (l_orderkey) references public.orders (o_orderkey);
ALTER TABLE public.lineitem ADD CONSTRAINT lineitem_fkey_part FOREIGN KEY (l_partkey) references public.part (p_partkey);
ALTER TABLE public.lineitem ADD CONSTRAINT lineitem_fkey_supplier FOREIGN KEY (l_suppkey) references public.supplier (s_suppkey);
