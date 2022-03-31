-- Source Database is a PostgreSQL database
--   MOTO_SALES schema is first source

--NOTE: creating gps data type in public schema so dropping it if it already existed before.
do $$
  begin
		create type gps as (
			latitude  numeric,
			longitude numeric,
			elevation numeric
		);
	exception when others then
    raise notice 'type gps already exists';
end;
$$;


drop schema if exists moto_sales_mtd_ref cascade;
create schema if not exists moto_sales_mtd_ref authorization vaultspeed;

drop sequence if exists moto_sales_mtd_ref.load_cycle_seq;
create sequence moto_sales_mtd_ref.load_cycle_seq start 1 increment 1;

drop table if exists moto_sales_mtd_ref.load_cycle_info cascade;
create table moto_sales_mtd_ref.load_cycle_info (
	load_cycle_id numeric   null,
	load_date     timestamp null
);

drop table if exists moto_sales_mtd_ref.fmc_loading_window_table cascade;
create table if not exists moto_sales_mtd_ref.fmc_loading_window_table (
	fmc_begin_lw_timestamp timestamp,
	fmc_end_lw_timestamp   timestamp
);

DROP TABLE IF EXISTS moto_sales_mtd_ref.mtd_exception_records CASCADE;
CREATE TABLE moto_sales_mtd_ref.mtd_exception_records
( 
	attribute_character varchar(4) NULL,
	attribute_date varchar(19) NULL,
	attribute_gps varchar NULL,
	attribute_integer varchar(11) NULL,
	attribute_numeric varchar(13) NULL,
	attribute_timestamp varchar(19) NULL,
	attribute_varchar varchar(4) NULL,
	key_attribute_character varchar(4) NULL,
	key_attribute_date varchar(19) NULL,
	key_attribute_gps VARCHAR null,
	key_attribute_integer varchar(11) NULL,
	key_attribute_numeric varchar(13) NULL,
	key_attribute_timestamp varchar(19) NULL,
	key_attribute_varchar varchar(4) NULL,
	load_cycle_id numeric,
	record_type varchar(4) NULL
);

insert into moto_sales_mtd_ref.mtd_exception_records
	(load_cycle_id, record_type, key_attribute_gps, attribute_gps,
	 key_attribute_numeric, attribute_numeric, key_attribute_timestamp, attribute_timestamp,
	 key_attribute_date, attribute_date, key_attribute_varchar, attribute_varchar,
	 key_attribute_character, attribute_character, key_attribute_integer, attribute_integer)
values
	('-1', 'N', '(-1,-1,-1)', '(-1,-1,-1)',
	 '-999999999999', '-999999999999', '01/01/2999 00:00:00', '01/01/2999 00:00:00',
	 '31/12/2499', '31/12/2499', '~NL~', '~NL~',
	 '~NL~', '~NL~', '-2147483648', '-2147483648');

insert into moto_sales_mtd_ref.mtd_exception_records
	(load_cycle_id, record_type, key_attribute_gps, attribute_gps,
	 key_attribute_numeric, attribute_numeric, key_attribute_timestamp, attribute_timestamp,
	 key_attribute_date, attribute_date, key_attribute_varchar, attribute_varchar,
	 key_attribute_character, attribute_character, key_attribute_integer, attribute_integer)
values
	('-2', 'U', '(-2,-2,-2)', '(-2,-2,-2)',
	 '-999999999998', '-999999999998', '01/01/2899 00:00:00', '01/01/2899 00:00:00',
	 '31/12/2599', '31/12/2599', '~UN~', '~UN~',
	 '~UN~', '~UN~', '-2147483647', '-2147483647');


------------------------------------------------------------------------------------------------------------------------


drop schema if exists moto_sales cascade;
create schema if not exists moto_sales authorization vaultspeed;


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_sales.addresses cascade;

