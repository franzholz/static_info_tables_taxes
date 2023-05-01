<?php
defined('TYPO3') || die('Access denied.');

$result = [
    'ctrl' => [
        'title' => 'LLL:EXT:'.STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_taxes',
        'label' => 'tx_name_en',
        'readOnly' => 1,
        'adminOnly' => 1,
        'rootLevel' => 1,
        'is_static' => 1,
        'default_sortby' => 'ORDER BY tx_country_iso_3',
        'delete' => 'deleted',
        'enablecolumns' => [
            'disabled' => 'hidden',
            'starttime' => 'starttime',
            'endtime' => 'endtime',
        ],
        'iconfile' => PATH_STATICINFOTABLESTAXES_ICON_TABLE_REL . 'Extension.gif',
    ],
    'interface' => [
        'showRecordFieldList' => 'tx_name_en,tx_code,tx_country_iso_2,tx_country_iso_3,tx_zn_code,tx_rate_uid,tx_priority,starttime,endtime'
    ],
    'columns' => [
        'starttime' => [
            'exclude' => 0,
            'label' => STATICINFOTABLESTAXES_LANGUAGE_LGL . 'starttime',
            'config' => [
                'type' => 'input',
                'size' => '8',
                'max' => '20',
                'eval' => 'date',
                'default' => '0',
                'checkbox' => '0'
            ]
        ],
        'endtime' => [
            'exclude' => 0,
            'label' => STATICINFOTABLESTAXES_LANGUAGE_LGL . 'endtime',
            'config' => [
                'type' => 'input',
                'size' => '8',
                'max' => '20',
                'eval' => 'date',
                'checkbox' => '0',
                'default' => '0',
                'range' => [
                    'upper' => mktime(0, 0, 0, 12, 31, 2040),
                    'lower' => mktime(0, 0, 0, date('m') - 1, date('d'), date('Y'))
                ]
            ]
        ],
        'tx_country_iso_2' => [
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_taxes.cn_iso_2',
            'exclude' => '0',
            'config' => [
                'type' => 'input',
                'size' => '3',
                'max' => '2',
                'eval' => '',
                'default' => ''
            ]
        ],
        'tx_country_iso_3' => [
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_taxes.cn_iso_3',
            'exclude' => '0',
            'config' => [
                'type' => 'input',
                'size' => '5',
                'max' => '3',
                'eval' => 'required,trim',
                'default' => ''
            ]
        ],
        'tx_zn_code' => [
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_taxes.zn_code',
            'exclude' => '0',
            'config' => [
                'type' => 'input',
                'size' => '18',
                'max' => '45',
                'eval' => 'trim',
                'default' => ''
            ]
        ],
        'tx_name_en' => [
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_taxes.tx_name_en',
            'exclude' => '0',
            'config' => [
                'type' => 'input',
                'size' => '30',
                'max' => '255',
                'eval' => 'trim',
                'default' => ''
            ]
        ],
        'tx_code' => [
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_taxes.tx_code',
            'exclude' => '0',
            'config' => [
                'type' => 'input',
                'size' => '5',
                'max' => '5',
                'eval' => 'trim',
                'default' => ''
            ]
        ],
        'tx_rate_id' => [
            'exclude' => 0,
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_taxes.tx_rate_id',
            'config' => [
                'type' => 'select',
                'items' => [
                    ['LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_taxes.tx_rate_id.I.0', '0'],
                    ['LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_taxes.tx_rate_id.I.1', '1'],
                    ['LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_taxes.tx_rate_id.I.2', '2'],
                    ['LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_taxes.tx_rate_id.I.3', '3'],
                    ['LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_taxes.tx_rate_id.I.4', '4'],
                    ['LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_taxes.tx_rate_id.I.5', '5'],
                ],
            ]
        ],
        'tx_rate_uid' => [
            'exclude' => 1,
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_taxes.tx_rate_uid',
            'config' => [
                'type' => 'inline',
                'appearance' => ['collapseAll' => true, 'newRecordLinkAddTitle' => false, 'useCombination' => true],
                'foreign_table' => 'static_taxes_mm_rates',
                'foreign_field' => 'uid_local',
                'foreign_sortby' => 'sorting',
                'foreign_label' => 'uid_foreign',
                'foreign_selector' => 'uid_foreign',
                'foreign_unique' => 'uid_foreign',
                'maxitems' => 1
            ],
        ],
        'tx_priority' => [
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_taxes.tx_priority',
            'exclude' => '0',
            'config' => [
                'type' => 'input',
                'size' => '3',
                'max' => '2',
                'eval' => 'int',
                'default' => '1'
            ]
        ]
    ],
    'types' => [
        '1' => [
            'showitem' => 'tx_name_en;;1;;2-2-2,--palette--;;3;;3-3-3,--palette--;;4;;3-3-3,--palette--;;5;;3-3-3'
        ],
        '2' => [
            'showitem' => 'tx_name_en;;1;;2-2-2,--palette--;;3;;3-3-3,--palette--;;2;;3-3-3'
        ],
    ],
    'palettes' => [
        '1' => [
            'showitem' => 'tx_country_iso_2,tx_country_iso_3',
            'canNotCollapse' => '1'
        ],
        '2' => [
            'showitem' => 'hidden,starttime,endtime',
            'canNotCollapse' => '1'
        ],
        '3' => [
            'showitem' => 'tx_code',
            'canNotCollapse' => '1'
        ],
        '4' => [
            'showitem' => 'tx_rate_id,tx_priority',
            'canNotCollapse' => '1'
        ],
        '5' => [
            'showitem' => 'tx_rate_uid',
            'canNotCollapse' => '1'
        ],
    ]
];

return $result;
