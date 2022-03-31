-- Source Database is a PostgreSQL database
--   MOTO_MKTG schema is second source

TRUNCATE TABLE moto_mktg_mtd_ref.load_cycle_info ;
INSERT INTO moto_mktg_mtd_ref.load_cycle_info (load_cycle_id,load_date)
VALUES (nextval('moto_mktg_mtd_ref.load_cycle_seq'), to_timestamp('17/01/2020 00:00:00','DD/MM/YYYY HH24:MI:SS'));

truncate moto_mktg_mtd_ref.fmc_loading_window_table;
insert into moto_mktg_mtd_ref.fmc_loading_window_table(fmc_begin_lw_timestamp, fmc_end_lw_timestamp)
select null, now();

------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

truncate moto_mktg.camp_part_cont cascade;
truncate moto_mktg.jrn_camp_part_cont cascade;
truncate moto_mktg.e_mails cascade;
truncate moto_mktg.jrn_e_mails cascade;
truncate moto_mktg.phones cascade;
truncate moto_mktg.jrn_phones cascade;
truncate moto_mktg.party_contacts cascade;
truncate moto_mktg.jrn_party_contacts cascade;
truncate moto_mktg.contacts cascade;
truncate moto_mktg.jrn_contacts cascade;
truncate moto_mktg.campaign_motorcycles cascade;
truncate moto_mktg.jrn_campaign_motorcycles cascade;
truncate moto_mktg.motorcycles cascade;
truncate moto_mktg.jrn_motorcycles cascade;
truncate moto_mktg.campaigns cascade;
truncate moto_mktg.jrn_campaigns cascade;
truncate moto_mktg.party cascade;
truncate moto_mktg.jrn_party cascade;
truncate moto_mktg.addresses cascade;
truncate moto_mktg.jrn_addresses cascade;
truncate moto_mktg.channels cascade;
truncate moto_mktg.jrn_channels cascade;
truncate moto_mktg.camp_moto_channel cascade;
truncate moto_mktg.jrn_camp_moto_channel cascade;
truncate moto_mktg.camp_moto_chan_region cascade;
truncate moto_mktg.jrn_camp_moto_chan_region cascade;

do $$
declare
  query text;
  curStmnt1 cursor FOR SELECT 'ALTER TABLE moto_mktg.'||table_name||' DISABLE TRIGGER ALL' stmnt
					  FROM information_schema.tables WHERE table_schema='moto_mktg' and table_name not like 'jrn%' order by table_name ;

BEGIN

   FOR s IN curStmnt1 LOOP
      execute s.stmnt;
   END LOOP;
end $$;



------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------

--create all the adresses
insert into moto_mktg.addresses(address_number, street_name, street_number, postal_code, city, province, update_user, update_timestamp)
values
	(1, 'Reintjesbeek', 50, '2930', 'Brasschaat', 'Antwerpen', 'ANOTHER',clock_timestamp());

insert into moto_mktg.addresses(address_number, street_name, street_number, postal_code, city, province, update_user, update_timestamp)
values
	(2, 'Frans Adriaenssensstraat', 333, '2170', 'Antwerpen', 'Antwerpen', 'ANOTHER',clock_timestamp());

insert into moto_mktg.addresses(address_number, street_name, street_number, postal_code, city, province, update_user, update_timestamp)
values
	(3, 'Mechelsesteenweg', 1023, '2550', 'Kontich', 'Antwerpen', 'MYSELFANDI',clock_timestamp());

insert into moto_mktg.addresses(address_number, street_name, street_number, postal_code, city, province, update_user, update_timestamp)
values
	(4, 'Berlaarbaan', 1523, '2861', 'Onze Lieve Vrouw Waver', 'Antwerpen', 'MYSELFANDI',clock_timestamp());

insert into moto_mktg.addresses(address_number, street_name, street_number, postal_code, city, province, update_user, update_timestamp)
values
	(5, 'Bosstraat', 150, '9920', 'Lovendegem', 'Oost-Vlaanderen', 'MYSELFANDI',clock_timestamp());

insert into moto_mktg.addresses	(address_number, street_name, street_number, postal_code, city, province, update_user, update_timestamp)
values
	(6, 'Heernisstraat', 100, '8340', 'Damme', 'West-Vlaanderen', 'NOTME',clock_timestamp());

insert into moto_mktg.addresses
	(address_number, street_name, street_number, postal_code, city, province, update_user, update_timestamp)
values
	(7, 'Hoppestraat', 2000, '8531', 'Harelbeke', 'West-Vlaanderen', 'NOTME',clock_timestamp());

insert into moto_mktg.addresses	(address_number, street_name, street_number, postal_code, city, province, update_user, update_timestamp)
values
	(8, 'Kontrijnstraat', 786, '9690', 'Kluisbergen', 'Oost-Vlaanderen', 'SOMEONE ELSE',clock_timestamp());

insert into moto_mktg.addresses	(address_number, street_name, street_number, postal_code, city, province, update_user, update_timestamp)
values
	(9, 'Chaussée de Douai', 3019, '7500', 'Tournai', 'Hainaut', 'SOMEONE ELSE',clock_timestamp());

insert into moto_mktg.addresses
	(address_number, street_name, street_number, postal_code, city, province, update_user, update_timestamp)
values
	(10, 'Sart-lez-Moulins', 1034, '6044', 'Charleroi', 'Hainaut', 'SOMEONE ELSE',clock_timestamp());

insert into moto_mktg.addresses
	(address_number, street_name, street_number, postal_code, city, province, update_user, update_timestamp)
values
	(11, 'Avenue Reine Fabiola', 777, '1340', 'Ottignies-Louvain-la-Neuve', 'Brabant Wallon', 'WHOCHANGEDIT',clock_timestamp());

insert into moto_mktg.addresses	(address_number, street_name, street_number, postal_code, city, province, update_user, update_timestamp)
values
	(12, 'Rue Henri Lemaître', 289, '5000', 'Namur', 'Namur', 'WHOCHANGEDIT',clock_timestamp());

insert into moto_mktg.addresses	(address_number, street_name, street_number, postal_code, city, province, update_user, update_timestamp)
values
	(13, 'Rue Janson', 634, '5300', 'Andenne', 'Namur', 'WHOCHANGEDIT',clock_timestamp());

insert into moto_mktg.addresses	(address_number, street_name, street_number, postal_code, city, province, update_user, update_timestamp)
values
	(14, 'Haagbeukenlaan', 7589, '1200', 'Sint-Lambrechts-Woluwe', 'Brabant', 'OTHERPERSON',clock_timestamp());

insert into moto_mktg.addresses	(address_number, street_name, street_number, postal_code, city, province, update_user, update_timestamp)
values
	(15, 'Henry Dunantlaan', 934, '1140', 'Evere', 'Brabant', 'OTHERPERSON',clock_timestamp());

insert into moto_mktg.addresses	(address_number, street_name, street_number, postal_code, city, province, update_user, update_timestamp)
values
	(16, 'Portaelsstraat', 489, '1030', 'Schaarbeek', 'Brabant', 'OTHERPERSON',clock_timestamp());