create table if not exists moto_sales.addresses (
	address_number   serial,
	street_name      varchar(50),
	street_number    numeric,
	postal_code      varchar(6),
	city             varchar(50),
	coordinates      gps,
	update_user      varchar(30),
	update_timestamp timestamp not null default current_timestamp
);

comment on table moto_sales.addresses is 'Table with business key containing all descriptive fields. All the Business keys will also become descriptive fields in the Satellite. It means no history of change is possible and Insert only logic should be applied';

alter table moto_sales.addresses
	drop constraint if exists moto_addresses_pk;

alter table moto_sales.addresses
	add constraint moto_addresses_pk primary key (address_number);

alter table moto_sales.addresses
	add constraint moto_addresses_uk unique (street_name, street_number, postal_code, city);

alter table moto_sales.addresses
	drop constraint if exists moto_addresses_uk;


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_sales.customers cascade;

create table if not exists moto_sales.customers (
	customer_number             serial,
	national_person_id          varchar(20),
	first_name                  varchar(50),
	last_name                   varchar(50),
	birthdate                   date,
	gender                      char(8),
	customer_invoice_address_id integer,
	customer_ship_to_address_id integer,
	update_user                 varchar(30),
	update_timestamp            timestamp not null default current_timestamp
);

comment on table moto_sales.customers is 'Table with multiple foreign keys to the same table. The Business Key is a Universal Key based on the NATIONAL_PERSON_ID and It will become a multi master Hub based on this customer table and party in the marketing model.
It is also a test to see if link tables do not loose data because there are null values in the relationships in the source table';

alter table moto_sales.customers
	drop constraint if exists moto_customers_pk;

alter table moto_sales.customers
	add constraint moto_customers_pk primary key (customer_number);


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_sales.invoices cascade;

create table if not exists moto_sales.invoices (
	invoice_number      serial,
	invoice_date        date,
	invoice_customer_id numeric,
	amount              numeric(14,2),
	discount            integer,
	update_user         varchar(30),
	update_timestamp    timestamp not null default current_timestamp
);

comment on table moto_sales.invoices is 'The foreign key between Invoices and Customers will not be created and needs to be defined manually in the FA 4.0';

alter table moto_sales.invoices
	drop constraint if exists moto_invoices_pk;

alter table moto_sales.invoices
	add constraint moto_invoices_pk primary key (invoice_number);


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_sales.moto_parts cascade;

create table if not exists moto_sales.moto_parts (
	part_id            serial,
	part_number        varchar(50) not null,
	part_language_code varchar(10),
	update_user        varchar(30),
	update_timestamp   timestamp not null default current_timestamp
);

comment on table moto_sales.moto_parts is 'Self reference Object with combined Business Key PART_NUMBER and PART_LANGUAGE_CODE separate from the Primary Key.
	Also Language code towards a resulting reference table in Data Vault. Name Moto will need to be filtered out of name
	The Business Key can be extracted from the Unique Key. There are no attributes apart form the Business Keys so they need to be repeated in the Satellite';

alter table moto_sales.moto_parts
	drop constraint if exists parts_pk;

alter table moto_sales.moto_parts
	add constraint parts_pk primary key (part_id);

alter table moto_sales.moto_parts
	drop constraint if exists moto_parts_uk;

alter table moto_sales.moto_parts
	add constraint moto_parts_uk unique (part_number, part_language_code);


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_sales.moto_products cascade;

create table if not exists moto_sales.moto_products (
	product_id             serial,
	replacement_product_id integer,
	product_cc             numeric,
	product_et_code        char(10),
	product_part_code      varchar(50),
	product_intro_date     date,
	product_name           varchar(100),
	update_user            varchar(30),
	update_timestamp       timestamp not null default current_timestamp
);
comment on table moto_sales.moto_products is 'Table with self reference and multiple columns in Business Key.  Also the prefix MOTO will be deleted out of the name of the MOTO_PRODUCTS.  Its a multi-source multi-master object.';

create unique index if not exists moto_products_uk_idx on moto_sales.moto_products(product_cc asc, product_et_code asc, product_part_code asc);
  
