#
# Table structure for table "static_taxes"
#
DROP TABLE IF EXISTS static_taxes;
CREATE TABLE static_taxes (
	uid int(11) unsigned auto_increment,
	pid int(11) unsigned DEFAULT '0',
	deleted tinyint(3) DEFAULT '0' NOT NULL,
	hidden tinyint(4) DEFAULT '0' NOT NULL,
	starttime int(11) DEFAULT '0' NOT NULL,
	endtime int(11) DEFAULT '0' NOT NULL,
	tx_country_iso_2 char(2) DEFAULT '' NOT NULL,
	tx_country_iso_3 char(3) DEFAULT '' NOT NULL,
	tx_zn_code varchar(45) DEFAULT '',
	tx_name_en varchar(255) DEFAULT 'VAT',
	tx_code varchar(5) DEFAULT '1',
	tx_rate_id tinyint(3) unsigned DEFAULT '1',
	tx_rate_uid int(11) DEFAULT '0' NOT NULL,
	tx_priority tinyint(3) unsigned DEFAULT '0',

	PRIMARY KEY (uid),
	KEY cn_iso_3 (tx_country_iso_3),
	KEY tx_rate_uid (tx_rate_uid)
);


#
# Table structure for table "static_tax_rates"
#
DROP TABLE IF EXISTS static_tax_rates;
CREATE TABLE static_tax_rates (
	uid int(11) unsigned auto_increment,
	pid int(11) unsigned DEFAULT '0',
	deleted tinyint(3) DEFAULT '0' NOT NULL,
	hidden tinyint(4) DEFAULT '0' NOT NULL,
	starttime int(11) DEFAULT '0' NOT NULL,
	endtime int(11) DEFAULT '0' NOT NULL,
	title varchar(256) NOT NULL,
	tx_rate decimal(19,2) DEFAULT '0.00' NOT NULL,
	category tinyint(3) unsigned DEFAULT '1',

	PRIMARY KEY (uid),
	KEY title (title)
);


#
# Table structure for table 'static_taxes_mm_rates'
#
DROP TABLE IF EXISTS static_taxes_mm_rates;
CREATE TABLE static_taxes_mm_rates (
	uid int(11) unsigned NOT NULL auto_increment,
	pid int(11) unsigned DEFAULT '0' NOT NULL,
	uid_local int(11) DEFAULT '0' NOT NULL,
	uid_foreign int(11) DEFAULT '0' NOT NULL,
	deleted tinyint(4) DEFAULT '0' NOT NULL,
	sorting int(10) DEFAULT '0' NOT NULL,
	foreignsort int(10) DEFAULT '0' NOT NULL,

	PRIMARY KEY (uid),
	KEY uid_local (uid_local),
	KEY uid_foreign (uid_foreign),
	KEY sorting (sorting),
	KEY foreignsort (foreignsort)
);


#
# Table structure for table "static_tax_categories"
#
DROP TABLE IF EXISTS static_tax_categories;
CREATE TABLE static_tax_categories (
	uid int(11) unsigned auto_increment,
	pid int(11) unsigned DEFAULT '0',
	deleted tinyint(3) DEFAULT '0' NOT NULL,
	hidden tinyint(4) DEFAULT '0' NOT NULL,
	starttime int(11) DEFAULT '0' NOT NULL,
	endtime int(11) DEFAULT '0' NOT NULL,
	title varchar(256) NOT NULL,
	parentid int(11) DEFAULT '0' NOT NULL,

	PRIMARY KEY (uid),
	KEY parent (parentid),
	KEY title (title)
);


