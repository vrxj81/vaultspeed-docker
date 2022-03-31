-- Source Database is a PostgreSQL database
--   MOTO_MKTG schema is second source


drop schema if exists moto_mktg_mtd_ref cascade;
create schema if not exists moto_mktg_mtd_ref authorization vaultspeed;

drop sequence if exists moto_mktg_mtd_ref.load_cycle_seq;
create sequence moto_mktg_mtd_ref.load_cycle_seq start 1 increment 1;

drop table if exists moto_mktg_mtd_ref.load_cycle_info cascade;
create table moto_mktg_mtd_ref.load_cycle_info (
	load_cycle_id numeric   null,
	load_date     timestamp null
);

drop table if exists moto_mktg_mtd_ref.fmc_loading_window_table cascade;
create table if not exists moto_mktg_mtd_ref.fmc_loading_window_table (
	fmc_begin_lw_timestamp timestamp,
	fmc_end_lw_timestamp   timestamp
);

DROP TABLE IF EXISTS moto_mktg_mtd_ref.mtd_exception_records CASCADE;
CREATE TABLE moto_mktg_mtd_ref.mtd_exception_records
(
	attribute_character varchar(4) NULL,
	attribute_date varchar(19) NULL,
	attribute_integer varchar(11) NULL,
	attribute_numeric varchar(13) NULL,
	attribute_timestamp varchar(19) NULL,
	attribute_varchar varchar(4) NULL,
	key_attribute_character varchar(4) NULL,
	key_attribute_date varchar(19) NULL,
	key_attribute_integer varchar(11) NULL,
	key_attribute_numeric varchar(13) NULL,
	key_attribute_timestamp varchar(19) NULL,
	key_attribute_varchar varchar(4) NULL,
	load_cycle_id numeric,
	record_type varchar(4) NULL
);

insert into moto_mktg_mtd_ref.mtd_exception_records
	(load_cycle_id, record_type, key_attribute_numeric, attribute_numeric,
	 key_attribute_timestamp, attribute_timestamp, key_attribute_date, attribute_date,
	 key_attribute_varchar, attribute_varchar, key_attribute_character, attribute_character,
	 key_attribute_integer, attribute_integer)
values
	('-1', 'N', '-999999999999', '-999999999999',
	 '01/01/2999 00:00:00', '01/01/2999 00:00:00', '31/12/2499', '31/12/2499',
	 '~NL~', '~NL~', '~NL~', '~NL~',
	 '-2147483648', '-2147483648');

insert into moto_mktg_mtd_ref.mtd_exception_records
	(load_cycle_id, record_type, key_attribute_numeric, attribute_numeric,
	 key_attribute_timestamp, attribute_timestamp, key_attribute_date, attribute_date,
	 key_attribute_varchar, attribute_varchar, key_attribute_character, attribute_character,
	 key_attribute_integer, attribute_integer)
values
	('-2', 'U', '-999999999998', '-999999999998',
	 '01/01/2899 00:00:00', '01/01/2899 00:00:00', '31/12/2599', '31/12/2599',
	 '~UN~', '~UN~', '~UN~', '~UN~',
	 '-2147483647', '-2147483647');


------------------------------------------------------------------------------------------------------------------------


drop schema if exists moto_mktg cascade;
create schema if not exists moto_mktg authorization vaultspeed;

drop sequence if exists moto_mktg.transaction_seq;
create sequence moto_mktg.transaction_seq start 1 increment 1 cache 20;


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_mktg.addresses cascade;

create table if not exists moto_mktg.addresses (
	address_number   numeric not null,
	street_name      varchar(50),
	street_number    numeric,
	postal_code      varchar(6),
	city             varchar(50),
	province         varchar(50),
	update_user      varchar(30),
	update_timestamp timestamp not null
);

comment on table moto_mktg.addresses is 'Multi-Source Multi Master address table in the moto_mktg source.  More attributes in the object than the address object in the moto_mktg object. street_name,street_number,postal_code,city are the business keys but they are also attributes.';

alter table moto_mktg.addresses
	drop constraint if exists addresses_pk;

alter table moto_mktg.addresses
	add constraint addresses_pk primary key (address_number);

alter table moto_mktg.addresses
	add constraint addresses_uk unique (street_name, street_number, postal_code, city);


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_mktg.party cascade;

