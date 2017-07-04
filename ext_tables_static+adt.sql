
#
# Table structure for table "static_taxes"
#
DROP TABLE IF EXISTS static_taxes;
CREATE TABLE static_taxes (
	uid int(11) unsigned auto_increment,
	pid int(11) unsigned DEFAULT '0',
	starttime int(11) unsigned DEFAULT '0',
	endtime int(11) unsigned DEFAULT '0',
	tx_country_iso_2 char(2) DEFAULT '' NOT NULL,
	tx_country_iso_3 char(3) DEFAULT '' NOT NULL,
	tx_zn_code varchar(45) DEFAULT '',
	tx_name_en varchar(255) DEFAULT 'VAT',
	tx_scope tinyint(3) unsigned DEFAULT '1',
	tx_code varchar(5) DEFAULT '1',
	tx_class tinyint(3) unsigned DEFAULT '3',
	tx_rate_id tinyint(3) unsigned DEFAULT '1',
	tx_rate_uid int(11) DEFAULT '0' NOT NULL,
	tx_priority tinyint(3) unsigned DEFAULT '0',

	PRIMARY KEY (uid),
	KEY cn_iso_3 (tx_country_iso_3),
	KEY tx_rate_uid (tx_rate_uid)
);

#
# Table structure for table 'static_taxes_mm_tax_rates'
#
DROP TABLE IF EXISTS static_taxes_mm_tax_rates;
CREATE TABLE static_taxes_mm_tax_rates (
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
	KEY foreignsort (foreignsort),
	KEY comp1 (pid,sorting),
	KEY parent (pid)
);

#
# Table structure for table "static_tax_rates"
#
DROP TABLE IF EXISTS static_tax_rates;
CREATE TABLE static_tax_rates (
	uid int(11) unsigned auto_increment,
	pid int(11) unsigned DEFAULT '0',
	starttime int(11) unsigned DEFAULT '0',
	endtime int(11) unsigned DEFAULT '0',
	tx_rate decimal(19,2) DEFAULT '0.00' NOT NULL,
	tx_country_iso_3 char(3) DEFAULT '',

	PRIMARY KEY (uid),
	KEY cn_iso_3 (tx_country_iso_3)
);

