<?php

########################################################################
# Extension Manager/Repository config file for ext: "static_info_tables_taxes"
#
# Auto generated 02-05-2008 22:21
#
# Manual updates:
# Only the data in the array - anything else is removed by next write.
# "version" and "dependencies" must not be touched!
########################################################################

$EM_CONF[$_EXTKEY] = array(
	'title' => 'Static taxes.',
	'description' => 'Tables and functions used for dealing with taxes',
	'category' => 'misc',
	'author' => 'Franz Holzinger',
	'author_email' => 'franz@ttproducts.de',
	'shy' => '',
	'dependencies' => 'static_info_tables',
	'priority' => '',
	'module' => '',
	'state' => 'stable',
	'internal' => '',
	'uploadfolder' => 0,
	'createDirs' => '',
	'modify_tables' => '',
	'clearCacheOnLoad' => 0,
	'lockType' => '',
	'author_company' => '',
	'version' => '0.2.1',
	'constraints' => array(
		'depends' => array(
			'static_info_tables' => '2.0.8-6.2.99',
			'typo3' => '4.2.0-7.5.99',
		),
		'conflicts' => array(
			'static_info_tables' => '1.0.0-2.0.7',
		),
		'suggests' => array(
		),
	),
	'_md5_values_when_last_written' => 'a:12:{s:9:"ChangeLog";s:4:"d600";s:38:"class.tx_staticinfotablestaxes_div.php";s:4:"ab51";s:12:"ext_icon.gif";s:4:"8981";s:17:"ext_localconf.php";s:4:"1f86";s:14:"ext_tables.php";s:4:"e1f5";s:14:"ext_tables.sql";s:4:"bf50";s:25:"ext_tables_static+adt.sql";s:4:"1c0f";s:16:"locallang_db.xml";s:4:"5e2f";s:7:"tca.php";s:4:"f4ec";s:14:"doc/manual.sxw";s:4:"f255";s:20:"static/constants.txt";s:4:"8533";s:16:"static/setup.txt";s:4:"98e7";}',
	'suggests' => array(
	),
);

?>