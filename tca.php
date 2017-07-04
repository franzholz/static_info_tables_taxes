<?php
if (!defined ('TYPO3_MODE')) {
	die('Access denied.');
}

$GLOBALS['TCA']['static_taxes'] = array(
	'ctrl' => $GLOBALS['TCA']['static_taxes']['ctrl'],
	'interface' => array(
		'showRecordFieldList' => 'tx_name_en,tx_scope,tx_code,tx_country_iso_2,tx_country_iso_3,tx_zn_code,tx_class,tx_rate_uid,tx_priority,starttime,endtime'
	),
	'columns' => array(
		'starttime' => array(
			'exclude' => 0,
			'label' => 'LLL:EXT:lang/locallang_general.xml:LGL.starttime',
			'config' => array(
				'type' => 'input',
				'size' => '8',
				'max' => '20',
				'eval' => 'date',
				'default' => '0',
				'checkbox' => '0'
			)
		),
		'endtime' => array(
			'exclude' => 0,
			'label' => 'LLL:EXT:lang/locallang_general.xml:LGL.endtime',
			'config' => array(
				'type' => 'input',
				'size' => '8',
				'max' => '20',
				'eval' => 'date',
				'checkbox' => '0',
				'default' => '0',
				'range' => array(
					'upper' => mktime(0, 0, 0, 12, 31, 2040),
					'lower' => mktime(0, 0, 0, date('m') - 1, date('d'), date('Y'))
				)
			)
		),
		'tx_country_iso_2' => array(
			'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_EXT . '/locallang_db.xml:static_taxes_item.cn_iso_2',
			'exclude' => '0',
			'config' => array(
				'type' => 'input',
				'size' => '3',
				'max' => '2',
				'eval' => '',
				'default' => ''
			)
		),
		'tx_country_iso_3' => array(
			'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_item.cn_iso_3',
			'exclude' => '0',
			'config' => array(
				'type' => 'input',
				'size' => '5',
				'max' => '3',
				'eval' => 'required,trim',
				'default' => ''
			)
		),
		'tx_zn_code' => array(
			'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_item.zn_code',
			'exclude' => '0',
			'config' => array(
				'type' => 'input',
				'size' => '18',
				'max' => '45',
				'eval' => 'trim',
				'default' => ''
			)
		),
		'tx_name_en' => array(
			'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_item.tx_name_en',
			'exclude' => '0',
			'config' => array(
				'type' => 'input',
				'size' => '30',
				'max' => '255',
				'eval' => 'trim',
				'default' => ''
			)
		),
		'tx_code' => array(
			'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_item.tx_code',
			'exclude' => '0',
			'config' => array(
				'type' => 'input',
				'size' => '5',
				'max' => '5',
				'eval' => 'trim',
				'default' => ''
			)
		),
		'tx_scope' => array(
			'exclude' => 0,
			'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_item.tx_scope',
			'config' => array(
				'type' => 'select',
				'items' => array(
					Array('LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_item.tx_scope.I.1', '1'),
					Array('LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_item.tx_scope.I.2', '2'),
				),
			)
		),
		'tx_class' => array(
			'exclude' => 0,
			'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_item.tx_class',
			'config' => array(
				'type' => 'select',
				'items' => array(
					Array('LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_item.tx_class.I.1', '1'),
					Array('LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_item.tx_class.I.2', '2'),
					Array('LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_item.tx_class.I.3', '3'),
				),
			)
		),
		'tx_rate_id' => array(
			'exclude' => 0,
			'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_item.tx_rate_id',
			'config' => array(
				'type' => 'select',
				'items' => array(
					Array('LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_item.tx_rate_id.I.1', '1'),
					Array('LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_item.tx_rate_id.I.2', '2'),
					Array('LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_item.tx_rate_id.I.3', '3'),
				),
			)
		),
		'tx_rate_uid' => array(
			'exclude' => 1,
			'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_item.tx_rate_uid',
			'config' => array(
				'type' => 'inline',
				'appearance' => array('collapseAll' => TRUE, 'newRecordLinkAddTitle' => FALSE, 'useCombination' => TRUE),
				'foreign_table' => 'static_taxes_mm_tax_rates',
				'foreign_field' => 'uid_local',
				'foreign_selector_fieldTcaOverride' => array(
					'config' => array(
						'foreign_table_where' => 'AND static_tax_rates.tx_country_iso_3=###REC_FIELD_tx_country_iso_3###',
					)
				),
				'foreign_sortby' => 'sorting',
				'foreign_label' => 'uid_foreign',
				'foreign_selector' => 'uid_foreign',
				'foreign_unique' => 'uid_foreign',
				'maxitems' => 1
			),
		),
		'tx_priority' => array(
			'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_item.tx_priority',
			'exclude' => '0',
			'config' => array(
				'type' => 'input',
				'size' => '3',
				'max' => '2',
				'eval' => 'int',
				'default' => '1'
			)
		)
	),
	'types' => array(
		'1' => array(
			'showitem' => 'tx_name_en;;1;;2-2-2,--palette--;;3;;3-3-3,--palette--;;4;;3-3-3,--palette--;;5;;3-3-3'
		),
		'2' => array(
			'showitem' => 'tx_name_en;;1;;2-2-2,--palette--;;3;;3-3-3,--palette--;;2;;3-3-3'
		),
	),
	'palettes' => array(
		'1' => Array(
			'showitem' => 'tx_country_iso_2,tx_country_iso_3',
			'canNotCollapse' => '1'
		),
		'2' => Array(
			'showitem' => 'hidden,starttime,endtime',
			'canNotCollapse' => '1'
		),
		'3' => Array(
			'showitem' => 'tx_scope,tx_code,tx_class',
			'canNotCollapse' => '1'
		),
		'4' => Array(
			'showitem' => 'tx_rate_id,tx_priority',
			'canNotCollapse' => '1'
		),
		'5' => Array(
			'showitem' => 'tx_rate_uid',
			'canNotCollapse' => '1'
		),
	)
);


