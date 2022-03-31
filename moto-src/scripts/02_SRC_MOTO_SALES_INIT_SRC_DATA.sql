-- Source Database is a PostgreSQL database
--   MOTO_SALES schema is first source


------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
TRUNCATE TABLE moto_sales_mtd_ref.load_cycle_info ;
INSERT INTO moto_sales_mtd_ref.load_cycle_info (load_cycle_id,load_date)
VALUES (nextval('moto_sales_mtd_ref.load_cycle_seq'), to_timestamp('17/01/2020 00:00:00','DD/MM/YYYY HH24:MI:SS'));

truncate moto_sales_mtd_ref.fmc_loading_window_table;
insert into moto_sales_mtd_ref.fmc_loading_window_table(fmc_begin_lw_timestamp, fmc_end_lw_timestamp)
select null, now();

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

truncate table moto_sales.addresses cascade;
truncate table moto_sales.jrn_addresses cascade;
truncate table moto_sales.customers cascade;
truncate table moto_sales.jrn_customers cascade;
truncate table moto_sales.invoices cascade;
truncate table moto_sales.jrn_invoices cascade;
truncate table moto_sales.moto_parts cascade;
truncate table moto_sales.jrn_moto_parts cascade;
truncate table moto_sales.moto_products cascade;
truncate table moto_sales.jrn_moto_products cascade;
truncate table moto_sales.invoice_lines cascade;
truncate table moto_sales.jrn_invoice_lines cascade;
truncate table moto_sales.invoice_lines cascade;
truncate table moto_sales.jrn_invoice_lines cascade;
truncate table moto_sales.product_feature_class cascade;
truncate table moto_sales.jrn_product_feature_class cascade;
truncate table moto_sales.product_feature_cat cascade;
truncate table moto_sales.jrn_product_feature_cat cascade;
truncate table moto_sales.product_features cascade;
truncate table moto_sales.jrn_product_features cascade;
truncate table moto_sales.product_feat_class_rel cascade;
truncate table moto_sales.jrn_product_feat_class_rel cascade;
truncate table moto_sales.codes_to_language cascade;
truncate table moto_sales.jrn_codes_to_language cascade;
truncate table moto_sales.payments cascade;
truncate table moto_sales.jrn_payments cascade;
truncate table moto_sales.cust_addresses cascade;
truncate table moto_sales.jrn_cust_addresses cascade;


------------------------------------------------------------------------------------------------------------------------

insert into moto_sales.addresses
	(street_name, street_number, postal_code, city, coordinates, update_user, update_timestamp )
values
	('Reintjesbeek', 50, '2930', 'Brasschaat', (51.2704083,4.4547302,14.73), 'ANOTHER', clock_timestamp());

insert into moto_sales.addresses
	(street_name, street_number, postal_code, city, coordinates, update_user, update_timestamp )
values
	('Frans Adriaenssensstraat', 333, '2170', 'Antwerpen',(51.2529991,4.4405631,17), 'ANOTHER', clock_timestamp());

insert into moto_sales.addresses
	(street_name, street_number, postal_code, city, coordinates, update_user, update_timestamp )
values
	('Mechelsesteenweg', 1023, '2550', 'Kontich', (51.1294796,4.4448072,17), 'MYSELFANDI', clock_timestamp());

insert into moto_sales.addresses
	(street_name, street_number, postal_code, city, coordinates, update_user, update_timestamp )
values
	('Berlaarbaan', 1523, '2861', 'Onze Lieve Vrouw Waver', (51.069642,4.568258,17), 'MYSELFANDI', clock_timestamp());

insert into moto_sales.addresses
	(street_name, street_number, postal_code, city, coordinates, update_user, update_timestamp )
values
	('Bosstraat', 150, '9920', 'Lovendegem', (51.1213642,3.6459505,17), 'MYSELFANDI', clock_timestamp());

insert into moto_sales.addresses
	(street_name, street_number, postal_code, city, coordinates, update_user, update_timestamp )
values
	('Heernisstraat', 100, '8340', 'Damme', (51.289591,3.281432,17), 'NOTME', clock_timestamp());

insert into moto_sales.addresses
	(street_name, street_number, postal_code, city, coordinates, update_user, update_timestamp )
values
	('Hoppestraat', 2000, '8531', 'Harelbeke', (50.8608225,3.2962062,17), 'NOTME', clock_timestamp());

insert into moto_sales.addresses
	(street_name, street_number, postal_code, city, coordinates, update_user, update_timestamp )
values
	('Kontrijnstraat', 786, '9690', 'Kluisbergen', (50.7792324,3.5072295,17), 'SOMEONE ELSE', clock_timestamp());

insert into moto_sales.addresses
	(street_name, street_number, postal_code, city, coordinates, update_user, update_timestamp )
values
	('Chaussée de Douai', 3019, '7500', 'Tournai', (50.5925762,3.3592582,17), 'SOMEONE ELSE', clock_timestamp());

insert into moto_sales.addresses
	(street_name, street_number, postal_code, city, coordinates, update_user, update_timestamp )
values
	('Sart-lez-Moulins', 1034, '6044', 'Charleroi', (50.4375379,4.3681152,17), 'SOMEONE ELSE', clock_timestamp());

insert into moto_sales.addresses
	(street_name, street_number, postal_code, city, coordinates, update_user, update_timestamp )
values
	('Avenue Reine Fabiola', 777, '1340', 'Ottignies-Louvain-la-Neuve', (50.6680405,4.5608913,17), 'WHOCHANGEDIT', clock_timestamp());

insert into moto_sales.addresses
	(street_name, street_number, postal_code, city, coordinates, update_user, update_timestamp )
values
	('Rue Henri Lemaître', 289, '5000', 'Namur', (50.4660583,4.8578143,17.11), 'WHOCHANGEDIT', clock_timestamp());

insert into moto_sales.addresses
	(street_name, street_number, postal_code, city, coordinates, update_user, update_timestamp )
values
	('Rue Janson', 634, '5300', 'Andenne', (50.4880651,5.0964683,17), 'WHOCHANGEDIT', clock_timestamp());

insert into moto_sales.addresses
	(street_name, street_number, postal_code, city, coordinates, update_user, update_timestamp )
values
	('Haagbeukenlaan', 7589, '1200', 'Sint-Lambrechts-Woluwe', (50.8530689,4.430269,17), 'OTHERPERSON', clock_timestamp());

insert into moto_sales.addresses
	(street_name, street_number, postal_code, city, coordinates, update_user, update_timestamp )
values
	('Henry Dunantlaan', 934, '1140', 'Evere', (50.8624915,4.4080649,17), 'OTHERPERSON', clock_timestamp());

insert into moto_sales.addresses
	(street_name, street_number, postal_code, city, coordinates, update_user, update_timestamp )
values
	('Portaelsstraat', 489, '1030', 'Schaarbeek', (50.8734662,4.3729844,17), 'OTHERPERSON', clock_timestamp());


------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------


insert into moto_sales.customers
	(national_person_id, first_name, last_name, birthdate, gender, customer_invoice_address_id,
	 customer_ship_to_address_id, update_user, update_timestamp )
values
	('87.13.11 1010.93', 'Hilde', 'Langebeen', to_date('13/11/1987', 'DD/MM/YYYY'), 'Female', 1, 2, 'ANOTHER', clock_timestamp());

insert into moto_sales.customers
	(national_person_id, first_name, last_name, birthdate, gender, customer_invoice_address_id,
	 customer_ship_to_address_id, update_user, update_timestamp )
values
	('85.03.03 273.93', 'Bart', 'Kortemark', to_date('03/03/1985', 'DD/MM/YYYY'), 'Male', 1, 2, 'ANOTHER', clock_timestamp());

insert into moto_sales.customers
	(national_person_id, first_name, last_name, birthdate, gender, customer_invoice_address_id,
	 customer_ship_to_address_id, update_user, update_timestamp )
values
	('75.12.12 75.93', 'Margot', 'Vandeberghe', to_date('12/12/1975', 'DD/MM/YYYY'), 'Female', 3, 4, 'ANOTHER', clock_timestamp());

insert into moto_sales.customers
	(national_person_id, first_name, last_name, birthdate, gender, customer_invoice_address_id,
	 customer_ship_to_address_id, update_user, update_timestamp )
values
	('75.07.05 58.93', 'Dirk', 'Verlinden', to_date('05/07/1975', 'DD/MM/YYYY'), 'Male', 3, 4, 'ANOTHER', clock_timestamp());

insert into moto_sales.customers
	(national_person_id, first_name, last_name, birthdate, gender, customer_invoice_address_id,
	 customer_ship_to_address_id, update_user, update_timestamp )
values
	('65.10.02 321.85', 'Patrick', 'Vanitsen', to_date('02/10/1965', 'DD/MM/YYYY'), 'Male', 5, null, 'MYSELFANDI', clock_timestamp());

