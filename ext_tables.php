<?php
if (!defined ('TYPO3_MODE')) {
	die ('Access denied.');
}

$GLOBALS['TCA']['static_taxes'] = array(
	'ctrl' => array(
		'label' => 'tx_name_en',
		'type' => 'tx_scope',
		'readOnly' => 1,
		'adminOnly' => 1,
		'rootLevel' => 1,
		'is_static' => 1,
		'default_sortby' => 'ORDER BY tx_name_en',
		'enablecolumns' => array(
			'starttime' => 'starttime',
			'endtime' => 'endtime',
		),
		'title' => 'LLL:EXT:'.STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes',
		'dynamicConfigFile' => PATH_BE_STATICINFOTABLESTAXES . 'tca.php',
		'iconfile' => PATH_BE_STATICINFOTABLESTAXES_REL . 'ext_icon.gif',
	),
	'interface' => array(
		'showRecordFieldList' => 'tx_name_en,tx_scope,tx_code,tx_country_iso_3,tx_country_iso_3,tx_zn_code,tx_class,tx_rate_id,tx_rate_uid,tx_priority,starttime,endtime'
	)
);

$GLOBALS['TCA']['static_taxes_mm_tax_rates'] = array(
	'ctrl' => array(
		'title' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_mm_tax_rates',
		'label' => 'title',
		'delete' => 'deleted',
		'prependAtCopy' => 'LLL:EXT:lang/locallang_general.php:LGL.prependAtCopy',
		'dynamicConfigFile' => PATH_BE_STATICINFOTABLESTAXES . 'tca.php',
		'iconfile' => PATH_BE_STATICINFOTABLESTAXES_REL . 'ext_icon.gif',
		'hideTable' => TRUE,
	),
);


$GLOBALS['TCA']['static_tax_rates'] = array(
	'ctrl' => array(
		'label' => 'tx_rate',
		'readOnly' => 1,
		'adminOnly' => 1,
		'rootLevel' => 1,
		'is_static' => 1,
		'default_sortby' => 'ORDER BY tx_rate',
		'enablecolumns' => array(
			'starttime' => 'starttime',
			'endtime' => 'endtime',
		),
		'title' => 'LLL:EXT:'.STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_tax_rates',
		'dynamicConfigFile' => PATH_BE_STATICINFOTABLESTAXES . 'tca.php',
		'iconfile' => PATH_BE_STATICINFOTABLESTAXES_REL . 'ext_icon.gif',
		'hideTable' => TRUE,
	),
	'interface' => array(
		'showRecordFieldList' => 'tx_rate,starttime,endtime'
	)
);

$GLOBALS['TCA']['static_taxes']['ctrl']['readOnly'] = 0;

t3lib_extMgm::addStaticFile(STATIC_INFO_TABLES_TAXES_EXT, 'static/', 'Static Info Tables Taxes');

?>