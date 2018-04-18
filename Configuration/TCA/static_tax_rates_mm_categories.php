<?php
if (!defined ('TYPO3_MODE')) {
    die ('Access denied.');
}


$result = array(
    'ctrl' => array(
        'title' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_tax_rates_mm_categories',
        'label' => 'title',
        'delete' => 'deleted',
        'enablecolumns' => Array (
            'disabled' => 'hidden',
            'starttime' => 'starttime',
            'endtime' => 'endtime',
        ),
        'prependAtCopy' => STATICINFOTABLESTAXES_LANGUAGE_LGL . 'prependAtCopy',
        'iconfile' => PATH_BE_STATICINFOTABLESTAXES_REL . 'ext_icon.gif',
        'hideTable' => TRUE,
    ),
    'interface' => array(
        'showRecordFieldList' => ''
    ),
    'columns' => array(
        'uid_local' => array(
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_tax_rates_mm_categories.uid_local',
            'config' => array(
                'type' => 'select',
                'foreign_table' => 'static_tax_rates',
                'maxitems' => 1
            )
        ),
        'uid_foreign' => array(
            'label' => 'LLL:EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/locallang_db.xml:static_tax_rates_mm_categories.uid_foreign',
            'config' => array(
                'type' => 'select',
                'foreign_table' => 'static_tax_categories',
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