insert into moto_sales.customers
	(national_person_id, first_name, last_name, birthdate, gender, customer_invoice_address_id,
	 customer_ship_to_address_id, update_user, update_timestamp )
values
	('75.08.01 65.93', 'Linda', 'Vermarken', to_date('01/08/1975', 'DD/MM/YYYY'), 'Female', 5, null, 'MYSELFANDI', clock_timestamp());

insert into moto_sales.customers
	(national_person_id, first_name, last_name, birthdate, gender, customer_invoice_address_id,
	 customer_ship_to_address_id, update_user, update_timestamp )
values
	('58.09.02 278.80', 'Jan', 'Olbrechts', to_date('02/09/1958', 'DD/MM/YYYY'), 'Male', 6, null, 'MYSELFANDI', clock_timestamp());

insert into moto_sales.customers
	(national_person_id, first_name, last_name, birthdate, gender, customer_invoice_address_id,
	 customer_ship_to_address_id, update_user, update_timestamp )
values
	('60.06.14 445.80', 'Greet', 'Van der Goten', to_date('14/06/1960', 'DD/MM/YYYY'), 'Female', 7, null, 'MYSELFANDI', clock_timestamp());

insert into moto_sales.customers
	(national_person_id, first_name, last_name, birthdate, gender, customer_invoice_address_id,
	 customer_ship_to_address_id, update_user, update_timestamp )
values
	('80.05.80 785.93', 'Charles', 'Michel', to_date('04/05/1980', 'DD/MM/YYYY'), 'Male', 8, 9, 'MYSELFANDI', clock_timestamp());

insert into moto_sales.customers
	(national_person_id, first_name, last_name, birthdate, gender, customer_invoice_address_id,
	 customer_ship_to_address_id, update_user, update_timestamp )