alter table moto_sales.moto_products
	drop constraint if exists moto_products_pk;

alter table moto_sales.moto_products
	add constraint moto_products_pk primary key (product_id);


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_sales.invoice_lines cascade;

create table if not exists moto_sales.invoice_lines (
	invoice_line_number serial,
	invoice_number      integer not null,
	product_id          integer,
	part_id             integer,
	amount              numeric(14, 2),
	quantity            numeric(12),
	unit_price          numeric(14, 2),
	update_user         varchar(30),
	update_timestamp    timestamp not null default current_timestamp
);

comment on table moto_sales.invoice_lines is 'Combined primary key INVOICE_LINE_NUMBER and INVOICE_NUMBER and multiple foreign keys to different Objects respectively to PRODUCT and PART
	The PRODUCT and PART relationships are mutual exclusive so also a check if the right data is stored in the relationships';

alter table moto_sales.invoice_lines
	drop constraint if exists moto_invoice_lines_pk;

alter table moto_sales.invoice_lines
	add constraint moto_invoice_lines_pk primary key (invoice_number, invoice_line_number);


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_sales.product_feature_class cascade;

create table if not exists moto_sales.product_feature_class (
	product_feature_class_id   int,
	product_feature_class_code varchar(20),
	product_feature_class_desc varchar(50),
	update_user                varchar(30),
	update_timestamp           timestamp not null default current_timestamp
);

comment on table moto_sales.product_feature_class is 'Simple object with description in object only English PRODUCT_FEATURE_CLASS_CODE is the Business Key and can be harvested trough the Unique Key Constraint';

alter table moto_sales.product_feature_class
	drop constraint if exists product_feature_class_pk;

alter table moto_sales.product_feature_class
	add constraint product_feature_class_pk primary key (product_feature_class_id);

alter table moto_sales.product_feature_class
	drop constraint if exists product_feature_class_uk;

alter table moto_sales.product_feature_class
	add constraint product_feature_class_uk unique (product_feature_class_code);


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_sales.product_feature_cat cascade;

create table if not exists moto_sales.product_feature_cat (
	product_feature_category_id   serial,
	product_feature_category_code varchar(50),
	prod_feat_cat_language_code   varchar(10),
	prod_feat_cat_description     varchar(60),
	update_user                   varchar(30),
	update_timestamp              timestamp not null default current_timestamp
);

comment on table moto_sales.product_feature_cat is 'Multi-Active Object with Attribute based SubSequence source attributePROD_FEAT_CAT_LANGUAGE_CODE and Business Keys is PRODUCT_FEATURE_CATEGORY_CODE. The Business Key PROD_FEAT_CAT_LANGUAGE_CODE and the SubSequence source attribute PROD_FEAT_CAT_LANGUAGE_CODE are not defined as attribute of the Satellite';
  
alter table moto_sales.product_feature_cat
	drop constraint if exists product_feature_cat_pk;

alter table moto_sales.product_feature_cat
	add constraint product_feature_cat_pk primary key (product_feature_category_id);


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_sales.product_features cascade;

create table if not exists moto_sales.product_features (
	product_feature_id            serial,
	product_feature_cat_id        integer,
	product_feature_code          varchar(20),
	product_feature_language_code varchar(10),
	product_feature_description   varchar(60),
	update_user                   varchar(30),
	update_timestamp              timestamp not null default current_timestamp
);

comment on table moto_sales.product_features is 'Multi-Active Object with Attribute based SubSequence source attrubute PRODUCT_FEATURE_LANGUAGE_CODE and Business Keys is PRODUCT_FEATURE_CODE. The link to PRODUCT_FEATURE_CAT is based on the PK - FK relationship without the subsequence source attribute';

alter table moto_sales.product_features
	drop constraint if exists moto_product_features_pk;

alter table moto_sales.product_features
	add constraint moto_product_features_pk primary key (product_feature_id);


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_sales.product_feat_class_rel cascade;