------------------------------------------------------------------------------------------------------------------------
-- create all the parties
insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(9, null, 'Hilde Langebeen', to_date('13/11/1987', 'DD/MM/YYYY'), 'Female', 'PI' -- PROSPECT INDIVIDUAL
		, 'New prospect for an R1200RT FULL OPTION', 2, 'ANOTHER',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(10, null, 'Bart Kortemark', to_date('03/03/1985', 'DD/MM/YYYY'), 'Male', 'CI' -- CUSTOMER INDIVIDUAL
		, 'Long time Customer, wife is a prospect with high potential to buy', 2, 'ANOTHER',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(7, null, 'Margot Vandeberghe', to_date('12/12/1975', 'DD/MM/YYYY'), 'Female', 'CI' -- CUSTOMER INDIVIDUAL
		, 'Good customer with already 5 bikes bought at our Shop', null, 'ANOTHER',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(8, null, 'Dirk Verlinden', to_date('05/07/1975', 'DD/MM/YYYY'), 'Male', 'PI' -- PROSPECT INDIVIDUAL
		, 'High potential for Buying, just got his drivers license', 4, 'ANOTHER',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(1, null, 'Vanitsen Consult BVBA', to_date('02/01/1993', 'DD/MM/YYYY'), 'Male', 'PO' -- Prospect Organisation
		, 'Single Person Management Company to Buy motorbike on', null, 'MYSELFANDI',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(2, 1, 'Patrick Vanitsen', to_date('02/10/1965', 'DD/MM/YYYY'), 'Male', 'PI' -- PROSPECT INDIVIDUAL
		, 'Very interested in a Touring bike but also drives on the circuit', 88, 'MYSELFANDI',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(3, null, 'Linda Vermarken', to_date('01/08/1975', 'DD/MM/YYYY'), 'Female', 'PI' -- PROSPECT INDIVIDUAL
		, 'Very interested in a bike but small person and not so many option to choose from', 5, 'MYSELFANDI',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(4, null, 'Olbrechts & Sons N.V.', to_date('02/06/2001', 'DD/MM/YYYY'), 'Male', 'CO' -- Customer Organisation
		, 'Company that bought already 15 bikes in 10 years', 6, 'MYSELFANDI',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(5, 4, 'Jan Olbrechts', to_date('02/09/1958', 'DD/MM/YYYY'), 'Male', 'CI' -- CUSTOMER INDIVIDUAL
		, 'Very good customer through his company', 6, 'MYSELFANDI',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(6, 4, 'Greet Van der Goten', to_date('14/06/1960', 'DD/MM/YYYY'), 'Female', 'CI' -- CUSTOMER INDIVIDUAL
		, 'Very good customer through husbands company', 89, 'MYSELFANDI',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(11, null, 'Michel & De Wever # B.V.B.A.', to_date('01/06/2004', 'DD/MM/YYYY'), 'Male', 'PO' -- PROSPECT ORGANISATION
		, 'Solid prospect, altough a lot of discussions between the managing partners in the company', 9, 'MYSELFANDI',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(12, 11, 'Charles Michel', to_date('04/05/1980', 'DD/MM/YYYY'), 'Male', 'PI' -- PROSPECT INDIVIDUAL
		, 'Managing partner in good prospect company, will have difficulties persuading his partner', 9, 'MYSELFANDI',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(13, null, 'Louise Ludgen', to_date('11/03/1962', 'DD/MM/YYYY'), 'Female', 'PI' -- PROSPECT INDIVIDUAL
		, 'Low possibility that the wife of Michel will buy a bike', 8, 'SOMEONEELSE',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(14, null, 'NOTORACLE COMPANY BVBA', to_date('03/12/1976', 'DD/MM/YYYY'), 'Male', 'CO' -- CUSTOMER ORGANISATION
		, 'Good Customer, buys a bike every 4 years', 10, 'SOMEONEELSE',clock_timestamp());

insert into moto_mktg.party
	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(15, 14, 'YvesMorisseau', to_date('03/12/1976', 'DD/MM/YYYY'), 'Male', 'CI' -- CUSTOMER INDIVIDUAL
		, 'Nice guy but stays with the same type of bike', 10, 'SOMEONEELSE',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(16, null, 'Mohamed Ali', to_date('12/07/1982', 'DD/MM/YYYY'), 'Male', 'CI' -- CUSTOMER INDIVIDUAL
		, 'Nice guy but big guy, I hope he never gets angry after selling him a bike', 12, 'SOMEONEELSE',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(17, null, 'Fatima Ali', to_date('12/07/1985', 'DD/MM/YYYY'), 'Female', 'PI' -- PROSPECT INDIVIDUAL
		, 'Interested in an off road bike', 12, 'SOMEONEELSE',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(18, null, 'Ken Coulter', to_date('29/02/1956', 'DD/MM/YYYY'), 'Male', 'PI' -- PROSPECT INDIVIDUAL
		, 'Has come into the showroom many times but did not buy anything yet', 14, 'SOMEONEELSE',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(19, null, 'Johanson Consult N.V.', to_date('02/01/1999', 'DD/MM/YYYY'), 'Male', 'CO' -- CUSTOMER ORGANISATION
		, 'Solid company owned by Lindsey', 14, 'SOMEONEELSE',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(20, 19, 'Lindsey Johanson', to_date('12/07/1985', 'DD/MM/YYYY'), 'Female', 'CI' -- CUSTOMER INDIVIDUAL
		, 'Good driver and loves fast bikes', 14, 'SOMEONEELSE',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(21, null, 'Bradley Cooper', to_date('28/5/1985', 'DD/MM/YYYY'), 'Male', 'CI' -- CUSTOMER INDIVIDUAL
		, 'Sporty driver who loves superbikes and all other 4 cylinder bikes', '16', 'SOMEONEELSE',clock_timestamp());

insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(22, null, 'Jennifer Garner', to_date('01/08/1985', 'DD/MM/YYYY'), 'Female', 'CI' -- CUSTOMER INDIVIDUAL
		, 'Even better than her husband on the race track', 16, 'SOMEONEELSE',clock_timestamp());


insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(98, 99, 'Jennifer PlatteKaas', to_date('01/08/1985', 'DD/MM/YYYY'), 'Female', 'CI' -- CUSTOMER INDIVIDUAL
		, 'Even better than her husband on the race track', 99, 'SOMEONEELSE',clock_timestamp());

-- decoy empty string to check that this source's EMPTYSTRING_IS_NULL doesn't get triggered
insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(42, null, 'Jenny EmptyString', to_date('01/08/1986', 'DD/MM/YYYY'), '', 'CI' -- CUSTOMER INDIVIDUAL
		, 'Gender unknown', 16, 'SOMEONEELSE', clock_timestamp());

-- decoy empty string to check that this source's EMPTYSTRING_IS_NULL doesn't get triggered
insert into moto_mktg.party	(party_number, parent_party_number, name, birthdate, gender, party_type_code, comments, address_number, update_user, update_timestamp)
values
	(123, 122, 'Danny EmptyString', to_date('01/08/1999', 'DD/MM/YYYY'), '', 'CI' -- CUSTOMER INDIVIDUAL
		, 'Genderless', 16, 'SOMEONEELSE',clock_timestamp());

------------------------------------------------------------------------------------------------------------------------
--create all the motorcycles

insert into moto_mktg.motorcycles
	(motorcycle_id, motorcycle_cc, motorcycle_et_code, motorcycle_part_code, motorcycle_name, update_user, update_timestamp)
values
	(21 -- BMW R 1200 RS
		, 1200, '2CYLBOX', 'R1200RSAC', 'BMW R 1200 RS AC', 'MEMYSELFANDI',clock_timestamp());

insert into moto_mktg.motorcycles
	(motorcycle_id, motorcycle_cc, motorcycle_et_code, motorcycle_part_code, motorcycle_name, update_user, update_timestamp)
values
	(20 -- BMW R 1200 RS LC
		, 1200, '2CYLBOX', 'R1200RSLC', 'BMW R 1200 RS LC', 'MEMYSELFANDI',clock_timestamp());

insert into moto_mktg.motorcycles
	(motorcycle_id, motorcycle_cc, motorcycle_et_code, motorcycle_part_code, motorcycle_name, update_user, update_timestamp)
values
	(19 -- BMW R 1200 R
		, 1200, '2CYLBOX', 'R1200RAC', 'BMW R 1200 R AC', 'MEMYSELFANDI',clock_timestamp());

insert into moto_mktg.motorcycles
	(motorcycle_id, motorcycle_cc, motorcycle_et_code, motorcycle_part_code, motorcycle_name, update_user, update_timestamp)
values
	(18 -- BMW R 1200 R
		, 1200, '2CYLBOX', 'R1200RLC', 'BMW R 1200 R LC', 'MEMYSELFANDI',clock_timestamp());

insert into moto_mktg.motorcycles
	(motorcycle_id, motorcycle_cc, motorcycle_et_code, motorcycle_part_code, motorcycle_name, update_user, update_timestamp)
values
	(17 -- BMW K 1200 LT ,23
		, 1200, '4CYLLINE', 'K1200LT', 'BMW K 1200 LT', 'MEMYSELFANDI',clock_timestamp());

insert into moto_mktg.motorcycles
	(motorcycle_id, motorcycle_cc, motorcycle_et_code, motorcycle_part_code, motorcycle_name, update_user, update_timestamp)
values
	(16 -- BMW K 1600 GT
		, 1600, '6CYLLINE', 'K1600GT', 'BMW K 1600 GT', 'MEMYSELFANDI',clock_timestamp());

insert into moto_mktg.motorcycles
	(motorcycle_id, motorcycle_cc, motorcycle_et_code, motorcycle_part_code, motorcycle_name, update_user, update_timestamp)
values
	(15 -- BMW R 1200 RT
		, 1200, '2CYLBOX', 'R1200RTAC', 'BMW R 1200 RT AC', 'MEMYSELFANDI',clock_timestamp());

insert into moto_mktg.motorcycles
	(motorcycle_id, motorcycle_cc, motorcycle_et_code, motorcycle_part_code, motorcycle_name, update_user, update_timestamp)
values
	(14 -- BMW R 1200 RT
		, 1200, '2CYLBOX', 'R1200RTLC', 'BMW R 1200 RT LC', 'MEMYSELFANDI',clock_timestamp());

insert into moto_mktg.motorcycles
	(motorcycle_id, motorcycle_cc, motorcycle_et_code, motorcycle_part_code, motorcycle_name, update_user, update_timestamp)
values
	(13 -- BMW R 1250 RT
		, 1250, '2CYLBOX', 'R1250RTLC', 'BMW R 1250 RT LC', 'MEMYSELFANDI',clock_timestamp());

insert into moto_mktg.motorcycles
	(motorcycle_id, motorcycle_cc, motorcycle_et_code, motorcycle_part_code, motorcycle_name, update_user, update_timestamp)
values
	(12 -- BMW F 850 GS
		, 850, '2CYLLINE', 'F850GS', 'BMW F 850 GS', 'MEMYSELFANDI',clock_timestamp());

insert into moto_mktg.motorcycles
	(motorcycle_id, motorcycle_cc, motorcycle_et_code, motorcycle_part_code, motorcycle_name, update_user, update_timestamp)
values
	(11 -- BMW R 1200 GS
		, 1200, '2CYLBOX', 'R1200GSAC', 'BMW R 1200 GS AC', 'MEMYSELFANDI',clock_timestamp());

insert into moto_mktg.motorcycles
	(motorcycle_id, motorcycle_cc, motorcycle_et_code, motorcycle_part_code, motorcycle_name, update_user, update_timestamp)
values
	(10 -- BMW R 1200 GS
		, 1200, '2CYLBOX', 'R1200GSLC', 'BMW R 1200 GS LC', 'MEMYSELFANDI',clock_timestamp());

insert into moto_mktg.motorcycles
	(motorcycle_id, motorcycle_cc, motorcycle_et_code, motorcycle_part_code, motorcycle_name, update_user, update_timestamp)
values
	(9 -- BMW R 1250 GS
		, 1250, '2CYLBOX', 'R1250GSLC', 'BMW R 1250 GS LC', 'MEMYSELFANDI',clock_timestamp());

insert into moto_mktg.motorcycles
	(motorcycle_id, motorcycle_cc, motorcycle_et_code, motorcycle_part_code, motorcycle_name, update_user, update_timestamp)
values
	(8 -- BMW S 1000 XR
		, 999, '4CYLLINE', 'S1000XR', 'BMW S 1000 XR', 'MEMYSELFANDI',clock_timestamp());

insert into moto_mktg.motorcycles
	(motorcycle_id, motorcycle_cc, motorcycle_et_code, motorcycle_part_code, motorcycle_name, update_user, update_timestamp)
values
	(7 -- BMW S 1000 RR
		, 999, '4CYLLINE', 'S1000RR', 'BMW S 1000 RR', 'MEMYSELFANDI',clock_timestamp());

insert into moto_mktg.motorcycles
	(motorcycle_id, motorcycle_cc, motorcycle_et_code, motorcycle_part_code, motorcycle_name, update_user, update_timestamp)
values
	(6 -- BMW R 1200 GS Adventure
		, 1200, '2CYLBOX', 'R1200GSADVLC', 'BMW R 1200 GS Adventure LC', 'MEMYSELFANDI',clock_timestamp());

insert into moto_mktg.motorcycles
	(motorcycle_id, motorcycle_cc, motorcycle_et_code, motorcycle_part_code, motorcycle_name, update_user, update_timestamp)
values
	(5 -- BMW R nineT Pure
		, 1200, '2CYLBOX', 'RNineTPure', 'BMW R NineT Pure AC', 'MEMYSELFANDI',clock_timestamp());

insert into moto_mktg.motorcycles
	(motorcycle_id, motorcycle_cc, motorcycle_et_code, motorcycle_part_code, motorcycle_name, update_user, update_timestamp)
values
	(4 -- BMW R nineT
		, 1200, '2CYLBOX', 'RNineT', 'BMW R NineT AC', 'MEMYSELFANDI',clock_timestamp());

------------------------------------------------------------------------------------------------------------------------
-- create alle the campaigns

INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('89DrivLicGenR', 'Generation with Drivers License before 1989 Boosting Boxer Sales = R models', to_date('01/06/2009 00:00:00','DD/MM/YYYY HH24:MI:SS'), 'SupermanDIDIT',clock_timestamp());

INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('89DrivLicGenR', 'Generation with Drivers License before 1989 Boosting Boxer Sales = R models', to_date('01/09/2009 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'SupermanDIDIT',clock_timestamp());

INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('89DrivLicGenR', 'Generation with Drivers License before 1989 Boosting Boxer Sales = R models', to_date('01/03/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'SupermanDIDIT',clock_timestamp()); 

INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('89DrivLicGenR', 'Generation with Drivers License before 1989 Boosting Boxer Sales = R models', to_date('01/06/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'SupermanDIDIT',clock_timestamp());

INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('Womenon4Cyl', 'Target Women to drive the 4 Cylinder bikes of BMW', to_date('01/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'SuperwomenDIDIT',clock_timestamp());   

INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('Womenon4Cyl', 'Target Women to drive the 4 Cylinder bikes of BMW', to_date('01/03/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'SuperwomenDIDIT',clock_timestamp());   

INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('Womenon4Cyl', 'Target Women to drive the 4 Cylinder bikes of BMW', to_date('01/04/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'SuperwomenDIDIT',clock_timestamp());   

INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('Womenon4Cyl', 'Target Women to drive the 4 Cylinder bikes of BMW', to_date('01/05/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'SuperwomenDIDIT',clock_timestamp());   

INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('Womenon4Cyl', 'Target Women to drive the 4 Cylinder bikes of BMW', to_date('01/06/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'SuperwomenDIDIT',clock_timestamp());   

INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('Womenon4Cyl', 'Target Women to drive the 4 Cylinder bikes of BMW', to_date('01/07/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'SuperwomenDIDIT',clock_timestamp());   

INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('Menon4Cyl', 'Target Men to drive the 4 Cylinder bikes of BMW', to_date('01/02/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'SuperwomenDIDIT',clock_timestamp());   

INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('Menon4Cyl', 'Target Men to drive the 4 Cylinder bikes of BMW', to_date('01/03/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'SuperwomenDIDIT',clock_timestamp());   

INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('Menon4Cyl', 'Target Men to drive the 4 Cylinder bikes of BMW', to_date('01/04/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'SuperwomenDIDIT',clock_timestamp());   

INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('Menon4Cyl', 'Target Men to drive the 4 Cylinder bikes of BMW', to_date('01/05/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'SuperwomenDIDIT',clock_timestamp());   

INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('Menon4Cyl', 'Target Men to drive the 4 Cylinder bikes of BMW', to_date('01/06/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'SuperwomenDIDIT',clock_timestamp());   

INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('Menon4Cyl', 'Target Men to drive the 4 Cylinder bikes of BMW', to_date('01/07/2010 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'SuperwomenDIDIT',clock_timestamp());  

INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('TargetLangebeen', 'One to One Direct Marketing To Langebeen', to_date('01/09/2009 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'SuperwomenDIDIT',clock_timestamp());

INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('TargetAli', 'One to One Direct Marketing To Ali', to_date('01/09/2009 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'SuperwomenDIDIT',clock_timestamp());

-- decoy empty string to check that this source's EMPTYSTRING_IS_NULL doesn't get triggered
INSERT INTO moto_mktg.campaigns
	(campaign_code, campaign_name, campaign_start_date, update_user, update_timestamp)
VALUES 
	('NewCampaign', '', to_date('01/09/2019 00:00:00', 'DD/MM/YYYY HH24:MI:SS'), 'SuperwomenDIDIT', clock_timestamp());
------------------------------------------------------------------------------------------------------------------------

--create all the channels

insert into moto_mktg.channels(channel_id, channel_code, channel_description, update_user, update_timestamp)
values
	(1, 'DML', 'Direct Mail', 'ANOTHER', clock_timestamp());

insert into moto_mktg.channels(channel_id, channel_code, channel_description, update_user, update_timestamp)
values
	(2, 'CPN', 'Coupon', 'ANOTHER', clock_timestamp());

insert into moto_mktg.channels(channel_id, channel_code, channel_description, update_user, update_timestamp)
values
	(3, 'OCM', 'Online Campaign', 'ANOTHER', clock_timestamp());

insert into moto_mktg.channels(channel_id, channel_code, channel_description, update_user, update_timestamp)
values
	(4, 'EMA', 'E-Mail', 'ANOTHER', clock_timestamp());

insert into moto_mktg.channels(channel_id, channel_code, channel_description, update_user, update_timestamp)
values
	(5, 'PHN', 'Phone', 'ANOTHER', clock_timestamp());

insert into moto_mktg.channels(channel_id, channel_code, channel_description, update_user, update_timestamp)
values
	(6, 'TEL', 'Television', 'ANOTHER', clock_timestamp());

------------------------------------------------------------------------------------------------------------------------

--create all the Campaign Motorcycle Channel relationships

insert into moto_mktg.camp_moto_channel(channel_id, campaign_code, campaign_start_date, motorcycle_name, from_date,
                                        to_date, valid_from_date, valid_to_date, update_user, update_timestamp)
values
	(1, '89DrivLicGenR', to_timestamp('01-06-2009', 'DD-MM-YYYY'), 'BMW R 1200 RS LC',
	 to_date('01-06-2009', 'DD-MM-YYYY'), to_date('31-12-2154', 'DD-MM-YYYY'), to_date('05-06-2009', 'DD-MM-YYYY'),
	 to_date('31-12-2154', 'DD-MM-YYYY'), 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_channel(channel_id, campaign_code, campaign_start_date, motorcycle_name, from_date,
                                        to_date, valid_from_date, valid_to_date, update_user, update_timestamp)
values
	(2, '89DrivLicGenR', to_timestamp('01-06-2009', 'DD-MM-YYYY'), 'BMW R 1200 RS LC',
	 to_date('01-06-2009', 'DD-MM-YYYY'), to_date('31-12-2154', 'DD-MM-YYYY'), to_date('03-06-2009', 'DD-MM-YYYY'),
	 to_date('31-12-2154', 'DD-MM-YYYY'), 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_channel(channel_id, campaign_code, campaign_start_date, motorcycle_name, from_date,
                                        to_date, valid_from_date, valid_to_date, update_user, update_timestamp)
values
	(3, '89DrivLicGenR', to_timestamp('01-06-2009', 'DD-MM-YYYY'), 'BMW R 1200 RS LC',
	 to_date('01-06-2009', 'DD-MM-YYYY'), to_date('31-12-2154', 'DD-MM-YYYY'), to_date('07-06-2009', 'DD-MM-YYYY'),
	 to_date('31-12-2154', 'DD-MM-YYYY'), 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_channel(channel_id, campaign_code, campaign_start_date, motorcycle_name, from_date,
                                        to_date, valid_from_date, valid_to_date, update_user, update_timestamp)
values
	(6, '89DrivLicGenR', to_timestamp('01-06-2009', 'DD-MM-YYYY'), 'BMW R 1200 RS LC',
	 to_date('01-06-2009', 'DD-MM-YYYY'), to_date('31-12-2154', 'DD-MM-YYYY'), to_date('09-06-2009', 'DD-MM-YYYY'),
	 to_date('31-12-2154', 'DD-MM-YYYY'), 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_channel(channel_id, campaign_code, campaign_start_date, motorcycle_name, from_date,
                                        to_date, valid_from_date, valid_to_date, update_user, update_timestamp)
values
	(1, 'Womenon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 'BMW S 1000 XR', to_date('01-03-2010', 'DD-MM-YYYY'),
	 to_date('31-12-2154', 'DD-MM-YYYY'), to_date('01-03-2010', 'DD-MM-YYYY'), to_date('31-12-2154', 'DD-MM-YYYY'),
	 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_channel(channel_id, campaign_code, campaign_start_date, motorcycle_name, from_date,
                                        to_date, valid_from_date, valid_to_date, update_user, update_timestamp)
values
	(2, 'Womenon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 'BMW S 1000 XR', to_date('01-03-2010', 'DD-MM-YYYY'),
	 to_date('31-12-2154', 'DD-MM-YYYY'), to_date('01-03-2010', 'DD-MM-YYYY'), to_date('31-12-2154', 'DD-MM-YYYY'),
	 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_channel(channel_id, campaign_code, campaign_start_date, motorcycle_name, from_date,
                                        to_date, valid_from_date, valid_to_date, update_user, update_timestamp)
values
	(3, 'Womenon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 'BMW S 1000 XR', to_date('01-03-2010', 'DD-MM-YYYY'),
	 to_date('31-12-2154', 'DD-MM-YYYY'), to_date('01-03-2010', 'DD-MM-YYYY'), to_date('31-12-2154', 'DD-MM-YYYY'),
	 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_channel(channel_id, campaign_code, campaign_start_date, motorcycle_name, from_date,
                                        to_date, valid_from_date, valid_to_date, update_user, update_timestamp)
values
	(4, 'Womenon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 'BMW S 1000 XR', to_date('01-03-2010', 'DD-MM-YYYY'),
	 to_date('31-12-2154', 'DD-MM-YYYY'), to_date('01-03-2010', 'DD-MM-YYYY'), to_date('31-12-2154', 'DD-MM-YYYY'),
	 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_channel(channel_id, campaign_code, campaign_start_date, motorcycle_name, from_date,
                                        to_date, valid_from_date, valid_to_date, update_user, update_timestamp)
values
	(7, 'Womenon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 'BMW S 1000 XR', to_date('01-03-2010', 'DD-MM-YYYY'),
	 to_date('31-12-2154', 'DD-MM-YYYY'), to_date('01-03-2010', 'DD-MM-YYYY'), to_date('31-12-2154', 'DD-MM-YYYY'),
	 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_channel(channel_id, campaign_code, campaign_start_date, motorcycle_name, from_date,
                                        to_date, valid_from_date, valid_to_date, update_user, update_timestamp)
values
	(1, 'Menon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 'BMW S 1000 XR', to_date('01-03-2010', 'DD-MM-YYYY'),
	 to_date('31-12-2154', 'DD-MM-YYYY'), to_date('01-03-2010', 'DD-MM-YYYY'), to_date('31-12-2154', 'DD-MM-YYYY'),
	 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_channel(channel_id, campaign_code, campaign_start_date, motorcycle_name, from_date,
                                        to_date, valid_from_date, valid_to_date, update_user, update_timestamp)
values
	(2, 'Menon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 'BMW S 1000 XR', to_date('01-03-2010', 'DD-MM-YYYY'),
	 to_date('31-12-2154', 'DD-MM-YYYY'), to_date('01-03-2010', 'DD-MM-YYYY'), to_date('31-12-2154', 'DD-MM-YYYY'),
	 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_channel(channel_id, campaign_code, campaign_start_date, motorcycle_name, from_date,
                                        to_date, valid_from_date, valid_to_date, update_user, update_timestamp)
values
	(3, 'Menon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 'BMW S 1000 XR', to_date('01-03-2010', 'DD-MM-YYYY'),
	 to_date('31-12-2154', 'DD-MM-YYYY'), to_date('01-03-2010', 'DD-MM-YYYY'), to_date('31-12-2154', 'DD-MM-YYYY'),
	 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_channel(channel_id, campaign_code, campaign_start_date, motorcycle_name, from_date,
                                        to_date, valid_from_date, valid_to_date, update_user, update_timestamp)
values
	(4, 'Menon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 'BMW S 1000 XR', to_date('01-03-2010', 'DD-MM-YYYY'),
	 to_date('31-12-2154', 'DD-MM-YYYY'), to_date('01-03-2010', 'DD-MM-YYYY'), to_date('31-12-2154', 'DD-MM-YYYY'),
	 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_channel(channel_id, campaign_code, campaign_start_date, motorcycle_name, from_date,
                                        to_date, valid_from_date, valid_to_date, update_user, update_timestamp)
values
	(7, 'Menon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 'BMW S 1000 XR', to_date('01-03-2010', 'DD-MM-YYYY'),
	 to_date('31-12-2154', 'DD-MM-YYYY'), to_date('01-03-2010', 'DD-MM-YYYY'), to_date('31-12-2154', 'DD-MM-YYYY'),
	 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_channel(channel_id, campaign_code, campaign_start_date, motorcycle_name, from_date,
                                        to_date, valid_from_date, valid_to_date, update_user, update_timestamp)
values
	(1, 'BigToererFocus#BE', to_timestamp('23-04-2010', 'DD-MM-YYYY'), 'BMW K 1600 GT',
	 to_date('23-04-2010', 'DD-MM-YYYY'), to_date('31-12-2154', 'DD-MM-YYYY'), to_date('23-04-2010', 'DD-MM-YYYY'),
	 to_date('31-12-2154', 'DD-MM-YYYY'), 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_channel(channel_id, campaign_code, campaign_start_date, motorcycle_name, from_date,
                                        to_date, valid_from_date, valid_to_date, update_user, update_timestamp)
values
	(2, 'BigToererFocus#BE', to_timestamp('23-04-2010', 'DD-MM-YYYY'), 'BMW K 1600 GT',
	 to_date('23-04-2010', 'DD-MM-YYYY'), to_date('31-12-2154', 'DD-MM-YYYY'), to_date('24-04-2010', 'DD-MM-YYYY'),
	 to_date('31-12-2154', 'DD-MM-YYYY'), 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_channel(channel_id, campaign_code, campaign_start_date, motorcycle_name, from_date,
                                        to_date, valid_from_date, valid_to_date, update_user, update_timestamp)
values
	(5, 'BigToererFocus#BE', to_timestamp('23-04-2010', 'DD-MM-YYYY'), 'BMW K 1600 GT',
	 to_date('23-04-2010', 'DD-MM-YYYY'), to_date('31-12-2154', 'DD-MM-YYYY'), to_date('27-04-2010', 'DD-MM-YYYY'),
	 to_date('31-12-2154', 'DD-MM-YYYY'), 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_channel(channel_id, campaign_code, campaign_start_date, motorcycle_name, from_date,
                                        to_date, valid_from_date, valid_to_date, update_user, update_timestamp)
values
	(99, 'BigToererFocus#BE', to_timestamp('23-04-2010', 'DD-MM-YYYY'), 'BMW K 1600 GT',
	 to_date('23-04-2010', 'DD-MM-YYYY'), to_date('31-12-2154', 'DD-MM-YYYY'), to_date('29-04-2010', 'DD-MM-YYYY'),
	 to_date('31-12-2154', 'DD-MM-YYYY'), 'ANOTHER', clock_timestamp());

------------------------------------------------------------------------------------------------------------------------

--create all the Campaign Motorcycle Channel relationships

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(1, '89DrivLicGenR', to_timestamp('01-06-2009', 'DD-MM-YYYY'), 20, 'BMW Leuven & Mechelen', 'ANOTHER',
	 clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(1, '89DrivLicGenR', to_timestamp('01-06-2009', 'DD-MM-YYYY'), 20, 'BMW Genk & Hasselt', 'ANOTHER',
	 clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(1, '89DrivLicGenR', to_timestamp('01-06-2009', 'DD-MM-YYYY'), 20, 'BMW Brussels', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(1, '89DrivLicGenR', to_timestamp('01-06-2009', 'DD-MM-YYYY'), 20, 'BMW Antwerp', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(3, '89DrivLicGenR', to_timestamp('01-06-2009', 'DD-MM-YYYY'), 20, 'BMW Leuven & Mechelen', 'ANOTHER',
	 clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(3, '89DrivLicGenR', to_timestamp('01-06-2009', 'DD-MM-YYYY'), 20, 'BMW Genk & Hasselt', 'ANOTHER',
	 clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(3, '89DrivLicGenR', to_timestamp('01-06-2009', 'DD-MM-YYYY'), 20, 'BMW Brussels', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(3, '89DrivLicGenR', to_timestamp('01-06-2009', 'DD-MM-YYYY'), 20, 'BMW Gent', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(7, '89DrivLicGenR', to_timestamp('01-06-2009', 'DD-MM-YYYY'), 20, 'BMW Gent', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(7, '89DrivLicGenR', to_timestamp('01-06-2009', 'DD-MM-YYYY'), 20, 'BMW Oostende', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(7, '89DrivLicGenR', to_timestamp('01-06-2009', 'DD-MM-YYYY'), 20, 'BMW Brussels', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(7, '89DrivLicGenR', to_timestamp('01-06-2009', 'DD-MM-YYYY'), 20, 'BMW Antwerp', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(1, 'Womenon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 8, 'BMW Genk & Hasselt', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(1, 'Womenon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 8, 'BMW Bruges', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(1, 'Womenon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 8, 'BMW Leuven', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(2, 'Womenon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 8, 'BMW Genk & Hasselt', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(2, 'Womenon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 8, 'BMW Bruges', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(2, 'Womenon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 8, 'BMW Antwerp', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(99, 'Womenon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 8, 'BMW Leuven', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(99, 'Womenon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 8, 'BMW Bruges', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(99, 'Womenon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 8, 'BMW Antwerp', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(1, 'Menon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 8, 'BMW Bruges', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(4, 'Menon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 8, 'BMW Bruges', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(5, 'Menon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 8, 'BMW Bruges', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(8, 'Menon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 8, 'BMW Bruges', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(9, 'Menon4Cyl', to_timestamp('01-03-2010', 'DD-MM-YYYY'), 8, 'BMW Bruges', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(3, 'BigToererFocus#BE', to_timestamp('23-04-2010', 'DD-MM-YYYY'), 16, 'BMW Leuven', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(3, 'BigToererFocus#BE', to_timestamp('23-04-2010', 'DD-MM-YYYY'), 16, 'BMW Namur', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(3, 'BigToererFocus#BE', to_timestamp('23-04-2010', 'DD-MM-YYYY'), 16, 'BMW Liège', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(5, 'BigToererFocus#BE', to_timestamp('23-04-2010', 'DD-MM-YYYY'), 16, 'BMW Leuven', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(5, 'BigToererFocus#BE', to_timestamp('23-04-2010', 'DD-MM-YYYY'), 16, 'BMW Namur', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(5, 'BigToererFocus#BE', to_timestamp('23-04-2010', 'DD-MM-YYYY'), 16, 'BMW Liège', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(9, 'BigToererFocus#BE', to_timestamp('23-04-2010', 'DD-MM-YYYY'), 99, 'BMW Leuven', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(9, 'BigToererFocus#BE', to_timestamp('23-04-2010', 'DD-MM-YYYY'), 99, 'BMW Namur', 'ANOTHER', clock_timestamp());

insert into moto_mktg.camp_moto_chan_region(channel_id, campaign_code, campaign_start_date, motorcycle_id, region,
                                            update_user, update_timestamp)
values
	(9, 'BigToererFocus#BE', to_timestamp('23-04-2010', 'DD-MM-YYYY'), 99, 'BMW Liège', 'ANOTHER', clock_timestamp());

------------------------------------------------------------------------------------------------------------------------
-- generate all the contacts for the parties that exist
DROP SEQUENCE IF EXISTS moto_mktg.rec_seq;
CREATE SEQUENCE moto_mktg.rec_seq start 1 increment 1 cache 50;

DROP SEQUENCE IF EXISTS moto_mktg.time_seq;
CREATE SEQUENCE moto_mktg.time_seq start 1 increment 1 cache 50;


do $$
declare
  query text;
  curStmnt cursor FOR SELECT 'INSERT INTO moto_mktg.contacts' || CHR(10) ||
       '  (' || CHR(10) ||
       '    contact_id' || CHR(10) ||
       '    ,contact_type' || CHR(10) ||
       '    ,contact_type_desc' || CHR(10) ||
       '    ,update_timestamp' || CHR(10) ||
       '  )' || CHR(10) ||
       'VALUES' || CHR(10) ||
       '  (' || CHR(10) ||
       '   ' || CAST(nextval('moto_mktg.rec_seq') AS VARCHAR) || CHR(10) ||
       '  ,''mn_email'''|| CHR(10) ||
       '  ,''Main e-mail''' || CHR(10) ||
       '  ,clock_timestamp() + interval''' || nextval('moto_mktg.time_seq') || ' microsecond''' || CHR(10) ||
       '  )' as stmnt
   FROM moto_mktg.party;

BEGIN

   FOR s IN curStmnt LOOP
      execute s.stmnt;
   END LOOP;

end $$;


------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
-- generate all the emails for the parties that exist

DROP SEQUENCE IF EXISTS moto_mktg.rec_seq;

CREATE SEQUENCE moto_mktg.rec_seq start 1 increment 1 cache 50;

DROP SEQUENCE IF EXISTS moto_mktg.time_seq;
CREATE SEQUENCE moto_mktg.time_seq start 1 increment 1 cache 50;

do $$
declare
  query text;
  curStmnt cursor FOR SELECT 'INSERT INTO moto_mktg.e_mails' || CHR(10) ||
							   '  (' || CHR(10) ||
							   '    contact_id' || CHR(10) ||
							   '    ,name' || CHR(10) ||
							   '    ,update_timestamp' || CHR(10) ||
							   '  )' || CHR(10) ||
							   'VALUES' || CHR(10) ||
							   '  (' || CHR(10) ||
							   '   ' || CAST(nextval('moto_mktg.rec_seq') AS VARCHAR) || CHR(10) ||
							   '  ,''' || CASE WHEN MOD(party_number,3) = 0
											   THEN REPLACE(name,' ','.') || '@' || 'icloud.com' || '''' || CHR(10)
											   WHEN MOD(party_number,3) = 1
											   THEN REPLACE(name,' ','.') || '@' || 'gmail.com' || '''' || CHR(10)
											   WHEN MOD(party_number,3) = 2
											   THEN REPLACE(name,' ','.') || '@' || 'hotmail.com' || '''' || CHR(10)
											   ELSE 'unknown@unknown.com'''
										  END  ||
							   '  ,clock_timestamp() + interval''' || nextval('moto_mktg.time_seq') || ' microsecond''' || CHR(10) ||
							   '  );' as stmnt
						   FROM moto_mktg.party;

BEGIN

   FOR s IN curStmnt LOOP
      execute s.stmnt;
   END LOOP;

end $$;



INSERT INTO moto_mktg.e_mails ( contact_id ,name, update_timestamp )
VALUES (99,'info@koverbit.be',clock_timestamp());
commit;

------------------------------------------------------------------------------------------------------------------------
-- generate all the phones for the parties
DROP SEQUENCE IF EXISTS moto_mktg.rec_seq;
DROP SEQUENCE IF EXISTS moto_mktg.nr1_seq;
DROP SEQUENCE IF EXISTS moto_mktg.nr2_seq;
DROP SEQUENCE IF EXISTS moto_mktg.nr3_seq;
DROP SEQUENCE IF EXISTS moto_mktg.nr4_seq;
DROP SEQUENCE IF EXISTS moto_mktg.nr5_seq;
DROP SEQUENCE IF EXISTS moto_mktg.nr6_seq;

CREATE SEQUENCE moto_mktg.rec_seq start 30 increment 1 cache 50;
CREATE SEQUENCE moto_mktg.nr1_seq start 7 increment 1 cache 50;
CREATE SEQUENCE moto_mktg.nr2_seq start 3 increment 1 cache 50;
CREATE SEQUENCE moto_mktg.nr3_seq start 8 increment 1 cache 50;
CREATE SEQUENCE moto_mktg.nr4_seq start 4 increment 1 cache 50;
CREATE SEQUENCE moto_mktg.nr5_seq start 2 increment 1 cache 50;
CREATE SEQUENCE moto_mktg.nr6_seq start 9 increment 1 cache 50;

DROP SEQUENCE IF EXISTS moto_mktg.time_seq;
CREATE SEQUENCE moto_mktg.time_seq start 1 increment 1 cache 50;

do $$
declare
  query text;
  curStmnt cursor FOR SELECT 'INSERT INTO moto_mktg.phones' || CHR(10) ||
       '  (' || CHR(10) ||
       '    contact_id' || CHR(10) ||
       '    ,phone_number' || CHR(10) ||
	     '    ,update_timestamp' || CHR(10) ||
       '  )' || CHR(10) ||
       'VALUES' || CHR(10) ||
       '  (' || CHR(10) ||
       '   ' || CAST(nextval('moto_mktg.rec_seq') AS VARCHAR) || CHR(10) ||
       '  ,''+32(0)4'
       ||
       CASE WHEN MOD(currval('moto_mktg.rec_seq'),15) = 0
            THEN '70'
            WHEN MOD(currval('moto_mktg.rec_seq'),15) = 1
            THEN '71'
            WHEN MOD(currval('moto_mktg.rec_seq'),15) = 2
            THEN '72'
            WHEN MOD(currval('moto_mktg.rec_seq'),15) = 3
            THEN '73'
            WHEN MOD(currval('moto_mktg.rec_seq'),15) = 4
            THEN '74'
            WHEN MOD(currval('moto_mktg.rec_seq'),15) = 5
            THEN '75'
            WHEN MOD(currval('moto_mktg.rec_seq'),15) = 6
            THEN '76'
            WHEN MOD(currval('moto_mktg.rec_seq'),15) = 7
            THEN '77'
            WHEN MOD(currval('moto_mktg.rec_seq'),15) = 8
            THEN '78'
            WHEN MOD(currval('moto_mktg.rec_seq'),15) = 9
            THEN '79'
            WHEN MOD(currval('moto_mktg.rec_seq'),15) = 10
            THEN '80'
            WHEN MOD(currval('moto_mktg.rec_seq'),15) = 11
            THEN '81'
            WHEN MOD(currval('moto_mktg.rec_seq'),15) = 12
            THEN '82'
            WHEN MOD(currval('moto_mktg.rec_seq'),15) = 13
            THEN '84'
            WHEN MOD(currval('moto_mktg.rec_seq'),15) = 14
            THEN '85'
            ELSE '86'
       END
       || '/' ||
       CAST(MOD(nextval('moto_mktg.nr1_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr2_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr3_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr4_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr5_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr6_seq'),10) AS VARCHAR)
       || '''' || CHR(10) ||
	   '  ,clock_timestamp() + interval''' || nextval('moto_mktg.time_seq') || ' microsecond''' || CHR(10) ||
	   '  );' as stmnt  FROM moto_mktg.party;


BEGIN

   FOR s IN curStmnt LOOP
      execute s.stmnt;
   END LOOP;

end $$;

DROP SEQUENCE IF EXISTS moto_mktg.rec_seq;
DROP SEQUENCE IF EXISTS moto_mktg.nr1_seq;
DROP SEQUENCE IF EXISTS moto_mktg.nr2_seq;
DROP SEQUENCE IF EXISTS moto_mktg.nr3_seq;
DROP SEQUENCE IF EXISTS moto_mktg.nr4_seq;
DROP SEQUENCE IF EXISTS moto_mktg.nr5_seq;
DROP SEQUENCE IF EXISTS moto_mktg.nr6_seq;
DROP SEQUENCE IF EXISTS moto_mktg.nr7_seq;

CREATE SEQUENCE moto_mktg.rec_seq start 60 increment 1 cache 50;
CREATE SEQUENCE moto_mktg.nr1_seq start 7 increment 1 cache 50;
CREATE SEQUENCE moto_mktg.nr2_seq start 3 increment 1 cache 50;
CREATE SEQUENCE moto_mktg.nr3_seq start 8 increment 1 cache 50;
CREATE SEQUENCE moto_mktg.nr4_seq start 4 increment 1 cache 50;
CREATE SEQUENCE moto_mktg.nr5_seq start 2 increment 1 cache 50;
CREATE SEQUENCE moto_mktg.nr6_seq start 9 increment 1 cache 50;
CREATE SEQUENCE moto_mktg.nr7_seq start 6 increment 1 cache 50;

DROP SEQUENCE IF EXISTS moto_mktg.time_seq;
CREATE SEQUENCE moto_mktg.time_seq start 1 increment 1 cache 50;

do $$
declare
  query text;
  curStmnt cursor FOR SELECT
       CASE
       WHEN MOD(nextval('moto_mktg.rec_seq'),6) = 0
       THEN
       'INSERT INTO moto_mktg.phones' || CHR(10) ||
       '  (' || CHR(10) ||
       '    contact_id' || CHR(10) ||
       '    ,phone_number' || CHR(10) ||
	     '    ,update_timestamp' || CHR(10) ||
       '  )' || CHR(10) ||
       'VALUES' || CHR(10) ||
       '  (' || CHR(10) ||
       '   ' || CAST(currval('moto_mktg.rec_seq') AS VARCHAR) || CHR(10)
       || '  ,''+32(0)2'
       || '/' ||
       CAST(MOD(nextval('moto_mktg.nr1_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr2_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr3_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr4_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr5_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr6_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr7_seq'),10) AS VARCHAR)
       || '''' || CHR(10) ||
	   '  ,clock_timestamp() + interval''' || nextval('moto_mktg.time_seq') || ' microsecond''' || CHR(10) ||
	   '  );'
       WHEN MOD(nextval('moto_mktg.rec_seq'),6) = 1
       THEN
       'INSERT INTO moto_mktg.phones' || CHR(10) ||
       '  (' || CHR(10) ||
       '    contact_id' || CHR(10) ||
       '    ,phone_number' || CHR(10) ||
	     '    ,update_timestamp' || CHR(10) ||
       '  )' || CHR(10) ||
       'VALUES' || CHR(10) ||
       '  (' || CHR(10) ||
       '   ' || CAST(currval('moto_mktg.rec_seq') AS VARCHAR) || CHR(10)
       || '  ,''+32(0)3'
       || '/' ||
       CAST(MOD(nextval('moto_mktg.nr1_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr2_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr3_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr4_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr5_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr6_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr7_seq'),10) AS VARCHAR)
       || '''' || CHR(10) ||
	   '  ,clock_timestamp() + interval''' || nextval('moto_mktg.time_seq') || ' microsecond''' || CHR(10) ||
	   '  );'
       WHEN MOD(currval('moto_mktg.rec_seq'),6) = 2
       THEN
       'INSERT INTO moto_mktg.phones' || CHR(10) ||
       '  (' || CHR(10) ||
       '    contact_id' || CHR(10) ||
       '    ,phone_number' || CHR(10) ||
	     '    ,update_timestamp' || CHR(10) ||
       '  )' || CHR(10) ||
       'VALUES' || CHR(10) ||
       '  (' || CHR(10) ||
       '   ' || CAST(currval('moto_mktg.rec_seq') AS VARCHAR) || CHR(10)
       || '  ,''+32(0)9'
       || '/' ||
       CAST(MOD(nextval('moto_mktg.nr1_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr2_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr3_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr4_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr5_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr6_seq'),10) AS VARCHAR)
       ||
       CAST(MOD(nextval('moto_mktg.nr7_seq'),10) AS VARCHAR)
       || '''' || CHR(10) ||
	   '  ,clock_timestamp() + interval''' || nextval('moto_mktg.time_seq') || ' microsecond''' || CHR(10) ||
	   '  );'
        ELSE NULL
       END stmnt
  FROM moto_mktg.party; 


BEGIN

   FOR s IN curStmnt LOOP
   	  if s.stmnt is not null then
        execute s.stmnt;
	  end if;
   END LOOP;

end $$;




------------------------------------------------------------------------------------------------------------------------
-- load the contacts based on the phones
do $$
declare
  query text;
  curStmnt cursor FOR SELECT 'INSERT INTO moto_mktg.contacts' || CHR(10) ||
							   '  (' || CHR(10) ||
							   '    contact_id' || CHR(10) ||
							   '    ,contact_type' || CHR(10) ||
							   '    ,contact_type_desc' || CHR(10) ||
							   '    ,update_timestamp' || CHR(10) ||
							   '  )' || CHR(10) ||
							   'VALUES' || CHR(10) ||
							   '  (' || CHR(10) ||
							   '   ' || CAST(contact_id AS VARCHAR) || CHR(10) ||
							   '  ,'''
							   ||
							   CASE WHEN phone_number LIKE '+32(0)4%'
									THEN 'Mobile'''
									ELSE 'Work'''
							   END
							   || CHR(10) ||
							   '  ,'''
							   ||
							   CASE WHEN phone_number LIKE '+32(0)4%'
									THEN 'Mobile Phone'''
									ELSE 'Work Phone Fixed line'''
							   END
							   || CHR(10) ||
                               '  ,clock_timestamp() + interval''' || nextval('moto_mktg.time_seq') || ' microsecond''' || CHR(10) ||
							   '  )' stmnt
						   FROM moto_mktg.phones;
BEGIN

   FOR s IN curStmnt LOOP
      execute s.stmnt;
   END LOOP;

end $$;



------------------------------------------------------------------------------------------------------------------------
-- load all the party contacts based on the contacts
do $$
declare
  query text;
  curStmnt cursor FOR SELECT 'INSERT INTO moto_mktg.party_contacts' || CHR(10) ||
       '  (' || CHR(10) ||
       '    party_number' || CHR(10) ||
       '    ,contact_id' || CHR(10) ||
	     '    ,update_timestamp' || CHR(10) ||
       '  )' || CHR(10) ||
       'VALUES' || CHR(10) ||
       '  (' || CHR(10) ||
       '   ' || CAST(CASE WHEN MOD(contact_id,22) = 0 THEN 22 ELSE MOD(contact_id,22) END AS VARCHAR) || CHR(10) ||
       '   ,' || CAST(contact_id AS VARCHAR) || CHR(10) ||
       '  ,clock_timestamp() + interval''' || nextval('moto_mktg.time_seq') || ' microsecond''' || CHR(10) ||
       '  )' stmnt
   FROM moto_mktg.contacts
  where contact_id != 99;

BEGIN

   FOR s IN curStmnt LOOP
      execute s.stmnt;
   END LOOP;

end $$;


------------------------------------------------------------------------------------------------------------------------
-- load a bunch of motorcycle for certain campaigns
do $$
declare
  query text;
  curStmnt cursor FOR SELECT distinct 'INSERT INTO moto_mktg.campaign_motorcycles (campaign_code,campaign_start_date,motorcycle_id,motorcycle_class_desc, motorcycle_subclass_desc, motorcycle_emotion_desc, motorcycle_comment, update_timestamp)' || CHR(10) ||
       'VALUES' || CHR(10) ||
       '  (' || CHR(10) ||
       '   ''' || campaign_code||''''||
	   '   ,to_date('''||campaign_start_date||''',''YYYY-MM-DD'')'
	   '  ,'  ||motorcycle_id || CHR(10)||
       '  ,''' || motorcycle_class_desc||''''||
	   '   ,''' || motorcycle_subclass_desc||''''||
	   '   ,''' || motorcycle_emotion_desc||''''||
	   '   ,''' || motorcycle_comment|| '''' ||
       '  ,clock_timestamp() + interval''' || nextval('moto_mktg.time_seq') || ' microsecond'')' stmnt
   FROM (select row_number() over (order by campaign_code, campaign_start_date) campaign_id, campaign_code, campaign_start_date from moto_mktg.campaigns) as camp
   join moto_mktg.motorcycles mot on (mod(campaign_id,18)+1 = motorcycle_id or mod(campaign_id,4)+1 = motorcycle_id  or mod(campaign_id,4)+6 = motorcycle_id) 
   join (select row_number() over (order by 1, 2) mot_class_nr, motorcycle_class_desc, motorcycle_subclass_desc, motorcycle_emotion_desc, motorcycle_comment
			from (  SELECT 'Roadster' as motorcycle_class_desc,'Roadster Boxer 1200' as motorcycle_subclass_desc,'Experience the thrill of riding without wind protection' as motorcycle_emotion_desc,'To push motorbike sales for second hand roadster bikes' as motorcycle_comment UNION
					SELECT 'Heritage','Heritage Air Cooled Boxer 1200','Experience history on a modern Bike','To push motorbike sales for Heritage bikes' UNION
					SELECT 'Adventure','Adventure Boxer 1200','Experience the adventure all-terrain motorbike driving','To push motorbike sales for second hand adventure bikes' UNION
					SELECT 'Roadster','Roadster Boxer 1250','Experience the thrill of riding without wind protection','Highest possibility for buying as it is the least sportif or the Roadsters' UNION
					SELECT 'Sport','SuperSport 4 Cylinder 1000cc','High Adrenaline SuperSport Bikes','To push motorbike sales for 4 CilinderSuperSportBikes' UNION
					SELECT 'Sport','SuperSport 4 Cylinder 1000cc','High Adrenaline SuperSport Bikes','To push motorbike sales for 4 Cilinder SuperSport Bikes' UNION
					SELECT 'Adventure','Adventure Boxer 1250','Experience the adventure all-terrain motorbike driving with more performance','To push motorbike sales for all-terrain performant adventure bikes' UNION
					SELECT 'Tourer','Toerer Boxer 1250','Travel Bike with the best wind protection and additional performance','To push motorbike sales for performant touring bikes' UNION
					SELECT 'Sport','High Legs Sport 4 Cylinder 1000cc','High Adrenaline Sport Bikes with impecible steering capabilities','To push motorbike sales for 4 Cilinder Sport Bikes' UNION
					SELECT 'Adventure','Extended Adventure Boxer 1200','Experience the extended adventure all-terrain motorbike driving','To push motorbike sales for second hand adventure bikes' UNION
					SELECT 'Tourer','Toerer Boxer 1200','Travel Bike with the best wind protection','To push motorbike sales for second hand tourer bikes') as mot_class) as mot_cls on (mot_class_nr = mod(mot.motorcycle_id,10)+1);  

BEGIN

   FOR s IN curStmnt LOOP
      execute s.stmnt;
   END LOOP;

end $$;


------------------------------------------------------------------------------------------------------------------------
-- load all the content for what party is contacted through what contact for what campaign
------------------------------------------------------------------------------------------------------------------------
-- load all the party contacts based on the contacts                  '  ,clock_timestamp() + interval''' || nextval('moto_mktg.time_seq') || ' microsecond'''
do $$
declare
  query text;
  curStmnt cursor FOR select 'INSERT INTO moto_mktg.camp_part_cont
									(party_number, campaign_code, campaign_start_date, contact_id, marketing_program_code, marketing_program_name, update_user, update_timestamp)
								VALUES 
									('||party_number||','''||campaign_code||''',to_date('''||campaign_start_date||''',''YYYY-MM-DD''),'||contact_id||','''||marketing_program_code||''','''||marketing_program_name||''',''WhoUpdated'',clock_timestamp() + interval''' || nextval('moto_mktg.time_seq') || ' microsecond'')' stmnt
									from (
								select subselect.party_number, subselect.campaign_code, subselect.campaign_start_date, subselect.contact_id
									   ,market.marketing_program_code
									   ,market.marketing_program_name
								from (
									select  mod(row_number() over(order by campaign_code,party_number,campaign_start_date),7) modd
										  , mod(row_number() over(order by campaign_code,party_number,campaign_start_date),3)+1 mod_market
										  , party_number
										  , campaign_code
										  , campaign_start_date
										  , contact_id
									from moto_mktg.party_contacts
									join moto_mktg.campaigns on (1=1)
								) as subselect
									join (select 1 as market_nr, 'OldMenNoDL' as marketing_program_code, 'Old Men and related Companies that do not need a Driver Licence to drive a Motorbike' as marketing_program_name
											union 
											select 2 as market_nr, 'FastWomen', 'Target women that like Fast Bikes'
											union
											select 3 as market_nr, 'OnetoOne', 'One To One Marketing Program') as market on (subselect.mod_market = market.market_nr)
								where modd in (1,3,5)) as main_select
								;

BEGIN

   FOR s IN curStmnt LOOP
      execute s.stmnt;
   END LOOP;

end $$;

-- RECORDS ADDED FOR NEW CONTROL MAPPINGS FOR HUBS AND SATELLITES (Missing the link keys at this moment in the HUB when (EARLY_ARRIVING_FACTS = N and missing them always in the SAT).
insert into moto_mktg.camp_part_cont(party_number, campaign_code, campaign_start_date, contact_id, marketing_program_code, marketing_program_name, update_user, update_timestamp)
values(18,'TargetFastWomen',to_date('18/12/2017','DD/MM/YYYY'),23,'FastWomen','Target Women for s1000 Bikes','ERROR_RECORD_DIDIT',clock_timestamp());
insert into moto_mktg.camp_part_cont(party_number, campaign_code, campaign_start_date, contact_id, marketing_program_code, marketing_program_name, update_user, update_timestamp)
values(18,'TargetFastWomen',to_date('20/01/2018','DD/MM/YYYY'),50,'FastWomen','Target Women for s1000 Bikes','ERROR_RECORD_DIDIT',clock_timestamp());
insert into moto_mktg.camp_part_cont(party_number, campaign_code, campaign_start_date, contact_id, marketing_program_code, marketing_program_name, update_user, update_timestamp)
values(18,'TargetFastWomen',to_date('01/03/2018','DD/MM/YYYY'),50,'FastWomen','Target Women for s1000 Bikes','ERROR_RECORD_DIDIT',clock_timestamp());

--select * from moto_ext_mm_tst_ref_scn1.ext_camp_part_cont;

ALTER TABLE moto_mktg.addresses ENABLE TRIGGER trg_addresses;
ALTER TABLE moto_mktg.party ENABLE TRIGGER trg_party;
ALTER TABLE moto_mktg.motorcycles ENABLE TRIGGER trg_motorcycles;
ALTER TABLE moto_mktg.campaigns ENABLE TRIGGER trg_campaigns;
ALTER TABLE moto_mktg.camp_part_cont ENABLE TRIGGER trg_camp_part_cont;
ALTER TABLE moto_mktg.e_mails ENABLE TRIGGER trg_e_mails;
ALTER TABLE moto_mktg.phones ENABLE TRIGGER trg_phones;
ALTER TABLE moto_mktg.contacts ENABLE TRIGGER trg_contacts;
ALTER TABLE moto_mktg.party_contacts ENABLE TRIGGER trg_party_contacts;
ALTER TABLE moto_mktg.campaign_motorcycles ENABLE TRIGGER trg_campaign_motorcycles;
ALTER TABLE moto_mktg.channels ENABLE TRIGGER trg_channels;
ALTER TABLE moto_mktg.camp_moto_channel ENABLE TRIGGER trg_camp_moto_channel;
ALTER TABLE moto_mktg.camp_moto_chan_region ENABLE TRIGGER trg_camp_moto_chan_region;
