<?php
defined('TYPO3') || die('Access denied.');

$where = \TYPO3\CMS\Backend\Utility\BackendUtility::BEenableFields('static_tax_categories');

$result = [
    'ctrl' => [
        'label' => 'title',
        'readOnly' => 1,
        'adminOnly' => 1,
        'rootLevel' => 1,
        'is_static' => 1,
        'title' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_tax_rates',
        'iconfile' => PATH_BE_STATICINFOTABLESTAXES_REL . 'ext_icon.gif',
        'hideTable' => true,
        'default_sortby' => 'ORDER BY title',
        'delete' => 'deleted',
        'enablecolumns' => [
            'disabled' => 'hidden',
            'starttime' => 'starttime',
            'endtime' => 'endtime',
        ],
        'iconfile' => PATH_BE_STATICINFOTABLESTAXES_REL . 'ext_icon.gif',
    ],
    'interface' => [
        'showRecordFieldList' => 'title,tx_rate,category,starttime,endtime'
    ],
    'columns' => [
        'starttime' => [
            'exclude' => 1,
            'label' => STATICINFOTABLESTAXES_LANGUAGE_LGL . 'starttime',
            'config' => [
                'type' => 'input',
                'size' => '8',
                'max' => '20',
                'eval' => 'date',
                'checkbox' => '0',
                'default' => '0'
            ]
        ],
        'endtime' => [
            'exclude' => 1,
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
                    'lower' => mktime(0, 0, 0, date('m') - 1, date('d') , date('Y'))
                ]
            ]
        ],
        'title' => [
            'exclude' => 0,
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_tax_rates.title',
            'config' => [
                'type' => 'input',
                'size' => '40',
                'max' => '256'
            ]
        ],
        'tx_rate' => [
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_tax_rates.tx_rate',
            'exclude' => '0',
            'config' => [
                'type' => 'input',
                'size' => '12',
                'max' => '20',
                'eval' => 'required,trim,double',
                'default' => '0',
                'range' => [
                    'upper' => 1,
                    'lower' => 0
                ]
            ]
        ],
        'category' => [
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_tax_rates.category',
            'exclude' => '0',
            'config' => [
                'autoSizeMax' => 45,
                'size' => 30,
                'minitems' => 0,
                'maxitems' => 100,
                'type' => 'select',
                'renderMode' => 'tree',
                'foreign_table' => 'static_tax_categories',
                'foreign_table_where' => $where . ' ORDER BY static_tax_categories.title',
                'MM' => 'static_tax_rates_mm_categories',
                'treeConfig' => [
                    'parentField' => 'parentid',
                    'appearance' => [
                        'expandAll' => 0,
                        'showHeader' => true,
                        'maxLevels' => 99,
                    ]
                ],
                'exclude' => 1,
            ]
        ],
    ],
    'types' => [
        '0' => [
            'showitem' => 'title;;7;;3-3-3,tx_rate;;;;3-3-3,category;;;;3-3-3, starttime, endtime'
        ],
    ],
];

return $result;
