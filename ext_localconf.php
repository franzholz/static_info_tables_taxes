<?php
if (!defined ('TYPO3_MODE')) {
	die ('Access denied.');
}

if (!defined ('STATIC_INFO_TABLES_TAXES_EXT')) {
	define('STATIC_INFO_TABLES_TAXES_EXT', $_EXTKEY);
}

if (!defined ('STATIC_INFO_TABLES_EXT')) {
	define('STATIC_INFO_TABLES_EXT', 'static_info_tables');
}

if (!defined ('PATH_BE_STATICINFOTABLESTAXES')) {
	define('PATH_BE_STATICINFOTABLESTAXES', t3lib_extMgm::extPath(STATIC_INFO_TABLES_TAXES_EXT));
}

if (!defined ('PATH_BE_STATICINFOTABLESTAXES_REL')) {
	define('PATH_BE_STATICINFOTABLESTAXES_REL', t3lib_extMgm::extRelPath(STATIC_INFO_TABLES_TAXES_EXT));
}

$GLOBALS['TYPO3_CONF_VARS']['EXTCONF'][$_EXTKEY]['tables']['static_taxes'] =
	array (
		'label_fields' => array (
			'tx_name_##', 'tx_name_en'
		),
		'isocode_field' => array (
			'tx_code', 'tx_country_iso_##', 'tx_zn_code'
		)
	);

?>