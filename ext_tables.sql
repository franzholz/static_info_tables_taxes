#
# Table structure for table "static_taxes"
#
CREATE TABLE static_taxes (
	tx_country_iso_2 char(2) DEFAULT '' NOT NULL,
	tx_country_iso_3 char(3) DEFAULT '' NOT NULL,
	tx_zn_code varchar(45) DEFAULT '',
	tx_name_en varchar(255) DEFAULT 'VAT',
	tx_code varchar(5) DEFAULT '1',
	tx_rate_id tinyint(3) unsigned DEFAULT '1',
	tx_rate_uid int(11) DEFAULT '0' NOT NULL,
	tx_priority tinyint(3) unsigned DEFAULT '0',

	KEY cn_iso_3 (tx_country_iso_3),
	KEY tx_rate_uid (tx_rate_uid)
);


#
# Table structure for table "static_tax_rates"
#
CREATE TABLE static_tax_rates (
	title varchar(255) DEFAULT '' NOT NULL,
	tx_rate decimal(19,2) DEFAULT '0.00' NOT NULL,
	category tinyint(3) unsigned DEFAULT '1',

	KEY title (title)
);


#
# Table structure for table 'static_taxes_mm_rates'
#
CREATE TABLE static_taxes_mm_rates (
	uid_local int(11) DEFAULT '0' NOT NULL,
	uid_foreign int(11) DEFAULT '0' NOT NULL,
	sorting int(10) DEFAULT '0' NOT NULL,
	foreignsort int(10) DEFAULT '0' NOT NULL,

	KEY uid_local (uid_local),
	KEY uid_foreign (uid_foreign),
	KEY sorting (sorting),
	KEY foreignsort (foreignsort)
);


#
# Table structure for table "static_tax_categories"
#
CREATE TABLE static_tax_categories (
	title varchar(255) DEFAULT '' NOT NULL,
	parentid int(11) DEFAULT '0' NOT NULL,

	KEY parent (parentid),
	KEY title (title)
);


#
# Table structure for table 'static_tax_rates_mm_categories'
#
CREATE TABLE static_tax_rates_mm_categories (
	uid_local int(11) DEFAULT '0' NOT NULL,
	uid_foreign int(11) DEFAULT '0' NOT NULL,
	sorting int(10) DEFAULT '0' NOT NULL,
	foreignsort int(10) DEFAULT '0' NOT NULL,

	KEY uid_local (uid_local),
	KEY uid_foreign (uid_foreign),
	KEY sorting (sorting),
	KEY foreignsort (foreignsort),
);