create table if not exists moto_sales.product_feat_class_rel (
	product_feature_id       serial,
	product_id               integer,
	product_feature_class_id integer,
	update_user              varchar(30),
	update_timestamp         timestamp not null default current_timestamp
);

comment on table moto_sales.product_feat_class_rel is 'This Object will become a Many to Many link with 3 relationships in the Data Vault Model, with attributes and the PRODUCT_ID and PRODUCT_FEATURE_ID as the driving keys';

alter table moto_sales.product_feat_class_rel
	drop constraint if exists product_feat_class_rel_uk;

alter table moto_sales.product_feat_class_rel
	add constraint product_feat_class_rel_uk unique (product_feature_id, product_id, product_feature_class_id);


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_sales.codes_to_language cascade;

create table if not exists moto_sales.codes_to_language (
	code              varchar(50),
	language_code     varchar(10),
	description       varchar(512),
	update_user       varchar(30),
	update_timestamp  timestamp not null default current_timestamp
);

comment on table moto_sales.codes_to_language is 'This will become a reference table in the RDV';

alter table moto_sales.codes_to_language
	drop constraint if exists codes_to_language_pk;

alter table moto_sales.codes_to_language
	add constraint codes_to_language_pk primary key (code, language_code);


------------------------------------------------------------------------------------------------------------------------


alter table moto_sales.customers
	drop constraint if exists moto_cust_inv_adr_fk;

alter table moto_sales.customers
	add constraint moto_cust_inv_adr_fk foreign key (customer_invoice_address_id) references moto_sales.addresses(address_number);

alter table moto_sales.customers
	drop constraint if exists moto_cust_shto_adr_fk;

alter table moto_sales.customers
	add constraint moto_cust_shto_adr_fk foreign key (customer_ship_to_address_id) references moto_sales.addresses(address_number);

alter table moto_sales.invoices
	drop constraint if exists moto_inv_cust_fk;

alter table moto_sales.invoice_lines
	drop constraint if exists invoice_lines_parts_fk;

alter table moto_sales.invoice_lines
	add constraint invoice_lines_parts_fk foreign key (part_id) references moto_sales.moto_parts(part_id);

alter table moto_sales.invoice_lines
	drop constraint if exists moto_invln_prod_fk;

alter table moto_sales.invoice_lines
	add constraint moto_invln_prod_fk foreign key (product_id) references moto_sales.moto_products(product_id);

alter table moto_sales.product_features
	drop constraint if exists product_features_fk;

alter table moto_sales.product_features
	add constraint product_features_fk foreign key (product_feature_cat_id) -- Different names in the referenced tables
		references moto_sales.product_feature_cat(product_feature_category_id);

alter table moto_sales.product_feat_class_rel
	drop constraint if exists product_feat_class_rel_prod_fk;

alter table moto_sales.product_feat_class_rel
	add constraint -- More than 2 relations in Many to Many link
		product_feat_class_rel_prod_fk foreign key (product_id) references moto_sales.moto_products(product_id);

alter table moto_sales.product_feat_class_rel
	drop constraint if exists product_feat_class_rel_feat_fk;

alter table moto_sales.product_feat_class_rel
	drop constraint if exists product_feat_class_rel_class_fk;

alter table moto_sales.invoice_lines
	drop constraint if exists moto_inv_lin_inv_fk;

alter table moto_sales.invoice_lines
	add constraint moto_inv_lin_inv_fk foreign key (invoice_number) references moto_sales.invoices(invoice_number);

alter table moto_sales.moto_products
	drop constraint if exists moto_prod_repl_prod_fk;

alter table moto_sales.moto_products
	add constraint moto_prod_repl_prod_fk foreign key (replacement_product_id) references moto_sales.moto_products(product_id);

------------------------------------------------------------------------------------------------------------------------

