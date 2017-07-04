<?php
if (!defined ('TYPO3_MODE')) {
	die ('Access denied.');
}

$where = \TYPO3\CMS\Backend\Utility\BackendUtility::BEenableFields('static_tax_categories');

$result = array(
	'ctrl' => array(
		'label' => 'title',
		'readOnly' => 1,
		'adminOnly' => 1,
		'rootLevel' => 1,
		'is_static' => 1,
		'title' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_tax_rates',
		'iconfile' => PATH_BE_STATICINFOTABLESTAXES_REL . 'ext_icon.gif',
		'hideTable' => TRUE,
		'default_sortby' => 'ORDER BY title',
		'delete' => 'deleted',
		'enablecolumns' => array (
			'disabled' => 'hidden',
			'starttime' => 'starttime',
			'endtime' => 'endtime',
		),
		'iconfile' => PATH_BE_STATICINFOTABLESTAXES_REL . 'ext_icon.gif',
	),
	'interface' => array(
		'showRecordFieldList' => 'title,tx_rate,category,starttime,endtime'
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
				'type' => 'input',+
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
		'title' => array (
			'exclude' => 0,
			'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_tax_rates.title',
			'config' => array (
				'type' => 'input',
				'size' => '40',
				'max' => '256'
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
		'category' => array(
			'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_tax_rates.category',
			'exclude' => '0',
			'config' => array(
				'autoSizeMax' => 45,
				'size' => 30,
				'minitems' => 0,
				'maxitems' => 100,
				'type' => 'select',
				'renderMode' => 'tree',
				'foreign_table' => 'static_tax_categories',
				'foreign_table_where' => $where . ' ORDER BY static_tax_categories.title',
				'MM' => 'static_tax_rates_mm_categories',
				'treeConfig' => array(
					'parentField' => 'parentid',
					'appearance' => array(
						'expandAll' => 0,
						'showHeader' => TRUE,
						'maxLevels' => 99,
					)
				),
				'exclude' => 1,
			)
		),
	),
	'types' => array(
		'0' => array(
			'showitem' => 'title;;7;;3-3-3,tx_rate;;;;3-3-3,category;;;;3-3-3, starttime, endtime'
		),
	),
);


return $result;