values
	('62.03.11 783.80', 'Louise', 'Ludgen', to_date('11/03/1962', 'DD/MM/YYYY'), 'Female', 8, 9, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.customers
	(national_person_id, first_name, last_name, birthdate, gender, customer_invoice_address_id,
	 customer_ship_to_address_id, update_user, update_timestamp )
values
	('76.12.03 317.90', 'Yves', 'Morisseau', to_date('03/12/1976', 'DD/MM/YYYY'), 'Male', null, 10, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.customers
	(national_person_id, first_name, last_name, birthdate, gender, customer_invoice_address_id,
	 customer_ship_to_address_id, update_user, update_timestamp )
values
	('82.07.12 527.97', 'Mohamed', 'Ali', to_date('12/07/1982', 'DD/MM/YYYY'), 'Male', 11, 12, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.customers
	(national_person_id, first_name, last_name, birthdate, gender, customer_invoice_address_id,
	 customer_ship_to_address_id, update_user, update_timestamp )
values
	('85.07.12 987.97', 'Fatima', 'Ali', to_date('12/07/1985', 'DD/MM/YYYY'), 'Female', 11, null, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.customers
	(national_person_id, first_name, last_name, birthdate, gender, customer_invoice_address_id,
	 customer_ship_to_address_id, update_user, update_timestamp )
values
	('56.02.29 132.78', 'Ken', 'Coulter', to_date('29/02/1956', 'DD/MM/YYYY'), 'Male', null, 14, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.customers
	(national_person_id, first_name, last_name, birthdate, gender, customer_invoice_address_id,
	 customer_ship_to_address_id, update_user, update_timestamp )
values
	('85.07.12 1135.85', 'Lindsey', 'Johanson', to_date('12/07/1985', 'DD/MM/YYYY'), 'Female', 96, 97, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.customers
	(national_person_id, first_name, last_name, birthdate, gender, customer_invoice_address_id,
	 customer_ship_to_address_id, update_user, update_timestamp )
values
	('85.05.28 1085.85', 'Bradley', 'Cooper', to_date('28/5/1985', 'DD/MM/YYYY'), 'Male', 99, 16, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.customers
	(national_person_id, first_name, last_name, birthdate, gender, customer_invoice_address_id,
	 customer_ship_to_address_id, update_user, update_timestamp )
values
	('85.08.01 1111.85', 'Jennifer', 'Garner', to_date('01/08/1985', 'DD/MM/YYYY'), 'Female', 15, 98, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.customers
	(national_person_id, first_name, last_name, birthdate, gender, customer_invoice_address_id,
	 customer_ship_to_address_id, update_user, update_timestamp)
values
	('85.08.01 1111.86', 'James', '', to_date('01/08/1986', 'DD/MM/YYYY'), '', 15, 98, 'SOMEONEELSE', clock_timestamp());


------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------


insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('22/01/2010', 'DD/MM/YYYY'), 1, 18499 / 1.04, 4, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('01/08/2010', 'DD/MM/YYYY'), 1, 450 / 1.25 -- 2 tyres : Front 200 and Back 250
		, 25, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('01/10/2011', 'DD/MM/YYYY'), 1, 460 / 1.25 -- 2 tyres : Front 200 and Back 250
		, 25, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('14/12/2012', 'DD/MM/YYYY'), 1, 150 / 1.10 -- New Battery
		, 10, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('20/04/2013', 'DD/MM/YYYY'), 1, 600 / 1.10 -- New Quickshifter
		, 10, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('23/02/2010', 'DD/MM/YYYY'), 2, 15799 / 1.03, 3, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('03/09/2010', 'DD/MM/YYYY'), 2, 380 / 1.20 -- 2 tyres : Front 175 and Back 205
		, 20, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('03/10/2011', 'DD/MM/YYYY'), 2, 390 / 1.20 -- 2 tyres : Front 180 and Back 210
		, 20, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('16/12/2012', 'DD/MM/YYYY'), 2, 150 / 1.08 -- New Battery
		, 8, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('22/01/2011', 'DD/MM/YYYY'), 3, 25499 / 1.04, 4, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('01/03/2012', 'DD/MM/YYYY'), 3, 450 / 1.25 -- 2 tyres : Front 200 and Back 250
		, 25, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('27/10/2013', 'DD/MM/YYYY'), 3, 460 / 1.25 -- 2 tyres : Front 200 and Back 250
		, 25, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('20/04/2013', 'DD/MM/YYYY'), 3, 250 / 1.10 -- New Left Mirror and (Pinker)
		, 10, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('21/01/2011', 'DD/MM/YYYY'), 4, 22799 / 1.02, 2, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('01/09/2012', 'DD/MM/YYYY'), 4, 420 / 1.15 -- 2 tyres : Front 200 and Back 220
		, 15, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('26/11/2013', 'DD/MM/YYYY'), 4, 430 / 1.20 -- 2 tyres : Front 200 and Back 230
		, 20, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('20/04/2013', 'DD/MM/YYYY'), 4,
	 435 / 1.10 -- Oil Filter and Oxigen Filter and OIl 3L and cooling Flued 3L
		, 10, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('20/01/2011', 'DD/MM/YYYY'), 5, 13799 / 1.02, 2, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('01/10/2012', 'DD/MM/YYYY'), 5, 350 / 1.18 -- 2 tyres : Front 150 and Back 200
		, 18, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('02/12/2013', 'DD/MM/YYYY'), 5, 360 / 1.21 -- 2 tyres : Front 160 and Back 200
		, 21, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('29/06/2013', 'DD/MM/YYYY'), 5,
	 385 / 1.10 -- Oil Filter and Oxigen Filter and OIl 3L and cooling Flued 3L
		, 10, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('22/01/2011', 'DD/MM/YYYY'), 7, 17499 / 1.03, 3, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('02/08/2012', 'DD/MM/YYYY'), 7, 360 / 1.20 -- 2 tyres : Front 170 and Back 190
		, 20, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('02/10/2013', 'DD/MM/YYYY'), 7, 360 / 1.20 -- 2 tyres : Front 170 and Back 190
		, 20, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('15/12/2012', 'DD/MM/YYYY'), 7, 270 / 1.15 -- New Windshield
		, 15, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('22/05/2011', 'DD/MM/YYYY'), 9, 21999 / 1.03, 3, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('03/08/2013', 'DD/MM/YYYY'), 9, 460 / 1.20 -- 2 tyres : Front 210 and Back 250
		, 20, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('11/12/2012', 'DD/MM/YYYY'), 9, 260 / 1.15 -- New Windshield
		, 15, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('20/07/2011', 'DD/MM/YYYY'), 10, 21895 / 1.06, 6, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('07/04/2013', 'DD/MM/YYYY'), 10, 450 / 1.30 -- 2 tyres : Front 200 and Back 250
		, 30, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('09/11/2014', 'DD/MM/YYYY'), 10, 450 / 1.30 -- 2 tyres : Front 200 and Back 250
		, 30, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('30/07/2013', 'DD/MM/YYYY'), 10,
	 425 / 1.15 -- Oil Filter and Oxigen Filter and OIl 3L and cooling Flued 3L
		, 15, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('26/04/2010', 'DD/MM/YYYY'), 12, 19785 / 1.04, 4, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('07/06/2010', 'DD/MM/YYYY'), 12, 250 / 1.15 -- Left Mirror and Left (Pinker)
		, 15, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('09/11/2011', 'DD/MM/YYYY'), 12, 450 / 1.20 -- 2 tyres : Front 200 and Back 250
		, 20, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('30/07/2012', 'DD/MM/YYYY'), 12,
	 425 / 1.20 -- Oil Filter and Oxigen Filter and OIl 3L and cooling Flued 3L
		, 20, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('03/04/2013', 'DD/MM/YYYY'), 13, 20785 / 1.05, 5, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('08/10/2013', 'DD/MM/YYYY'), 13, 420 / 1.20 -- 2 tyres : Front 190 and Back 230
		, 20, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('03/06/2013', 'DD/MM/YYYY'), 14, 15785 / 1.02, 2, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('08/11/2013', 'DD/MM/YYYY'), 14, 360 / 1.15 -- 2 tyres : Front 160 and Back 200
		, 15, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('03/09/2013', 'DD/MM/YYYY'), 98, 16785 / 1.02, 2, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoices
	(invoice_date, invoice_customer_id, amount, discount, update_user, update_timestamp )
values
	(to_date('08/12/2013', 'DD/MM/YYYY'), 99, 360 / 1.15 -- 2 tyres : Front 160 and Back 200
		, 15, 'SOMEONEELSE', clock_timestamp());


------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------


insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(11 -- Michelin Pilot Road 5 120/70 ZR 17 58W
		, 'MICHPILRD512070', 'US_EN', 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(12 -- Michelin Pilot Road 5 190/55 ZR 17 75W
		, 'MICHPILRD519055', 'US_EN', 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(40 -- Michelin Pilot Road 5 120/70 ZR 17 58W
		, 'MICHPILRD512070', 'BE_NL', 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(41 -- Michelin Pilot Road 5 190/55 ZR 17 75W
		, 'MICHPILRD519055', 'BE_NL', 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(28 -- Michelin Anakee 2 110/80 R19 59V
		, 'MICHANAK211080', 'US_EN', 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(29 -- Michelin Anakee 2 150/70 R17 69V
		, 'MICHANAK215070', 'US_EN', 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(15 -- Castrol 10w-40
		, 'CAST10W40', 'BE_FR', 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(16 -- Cooling Flued
		, 'COOLFLUED', 'BE_FR', 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(26 -- Oil Filter BMW S 1000 RR
		, 'OILFILTS1000RR', 'BE_FR', 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(27 -- Air Filter BMW S 1000 RR
		, 'AIRFILTS1000RR', 'BE_FR', 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(24 -- Michelin Pilot Power Cup EVO 5 120/70 ZR17 58W
		, 'MICHPILPWCUPEVO512070', 'BE_FR', 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(25 -- Michelin Pilot Power Cup EVO 200/55 ZR17 78W
		, 'MICHPILPWCUPEVO520055', 'BE_FR', 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(22 -- Left Rear Traffic Indicator BMW S 1000 RR
		, 'LFTRRTRAFINDS1000RR', 'BE_FR', 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(23 -- Left Mirror BMW S 1000 RR
		, 'LFTMIRS1000RR', 'BE_FR', 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(30 -- Castrol 10w-40
		, 'CAST10W40', 'BE_NL', 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(31 -- Cooling Flued
		, 'COOLFLUED', 'BE_NL', 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(32 -- Michelin Pilot Road 5 120/70 ZR 17 58W
		, 'MICHPILRD512070', 'BE_FR', 'WHODIDIT', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(33 -- Michelin Pilot Road 5 190/55 ZR 17 75W
		, 'MICHPILRD519055', 'BE_FR', 'WHODIDIT', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(20 -- Oil Filter BMW S 1000 XR
		, 'OILFILTS1000XR', 'BE_FR', 'WHODIDIT', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(21 -- Air Filter BMW S 1000 XR
		, 'AIRFILTS1000XR', 'BE_FR', 'WHODIDIT', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(34 -- Michelin Anakee 3 120/70 R19 60V
		, 'MICHANAK312070', 'BE_NL', 'WHODIDIT', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(35 -- Michelin Anakee 3 170/60 R17 72V
		, 'MICHANAK317060', 'BE_NL', 'WHODIDIT', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(19 -- Windshield BMW R 1200 GS
		, 'WNDSHDR1200GS', 'BE_NL', 'WHODIDIT', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(17 -- MICHELIN Pilot Road 4 Trail 120/70 R19 60V
		, 'MICHPILRD4TR12070', 'BE_NL', 'NOTME', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(18 -- MICHELIN Pilot Road 4 Trail 170/60 R17 72V
		, 'MICHPILRD4TR17060', 'BE_NL', 'NOTME', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(36 -- Michelin Anakee Wild 90/90 21 54R
		, 'MICHANAKWLD9090', 'BE_NL', 'NOTME', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(37 -- Michelin Anakee Wild 150/70 R17 69R
		, 'MICHANAKWLD15070', 'BE_NL', 'NOTME', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(13 -- Oil Filter BMW F 850 GS
		, 'OILFILTF850GS', 'BE_NL', 'NOTME', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(14 -- Air Filter BMW F 850 GS
		, 'AIRFILTF850GS', 'BE_NL', 'WHODIDIT', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(38 -- Oil Filter BMW R 1250 RT
		, 'OILFILTR1250RT', 'BE_NL', 'NOTME', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(39 -- Air Filter BMW R 1250 RT
		, 'AIRFILTR1250RT', 'BE_NL', 'NOTME', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(7 -- Michelin Pilot Road 5 GT 120/70 ZR 17 58W
		, 'MICHPILRD5GT12070', 'BE_NL', 'NOTME', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(8 -- Michelin Pilot Road 5 GT 190/55 ZR 17 75W
		, 'MICHPILRD5GT19055', 'BE_NL', 'NOTME', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(9 -- Left Rear Traffic Indicator BMW K 1600 GT
		, 'LFTRRTRAFINDK1600GT', 'BE_NL', 'NOTME', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(10 -- Left Mirror BMW K 1600 GT
		, 'LFTMIRK1600GT', 'BE_NL', 'NOTME', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(5 -- Michelin Pilot Road 120/70 ZR 17 58W
		, 'MICHPILRD12070', 'BE_NL', 'NOTME', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(6 -- Michelin Pilot Road 190/55 ZR 17 75W
		, 'MICHPILRD19055', 'BE_NL', 'NOTME', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(3 -- Varta BMW Accu onderhoudsvrij
		, 'VARTABMWACCU', 'BE_NL', 'NOTME', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(1 -- Michelin Pilot Sport RS 120/70 ZR 17 58W
		, 'MICHPILSPRS12070', 'BE_NL', 'NOTME', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(2 -- Michelin Pilot Sport RS 190/55 ZR 17 75W
		, 'MICHPILSPRS19055', 'BE_NL', 'NOTME', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp )
values
	(4 -- Quickshifter BMW R 1200 RS
		, 'QCKSHIFTR1200RS', 'BE_NL', 'NOTME', clock_timestamp());

insert into moto_sales.moto_parts
	(part_id, part_number, part_language_code, update_user, update_timestamp)
values
	(54 -- testing empty string is null
		, '', 'BE_NL', 'NOTME',clock_timestamp());

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------


insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user,update_timestamp)
values
	(21 -- BMW R 1200 RS LC
		, null, 1200, '2CYLBOX', 'R1200RSLC', to_date('10/11/2009', 'DD/MM/YYYY'), 'BMW R 1200 RS LC', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user,update_timestamp)
values
	(1 -- BMW R 1200 RS
		, 21, 1200, '2CYLBOX', 'R1200RSAC', to_date('10/11/2001', 'DD/MM/YYYY'), 'BMW R 1200 RS AC', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user,update_timestamp)
values
	(22 -- BMW R 1200 R
		, null, 1200, '2CYLBOX', 'R1200RLC', to_date('10/10/2009', 'DD/MM/YYYY'), 'BMW R 1200 R LC', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user,update_timestamp)
values
	(2 -- BMW R 1200 R
		, 22, 1200, '2CYLBOX', 'R1200RAC', to_date('10/10/2001', 'DD/MM/YYYY'), 'BMW R 1200 R AC', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user,update_timestamp)
values
	(23 -- BMW K 1600 GT
		, null, 1600, '6CYLLINE', 'K1600GT', to_date('10/5/2011', 'DD/MM/YYYY'), 'BMW K 1600 GT', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user,update_timestamp)
values
	(3 -- BMW K 1200 LT
		, 23, 1200, '4CYLLINE', 'K1200LT', to_date('10/5/1999', 'DD/MM/YYYY'), 'BMW K 1200 LT', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user,update_timestamp)
values
	(24 -- BMW R 1250 RT
		, null, 1250, '2CYLBOX', 'R1250RTLC', to_date('10/3/2010', 'DD/MM/YYYY'), 'BMW R 1250 RT LC', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user,update_timestamp)
values
	(14 -- BMW R 1200 RT
		, 24, 1200, '2CYLBOX', 'R1200RTLC', to_date('10/3/2007', 'DD/MM/YYYY'), 'BMW R 1200 RT LC', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user,update_timestamp)
values
	(4 -- BMW R 1200 RT
		, 14, 1200, '2CYLBOX', 'R1200RTAC', to_date('10/3/2003', 'DD/MM/YYYY'), 'BMW R 1200 RT AC', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user,update_timestamp)
values
	(5 -- BMW F 850 GS
		, null, 850, '2CYLLINE', 'F850GS', to_date('10/4/2009', 'DD/MM/YYYY'), 'BMW F 850 GS', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user,update_timestamp)
values
	(26 -- BMW R 1250 GS
		, null, 1250, '2CYLBOX', 'R1250GSLC', to_date('10/3/2010', 'DD/MM/YYYY'), 'BMW R 1250 GS LC', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user,update_timestamp)
values
	(16 -- BMW R 1200 GS
		, 26, 1200, '2CYLBOX', 'R1200GSLC', to_date('10/3/2007', 'DD/MM/YYYY'), 'BMW R 1200 GS LC', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user,update_timestamp)
values
	(6 -- BMW R 1200 GS
		, 16, 1200, '2CYLBOX', 'R1200GSAC', to_date('10/3/2003', 'DD/MM/YYYY'), 'BMW R 1200 GS AC', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user,update_timestamp)
values
	(7 -- BMW S 1000 XR
		, null, 999, '4CYLLINE', 'S1000XR', to_date('10/6/2009', 'DD/MM/YYYY'), 'BMW S 1000 XR', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user,update_timestamp)
values
	(8 -- BMW S 1000 RR
		, null, 999, '4CYLLINE', 'S1000RR', to_date('10/6/2009', 'DD/MM/YYYY'), 'BMW S 1000 RR', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user,update_timestamp)
values
	(19 -- BMW R 1200 GS Adventure
		, null, 1200, '2CYLBOX', 'R1200GSADVLC', to_date('10/6/2009', 'DD/MM/YYYY'), 'BMW R 1200 GS Adventure LC', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user,update_timestamp)
values
	(10 -- BMW R nineT Pure
		, null, 1200, '2CYLBOX', 'RNineTPure', to_date('10/6/2009', 'DD/MM/YYYY'), 'BMW R NineT Pure AC', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user,update_timestamp)
values
	(11 -- BMW R nineT
		, 99, 1200, '2CYLBOX', 'RNineT', to_date('10/6/2009', 'DD/MM/YYYY'), 'BMW R NineT AC', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user, update_timestamp)
values
	(31 -- testing empty string is null
		, 99, 1200, '2CYLBOX2', '', to_date('10/6/2009', 'DD/MM/YYYY'), '', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.moto_products
	(product_id, replacement_product_id, product_cc, product_et_code, product_part_code, product_intro_date, product_name,
	 update_user, update_timestamp)
values
	(32 -- testing empty string is null
		, 123, 1200, '2CYLBOX3', '', to_date('10/6/2009', 'DD/MM/YYYY'), '', 'MEMYSELFANDI', clock_timestamp());

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------


insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 1, 21 -- BMW R 1200 RS
		, null, 18499, 1, 18499, 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 50, null, 1 -- Michelin Pilot Sport RS 120/70 ZR 17 58W
		, 200, 1, 200, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 50, null, 2 -- Michelin Pilot Sport RS 190/55 ZR 17 75W
		, 250, 1, 250, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 80, null, 1 -- Michelin Pilot Sport RS 120/70 ZR 17 58W
		, 210, 1, 210, 'WHODIDIT', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 80, null, 2 -- Michelin Pilot Sport RS 190/55 ZR 17 75W
		, 250, 1, 250, 'WHODIDIT', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 100, null, 3 -- Varta BMW Accu onderhoudsvrij
		, 150, 1, 150, 'WHODIDIT', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 120, null, 4 -- Quickshifter BMW R 1200 RS
		, 600, 1, 600, 'WHODIDIT', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 2, 22 -- BMW R 1200 R
		, null, 15799, 1, 15799, 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 51, null, 5 -- Michelin Pilot Road 120/70 ZR 17 58W
		, 175, 1, 175, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 51, null, 6 -- Michelin Pilot Road 190/55 ZR 17 75W
		, 205, 1, 205, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 81, null, 5 -- Michelin Pilot Road 120/70 ZR 17 58W
		, 180, 1, 180, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 81, null, 6 -- Michelin Pilot Road 190/55 ZR 17 75W
		, 210, 1, 210, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 101, null, 3 -- Varta BMW Accu onderhoudsvrij
		, 150, 1, 150, 'WHODIDIT', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 3, 23 -- BMW K 1600 GT
		, null, 25499, 1, 25499, 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 52, null, 7 -- Michelin Pilot Road 5 GT 120/70 ZR 17 58W
		, 200, 1, 200, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 52, null, 8 -- Michelin Pilot Road 5 GT 190/55 ZR 17 75W
		, 250, 1, 250, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 82, null, 7 -- Michelin Pilot Road 5 GT 120/70 ZR 17 58W
		, 210, 1, 210, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 82, null, 8 -- Michelin Pilot Road 5 GT 190/55 ZR 17 75W
		, 250, 1, 250, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 122, null, 9 -- Left Rear Traffic Indicator BMW K 1600 GT
		, 80, 1, 80, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 122, null, 10 -- Left Mirror BMW K 1600 GT
		, 170, 1, 170, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 4, 24 -- BMW R 1250 RT
		, null, 22799, 1, 22799, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 53, null, 40 -- Michelin Pilot Road 5 120/70 ZR 17 58W
		, 200, 1, 200, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 53, null, 41 -- Michelin Pilot Road 5 190/55 ZR 17 75W
		, 220, 1, 220, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 83, null, 40 -- Michelin Pilot Road 5 120/70 ZR 17 58W
		, 200, 1, 200, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 83, null, 41 -- Michelin Pilot Road 5 190/55 ZR 17 75W
		, 220, 1, 220, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 123, null, 38 -- Oil Filter BMW R 1250 RT
		, 90, 1, 90, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 123, null, 39 -- Air Filter BMW R 1250 RT
		, 105, 1, 105, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(3, 123, null, 30 -- Castrol 10w-40
		, 210, 3, 70, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(4, 123, null, 31 -- Cooling Flued
		, 30, 3, 10, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 5, 5 -- BMW F 850 GS
		, null, 13799, 1, 13799, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 54, null, 36 -- Michelin Anakee Wild 90/90 21 54R
		, 150, 1, 150, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 54, null, 37 -- Michelin Anakee Wild 150/70 R17 69R
		, 200, 1, 200, 'WHODIDIT', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 84, null, 36 -- Michelin Anakee Wild 90/90 21 54R
		, 160, 1, 160, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 84, null, 37 -- Michelin Anakee Wild 150/70 R17 69R
		, 200, 1, 200, 'WHODIDIT', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 124, null, 13 -- Oil Filter BMW F 850 GS
		, 70, 1, 70, 'WHODIDIT', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 124, null, 14 -- Air Filter BMW F 850 GS
		, 75, 1, 75, 'WHODIDIT', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(3, 124, null, 30 -- Castrol 10w-40
		, 210, 3, 70, 'WHODIDIT', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(4, 124, null, 31 -- Cooling Flued
		, 30, 3, 10, 'WHODIDIT', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 7, 26 -- BMW R 1250 GS
		, null, 17499, 1, 17499, 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 56, null, 17 -- MICHELIN Pilot Road 4 Trail 120/70 R19 60V
		, 170, 1, 170, 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 56, null, 18 -- MICHELIN Pilot Road 4 Trail 170/60 R17 72V
		, 190, 1, 190, 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 86, null, 17 -- MICHELIN Pilot Road 4 Trail 120/70 R19 60V
		, 170, 1, 170, 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 86, null, 18 -- MICHELIN Pilot Road 4 Trail 170/60 R17 72V
		, 190, 1, 190, 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 106, null, 19 -- Windshield BMW R 1250 GS
		, 270, 1, 270, 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 8, 26 -- BMW R 1250 GS
		, null, 21999, 1, 21999, 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 57, null, 34 -- Michelin Anakee 3 120/70 R19 60V
		, 200, 1, 200, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 57, null, 35 -- Michelin Anakee 3 170/60 R17 72V
		, 250, 1, 250, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 107, null, 19 -- Windshield BMW R 1200 GS
		, 260, 1, 260, 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 9, 7 -- BMW S 1000 XR
		, null, 21895, 1, 21895, 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 58, null, 32 -- Michelin Pilot Road 5 120/70 ZR 17 58W
		, 200, 1, 200, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 58, null, 33 -- Michelin Pilot Road 5 190/55 ZR 17 75W
		, 250, 1, 250, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 88, null, 32 -- Michelin Pilot Road 5 120/70 ZR 17 58W
		, 200, 1, 200, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 88, null, 33 -- Michelin Pilot Road 5 190/55 ZR 17 75W
		, 250, 1, 250, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 128, null, 20 -- Oil Filter BMW S 1000 XR
		, 80, 1, 80, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 128, null, 21 -- Air Filter BMW S 1000 XR
		, 105, 1, 105, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(3, 128, null, 15 -- Castrol 10w-40
		, 210, 3, 70, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(4, 128, null, 16 -- Cooling Flued
		, 30, 3, 10, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 10, 8 -- BMW S 1000 RR
		, null, 19785, 1, 19785, 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 59, null, 22 -- Left Rear Traffic Indicator BMW S 1000 RR
		, 80, 1, 80, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 59, null, 23 -- Left Mirror BMW S 1000 RR
		, 170, 1, 170, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 89, null, 24 -- Michelin Pilot Power Cup EVO 5 120/70 ZR17 58W
		, 200, 1, 200, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 89, null, 25 -- Michelin Pilot Power Cup EVO 200/55 ZR17 78W
		, 250, 1, 250, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 129, null, 26 -- Oil Filter BMW S 1000 RR
		, 80, 1, 80, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 129, null, 27 -- Air Filter BMW S 1000 RR
		, 105, 1, 105, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(3, 129, null, 15 -- Castrol 10w-40
		, 210, 3, 70, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(4, 129, null, 16 -- Cooling Flued
		, 30, 3, 10, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 11, 19 -- BMW R 1200 GS Adventure
		, null, 20785, 1, 20785, 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 90, null, 28 -- Michelin Anakee 2 110/80 R19 59V
		, 190, 1, 190, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 90, null, 29 -- Michelin Anakee 2 150/70 R17 69V
		, 230, 1, 230, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 12, 10 -- BMW R nineT Pure
		, null, 15785, 1, 15785, 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 91, null, 11 -- Michelin Pilot Road 5 120/70 ZR 17 58W
		, 160, 1, 160, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 91, null, 12 -- Michelin Pilot Road 5 190/55 ZR 17 75W
		, 200, 1, 200, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 13, 11 -- BMW R nineT
		, null, 16785, 1, 16785, 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 92, null, 11 -- Michelin Pilot Road 5 120/70 ZR 17 58W
		, 160, 1, 160, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(2, 92, null, 12 -- Michelin Pilot Road 5 190/55 ZR 17 75W
		, 200, 1, 200, 'SOMEONEELSE', clock_timestamp());

insert into moto_sales.invoice_lines
	(invoice_line_number, invoice_number, product_id, part_id, amount, quantity, unit_price, update_user, update_timestamp )
values
	(1, 99, 99, 99 -- Michelin Pilot Road 5 190/55 ZR 17 75W
		, 200, 1, 200, 'SOMEONEELSE', clock_timestamp());


------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------


insert into moto_sales.product_feature_class
	(product_feature_class_id, product_feature_class_code, product_feature_class_desc, update_user, update_timestamp )
values
	(3 -- Accessory
		, 'ACC' -- Accessory
		, 'Accessory', 'THESAINT', clock_timestamp());

insert into moto_sales.product_feature_class
	(product_feature_class_id, product_feature_class_code, product_feature_class_desc, update_user, update_timestamp )
values
	(2 -- Factory Mounted Option
		, 'FMO' -- Factory Mounted Option
		, 'Factory Mounted Option', 'THESAINT', clock_timestamp());

insert into moto_sales.product_feature_class
	(product_feature_class_id, product_feature_class_code, product_feature_class_desc, update_user, update_timestamp )
values
	(1 -- Factory Mounted Standard
		, 'FMS' -- Factory Mounted Standard
		, 'Factory Mounted Standard', 'THESAINT', clock_timestamp());


------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------


insert into moto_sales.product_feature_cat
	(product_feature_category_id, product_feature_category_code, prod_feat_cat_language_code,prod_feat_cat_description, update_user, update_timestamp )
values
	(51 -- LUGGAGE EN
		, 'LGGG' -- LUGGAGE EN
		, 'US_EN'
		,'Luggage'
		, 'THELASTONESTANDING'
        , clock_timestamp());

insert into moto_sales.product_feature_cat
	(product_feature_category_id, product_feature_category_code, prod_feat_cat_language_code,prod_feat_cat_description, update_user, update_timestamp )
values
	(21 -- Color EN
		, 'CLR' -- Color EN
		, 'US_EN'
		, 'Color'
	    ,'THELASTONESTANDING'
	    , clock_timestamp());

insert into moto_sales.product_feature_cat
	(product_feature_category_id, product_feature_category_code, prod_feat_cat_language_code,prod_feat_cat_description, update_user, update_timestamp )
values
	(52 -- LUGGAGE NL
		, 'LGGG' -- LUGGAGE NL
		, 'BE_NL'
		, 'Baggage'
		, 'THESAINT'
		, clock_timestamp());

insert into moto_sales.product_feature_cat
	(product_feature_category_id, product_feature_category_code, prod_feat_cat_language_code,prod_feat_cat_description, update_user, update_timestamp )
values
	(22 -- Color NL
		, 'CLR' -- Color NL
		, 'BE_NL'
		,'Kleur'
	    ,'THELASTONESTANDING'
	    , clock_timestamp());

insert into moto_sales.product_feature_cat
	(product_feature_category_id, product_feature_category_code, prod_feat_cat_language_code,prod_feat_cat_description, update_user, update_timestamp )
values
	(32 -- WHEELS NL
		, 'WHLS' -- WHEELS NL
		, 'BE_NL'
		, 'Wielen'
		, 'THELASTONESTANDING'
        , clock_timestamp());

insert into moto_sales.product_feature_cat
	(product_feature_category_id, product_feature_category_code, prod_feat_cat_language_code,prod_feat_cat_description, update_user, update_timestamp )
values
	(41 -- Touring NL
		, 'TRNG' -- Touring NL
		, 'BE_NL'
		,'Toeren'
		, 'THELASTONESTANDING'
        , clock_timestamp());

insert into moto_sales.product_feature_cat
	(product_feature_category_id, product_feature_category_code, prod_feat_cat_language_code,prod_feat_cat_description, update_user, update_timestamp )
values
	(31 -- WHEELS FR
		, 'WHLS' -- WHEELS FR
		, 'BE_FR'
		, 'Roues'
		, 'THELASTONESTANDING'
        , clock_timestamp());

insert into moto_sales.product_feature_cat
	(product_feature_category_id, product_feature_category_code, prod_feat_cat_language_code,prod_feat_cat_description, update_user, update_timestamp )
values
	(23 -- Color FR
		, 'CLR' -- Color FR
		, 'BE_FR'
		,'Couleur'
		, 'THELASTONESTANDING'
        , clock_timestamp());

insert into moto_sales.product_feature_cat
	(product_feature_category_id, product_feature_category_code, prod_feat_cat_language_code,prod_feat_cat_description, update_user, update_timestamp )
values
	(53 -- LUGGAGE FR
		, 'LGGG' -- LUGGAGE FR
		, 'BE_FR'
		,'Baggage'
		, 'THESAINT'
		, clock_timestamp());

insert into moto_sales.product_feature_cat
	(product_feature_category_id, product_feature_category_code, prod_feat_cat_language_code,prod_feat_cat_description, update_user, update_timestamp )
values
	(991 -- HP ONDERDELEN NL
		, 'HPPARTS' -- HP Parts
		, 'BE_NL'
		,'HP Onderdelen'
		, 'THESAINT'
		, clock_timestamp());

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------------------------------------------

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(7 -- Color : BMW MOTORSPORT COLOR
		, 23 -- Color FR
		, 'BMWMTRSP' -- BMW MOTORSPORT COLOR
		, 'BE_FR'
		,'BMW Motorsport Couleur'
		, 'THESAINT'
		, clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(18 -- TANK BAG S1000
		, 53 -- TANK BAG FR
		, 'TNKBGS1000' -- TANK BAG S1000
		, 'BE_FR'
		,'Sac de Réservoir S1000'
		, 'THESAINT'
		, clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(11 -- FORGED WHEELS
		, 31 -- WHEELS FR
		, 'FRGDWHLS' -- FORGED WHEELS
		, 'BE_FR'
		,'Roues Forgées'
		, 'MEMYSELFANDI'
		, clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(15 -- Color : Style HP
		, 22-- Color NL
		, 'STLHP' -- Style HP
		, 'BE_NL'
	    ,'Hoge Performantie Stijl'' ||
'       ,'MEMYSELFANDI'
		, clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(113 -- Color : Black Storm Metallic
		, 22 -- Color NL
		, 'BLSTMET' -- Black Storm Metallic
		, 'BE_NL'
		, 'Zwarte Storm Metallic'
		, 'MEMYSELFANDI'
		, clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(13 -- Color : Style Exclusive
		, 22 -- Color NL
		, 'STEXCL' -- Style Exclusive
		, 'BE_NL'
		, 'Exclusieve Stijl'
        , 'MEMYSELFANDI'
        , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(9 -- Cruise Control
		, 41 -- Touring
		, 'CRSCNTRL' -- Cruise Control
		, 'BE_NL'
		, 'Cruise Control'
		, 'MEMYSELFANDI'
		, clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(20 -- Small Top Topcase
		, 52 -- LUGGAGE NL
		, 'TPCSSMLL' -- Cruise Control
		, 'BE_NL'
		,'Kleine Topkoffer'
		, 'MEMYSELFANDI'
		, clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(19 -- Large Topcase
		, 52 -- LUGGAGE NL
		, 'TPCSLRG' -- Cruise Control
		, 'BE_NL'
		, 'Grote Topkoffer'
		, 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(1 -- Color : Alpine White
		, 22 -- Color NL
		, 'ALPNWHT' -- Alpine White
		, 'BE_NL'
		,'Alpine Wit'
		, 'MEMYSELFANDI'
		, clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(14 -- Color : Style Elegance Pack
		, 22 -- Color NL
		, 'STLELGNCPCK' -- Style Elegance Pack
		, 'BE_NL'
	    , 'Elegantie Pakket Stijl'
	    , 'MEMYSELFANDI'
	    , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(16 -- Color : Style Sport Pack
		, 22 -- Color NL
		, 'STLSPRTPCK' -- Style Sport Pack
		, 'BE_NL'
		, 'Sportpakket Stijl'
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(2 -- Color : Bleu Planet Metallic
		, 22 -- Color NL
		, 'BLPLNTMTLLC' -- Bleu Planet Metallic
		, 'BE_NL'
		,'Blauwe Planeet Metallic'
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(8 -- Classic Forged Wheels
		, 32 -- WHEELS NL
		, 'CLSSCFRGDWHLS' -- FORGED WHEELS
		, 'BE_NL'
		,'Gesmede Wielen'
		, 'MEMYSELFANDI'
		, clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(123 -- Color : Black Storm Metallic
		, 21 -- Color EN
		, 'BLSTMET' -- Black Storm Metallic
		, 'US_EN'
	    ,'Black Storm Metallic'
	    , 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(5 -- Color : Black Storm Metallic/Vintage
		, 21 -- Color EN
		, 'BLSTRMMTLLCVNTG' -- Black Storm Metallic/Vintage
		, 'US_EN'
		,'Black Storm Metallic/Vintage'
	    , 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(10 -- Color : Catalano Grey
		, 21 -- Color EN
		, 'CTLNGREY' -- Catalano Grey
		, 'US_EN'
	    ,'Catalano Grey'
	    , 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(4 -- Color : Black Storm Metallic/Aurum
		, 21 -- Color EN
		, 'BLSTRMMTLLCAURM' -- Black Storm Metallic/Aurum
		, 'US_EN'
		,'Black Storm Metallic/Aurum'
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(12 -- Color : Racing Red
		, 22 -- Color NL
		, 'RCNGRED' -- Racing Red
		, 'BE_NL'
		,'Racing Rood'
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(616 -- Color : Blue - White
		, 22 -- Color NL
		, 'BLUEWHITE' -- Blue - White
		, 'BE_NL'
		,'Blauw - Wit'
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(417 -- TANK BAG R1200
		, 52 -- LUGGAGE NL
		, 'TNKBGR1200' -- TANK BAG R1200
		, 'BE_NL'
		, 'Tanktas'
		, 'THESAINT'
        , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(626 -- Color : Blue - White
		, 21 -- Color EN
		, 'BLUEWHITE' -- Blue - White
		, 'US_EN'
	    ,'Blue - White'
	    , 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(517 -- TANK BAG R1200
		, 51 -- Luggage EN
		, 'TNKBGR1200' -- TANK BAG R1200
		, 'US_EN'
	    , 'Tank Bag'
	    , 'THESAINT'
	    , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(991 -- TANK BAG R1200
		, 991 -- HP onderdeleten NL
		, 'VTSTNHPS1000XR2014' -- Voetsteun HP S1000XR 2014
		, 'BE_NL'
	    , 'Voetsteun HP S1000XR 2014'
	    , 'THESAINT'
	    , clock_timestamp());

-- From here in comments in this release !!
insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(992 -- TANK BAG R1200
		, 991 -- HP onderdeleten NL
		, 'VTSTNHPS1000XR2014' -- Voetsteun HP S1000XR 2014
		, 'BE_EN'
	    , 'FOOTPAD HP S1000XR 2014'
	    , 'THESAINT'
	    , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(9991 -- BMW Navigator VI GPS Mount
		, 9991 -- Mounts
		, 'BMWNAVVIMNT' -- BMW Navigator VI GPS Mount
		, 'BE_NL'
	    , 'BMW Navigator VI GPS-houder'
	    , 'THEGOODBADUGLY'
        , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(9992 -- BMW Navigator VI GPS Mount
		, 9991 -- Mounts
		, 'BMWNAVVIMNT' -- BMW Navigator VI GPS Mount
		, 'EN_US'
	    , 'BMW Navigator VI GPS-mount'
	    , 'THEGOODBADUGLY'
        , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(9993 -- BMW Navigator VI GPS Mount
		, 9991 -- Mounts
		, 'BMWNAVVIMNT' -- BMW Navigator VI GPS Mount
		, 'BE_FR'
	    , 'Support GPS pour BMW Navigator V'
	    , 'THEGOODBADUGLY'
        , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(9994 -- BMW Navigator V GPS Mount
		, 9991 -- Mounts
		, 'BMWNAVVMNT' -- BMW Navigator V GPS Mount
		, 'BE_NL'
	    , 'BMW Navigator V GPS-houder'
	    , 'THEGOODBADUGLY'
        , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(9995 -- BMW Navigator V GPS Mount
		, 9991 -- Mounts
		, 'BMWNAVVMNT' -- BMW Navigator V GPS Mount
		, 'EN_US'
	    , 'BMW Navigator V GPS-mount'
	    , 'THEGOODBADUGLY'
        , clock_timestamp());

insert into moto_sales.product_features
	(product_feature_id, product_feature_cat_id, product_feature_code, product_feature_language_code, product_feature_description, update_user, update_timestamp )
values
	(9996 -- BMW Navigator V GPS Mount
		, 9991 -- Mounts
		, 'BMWNAVVMNT' -- BMW Navigator V GPS Mount
		, 'BE_FR'
	    , 'Support GPS pour BMW Navigator V'
	    , 'THEGOODBADUGLY'
        , clock_timestamp());


------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------


insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(123 -- Color : Black Storm Metallic
		, 10 -- BMW R NineT Pure
		, 1 -- Factory Mounted Standard
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(5 -- Color : Black Storm Metallic/Vintage
		, 11 -- BMW R NineT
		, 2 -- Factory Mounted Option
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(10 -- Color : Catalano Grey
		, 10 -- BMW R NineT Pure
		, 1 -- Factory Mounted Standard
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(4 -- Color : Black Storm Metallic/Aurum
		, 10 -- BMW R NineT Pure
		, 2 -- Factory Mounted Option
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(12 -- Color : Racing Red
		, 5 -- BMW F 850 GS
		, 1 -- Factory Mounted Standard
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(13 -- Color : Style Exclusive
		, 5 -- BMW F 850 GS
		, 2 -- Factory Mounted Option
		, 'THESAINT', clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(9 -- Cruise Control
		, 5 -- BMW F 850 GS
		, 2 -- Factory Mounted Option
		, 'THESAINT', clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(626 -- Color : Blue - White
		, 21 -- BMW R 1200 RS
		, 1 -- Factory Mounted Standard
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(517 -- Tank Bag R1200
		, 21 -- BMW R 1200 RS
		, 3 -- Accessory
		, 'THESAINT', clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(616 -- Color : Blue - White
		, 19 -- BMW R 1200 GS Adventure
		, 1 -- Factory Mounted Standard
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(417 -- Tank Bag R1200
		, 19 -- BMW R 1200 GS Adventure
		, 3 -- Accessory
		, 'THESAINT', clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(626 -- Color : Blue - White
		, 22 -- BMW R 1200 R
		, 1 -- Factory Mounted Standard
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(517 -- Tank Bag R1200
		, 22 -- BMW R 1200 R
		, 3 -- Accessory
		, 'THESAINT', clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(123 -- Color : Black Storm Metallic
		, 23 -- BMW K 1600 GT
		, 1 -- Factory Mounted Standard
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(2 -- Color : Bleu Planet Metallic
		, 23 -- BMW K 1600 GT
		, 2 -- Factory Mounted Option
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(19 -- Large Topcase
		, 23 -- BMW K 1600 GT
		, 1 -- Factory Mounted Standard
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(8 -- Classic Forged Wheels
		, 23 -- BMW K 1600 GT
		, 2 -- Factory Mounted Option
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(9 -- Cruise Control
		, 23 -- BMW K 1600 GT
		, 2 -- Factory Mounted Option
		, 'THESAINT', clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(1 -- Color : Alpine White
		, 24 -- BMW R 1250 RT
		, 1 -- Factory Mounted Standard
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(14 -- Color : Style Elegance Pack
		, 24 -- BMW R 1250 RT
		, 2 -- Factory Mounted Option
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(16 -- Color : Style Sport Pack
		, 24 -- BMW R 1250 RT
		, 2 -- Factory Mounted Option
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(20 -- Small Top Topcase
		, 24 -- BMW R 1250 RT
		, 3 -- Accessory
		, 'THESAINT', clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(19 -- Large Topcase
		, 24 -- BMW R 1250 RT
		, 3 -- Accessory
		, 'THESAINT', clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(9 -- Cruise Control
		, 24 -- BMW R 1250 RT
		, 2 -- Factory Mounted Option
		, 'THESAINT', clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(113 -- Color : Black Storm Metallic
		, 26 -- BMW R 1250 GS
		, 1 -- Factory Mounted Standard
		, 'THESAINT', clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(13 -- Color : Style Exclusive
		, 26 -- BMW R 1250 GS
		, 2 -- Factory Mounted Option
		, 'THESAINT', clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(15 -- Color : Style HP
		, 26 -- BMW R 1250 GS
		, 2 -- Factory Mounted Option
		, 'THESAINT', clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(7 -- Color : BMW MOTORSPORT COLOR
		, 8 -- BMW S 1000 RR
		, 2 -- Factory Mounted Option
		, 'THESAINT', clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(11 -- FORGED WHEELS
		, 8 -- BMW S 1000 RR
		, 2 -- Factory Mounted Option
		, 'THESAINT', clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(18 -- TANK BAG S1000
		, 8 -- BMW S 1000 RR
		, 3 -- Accessory
		, 'THESAINT', clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(7 -- Color : BMW MOTORSPORT COLOR
		, 7 -- BMW S 1000 XR
		, 2 -- Factory Mounted Option
		, 'THESAINT', clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(18 -- TANK BAG S1000
		, 7 -- BMW S 1000 XR
		, 3 -- Accessory
		, 'THESAINT', clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(113 -- Color : Black Storm Metallic
		, 11 -- BMW R NineT
		, 4 -- External Patner Accessoire
		, 'NOTTHEOTHER'
        , clock_timestamp());

insert into moto_sales.product_feat_class_rel
	(product_feature_id, product_id, product_feature_class_id, update_user, update_timestamp )
values
	(417 -- Tank Bag R1200
		, 11 -- BMW R NineT
        ,NULL -- UNKNOWN
		, 'NOTTHEOTHER'
        , clock_timestamp());


------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------


insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('LGGG' -- LUGGAGE FR
		, 'BE_FR', 'Bagage', 'THESAINT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('CLR' -- Color FR
		, 'BE_FR', 'Couleur', 'THELASTONESTANDING', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('WHLS' -- WHEELS FR
		, 'BE_FR', 'Roues', 'NOTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('TRNG' -- Touring NL
		, 'BE_NL', 'Touren', 'NOTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('WHLS' -- WHEELS NL
		, 'BE_NL', 'Wheels', 'NOTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('CLR' -- Color NL
		, 'BE_NL', 'Kleuren', 'NOTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('LGGG' -- LUGGAGE NL
		, 'BE_NL', 'Baggage', 'NOTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('CLR' -- Color EN
		, 'US_EN', 'Colors', 'NOTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('LGGG' -- LUGGAGE EN
		, 'US_EN', 'Luggage', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('TNKBGR1200' -- TANK BAG R1200
		, 'US_EN', 'Tank Bag', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('BLUEWHITE' -- Blue - White
		, 'US_EN', 'Blue - White', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('BLUEWHITE' -- Blue - White
		, 'BE_NL', 'Blauw - Wit', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('RCNGRED' -- Racing Red
		, 'BE_NL', 'Racing Rood', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('BLSTRMMTLLCAURM' -- Black Storm Metallic/Aurum
		, 'US_EN', 'Black Storm Metallic/Aurum', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('CTLNGREY' -- Catalano Grey
		, 'US_EN', 'Catalano Grey', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('BLSTRMMTLLCVNTG' -- Black Storm Metallic/Vintage
		, 'US_EN', 'Black Storm Metallic/Vintage', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('BLSTMET' -- Black Storm Metallic
		, 'US_EN', 'Black Storm Metallic', 'MEMYSELFANDI', clock_timestamp());


insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('CLSSCFRGDWHLS' -- FORGED WHEELS
		, 'BE_NL', 'Gesmede Wielen', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('BLPLNTMTLLC' -- Bleu Planet Metallic
		, 'BE_NL', 'Blauwe Planeet Metallic', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('STLSPRTPCK' -- Style Sport Pack
		, 'BE_NL', 'Sportpakket Stijl', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('STLELGNCPCK' -- Style Elegance Pack
		, 'BE_NL', 'Elegantie Pakket Stijl', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('ALPNWHT' -- Alpine White
		, 'BE_NL', 'Alpine Wit', 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('TPCSLRG' --  Large Topcase
		, 'BE_NL', 'Grote Topkoffer' -- Large Topcase
		, 'MEMYSELFANDI', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('TPCSSMLL' -- Small Top Topcase
		, 'BE_NL', 'Kleine Topkoffer' -- Large Topcase
		, 'WHODIDIT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('CRSCNTRL' -- Cruise Control
		, 'BE_NL', 'Cruise Control' -- Cruise Control
		, 'WHODIDIT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('STEXCL' -- Style Exclusive
		, 'BE_NL', 'Exclusieve Stijl', 'WHODIDIT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('BLSTMET' -- Black Storm Metallic
		, 'BE_NL', 'Zwarte Storm Metallic', 'WHODIDIT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('STLHP' -- Style HP
		, 'BE_NL', 'Hoge Performantie Stijl', 'WHODIDIT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('FRGDWHLS' -- FORGED WHEELS
		, 'BE_FR', 'Roues Forgées', 'WHODIDIT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('TNKBGS1000' -- TANK BAG S1000
		, 'BE_FR', 'Sac de Réservoir S1000', 'WHODIDIT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('BMWMTRSP' -- bmw motorsport color
		, 'BE_FR', 'BMW Motorsport Couleur', 'WHODIDIT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('QCKSHIFTR1200RS' -- Quickshifter BMW R 1200 RS
		, 'BE_NL', 'Quickshifter BMW R 1200 RS', 'WHODIDIT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHPILSPRS19055' -- Michelin Pilot Sport RS 190/55 ZR 17 75W
		, 'BE_NL', 'Michelin Pilot Sport RS 190/55 ZR 17 75W', 'WHODIDIT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHPILSPRS12070' -- Michelin Pilot Sport RS 120/70 ZR 17 58W
		, 'BE_NL', 'Michelin Pilot Sport RS 120/70 ZR 17 58W', 'WHODIDIT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('VARTABMWACCU' -- Varta BMW Accu onderhoudsvrij
		, 'BE_NL', 'Varta BMW Batterij Onderhoudsvrij', 'WHODIDIT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHPILRD19055' -- Michelin Pilot Road 190/55 ZR 17 75W
		, 'BE_NL', 'Michelin Pilot Road 190/55 ZR 17 75W', 'WHODIDIT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHPILRD12070' -- Michelin Pilot Road 120/70 ZR 17 58W
		, 'BE_NL', 'Michelin Pilot Road 120/70 ZR 17 58W', 'WHODIDIT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('LFTMIRK1600GT' -- Left Mirror BMW K 1600 GT
		, 'BE_NL', 'Linker Spiegel BMW K 1600 GT', 'WHODIDIT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('LFTRRTRAFINDK1600GT' -- Left Rear Traffic Indicator BMW K 1600 GT
		, 'BE_NL', 'Richtingaanwijzer Links Achteraan BMW K 1600 GT', 'WHODIDIT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHPILRD5GT19055' -- Michelin Pilot Road 5 GT 190/55 ZR 17 75W
		, 'BE_NL', 'Michelin Pilot Road 5 GT 190/55 ZR 17 75W', 'WHODIDIT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHPILRD5GT12070' -- Michelin Pilot Road 5 GT 120/70 ZR 17 58W
		, 'BE_NL', 'Michelin Pilot Road 5 GT 120/70 ZR 17 58W', 'WHODIDIT', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('AIRFILTR1250RT' -- Air Filter BMW R 1250 RT
		, 'BE_NL', 'Luchtfilter BMW R 1250 RT', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('OILFILTR1250RT' -- Oil Filter BMW R 1250 RT
		, 'BE_NL', 'Oliefilter BMW R 1250 RT', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('AIRFILTF850GS' -- Air Filter BMW F 850 GS
		, 'BE_NL', 'Luchtfilter BMW F 850 GS', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('OILFILTF850GS' -- Oil Filter BMW F 850 GS
		, 'BE_NL', 'Oliefilter BMW F 850 GS', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHANAKWLD15070' -- Michelin Anakee Wild 150/70 R17 69R
		, 'BE_NL', 'Michelin Anakee Wild 150/70 R17 69R', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHANAKWLD9090' -- Michelin Anakee Wild 90/90 21 54R
		, 'BE_NL', 'Michelin Anakee Wild 90/90 21 54R', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHPILRD4TR17060' -- MICHELIN Pilot Road 4 Trail 170/60 R17 72V
		, 'BE_NL', 'MICHELIN Pilot Road 4 Trail 170/60 R17 72V', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHPILRD4TR12070' -- MICHELIN Pilot Road 4 Trail 120/70 R19 60V
		, 'BE_NL', 'MICHELIN Pilot Road 4 Trail 120/70 R19 60V', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('WNDSHDR1200GS' -- Windshield BMW R 1200 GS
		, 'BE_NL', 'Voorruit BMW R 1200 GS', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHANAK317060' -- Michelin Anakee 3 170/60 R17 72V
		, 'BE_NL', 'Michelin Anakee 3 170/60 R17 72V', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHANAK312070' -- Michelin Anakee 3 120/70 R19 60V
		, 'BE_NL', 'Michelin Anakee 3 120/70 R19 60V', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('AIRFILTS1000XR' -- Air Filter BMW S 1000 XR
		, 'BE_FR', 'Filtre à air BMW S 1000 XR', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('OILFILTS1000XR' -- Oil Filter BMW S 1000 XR
		, 'BE_FR', 'Filtre à l''''huile BMW S 1000 XR', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHPILRD519055' -- Michelin Pilot Road 5 190/55 ZR 17 75W
		, 'BE_FR', 'Michelin Pilot Road 5 190/55 ZR 17 75W', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHPILRD512070' -- Michelin Pilot Road 5 120/70 ZR 17 58W
		, 'BE_FR', 'Michelin Pilot Road 5 120/70 ZR 17 58W', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('COOLFLUED' -- Cooling Flued
		, 'BE_NL', 'Koelvloeistof', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('CAST10W40' -- Castrol 10w-40
		, 'BE_NL', 'Minerale Olie Castrol 10w-40', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('LFTMIRS1000RR' -- Left Mirror BMW S 1000 RR
		, 'BE_FR', 'Rétroviseur Gauche BMW S 1000 RR', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('LFTRRTRAFINDS1000RR' -- Left Rear Traffic Indicator BMW S 1000 RR
		, 'BE_FR', 'Indicateur de trafic arrière gauche BMW S 1000 RR', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHPILPWCUPEVO520055' -- Michelin Pilot Power Cup EVO 5 200/55 ZR17 78W
		, 'BE_FR', 'Michelin Pilot Power Cup EVO 5 200/55 ZR17 78W', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHPILPWCUPEVO512070' -- Michelin Pilot Power Cup EVO 5 120/70 ZR17 58W
		, 'BE_FR', 'Michelin Pilot Power Cup EVO 5 120/70 ZR17 58W', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('AIRFILTS1000RR' -- Air Filter BMW S 1000 RR
		, 'BE_FR', 'Filtre à air BMW S 1000 RR', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('OILFILTS1000RR' -- Oil Filter BMW S 1000 RR
		, 'BE_FR', 'Filtre à l''''huile BMW S 1000 RR', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('COOLFLUED' -- Cooling Flued
		, 'BE_FR', 'Fluide de refroidissement', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('CAST10W40' -- Castrol 10w-40
		, 'BE_FR', 'Huile minérale Castrol 10w-40', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHANAK215070' -- Michelin Anakee 2 150/70 R17 69V
		, 'US_EN', 'Michelin Anakee 2 150/70 R17 69V', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHANAK211080' -- Michelin Anakee 2 110/80 R19 59V
		, 'US_EN', 'Michelin Anakee 2 110/80 R19 59V', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHPILRD519055' -- Michelin Pilot Road 5 190/55 ZR 17 75W
		, 'US_EN', 'Michelin Pilot Road 5 190/55 ZR 17 75W', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHPILRD512070' -- Michelin Pilot Road 5 120/70 ZR 17 58W
		, 'US_EN', 'Michelin Pilot Road 5 120/70 ZR 17 58W', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHPILRD519055' -- Michelin Pilot Road 5 190/55 ZR 17 75W
		, 'BE_NL', 'Michelin Pilot Road 5 190/55 ZR 17 75W', 'ITWASNTME', clock_timestamp());

insert into moto_sales.codes_to_language
	(code, language_code, description, update_user, update_timestamp )
values
	('MICHPILRD512070' -- Michelin Pilot Road 5 120/70 ZR 17 58W
		, 'BE_NL', 'Michelin Pilot Road 5 120/70 ZR 17 58W', 'ITWASNTME', clock_timestamp());

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------


INSERT INTO moto_sales.payments (transaction_id, date_time, invoice_number, amount, customer_number)
VALUES ('0HxZ1ySBQkBzlmLv0hVO4Ux0lFL2rItx', '2011-03-30 00:00:00.000000', 7, 16989.00, 7),
       ('0XNTWyweImloRiKuplt4HQWsM1eigFuG', '2013-08-15 00:00:00.000000', 58, 346.00, 10),
       ('0k6pp0oZzp1zOW12awypW9l3hPs4Nchd', '2013-05-30 00:00:00.000000', 122, 227.00, 3),
       ('0JU7zb7LZ1Ccgs0dXCkZZbwCKbdv6VHu', '2011-02-21 00:00:00.000000', 5, 13528.00, 21),
       ('07vyT6vpIulOpZjsbl0bcW3525QyVrRf', '2013-10-31 00:00:00.000000', 2002, 713.00, 5),
       ('0DqXJGWuCdJNSJsyL8f3wPto0R69JFsi', '2013-10-31 00:00:00.000000', 2005, 713.00, 130);


insert into moto_sales.cust_addresses
	(customer_number, address_number, address_type, update_timestamp, update_user)
select
	customer_number,
	address_number,
	'INV' as address_type,
	ad.update_timestamp,
	ad.update_user
from moto_sales.customers cu
join moto_sales.addresses ad on cu.customer_invoice_address_id = ad.address_number
union
select
	customer_number,
	address_number,
	'SHT' as address_type,
	ad.update_timestamp,
	ad.update_user
from moto_sales.customers cu
join moto_sales.addresses ad on cu.customer_invoice_address_id = ad.address_number
where mod(cu.customer_number, 2) = 1
union
select
	customer_number,
	address_number,
	'INV' as address_type,
	ad.update_timestamp,
	ad.update_user
from moto_sales.customers cu
join moto_sales.addresses ad on cu.customer_ship_to_address_id = ad.address_number
union
select
	customer_number,
	address_number,
	'SHT' as address_type,
	ad.update_timestamp,
	ad.update_user
from moto_sales.customers cu
join moto_sales.addresses ad on cu.customer_ship_to_address_id = ad.address_number
where mod(cu.customer_number, 2) = 0;

commit;

insert into moto_sales.cust_addresses
	(customer_number, address_number, address_type, update_timestamp, update_user)
values
	(9999999, 999999, 'UNK', to_timestamp('01/01/1997', 'DD/MM/YYYY'), 'WRONG INPUT');

insert into moto_sales.cust_addresses
	(customer_number, address_number, address_type, update_timestamp, update_user)
values
	(9999999, 6, 'UNK', to_timestamp('01/01/1997', 'DD/MM/YYYY'), 'WRONG INPUT');

insert into moto_sales.cust_addresses
	(customer_number, address_number, address_type, update_timestamp, update_user)
values
	(5, 9999999, 'UNK', to_timestamp('01/01/1997', 'DD/MM/YYYY'), 'WRONG INPUT');