$GLOBALS['TCA']['static_taxes_mm_tax_rates'] = array(
	'ctrl' => $GLOBALS['TCA']['static_taxes_mm_tax_rates']['ctrl'],
	'interface' => array(
		'showRecordFieldList' => 'product_uid,graduated_price_uid'
	),
	'feInterface' => $GLOBALS['TCA']['static_taxes_mm_tax_rates']['feInterface'],
	'columns' => array(
		'uid_local' => array(
			'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_mm_tax_rates.uid_local',
			'config' => array(
				'type' => 'select',
				'foreign_table' => 'static_taxes',
				'maxitems' => 1
			)
		),
		'uid_foreign' => array(
			'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_mm_tax_rates.uid_foreign',
			'config' => array(
				'type' => 'select',
				'foreign_table' => 'static_tax_rates',
				'maxitems' => 5
			)
		),
		'sorting' => array(
			'config' => array(
				'type' => 'passthrough',
			)
		),
		'foreignsort' => array(
			'config' => array(
				'type' => 'passthrough',
			)
		),
	),
);


$GLOBALS['TCA']['static_tax_rates'] = array(
	'ctrl' => $GLOBALS['TCA']['static_tax_rates']['ctrl'],
	'interface' => array(
		'showRecordFieldList' => 'starttime,endtime,tx_rate'
	),
	'columns' => array(
		'starttime' => array(
			'exclude' => 1,
			'label' => 'LLL:EXT:lang/locallang_general.php:LGL.starttime',
			'config' => array(
				'type' => 'input',
				'size' => '8',
				'max' => '20',
				'eval' => 'date',
				'checkbox' => '0',
				'default' => '0'
			)
		),
		'endtime' => array(
			'exclude' => 1,
			'label' => 'LLL:EXT:lang/locallang_general.php:LGL.endtime',
			'config' => array(
				'type' => 'input',
				'size' => '8',
				'max' => '20',
				'eval' => 'date',
				'checkbox' => '0',
				'default' => '0',
				'range' => array(
					'upper' => mktime(0, 0, 0, 12, 31, 2040),
					'lower' => mktime(0, 0, 0, date('m') - 1, date('d') , date('Y'))
				)
			)
		),
		'tx_rate' => array(
			'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_tax_rates.tx_rate',
			'exclude' => '0',
			'config' => array(
				'type' => 'input',
				'size' => '12',
				'max' => '20',
				'eval' => 'required,trim,double',
				'default' => '0',
				'range' => array(
					'upper' => 1,
					'lower' => 0
				)
			)
		),
		'tx_country_iso_3' => array(
			'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_taxes_item.cn_iso_3',
			'exclude' => '0',
			'config' => array(
				'type' => 'input',
				'size' => '5',
				'max' => '3',
				'eval' => 'null',
				'placeholder' => '__row|uid_local|tx_country_iso_3',
				'mode' => 'useOrOverridePlaceholder',
			)
		),
	),
	'types' => array(
		'0' => array(
			'showitem' => 'tx_rate;;;;2-2-2,tx_country_iso_3;;;;3-3-3,starttime, endtime'
		),
	),
);