create table if not exists moto_mktg.party (
	party_number        numeric not null,
	parent_party_number numeric,
	name                varchar(50),
	birthdate           date,
	gender              char(8),
	party_type_code     char(2),
	comments            text,
	address_number      integer,
	update_user         varchar(30),
	update_timestamp    timestamp not null
);

comment on table moto_mktg.party is 'Multi-Master Object with different number of Business Keys than the Moto-Sales Customer Object.  Self referencing table and Business Key is different from the Primary keys and contains all Descriptive fields except for the comments. name, birthdate, gender,party_type_code are business keys but will also be attributes.';

alter table moto_mktg.party
	drop constraint if exists party_pk;

alter table moto_mktg.party
	add constraint party_pk primary key (party_number);

alter table moto_mktg.party
	drop constraint if exists party_uk;

alter table moto_mktg.party
	add constraint party_uk unique (name, birthdate, gender, party_type_code);


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_mktg.motorcycles cascade;

create table if not exists moto_mktg.motorcycles (
	motorcycle_id        numeric(16) not null,
	motorcycle_cc        numeric,
	motorcycle_et_code   char(10),
	motorcycle_part_code varchar(50),
	motorcycle_name      varchar(100),
	update_user          varchar(30),
	update_timestamp     timestamp not null
);

comment on table moto_mktg.motorcycles is 'Table with multiple columns in Business Key. Its a multi-source multi-master object. STORE_BK_FIELDS_IN_SAT = N';

create unique index if not exists motorcycles_uk_idx on moto_mktg.motorcycles(motorcycle_cc asc, motorcycle_et_code asc, motorcycle_part_code asc);

alter table moto_mktg.motorcycles
	drop constraint if exists motorcycles_pk;

alter table moto_mktg.motorcycles
	add constraint motorcycles_pk primary key (motorcycle_id);


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_mktg.campaigns cascade;

create table if not exists moto_mktg.campaigns (
	campaign_code       varchar(20) not null,
	campaign_start_date date,
	campaign_name       varchar(100),
	update_user         varchar(30),
	update_timestamp    timestamp not null
);

comment on table moto_mktg.campaigns is 'Source Object with Business Keys is equal to primary keys and consists of 2 fields. The Business Keys are also descriptive fields and should be part of the Satellite, but without change of history on these fields';

alter table moto_mktg.campaigns
	add constraint campaigns_pk primary key (campaign_code, campaign_start_date);


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_mktg.camp_part_cont cascade;

create table if not exists moto_mktg.camp_part_cont (
	party_number           numeric     not null,
	campaign_code          varchar(20) not null,
	campaign_start_date    date,
	contact_id             numeric,
	marketing_program_code char(10),
	marketing_program_name char(100),
	update_user            varchar(30),
	update_timestamp       timestamp not null
);

comment on table moto_mktg.camp_part_cont is 'Many to Many link with attributes where change of history is on the change of the attributes.  The Foreign Key to Campaign needs to be defined in the Accelerator.';

alter table moto_mktg.camp_part_cont
	add constraint camp_part_cont_un unique (party_number, campaign_code, campaign_start_date, contact_id);


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_mktg.e_mails cascade;

create table if not exists moto_mktg.e_mails (
	contact_id       numeric not null,
	name             varchar(100),
	update_timestamp timestamp not null
);

comment on table moto_mktg.e_mails is 'e-mails is a subtype of contact and will become a satellite on top of contact';

alter table moto_mktg.e_mails
	add constraint e_mails_pk primary key (contact_id);


------------------------------------------------------------------------------------------------------------------------

drop table if exists moto_mktg.phones cascade;

create table if not exists moto_mktg.phones (
	contact_id       numeric not null,
	phone_number     varchar(20),
	update_timestamp timestamp not null
);

comment on table moto_mktg.phones is 'Phones is a subtype of contact and will become a satellite on top of the hub contact';

alter table moto_mktg.phones
	add constraint phones_pk primary key (contact_id);


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_mktg.contacts cascade;

create table if not exists moto_mktg.contacts (
	contact_id        numeric not null,
	contact_type      varchar(10),
	contact_type_desc varchar(100),
	update_timestamp  timestamp not null
);

comment on table moto_mktg.contacts is 'Contact will become a Hub but the related subtypes e-mails and phones will not become hubs but wil be satellites on top of the contact hub.';

alter table moto_mktg.contacts
	add constraint contacts_pk primary key (contact_id);


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_mktg.party_contacts cascade;

create table if not exists moto_mktg.party_contacts (
	party_number     numeric,
	contact_id       numeric,
	update_timestamp timestamp not null
);

