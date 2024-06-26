<?php
defined('TYPO3') || die('Access denied.');

$where = '1=1';
$extensionKey = 'static_info_tables_taxes';
$languageFile = 'LLL:EXT:core/Resources/Private/Language/locallang_general.xlf:LGL.';
$languageSubpath = '/Resources/Private/Language/';
$imagePath = 'EXT:' . $extensionKey . '/Resources/Public/Icons/';

$result = [
    'ctrl' => [
        'label' => 'title',
        'readOnly' => 1,
        'adminOnly' => 1,
        'rootLevel' => 1,
        'is_static' => 1,
        'default_sortby' => 'ORDER BY title',
        'title' => 'LLL:EXT:' . $extensionKey . $languageSubpath . 'locallang_db.xlf:static_tax_categories',
        'iconfile' => $imagePath . 'Extension.gif',
        'default_sortby' => 'ORDER BY uid',
        'delete' => 'deleted',
        'enablecolumns' => [
            'disabled' => 'hidden',
            'starttime' => 'starttime',
            'endtime' => 'endtime',
        ],
        'iconfile' => $imagePath . 'Extension.gif',
    ],
    'interface' => [
        'showRecordFieldList' => 'title,parentid,starttime,endtime'
    ],
    'columns' => [
        'starttime' => [
            'exclude' => 1,
            'label' => $languageFile . 'starttime',
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
            'label' => $languageFile . 'endtime',
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
            'label' => 'LLL:EXT:' . $extensionKey . $languageSubpath . 'locallang_db.xlf:static_tax_categories.title',
            'config' => [
                'type' => 'input',
                'size' => '40',
                'max' => '256'
            ]
        ],
        'parentid' => [
            'exclude' => 1,
            'label' => 'LLL:EXT:' . $extensionKey . $languageSubpath . 'locallang_db.xlf:static_tax_categories.parentid',
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
            'showitem' => 'title, parentid, starttime, endtime'
        ],
    ],
];

return $result;
