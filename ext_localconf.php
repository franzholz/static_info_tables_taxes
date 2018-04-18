<?php
if (!defined ('TYPO3_MODE')) {
    die ('Access denied.');
}

$emClass = '\\TYPO3\\CMS\\Core\\Utility\\ExtensionManagementUtility';

if (!defined ('STATIC_INFO_TABLES_TAXES_EXT')) {
    define('STATIC_INFO_TABLES_TAXES_EXT', $_EXTKEY);
}

if (!defined ('STATIC_INFO_TABLES_EXT')) {
    define('STATIC_INFO_TABLES_EXT', 'static_info_tables');
}

if (!defined ('PATH_BE_STATICINFOTABLESTAXES')) {
    define('PATH_BE_STATICINFOTABLESTAXES', call_user_func($emClass . '::extPath', $_EXTKEY));
}

if (!defined ('PATH_BE_STATICINFOTABLESTAXES_REL')) {
    define('PATH_BE_STATICINFOTABLESTAXES_REL', call_user_func($emClass . '::extRelPath', $_EXTKEY));
}

$GLOBALS['TYPO3_CONF_VARS']['EXTCONF'][$_EXTKEY]['tables']['static_taxes'] =
    array (
        'label_fields' => array (
            'tx_name_##', 'tx_name_en'
        ),
        'isocode_field' => array (
            'tx_code', 'tx_country_iso_##', 'tx_zn_code'
        )
    );

// constants for the TCA fields

if (version_compare(TYPO3_version, '8.0.0', '>=')) {
    // 'label' => 'LLL:EXT:lang/Resources/Private/Language/locallang_general.xlf:LGL.starttime',

    define('STATICINFOTABLESTAXES_LANGUAGE_LGL', 'LLL:EXT:lang/Resources/Private/Language/locallang_general.xlf:LGL.');
} else {
    // 'label' => 'LLL:EXT:lang/locallang_general.php:LGL.starttime',
    define('STATICINFOTABLESTAXES_LANGUAGE_LGL', 'LLL:EXT:lang/locallang_general.php:LGL.');
}


    