comment on table moto_mktg.party_contacts is 'Party Contacts is a Many to Many link with no driving key in the relationship';

alter table moto_mktg.party_contacts
	add constraint party_contacts_uk unique (party_number, contact_id);


------------------------------------------------------------------------------------------------------------------------


drop table if exists moto_mktg.campaign_motorcycles cascade;

create table if not exists moto_mktg.campaign_motorcycles (
	campaign_code            varchar(60),
	campaign_start_date      date,
	motorcycle_id            numeric,
	motorcycle_class_desc    varchar(40),
	motorcycle_subclass_desc varchar(256),
	motorcycle_emotion_desc  varchar(256),
	motorcycle_comment       varchar(1000),
	update_timestamp         timestamp not null
);

comment on table moto_mktg.campaign_motorcycles
is
  'campaign_motorcycles is a Many to Many link that will have 2 Satellites, a class, subclass satellite and a emotion, comment satellite.  Changes in the attributes will create change of history';

alter table moto_mktg.campaign_motorcycles
	add constraint campaign_motorcycles_uk unique (campaign_code, campaign_start_date, motorcycle_id);


------------------------------------------------------------------------------------------------------------------------

drop table if exists moto_mktg.channels cascade;

create table if not exists moto_mktg.channels (
	channel_id          numeric   not null,
	channel_code        varchar(50),
	channel_description varchar(250),
	update_user         varchar(30),
	update_timestamp    timestamp not null
);
comment on table moto_mktg.channels is 'Simple object with channel code as BK';

alter table moto_mktg.channels
	drop constraint if exists channels_pk;

alter table moto_mktg.channels
	add constraint channels_pk primary key (channel_id);

alter table moto_mktg.channels
	drop constraint if exists channels_uk;

alter table moto_mktg.channels
	add constraint channels_uk unique (channel_code);

------------------------------------------------------------------------------------------------------------------------

drop table if exists moto_mktg.camp_moto_channel cascade;

create table if not exists moto_mktg.camp_moto_channel (
	channel_id          numeric   not null,
	campaign_code       varchar(20),
	campaign_start_date date,
	motorcycle_name     varchar,
	from_date           timestamp,
	to_date             timestamp,
	valid_from_date     timestamp,
	valid_to_date       timestamp,
	update_user         varchar(30),
	update_timestamp    timestamp not null
);
comment on table moto_mktg.camp_moto_channel is 'Multi-Active Satellite on Many to Many Link';

alter table moto_mktg.camp_moto_channel
	drop constraint if exists camp_moto_channel_uk;

alter table moto_mktg.camp_moto_channel
	add constraint camp_moto_channel_uk unique (channel_id, campaign_code, campaign_start_date, motorcycle_name,
	                                            from_date, valid_from_date
	                                           );

------------------------------------------------------------------------------------------------------------------------

drop table if exists moto_mktg.camp_moto_chan_region cascade;

create table if not exists moto_mktg.camp_moto_chan_region (
	channel_id          numeric   not null,
	campaign_code       varchar(20),
	campaign_start_date date,
	motorcycle_id       numeric,
	region              varchar,
	update_user         varchar(30),
	update_timestamp    timestamp not null
);
comment on table moto_mktg.camp_moto_chan_region is 'Multi-Active Satellite on Many to Many Link with change of history on driving keys';

alter table moto_mktg.camp_moto_chan_region
	drop constraint if exists camp_moto_chan_region_uk;

alter table moto_mktg.camp_moto_chan_region
	add constraint camp_moto_chan_region_uk unique (channel_id, campaign_code, campaign_start_date, motorcycle_id, region);

------------------------------------------------------------------------------------------------------------------------

alter table moto_mktg.camp_part_cont
	drop constraint if exists camp_part_cont_party_fk;

alter table moto_mktg.camp_part_cont
	add constraint camp_part_cont_party_fk foreign key (party_number) references moto_mktg.party(party_number);

alter table moto_mktg.camp_part_cont
	drop constraint if exists camp_part_cont_cont_fk;

alter table moto_mktg.camp_part_cont
	add constraint camp_part_cont_cont_fk foreign key (contact_id) references moto_mktg.contacts(contact_id);

alter table moto_mktg.party
	drop constraint if exists party_addresses_fk;

alter table moto_mktg.party add constraint party_addresses_fk foreign key (address_number) references moto_mktg.addresses(address_number);

