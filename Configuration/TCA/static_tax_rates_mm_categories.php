<?php
defined('TYPO3') || die('Access denied.');

$extensionKey = 'static_info_tables_taxes';
$languageSubpath = '/Resources/Private/Language/';
$imagePath = 'EXT:' . $extensionKey . '/Resources/Public/Icons/';
$languageLglPath = 'LLL:EXT:lang/Resources/Private/Language/locallang_general.xlf:LGL.';

$result = [
    'ctrl' => [
        'title' => 'LLL:EXT:' . $extensionKey . $languageSubpath . 'locallang_db.xlf:static_tax_rates_mm_categories',
        'label' => 'title',
        'delete' => 'deleted',
        'enablecolumns' => [
            'disabled' => 'hidden',
            'starttime' => 'starttime',
            'endtime' => 'endtime',
        ],
        'prependAtCopy' => $languageLglPath . 'prependAtCopy',
        'iconfile' => $imagePath . 'Extension.gif',
        'hideTable' => true,
    ],
    'interface' => [
        'showRecordFieldList' => ''
    ],
    'columns' => [
        'uid_local' => [
            'label' => 'LLL:EXT:' . $extensionKey . $languageSubpath . 'locallang_db.xlf:static_tax_rates_mm_categories.uid_local',
            'config' => [
                'type' => 'select',
                'foreign_table' => 'static_tax_rates',
                'maxitems' => 1
            ]
        ],
        'uid_foreign' => [
            'label' => 'LLL:EXT:' . $extensionKey . $languageSubpath . 'locallang_db.xlf:static_tax_rates_mm_categories.uid_foreign',
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
