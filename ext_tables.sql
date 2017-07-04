#
# Table structure for table "static_taxes"
#
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