alter table moto_mktg.party
	drop constraint if exists party_parent_fk;

alter table moto_mktg.party
	add constraint party_parent_fk foreign key (parent_party_number) references moto_mktg.party(party_number);

-- LAS
do $$
begin
	if exists(
		SELECT 1
		FROM information_schema.schemata
		WHERE schema_name = 'moto_sales_gg'
	) then
	alter table moto_mktg.party drop constraint if exists party_addresses_address_number_fk;
	alter table moto_mktg.party
		add constraint party_addresses_address_number_gg_fk foreign key (address_number) references moto_sales_gg.addresses(address_number);
	else
	alter table moto_mktg.party
		add constraint party_addresses_address_number_fk foreign key (address_number) references moto_sales.addresses;
	end if;
end
$$;

alter table moto_mktg.e_mails
	drop constraint if exists e_mails_contacts_fk;

alter table moto_mktg.e_mails
	add constraint e_mails_contacts_fk foreign key (contact_id) references moto_mktg.contacts(contact_id);

alter table moto_mktg.phones
	drop constraint if exists phone_contacts_fk;

alter table moto_mktg.phones
	add constraint phone_contacts_fk foreign key (contact_id) references moto_mktg.contacts(contact_id);

alter table moto_mktg.party_contacts
	drop constraint if exists party_contacts_contact_fk;

alter table moto_mktg.party_contacts
	add constraint party_contacts_contact_fk foreign key (contact_id) references moto_mktg.contacts(contact_id);

alter table moto_mktg.party_contacts
	drop constraint if exists party_contact_party_fk;

alter table moto_mktg.party_contacts
	add constraint party_contact_party_fk foreign key (party_number) references moto_mktg.party(party_number);

alter table moto_mktg.campaign_motorcycles
	drop constraint if exists campaign_motorcycles_campaign_fk;

alter table moto_mktg.campaign_motorcycles
	add constraint campaign_motorcycles_campaign_fk foreign key (campaign_code,campaign_start_date) references moto_mktg.campaigns(campaign_code,campaign_start_date);

alter table moto_mktg.campaign_motorcycles
	drop constraint if exists party_motorcycles_campaign_motorcycle_fk;

alter table moto_mktg.campaign_motorcycles
	add constraint party_motorcycles_campaign_motorcycle_fk foreign key (motorcycle_id) references moto_mktg.motorcycles(motorcycle_id);


------------------------------------------------------------------------------------------------------------------------


commit;

do
$$  -- executes the DDL to create the jrn objects in moto_mktg
declare
	rec record;
begin
 
	for rec in select table_name::varchar as table_name from information_schema.tables where table_schema = 'moto_mktg' and table_name not like 'jrn_%'
	loop
	  execute concat('DROP TABLE IF EXISTS moto_mktg.jrn_',rec.table_name,' CASCADE;');
	  execute concat(
	    'create table moto_mktg.jrn_',rec.table_name,' (
				trans_id        numeric,
				image_type      varchar(20),
				operation       char(1),
				trans_timestamp timestamp,
				like moto_mktg.',rec.table_name,'
			);');
	 
	end loop;

end;
$$;


create or replace function moto_mktg.create_jrn_func(
  p_table_name varchar
) returns text as
$create_jrn_func$

declare
 
	cols				varchar[];
	keys				varchar[];
	old_case_cols		varchar[];
	new_case_cols		varchar[];
  	attribute_cols		varchar[];
 