drop table if exists moto_sales.payments;
create table if not exists moto_sales.payments
(
  transaction_id   varchar(32)             not null
    constraint payments_pk primary key,
  date_time        timestamp               not null,
  invoice_number   numeric                 not null,
  amount           numeric(14, 2)          not null,
  customer_number  numeric                 not null,
  update_timestamp timestamp default clock_timestamp() not null
);


------------------------------------------------------------------------------------------------------------------------

drop table if exists moto_sales.cust_addresses cascade;

create table if not exists moto_sales.cust_addresses (
	customer_number  numeric,
	address_number   numeric,
	address_type     varchar(3),
	update_user      varchar(30),
	update_timestamp timestamp not null
);
comment on table moto_sales.cust_addresses is 'This Object will become a Many to Many link with only masters and subsequence attribute as part of the key of the satellite on link';


alter table moto_sales.cust_addresses
	drop constraint if exists ppriv_cust_addresses_uk;

alter table moto_sales.cust_addresses
	add constraint priv_cust_addresses_rel_uk unique (customer_number, address_number, address_type);


------------------------------------------------------------------------------------------------------------------------

commit;

do
$$  -- executes the DDL to create the jrn objects in moto_sales
declare
 
	rec record;
  rec_fk record;
  
begin
 
	for rec in select table_name from information_schema.tables where table_schema = 'moto_sales' and table_name not like 'jrn_%'
	loop
	  execute concat('DROP TABLE IF EXISTS moto_sales.jrn_',rec.table_name,' CASCADE;');
	  execute concat(
	    'create table moto_sales.jrn_',rec.table_name,' (
				operation       char(1),
				trans_timestamp timestamp,
				like moto_sales.',rec.table_name,'
			);');
	 
	end loop;

end;
$$;


create or replace function moto_sales.create_jrn_func(
  ptable_name varchar
) returns text as
$create_jrn_func$
begin

	return concat('
		create or replace function moto_sales.cdc_',ptable_name,'(
		) returns trigger as
		$$
		begin
			--
			-- Create a row in jrn_',ptable_name,' to reflect the operation performed on ',ptable_name,',
			-- make use of the special variable TG_OP to work out the operation.
			--
			if (tg_op = ''DELETE'') then
				insert into moto_sales.jrn_',ptable_name,' select ''D'', clock_timestamp(), old.*;
				return old;
			elsif (tg_op = ''UPDATE'') then
				insert into moto_sales.jrn_',ptable_name,' select ''U'', clock_timestamp(), new.*;
				return new;
			elsif (tg_op = ''INSERT'') then
				insert into moto_sales.jrn_',ptable_name,' select ''I'', clock_timestamp(), new.*;
				return new;
			end if;
			return null; -- result is ignored since this is an AFTER trigger
		end;
		$$
			language plpgsql;
	');
end;
$create_jrn_func$ language plpgsql;


do
$$  -- executes the DDL to create the jrn triggers in moto_sales
declare
 
	rec record;
 
begin
 
	for rec in select table_name from information_schema.tables where table_schema = 'moto_sales' and table_name not like 'jrn_%'
	loop
	  execute moto_sales.create_jrn_func(rec.table_name::varchar);
	  execute concat('
	    drop trigger if exists trg_',rec.table_name,' on moto_sales.',rec.table_name,' cascade;
			create trigger trg_',rec.table_name,'
				after insert or update or delete
				on moto_sales.',rec.table_name,'
				for each row
			execute procedure moto_sales.cdc_',rec.table_name,'();');
	 
	end loop;

end;
$$;

commit;

------------------------------------------------------------------------------------------------------------------------

do
$$
	declare
		schema_tables cursor for select
			                         'ALTER TABLE moto_sales.' || table_name || ' DISABLE TRIGGER ALL' as stmnt
		                         from information_schema.tables
		                         where table_schema = 'moto_sales'
		                         order by table_name ;
	
	begin
		
		for s in schema_tables
		loop
			execute s.stmnt;
		end loop;
	end
$$;
