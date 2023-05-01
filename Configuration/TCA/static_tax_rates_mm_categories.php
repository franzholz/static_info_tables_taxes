<?php
defined('TYPO3') || die('Access denied.');

$result = [
    'ctrl' => [
        'title' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_tax_rates_mm_categories',
        'label' => 'title',
        'delete' => 'deleted',
        'enablecolumns' => [
            'disabled' => 'hidden',
            'starttime' => 'starttime',
            'endtime' => 'endtime',
        ],
        'prependAtCopy' => STATICINFOTABLESTAXES_LANGUAGE_LGL . 'prependAtCopy',
        'iconfile' => PATH_STATICINFOTABLESTAXES_ICON_TABLE_REL . 'Extension.gif',
        'hideTable' => true,
    ],
    'interface' => [
        'showRecordFieldList' => ''
    ],
    'columns' => [
        'uid_local' => [
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_tax_rates_mm_categories.uid_local',
            'config' => [
                'type' => 'select',
                'foreign_table' => 'static_tax_rates',
                'maxitems' => 1
            ]
        ],
        'uid_foreign' => [
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_tax_rates_mm_categories.uid_foreign',
            'config' => [
                'type' => 'select',
                'foreign_table' => 'static_tax_categories',
                'maxitems' => 5
            ]
        ],
        'sorting' => [
            'config' => [
                'type' => 'passthrough',
            ]
        ],
        'foreignsort' => [
            'config' => [
                'type' => 'passthrough',
            ]
        ],
    ],
    'types' => [
        '0' => [
            'showitem' => ''
        ]
    ],
];

return $result;