# AUSTRIA

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('1', '0', '0', '0', 'AT', 'AUT', '', 'Austria VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('1', '0', '0', '0', '20', 'AUT');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('1', '0', '1', '1', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('2', '0', '0', '0', 'AT', 'AUT', '', 'Austria Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('2', '0', '0', '0', '10', 'AUT');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('2', '0', '2', '2', '0', '0', '0');

# BELGIUM

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('3', '0', '0', '0', 'BE', 'BEL', '', 'Belgium VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('3', '0', '0', '0', '21', 'BEL');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('3', '0', '3', '3', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('4', '0', '0', '0', 'BE', 'BEL', '', 'Belgium Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('4', '0', '0', '0', '12', 'BEL');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('4', '0', '4', '4', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('5', '0', '0', '0', 'BE', 'BEL', '', 'Belgium Lowest VAT', '1', '3', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('5', '0', '0', '0', '6', 'BEL');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('5', '0', '5', '5', '0', '0', '0');

# BULGARIA

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('6', '0', '0', '0', 'BG', 'BGR', '', 'Bulgaria VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('6', '0', '0', '0', '20', 'BGR');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('6', '0', '6', '6', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('7', '0', '0', '0', 'BG', 'BGR', '', 'Bulgaria Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('7', '0', '0', '0', '9', 'BGR');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('7', '0', '7', '7', '0', '0', '0');

# CANADA

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('8', '0', '0', '0', 'CA', 'CAN', 'SK', 'Saskatchewan Retail Sales Tax', '2', 'SKRST', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('8', '0', '0', '0', '6', 'CAN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('8', '0', '8', '8', '0', '0', '0');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('9', '0', '0', '0', 'CA', 'CAN', 'QC', 'Québec Sales Tax', '2', 'TVQ', '3', '1', '1', '2');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('9', '0', '0', '0', '7.5', 'CAN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('9', '0', '9', '9', '0', '0', '0');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('10', '0', '0', '0', 'CA', 'CAN', '', 'Canada Goods and Services Tax', '1', 'GST', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('10', '0', '0', '0', '5', 'CAN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('10', '0', '10', '10', '0', '0', '0');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('11', '0', '0', '0', 'CA', 'CAN', 'MB', 'Manitoba Retail Sales Tax', '2', 'MBRST', '3', '1', '1', '2');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('11', '0', '0', '0', '5', 'CAN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('11', '0', '11', '11', '0', '0', '0');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('12', '0', '0', '0', 'CA', 'CAN', 'BC', 'British Columbia Retail Sales Tax', '2', 'BCRST', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('12', '0', '0', '0', '7.5', 'CAN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('12', '0', '12', '12', '0', '0', '0');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('13', '0', '0', '0', 'CA', 'CAN', 'ON', 'Ontario Retail Sales Tax', '2', 'ONRST', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('13', '0', '0', '0', '8', 'CAN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('13', '0', '13', '13', '0', '0', '0');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('14', '0', '0', '0', 'CA', 'CAN', 'NB', 'New Brunswick Harmonized Sales Tax', '2', 'HST', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('14', '0', '0', '0', '8', 'CAN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('14', '0', '14', '14', '0', '0', '0');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('15', '0', '0', '0', 'CA', 'CAN', 'NS', 'Nova Scotia Harmonized Sales Tax', '2', 'HST', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('15', '0', '0', '0', '8', 'CAN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('15', '0', '15', '15', '0', '0', '0');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('16', '0', '0', '0', 'CA', 'CAN', 'NS', 'Nova Scotia Harmonized Sales Tax', '2', 'HST', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('16', '0', '0', '0', '8', 'CAN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('16', '0', '16', '16', '0', '0', '0');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('17', '0', '0', '0', 'CA', 'CAN', 'PE', 'Prince Edward Island Retail Sales Tax', '2', 'PERST', '3', '1', '1', '2');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('17', '0', '0', '0', '10', 'CAN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('17', '0', '17', '17', '0', '0', '0');


INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('18', '0', '0', '0', 'CA', 'CAN', 'NL', 'Newfoundland and Labrador Harmonized Sales Tax', '2', 'PERST', '3', '1', '1', '2');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('18', '0', '0', '0', '8', 'CAN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('18', '0', '18', '18', '0', '0', '0');


# SWITZERLAND

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('19', '0', '0', '0', 'CH', 'CHE', '', 'Switzerland VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('19', '0', '0', '0', '8', 'CHE');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('19', '0', '19', '19', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('20', '0', '0', '0', 'CH', 'CHE', '', 'Switzerland Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('20', '0', '0', '0', '3.8', 'CHE');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('20', '0', '20', '20', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('21', '0', '0', '0', 'CH', 'CHE', '', 'Switzerland Lowest VAT', '1', '3', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('21', '0', '0', '0', '2.5', 'CHE');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('21', '0', '21', '21', '0', '0', '0');


# CYPRUS

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('22', '0', '0', '0', 'CY', 'CYP', '', 'Cyprus VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('22', '0', '0', '0', '15', 'CYP');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('22', '0', '22', '22', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('23', '0', '0', '0', 'CY', 'CYP', '', 'Cyprus Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('23', '0', '0', '0', '8', 'CYP');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('23', '0', '23', '23', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('24', '0', '0', '0', 'CY', 'CYP', '', 'Cyprus Lowest VAT', '1', '3', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('24', '0', '0', '0', '5', 'CYP');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('24', '0', '24', '24', '0', '0', '0');


# CZECH

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('25', '0', '0', '0', 'CZ', 'CZE', '', 'Czech Republic VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('25', '0', '0', '0', '19', 'CZE');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('25', '0', '25', '25', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('26', '0', '0', '0', 'CZ', 'CZE', '', 'Czech Republic Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('26', '0', '0', '0', '5', 'CZE');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('26', '0', '26', '26', '0', '0', '0');


# DENMARK

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('27', '0', '0', '0', 'DK', 'DNK', '', 'Denmark VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('27', '0', '0', '0', '25', 'DNK');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('27', '0', '27', '27', '0', '0', '0');


# GERMANY

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('28', '0', '0', '0', 'DE', 'DEU', '', 'Germany VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('28', '0', '0', '0', '19', 'DEU');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('28', '0', '28', '28', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('29', '0', '0', '0', 'DE', 'DEU', '', 'Germany Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('29', '0', '0', '0', '7', 'DEU');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('29', '0', '29', '29', '0', '0', '0');


# ESTONIA

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('30', '0', '0', '0', 'EE', 'EST', '', 'Estonia VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('30', '0', '0', '0', '18', 'EST');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('30', '0', '30', '30', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('31', '0', '0', '0', 'EE', 'EST', '', 'Estonia VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('31', '0', '0', '0', '5', 'EST');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('31', '0', '31', '31', '0', '0', '0');


# SPAIN

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('32', '0', '0', '0', 'ES', 'ESP', '', 'Spain VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('32', '0', '0', '0', '16', 'ESP');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('32', '0', '32', '32', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('33', '0', '0', '0', 'ES', 'ESP', '', 'Spain VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('33', '0', '0', '0', '7', 'ESP');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('33', '0', '33', '33', '0', '0', '0');


# FINLAND

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('34', '0', '0', '0', 'FI', 'FIN', '', 'Finland VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('34', '0', '0', '0', '22', 'FIN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('34', '0', '34', '34', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('35', '0', '0', '0', 'FI', 'FIN', '', 'Finland Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('35', '0', '0', '0', '17', 'FIN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('35', '0', '35', '35', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('36', '0', '0', '0', 'FI', 'FIN', '', 'Finland Lowest VAT', '1', '3', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('36', '0', '0', '0', '8', 'FIN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('36', '0', '36', '36', '0', '0', '0');


# FRANCE

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('37', '0', '0', '0', 'FR', 'FRA', '', 'France VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('37', '0', '0', '0', '19.6', 'FRA');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('37', '0', '37', '37', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('38', '0', '0', '0', 'FR', 'FRA', '', 'France Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('38', '0', '0', '0', '5.5', 'FRA');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('38', '0', '38', '38', '0', '0', '0');


# UNITED KINGDOM

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('39', '0', '0', '0', 'GB', 'GBR', '', 'United Kingdom VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('39', '0', '0', '0', '17.5', 'GBR');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('39', '0', '39', '39', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('40', '0', '0', '0', 'GB', 'GBR', '', 'United Kingdom Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('40', '0', '0', '0', '5', 'GBR');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('40', '0', '40', '40', '0', '0', '0');


# GREECE

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('41', '0', '0', '0', 'GR', 'GRC', '', 'Greece VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('41', '0', '0', '0', '19', 'GRC');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('41', '0', '41', '41', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('42', '0', '0', '0', 'GR', 'GRC', '', 'Greece Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('42', '0', '0', '0', '9', 'GRC');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('42', '0', '42', '42', '0', '0', '0');


# HUNGARY

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('43', '0', '0', '0', 'HU', 'HUN', '', 'Hungary VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('43', '0', '0', '0', '20', 'HUN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('43', '0', '43', '43', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('44', '0', '0', '0', 'HU', 'HUN', '', 'Hungary Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('44', '0', '0', '0', '5', 'HUN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('44', '0', '44', '44', '0', '0', '0');


# IRELAND

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('45', '0', '0', '0', 'IE', 'IRL', '', 'Ireland VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('45', '0', '0', '0', '21', 'IRL');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('45', '0', '45', '45', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('46', '0', '0', '0', 'IE', 'IRL', '', 'Ireland Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('46', '0', '0', '0', '13.5', 'IRL');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('46', '0', '46', '46', '0', '0', '0');


# ITALY

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('47', '0', '0', '0', 'IT', 'ITA', '', 'Italy VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('47', '0', '0', '0', '20', 'ITA');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('47', '0', '47', '47', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('48', '0', '0', '0', 'IT', 'ITA', '', 'Italy Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('48', '0', '0', '0', '10', 'ITA');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('48', '0', '48', '48', '0', '0', '0');


# JAPAN

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('49', '0', '0', '0', 'JP', 'JPN', '', 'Japan VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('49', '0', '0', '0', '5', 'JPN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('49', '0', '49', '49', '0', '0', '0');


# LATVIA

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('50', '0', '0', '0', 'LV', 'LVA', '', 'Latvia VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('50', '0', '0', '0', '18', 'LVA');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('50', '0', '50', '50', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('51', '0', '0', '0', 'LV', 'LVA', '', 'Latvia Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('51', '0', '0', '0', '5', 'LVA');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('51', '0', '51', '51', '0', '0', '0');


# LITHUANIA

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('52', '0', '0', '0', 'LT', 'LTU', '', 'Lithuania VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('52', '0', '0', '0', '18', 'LTU');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('52', '0', '52', '52', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('53', '0', '0', '0', 'LT', 'LTU', '', 'Lithuania Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('53', '0', '0', '0', '9', 'LTU');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('53', '0', '53', '53', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('54', '0', '0', '0', 'LT', 'LTU', '', 'Lithuania Lowest VAT', '1', '3', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('54', '0', '0', '0', '5', 'LTU');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('54', '0', '54', '54', '0', '0', '0');


# LUXEMBOURG

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('55', '0', '0', '0', 'LU', 'LUX', '', 'Luxembourg VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('55', '0', '0', '0', '15', 'LUX');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('55', '0', '55', '55', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('56', '0', '0', '0', 'LU', 'LUX', '', 'Luxembourg Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('56', '0', '0', '0', '12', 'LUX');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('56', '0', '56', '56', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('57', '0', '0', '0', 'LU', 'LUX', '', 'Luxembourg Lowest VAT', '1', '3', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('57', '0', '0', '0', '6', 'LUX');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('57', '0', '57', '57', '0', '0', '0');


# MALTA

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('58', '0', '0', '0', 'MT', 'MLT', '', 'Malta VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('58', '0', '0', '0', '18', 'MLT');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('58', '0', '58', '58', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('59', '0', '0', '0', 'MT', 'MLT', '', 'Malta Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('59', '0', '0', '0', '5', 'MLT');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('59', '0', '59', '59', '0', '0', '0');


# MEXICO

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('60', '0', '0', '0', 'MX', 'MEX', '', 'Mexico VAT', '1', 'IVA', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('60', '0', '0', '0', '15', 'MEX');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('60', '0', '60', '60', '0', '0', '0');


# NETHERLANDS

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('61', '0', '0', '0', 'NL', 'NLD', '', 'Netherlands VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('61', '0', '0', '0', '19', 'NLD');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('61', '0', '61', '61', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('62', '0', '0', '0', 'NL', 'NLD', '', 'Netherlands Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('62', '0', '0', '0', '6', 'NLD');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('62', '0', '62', '62', '0', '0', '0');


# NORWAY

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('63', '0', '0', '0', 'NO', 'NOR', '', 'Norway VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('63', '0', '0', '0', '25', 'NOR');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('63', '0', '63', '63', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('64', '0', '0', '0', 'NO', 'NOR', '', 'Norway Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('64', '0', '0', '0', '14', 'NOR');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('64', '0', '64', '64', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('65', '0', '0', '0', 'NO', 'NOR', '', 'Norway Lowest VAT', '1', '3', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('65', '0', '0', '0', '8', 'NOR');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('65', '0', '65', '65', '0', '0', '0');


# POLAND

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('66', '0', '0', '0', 'PL', 'POL', '', 'Poland VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('66', '0', '0', '0', '22', 'POL');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('66', '0', '66', '66', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('67', '0', '0', '0', 'PL', 'POL', '', 'Poland Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('67', '0', '0', '0', '7', 'POL');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('67', '0', '67', '67', '0', '0', '0');


# ROMANIA

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('68', '0', '0', '0', 'RO', 'ROU', '', 'Romania VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('68', '0', '0', '0', '19', 'ROU');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('68', '0', '68', '68', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('69', '0', '0', '0', 'RO', 'ROU', '', 'Romania Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('69', '0', '0', '0', '9', 'ROU');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('69', '0', '69', '69', '0', '0', '0');


# PORTUGAL

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('70', '0', '0', '0', 'PT', 'PRT', '', 'Portugal VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('70', '0', '0', '0', '19', 'PRT');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('70', '0', '70', '70', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('71', '0', '0', '0', 'PT', 'PRT', '', 'Portugal Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('71', '0', '0', '0', '12', 'PRT');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('71', '0', '71', '71', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('72', '0', '0', '0', 'PT', 'PRT', '', 'Portugal Lowest VAT', '1', '3', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('72', '0', '0', '0', '5', 'PRT');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('72', '0', '72', '72', '0', '0', '0');


# SWEDEN

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('73', '0', '0', '0', 'SE', 'SWE', '', 'Sweden VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('73', '0', '0', '0', '25', 'SWE');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('73', '0', '73', '73', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('74', '0', '0', '0', 'SE', 'SWE', '', 'Sweden Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('74', '0', '0', '0', '12', 'SWE');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('74', '0', '74', '74', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('75', '0', '0', '0', 'SE', 'SWE', '', 'Sweden Lowest VAT', '1', '3', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('75', '0', '0', '0', '6', 'SWE');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('75', '0', '75', '75', '0', '0', '0');


# SLOVENIA

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('76', '0', '0', '0', 'SI', 'SVN', '', 'Slovenia VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('76', '0', '0', '0', '20', 'SVN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('76', '0', '76', '76', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('77', '0', '0', '0', 'SI', 'SVN', '', 'Slovenia Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('77', '0', '0', '0', '8.5', 'SVN');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('77', '0', '77', '77', '0', '0', '0');


# SLOVAKIA

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('78', '0', '0', '0', 'SK', 'SVK', '', 'Slovakia VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('78', '0', '0', '0', '19', 'SVK');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('78', '0', '78', '78', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('79', '0', '0', '0', 'SK', 'SVK', '', 'Slovakia Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('79', '0', '0', '0', '10', 'SVK');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('79', '0', '79', '79', '0', '0', '0');


# TURKEY

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('80', '0', '0', '0', 'TR', 'TUR', '', 'Turkey VAT', '1', '1', '3', '1', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('80', '0', '0', '0', '18', 'TUR');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('80', '0', '80', '80', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('81', '0', '0', '0', 'TR', 'TUR', '', 'Turkey Reduced VAT', '1', '2', '3', '2', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('81', '0', '0', '0', '8', 'TUR');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('81', '0', '81', '81', '0', '0', '0');

INSERT INTO static_taxes (uid, pid, starttime, endtime, tx_country_iso_2, tx_country_iso_3, tx_zn_code, tx_name_en, tx_scope, tx_code, tx_class, tx_rate_id, tx_rate_uid, tx_priority)
	VALUES ('82', '0', '0', '0', 'TR', 'TUR', '', 'Turkey Lowest VAT', '1', '3', '3', '3', '1', '1');
INSERT INTO static_tax_rates (uid, pid, starttime, endtime, tx_rate, tx_country_iso_3)
	VALUES ('82', '0', '0', '0', '1', 'TUR');
INSERT INTO static_taxes_mm_tax_rates (uid, pid, uid_local, uid_foreign, deleted, sorting, foreignsort)
	VALUES ('82', '0', '82', '82', '0', '0', '0');