#
# Table structure for table 'static_tax_rates_mm_categories'
#
DROP TABLE IF EXISTS static_tax_rates_mm_categories;
CREATE TABLE static_tax_rates_mm_categories (
	uid int(11) unsigned NOT NULL auto_increment,
	pid int(11) unsigned DEFAULT '0' NOT NULL,
	deleted tinyint(3) DEFAULT '0' NOT NULL,
	hidden tinyint(4) DEFAULT '0' NOT NULL,
	starttime int(11) DEFAULT '0' NOT NULL,
	endtime int(11) DEFAULT '0' NOT NULL,
	uid_local int(11) DEFAULT '0' NOT NULL,
	uid_foreign int(11) DEFAULT '0' NOT NULL,
	sorting int(10) DEFAULT '0' NOT NULL,
	foreignsort int(10) DEFAULT '0' NOT NULL,

	PRIMARY KEY (uid),
	KEY uid_local (uid_local),
	KEY uid_foreign (uid_foreign),
	KEY sorting (sorting),
	KEY foreignsort (foreignsort)
);



# Goods


INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('1', 'Goods and Services', '0');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('2', 'Goods', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('3', 'Children supplies', '1');


# Foods and Drinks


INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('10', 'Food and Beverages', '2');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('13', 'Foodstuff', '10');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('14', 'Basic Foodstuffs', '13');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('15', 'Baby Foodstuffs', '13');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('18', 'Supply of Fish', '13');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('19', 'Beverages', '10');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('20', 'Water', '19');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('21', 'Bottled Water', '19');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('22', 'Wine', '19');


# Printings


INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('50', 'Printed Materials', '2');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('51', 'Books and Journals', '50');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('52', 'Books', '51');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('53', 'DVDs and CDs', '2');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('54', 'Newspapers', '50');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('55', 'Journals', '51');


# Tourism


INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('60', 'Hotels', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('61', 'Tourism', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('62', 'Accommodation and Camping', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('63', 'Restaurants', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('64', 'Catering', '1');


# Transport


INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('70', 'Transport Service', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('71', 'Passenger Transport', '70');


# Chemicals


INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('80', 'Pharmaceuticals', '2');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('81', 'Medicals', '2');


# Buildings


INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('90', 'Housing and Construction', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('91', 'New Homes', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('92', 'Immovable Property Renovation', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('93', 'Household Services', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('94', 'Private Real Estate', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('95', 'House Repairs', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('96', 'Domestic Renovations', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('97', 'New Housing', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('98', 'Social Buildings', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('99', 'Household Cleaning', '93');


# Events


INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('100', 'Cultural and Sporting Events', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('101', 'Cultural and Cinema Events', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('102', 'Cultural Events', '100');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('103', 'Sporting Events', '100');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('104', 'Art', '2');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('105', 'Amusement Park', '2');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('106', 'Sporting Ground Rental', '1');


# Energy Supply


INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('110', 'Domestic Energy', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('111', 'Domestic Fuel', '2');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('112', 'Domestic Heating', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('113', 'Domestic Power Electricity', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('114', 'Heating Oil', '2');


# Services


INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('120', 'Services', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('121', 'Securities Management', '120');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('122', 'Financial Services', '120');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('123', 'Reinsurance Services', '120');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('124', 'Establishments Providing Female Meeting Services', '120');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('125', 'Book Writing and Music Composing Services', '120');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('126', 'Funeral Parlour', '120');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('127', 'Medical and Dental Services', '120');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('128', 'Garbage Collection and Street Cleaning Services', '120');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('129', 'Mobile Nursing Service', '120');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('130', 'Hairdressing Service', '120');


# Animals and Plants


INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('150', 'Livestock', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('151', 'Agriculture', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('152', 'Horticulture', '1');


# Digital and Telecommunication Services


INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('300', 'Broadcasting Services', '120');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('301', 'Broadcasting Services - Radio and TV programmes', '300');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('302', 'Broadcasting Services - Offre triple play', '301');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('303', 'Broadcasting Services - Offres TV seule', '301');

### EU rule to use the customer country tax instead of the shop country tax:
INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('304', 'Telecommunication & e-Services', '120');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('305', 'Telecommunication & e-Services - eBooks', '304');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('306', 'Telecommunication & e-Services - eNewspapers', '304');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('307', 'Telephony', '304');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('308', 'Pay TV / Cable TV', '300');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('309', 'Radio and TV fees', '301');


# Handicapped Persons


INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('400', 'Utilities for Invalids', '1');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('401', 'Child Car Seats', '1');


# Repairing Services (Correction and Modification)
INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('420', 'Repairing and Modification Services', '120');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('421', 'Repairing Bikes', '420');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('422', 'Repairing Shoes and Leather', '420');

INSERT INTO static_tax_categories (uid, title, parentid)
	VALUES ('423', 'Repairing Clothes and Household Linen', '420');



# AUSTRIA


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('1', '0', '0', '0', 'AT', 'AUT', '', 'Austria VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('1', '0', '0', '0', 'AUT', '20');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('1', '1');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('1', '1');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('1', '304');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('2', '0', '0', '0', 'AT', 'AUT', '', 'Austria Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('2', '0', '0', '0', 'AUT', '10');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('2', '2');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('2', '301');


# BELGIUM


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('3', '0', '0', '0', 'BE', 'BEL', '', 'Belgium VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('3', '0', '0', '0', 'BEL', '21');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('3', '3');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('3', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('4', '0', '0', '0', 'BE', 'BEL', '', 'Belgium Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('4', '0', '0', '0', 'BEL', '12');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('4', '4');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('5', '0', '0', '0', 'BE', 'BEL', '', 'Belgium Lowest VAT', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('5', '0', '0', '0', 'BEL', '6');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('5', '5');


# BULGARIA


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('6', '0', '0', '0', 'BG', 'BGR', '', 'Bulgaria VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('6', '0', '0', '0', 'BGR', '20');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('6', '6');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('6', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('7', '0', '0', '0', 'BG', 'BGR', '', 'Bulgaria Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('7', '0', '0', '0', 'BGR', '9');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('7', '7');


# CANADA


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('8', '0', '0', '0', 'CA', 'CAN', 'SK', 'Saskatchewan Retail Sales Tax', 'SKRST', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('8', '0', '0', '0', 'CAN-SKRST', '6');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('8', '8');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('9', '0', '0', '0', 'CA', 'CAN', 'QC', 'Québec Sales Tax', 'TVQ', '1', '1', '2');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('9', '0', '0', '0', 'CAN-TVQ', '7.5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('9', '9');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('10', '0', '0', '0', 'CA', 'CAN', '', 'Canada Goods and Services Tax', 'GST', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('10', '0', '0', '0', 'CAN-GST', '5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('10', '10');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('11', '0', '0', '0', 'CA', 'CAN', 'MB', 'Manitoba Retail Sales Tax', 'MBRST', '1', '1', '2');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('11', '0', '0', '0', 'CAN-MBRST', '5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('11', '11');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('12', '0', '0', '0', 'CA', 'CAN', 'BC', 'British Columbia Retail Sales Tax', 'BCRST', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('12', '0', '0', '0', 'CAN-BCRST', '7.5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('12', '12');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('13', '0', '0', '0', 'CA', 'CAN', 'ON', 'Ontario Retail Sales Tax', 'ONRST', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('13', '0', '0', '0', 'CAN-ONRST', '8');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('13', '13');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('14', '0', '0', '0', 'CA', 'CAN', 'NB', 'New Brunswick Harmonized Sales Tax', 'HST', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('14', '0', '0', '0', 'CAN-HST New Brunswick', '8');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('14', '14');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('15', '0', '0', '0', 'CA', 'CAN', 'NS', 'Nova Scotia Harmonized Sales Tax', 'HST', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('15', '0', '0', '0', 'CAN-HST Nova Scotia', '8');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('15', '15');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('17', '0', '0', '0', 'CA', 'CAN', 'PE', 'Prince Edward Island Retail Sales Tax', 'PERST', '1', '1', '2');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('17', '0', '0', '0', 'CAN-PERST Prince Edward', '10');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('17', '17');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('18', '0', '0', '0', 'CA', 'CAN', 'NL', 'Newfoundland and Labrador Harmonized Sales Tax', 'PERST', '1',  '1', '2');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('18', '0', '0', '0', 'CAN-PERST Newfoundland', '8');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('18', '18');


# SWITZERLAND


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('19', '0', '0', '0', 'CH', 'CHE', '', 'Switzerland VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('19', '0', '0', '0', 'CHE-1', '8');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('19', '19');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('19', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('20', '0', '0', '0', 'CH', 'CHE', '', 'Switzerland Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('20', '0', '0', '0', 'CHE-2', '3.8');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('20', '20');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('21', '0', '0', '0', 'CH', 'CHE', '', 'Switzerland Lowest VAT', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('21', '0', '0', '0', 'CHE-3', '2.5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('21', '21');


# CYPRUS


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('22', '0', '0', '0', 'CY', 'CYP', '', 'Cyprus VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('22', '0', '0', '0', 'CYP-1', '19');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('22', '22');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('22', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('23', '0', '0', '0', 'CY', 'CYP', '', 'Cyprus Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('23', '0', '0', '0', 'CYP-2', '9');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('23', '23');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('24', '0', '0', '0', 'CY', 'CYP', '', 'Cyprus Lowest VAT', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('24', '0', '0', '0', 'CYP-3', '5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('24', '24');


# CZECH


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('25', '0', '0', '0', 'CZ', 'CZE', '', 'Czech Republic VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('25', '0', '0', '0', 'CZE-1', '21');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('25', '25');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('25', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('26', '0', '0', '0', 'CZ', 'CZE', '', 'Czech Republic Higher Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('26', '0', '0', '0', 'CZE-2', '15');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('26', '26');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('27', '0', '0', '0', 'CZ', 'CZE', '', 'Czech Republic Lower Reduced VAT', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('27', '0', '0', '0', 'CZE-3', '5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('27', '27');

# GERMANY


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('28', '0', '0', '0', 'DE', 'DEU', '', 'Germany VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('28', '0', '0', '0', 'DEU-1', '19');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('28', '28');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('28', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('29', '0', '0', '0', 'DE', 'DEU', '', 'Germany Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('29', '0', '0', '0', 'DEU-2', '7');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('29', '29');


# DENMARK


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('30', '0', '0', '0', 'DK', 'DNK', '', 'Denmark VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('30', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('30', '0', '0', '0', 'DNK-1', '25');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('30', '30');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('30', '1');


# ESTONIA


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('40', '0', '0', '0', 'EE', 'EST', '', 'Estonia VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('40', '0', '0', '0', 'EST-1', '20');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('40', '40');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('40', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('41', '0', '0', '0', 'EE', 'EST', '', 'Estonia VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('41', '0', '0', '0', 'EST-2', '9');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('41', '41');


# SPAIN


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('42', '0', '0', '0', 'ES', 'ESP', '', 'Spain VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('42', '0', '0', '0', 'ESP-1', '21');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('42', '42');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('42', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('43', '0', '0', '0', 'ES', 'ESP', '', 'Spain Higher Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('43', '0', '0', '0', 'ESP-2', '10');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('43', '43');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('44', '0', '0', '0', 'ES', 'ESP', '', 'Spain Lowest Reduced VAT', '5', '5', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('44', '0', '0', '0', 'ESP-3', '4');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('44', '44');


# FINLAND


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('45', '0', '0', '0', 'FI', 'FIN', '', 'Finland VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('45', '0', '0', '0', 'FIN-1', '24');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('45', '45');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('45', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('46', '0', '0', '0', 'FI', 'FIN', '', 'Finland Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('46', '0', '0', '0', 'FIN-2', '17');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('46', '46');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('47', '0', '0', '0', 'FI', 'FIN', '', 'Finland Lowest VAT', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('47', '0', '0', '0', 'FIN-3', '8');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('47', '47');


# FRANCE


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('48', '0', '0', '0', 'FR', 'FRA', '', 'France VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('48', '0', '0', '0', 'FRA-1', '20');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('48', '48');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('48', '1');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('48', '302');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('49', '0', '0', '0', 'FR', 'FRA', '', 'France Reduced Upper VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('49', '0', '0', '0', 'FRA-2', '10');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('49', '49');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('49', '303');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('50', '0', '0', '0', 'FR', 'FRA', '', 'France Reduced Lower VAT', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('50', '0', '0', '0', 'FRA-3', '5.5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('50', '50');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('50', '305');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('51', '0', '0', '0', 'FR', 'FRA', '', 'France Reduced Lowest VAT', '4', '4', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('51', '0', '0', '0', 'FRA-4', '2.1');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('51', '51');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('51', '306');


# UNITED KINGDOM


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('70', '0', '0', '0', 'GB', 'GBR', '', 'United Kingdom VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('70', '0', '0', '0', 'GBR-1', '20');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('70', '70');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('70', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('71', '0', '0', '0', 'GB', 'GBR', '', 'United Kingdom Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('71', '0', '0', '0', 'GBR-2', '5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('71', '71');


# GREECE


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('72', '0', '0', '0', 'GR', 'GRC', '', 'Greece VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('72', '0', '0', '0', 'GRC-1', '23');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('72', '72');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('72', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('73', '0', '0', '0', 'GR', 'GRC', '', 'Greece Upper Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('73', '0', '0', '0', 'GRC-2', '13');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('73', '73');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('74', '0', '0', '0', 'GR', 'GRC', '', 'Greece Lower Reduced VAT', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('74', '0', '0', '0', 'GRC-3', '6,5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('74', '74');


# CROATIA


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('75', '0', '0', '0', 'HR', ' HRV ', '', 'Croatia VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('75', '0', '0', '0', 'CYP-1', '25');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('75', '75');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('75', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('76', '0', '0', '0', 'CY', 'CYP', '', 'Croatia Higher Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('76', '0', '0', '0', 'CYP-2', '13');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('76', '76');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('77', '0', '0', '0', 'CY', 'CYP', '', 'Croatia Lower VAT', '4', '4', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('77', '0', '0', '0', 'CYP-3', '5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('77', '77');


# HUNGARY


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('80', '0', '0', '0', 'HU', 'HUN', '', 'Hungary VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('80', '0', '0', '0', 'HUN-1', '20');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('80', '80');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('80', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('81', '0', '0', '0', 'HU', 'HUN', '', 'Hungary Higher Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('81', '0', '0', '0', 'HUN-2', '18');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('81', '81');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('82', '0', '0', '0', 'HU', 'HUN', '', 'Hungary Lower Reduced VAT', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('82', '0', '0', '0', 'HUN-3', '5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('82', '82');


# IRELAND


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('83', '0', '0', '0', 'IE', 'IRL', '', 'Ireland VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('83', '0', '0', '0', 'IRL-1', '21');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('83', '83');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('83', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('84', '0', '0', '0', 'IE', 'IRL', '', 'Ireland Higher Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('84', '0', '0', '0', 'IRL-2', '13.5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('84', '84');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('85', '0', '0', '0', 'IE', 'IRL', '', 'Ireland Intermediate Reduced VAT', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('85', '0', '0', '0', 'IRL-3', '13.5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('85', '85');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('86', '0', '0', '0', 'IE', 'IRL', '', 'Ireland Lower Reduced VAT', '4', '4', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('86', '0', '0', '0', 'IRL-4', '9');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('86', '86');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('87', '0', '0', '0', 'IE', 'IRL', '', 'Ireland Lowest Reduced VAT', '5', '5', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('87', '0', '0', '0', 'IRL-5', '4.8');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('87', '87');


# ITALY


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('100', '0', '0', '0', 'IT', 'ITA', '', 'Italy VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('100', '0', '0', '0', 'ITA-1', '20');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('100', '100');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('100', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('101', '0', '0', '0', 'IT', 'ITA', '', 'Italy Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('101', '0', '0', '0', 'ITA-2', '10');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('101', '101');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('102', '0', '0', '0', 'IT', 'ITA', '', 'Italy Lowest Reduced VAT', '5', '5', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('102', '0', '0', '0', 'ITA-3', '4');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('102', '102');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('102', '305');


# JAPAN


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('120', '0', '0', '0', 'JP', 'JPN', '', 'Japan VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('120', '0', '0', '0', 'JPN', '5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('120', '120');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('120', '1');


# LITHUANIA


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('121', '0', '0', '0', 'LT', 'LTU', '', 'Lithuania VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('121', '0', '0', '0', 'LTU-1', '18');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('121', '121');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('121', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('122', '0', '0', '0', 'LT', 'LTU', '', 'Lithuania Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('122', '0', '0', '0', 'LTU-2', '9');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('122', '122');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('123', '0', '0', '0', 'LT', 'LTU', '', 'Lithuania Lowest VAT', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('123', '0', '0', '0', 'LTU-3', '5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('123', '123');


# LATVIA


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('125', '0', '0', '0', 'LV', 'LVA', '', 'Latvia VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('125', '0', '0', '0', 'LVA-1', '21');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('125', '125');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('125', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('126', '0', '0', '0', 'LV', 'LVA', '', 'Latvia Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('126', '0', '0', '0', 'LVA-2', '12');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('126', '126');


# LUXEMBOURG


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('127', '0', '0', '0', 'LU', 'LUX', '', 'Luxembourg VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('127', '0', '0', '0', 'LUX-1', '17');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('127', '127');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('127', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('128', '0', '0', '0', 'LU', 'LUX', '', 'Luxembourg Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('128', '0', '0', '0', 'LUX-2', '8');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('128', '128');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('129', '0', '0', '0', 'LU', 'LUX', '', 'Luxembourg Intermediate VAT', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('129', '0', '0', '0', 'LUX-3', '14');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('129', '129');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('130', '0', '0', '0', 'LU', 'LUX', '', 'Luxembourg Lowest VAT', '5', '5', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('130', '0', '0', '0', 'LUX', '3');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('130', '130');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('130', '300');


# MALTA


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('131', '0', '0', '0', 'MT', 'MLT', '', 'Malta VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('131', '0', '0', '0', 'MLT-1', '18');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('131', '131');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('131', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('132', '0', '0', '0', 'MT', 'MLT', '', 'Malta Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('132', '0', '0', '0', 'MLT-2', '5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('132', '132');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('133', '0', '0', '0', 'MT', 'MLT', '', 'Malta Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('133', '0', '0', '0', 'MLT-3', '5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('133', '133');


# MEXICO


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('134', '0', '0', '0', 'MX', 'MEX', '', 'Mexico VAT', 'IVA', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('134', '0', '0', '0', 'MEX', '16');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('134', '134');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('134', '1');


# NETHERLANDS


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('140', '0', '0', '0', 'NL', 'NLD', '', 'Netherlands VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('140', '0', '0', '0', 'NLD-1', '21');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('140', '140');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('140', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('141', '0', '0', '0', 'NL', 'NLD', '', 'Netherlands Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('141', '0', '0', '0', 'NLD-2', '6');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('141', '141');


# NORWAY


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('142', '0', '0', '0', 'NO', 'NOR', '', 'Norway VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('142', '0', '0', '0', 'NOR-1', '25');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('142', '142');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('142', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('143', '0', '0', '0', 'NO', 'NOR', '', 'Norway Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('143', '0', '0', '0', 'NOR-2', '15');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('143', '143');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('144', '0', '0', '0', 'NO', 'NOR', '', 'Norway Lowest VAT', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('144', '0', '0', '0', 'NOR-3', '8');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('144', '144');


# POLAND


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('150', '0', '0', '0', 'PL', 'POL', '', 'Poland VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('150', '0', '0', '0', 'POL-1', '22');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('150', '150');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('150', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('151', '0', '0', '0', 'PL', 'POL', '', 'Poland Higher Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('151', '0', '0', '0', 'POL-2', '8');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('151', '151');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('151', '300');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('152', '0', '0', '0', 'PL', 'POL', '', 'Poland Lower Reduced VAT', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('152', '0', '0', '0', 'POL-3', '5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('152', '152');


# PORTUGAL


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('160', '0', '0', '0', 'PT', 'PRT', '', 'Portugal VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('160', '0', '0', '0', 'PRT-1', '23');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('160', '160');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('160', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('161', '0', '0', '0', 'PT', 'PRT', '', 'Portugal Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('161', '0', '0', '0', 'PRT-2', '13');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('161', '161');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('162', '0', '0', '0', 'PT', 'PRT', '', 'Portugal Intermediate VAT', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('162', '0', '0', '0', 'PRT-3', '13');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('162', '162');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('163', '0', '0', '0', 'PT', 'PRT', '', 'Portugal Lower VAT', '4', '4', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('163', '0', '0', '0', 'PRT-4', '6');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('163', '163');


# ROMANIA


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('170', '0', '0', '0', 'RO', 'ROU', '', 'Romania VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('170', '0', '0', '0', 'ROU-1', '24');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('170', '170');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('170', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('171', '0', '0', '0', 'RO', 'ROU', '', 'Romania Higher Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('171', '0', '0', '0', 'ROU-2', '9');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('171', '171');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('172', '0', '0', '0', 'RO', 'ROU', '', 'Romania Lower Reduced VAT', '4', '4', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('172', '0', '0', '0', 'ROU-3', '5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('172', '172');


# SWEDEN


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('180', '0', '0', '0', 'SE', 'SWE', '', 'Sweden VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('180', '0', '0', '0', 'SWE-1', '25');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('180', '180');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('180', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('181', '0', '0', '0', 'SE', 'SWE', '', 'Sweden Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('181', '0', '0', '0', 'SWE-2', '12');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('181', '181');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('182', '0', '0', '0', 'SE', 'SWE', '', 'Sweden Lowest VAT', '4', '4', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('182', '0', '0', '0', 'SWE-3', '6');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('182', '182');


# SLOVENIA


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('183', '0', '0', '0', 'SI', 'SVN', '', 'Slovenia VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('183', '0', '0', '0', 'SVN-1', '22');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('183', '183');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('183', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('184', '0', '0', '0', 'SI', 'SVN', '', 'Slovenia Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('184', '0', '0', '0', 'SVN-2', '9.5');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('184', '184');


# SLOVAKIA


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('185', '0', '0', '0', 'SK', 'SVK', '', 'Slovakia VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('185', '0', '0', '0', 'SVK-1', '20');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('185', '185');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('185', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('186', '0', '0', '0', 'SK', 'SVK', '', 'Slovakia Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('186', '0', '0', '0', 'SVK-2', '10');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('186', '186');


# TURKEY


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('200', '0', '0', '0', 'TR', 'TUR', '', 'Turkey VAT', '1', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('200', '0', '0', '0', 'TUR-1', '18');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('200', '100');
INSERT INTO static_tax_rates_mm_categories (uid_local, uid_foreign)
	VALUES ('200', '1');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('201', '0', '0', '0', 'TR', 'TUR', '', 'Turkey Higher Reduced VAT', '2', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('201', '0', '0', '0', 'TUR-2', '8');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('201', '201');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_code, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('202', '0', '0', '0', 'TR', 'TUR', '', 'Turkey Lower Reduced VAT', '4', '4', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, title, tx_rate)
	VALUES ('202', '0', '0', '0', 'TUR-3', '1');
INSERT INTO static_taxes_mm_rates (uid_local, uid_foreign)
	VALUES ('202', '202');

