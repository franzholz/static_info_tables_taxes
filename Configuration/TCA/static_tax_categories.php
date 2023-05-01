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
        'default_sortby' => 'ORDER BY title',
        'title' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_tax_categories',
        'iconfile' => PATH_STATICINFOTABLESTAXES_ICON_TABLE_REL . 'Extension.gif',
        'default_sortby' => 'ORDER BY uid',
        'delete' => 'deleted',
        'enablecolumns' => [
            'disabled' => 'hidden',
            'starttime' => 'starttime',
            'endtime' => 'endtime',
        ],
        'iconfile' => PATH_STATICINFOTABLESTAXES_ICON_TABLE_REL . 'Extension.gif',
    ],
    'interface' => [
        'showRecordFieldList' => 'title,parentid,starttime,endtime'
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
                    'lower' => mktime(0, 0, 0, date('m') - 1, date('d'), date('Y'))
                ]
            ]
        ],
        'title' => [
            'exclude' => 0,
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_tax_categories.title',
            'config' => [
                'type' => 'input',
                'size' => '40',
                'max' => '256'
            ]
        ],
        'parentid' => [
            'exclude' => 1,
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . DIV2007_LANGUAGE_SUBPATH . 'locallang_db.xlf:static_tax_categories.parentid',
            'config' => [
                'autoSizeMax' => 20,
                'minitems' => 0,
                'maxitems' => 1,
                'type' => 'select',
                'renderMode' => 'tree',
                'foreign_table' => 'static_tax_categories',
                'foreign_table_where' => $where . ' ORDER BY static_tax_categories.title',
                'treeConfig' => [
                    'parentField' => 'parentid',
                    'appearance' => [
                        'expandAll' => 0,
                        'showHeader' => true,
                        'maxLevels' => 99,
                        'width' => 450,
                    ]
                ],
                'exclude' => 1,
            ]
        ],
    ],
    'types' => [
        '0' => [
            'showitem' => 'title;;;;2-2-2,parentid;;;;3-3-3, starttime, endtime'
        ],
    ],
];

return $result;
