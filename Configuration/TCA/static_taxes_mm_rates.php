<?php
defined('TYPO3') || die('Access denied.');

$result = array(
    'ctrl' => array(
        'title' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_taxes_mm_rates',
        'label' => 'title',
        'delete' => 'deleted',
        'prependAtCopy' => STATICINFOTABLESTAXES_LANGUAGE_LGL . 'prependAtCopy',
        'iconfile' => PATH_BE_STATICINFOTABLESTAXES_REL . 'ext_icon.gif',
        'hideTable' => true,
    ),
    'interface' => array(
        'showRecordFieldList' => ''
    ),
    'columns' => array(
        'uid_local' => array(
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_taxes_mm_rates.uid_local',
            'config' => array(
                'type' => 'select',
                'foreign_table' => 'static_taxes',
                'maxitems' => 1
            )
        ),
        'uid_foreign' => array(
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_taxes_mm_rates.uid_foreign',
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
    'types' => array(
        '0' => array(
            'showitem' => ''
        )
    ),
);


return $result;