begin
	
	select
		array_agg(column_name::varchar)
	into cols
	from information_schema.columns
	where table_schema = 'moto_mktg'
		and table_name = p_table_name;
	
	select
		array_agg(c.column_name::varchar)
	into keys
	from information_schema.table_constraints          tc
	join information_schema.constraint_column_usage as ccu using (constraint_schema, constraint_name)
	join information_schema.columns                 as c
	     on c.table_schema = tc.constraint_schema and tc.table_name = c.table_name and ccu.column_name = c.column_name
	where constraint_type = 'PRIMARY KEY'
		and tc.table_name = p_table_name
		and tc.table_schema = 'moto_mktg';
	
	if keys is null then
		select
			array_agg(c.column_name::varchar)
		into keys
		from information_schema.table_constraints          tc
		join information_schema.constraint_column_usage as ccu using (constraint_schema, constraint_name)
		join information_schema.columns                 as c
		     on c.table_schema = tc.constraint_schema and tc.table_name = c.table_name and ccu.column_name = c.column_name
		where constraint_type = 'UNIQUE'
			and tc.table_name = p_table_name
			and tc.table_schema = 'moto_mktg';
	end if;
	
	keys := array_append(keys, 'update_timestamp');
  
  select array_agg(element), array_agg(old_cc), array_agg(new_cc) into attribute_cols, old_case_cols, new_case_cols
  from(
	select 	concat('CASE WHEN NEW.',element,' = OLD.',element,'
		                 THEN NULL
		                 ELSE OLD.',element,'
                 END as ',element) as old_cc,
			concat('CASE WHEN NEW.',element,' = OLD.',element,'
		                 THEN NULL
		                 ELSE NEW.',element,'
                 END as ',element) as new_cc,
			element
	from (
	  select unnest(cols)
	  except
	  select unnest(keys)
	) t (element))c;

	return concat('
		create or replace function moto_mktg.cdc_',p_table_name,'(
		) returns trigger as
		$$
		
		declare
		
		    vtrans_id int = nextval(''moto_mktg.transaction_seq'');
		
		begin
			--
			-- Create a row in jrn_',p_table_name,' to reflect the operation performed on ',p_table_name,',
			-- make use of the special variable TG_OP to work out the operation.
			--
			if (tg_op = ''DELETE'') then
		            INSERT INTO moto_mktg.jrn_',p_table_name,'
		                        (
		                         trans_id
		                        ,image_type
		                        ,operation
		                        ,trans_timestamp
		                        ,',array_to_string(cols, ', '),'
		                         )
		                  SELECT
		                         vtrans_id
		                         ,NULL
		                         ,''D''
		                         ,clock_timestamp()
		                         ,old.',array_to_string(cols, ', old.'),';
				return old;
		    elsif (tg_op = ''UPDATE'') then
		            INSERT INTO moto_mktg.jrn_',p_table_name,'
		                        (
		                        trans_id
		                        ,image_type
		                        ,operation
		                        ,trans_timestamp
		                        ,',array_to_string(keys, ', '),'
		                        ',','||array_to_string(attribute_cols, ', '),'
		                        )
		                    SELECT vtrans_id
		                         ,''BEFORE''
		                         ,''U''
		                         ,clock_timestamp()
		                         ,OLD.',array_to_string(keys, ', OLD.'),'
		                         ',','||array_to_string(old_case_cols, ', '),'
		                UNION ALL
		                  SELECT vtrans_id
		                         ,''AFTER''
		                         ,''U''
		                         ,clock_timestamp()
		                         ,NEW.',array_to_string(keys, ', NEW.'),'
		                         ',','||array_to_string(new_case_cols, ', '),'
		                         ;
				return new;
			elsif (tg_op = ''INSERT'') then
		            INSERT INTO moto_mktg.jrn_',p_table_name,'
		                (
		                trans_id
		                ,image_type
		                ,operation
		                ,trans_timestamp
		                ,',array_to_string(cols, ', '),'
		                )
				        SELECT
	                  vtrans_id
			              , NULL
			              , ''I''
			              ,clock_timestamp()
			              ,new.',array_to_string(cols, ', new.'),';
				return new;
			end if;
			return null; -- result is ignored since this is an AFTER trigger
		end;
		$$
			language plpgsql;
	');
 
end;
$create_jrn_func$
language plpgsql;


do
$$  -- executes the DDL to create the jrn triggers in moto_mktg
declare
 
	rec record;
 
begin
 
	for rec in select table_name::varchar as table_name from information_schema.tables where table_schema = 'moto_mktg' and table_name not like 'jrn_%'
	loop
	  execute moto_mktg.create_jrn_func(rec.table_name::varchar);
	  execute concat('
	    drop trigger if exists trg_',rec.table_name,' on moto_mktg.',rec.table_name,' cascade;
			create trigger trg_',rec.table_name,'
				after insert or update or delete
				on moto_mktg.',rec.table_name,'
				for each row
			execute procedure moto_mktg.cdc_',rec.table_name,'();');
	 
	end loop;

end;
$$;


do
$$
	declare
		schema_tables cursor for select
			                         'ALTER TABLE moto_mktg.' || table_name || ' DISABLE TRIGGER ALL' as stmnt
		                         from information_schema.tables
		                         where table_schema = 'moto_mktg'
				                       and table_name not like 'jrn%'
		                         order by table_name ;

	begin

		for s in schema_tables
		loop
			execute s.stmnt;
		end loop;
	end
$$;

