<?php
defined('TYPO3') || die('Access denied.');

call_user_func(function () {

    if (!defined ('STATIC_INFO_TABLES_TAXES_EXT')) {
        define('STATIC_INFO_TABLES_TAXES_EXT', 'static_info_tables_taxes');
    }

    if (!defined ('PATH_BE_STATICINFOTABLESTAXES')) {
        define('PATH_BE_STATICINFOTABLESTAXES', \TYPO3\CMS\Core\Utility\ExtensionManagementUtility::extPath(STATIC_INFO_TABLES_TAXES_EXT));
    }

    if (!defined ('PATH_STATICINFOTABLESTAXES_ICON_TABLE_REL')) {
        define('PATH_STATICINFOTABLESTAXES_ICON_TABLE_REL', 'EXT:' . STATIC_INFO_TABLES_TAXES_EXT . '/Resources/Public/Icons/');
    }

    // constants for the TCA fields

    // for a TCA 'label' => 'LLL:EXT:lang/Resources/Private/Language/locallang_general.xlf:LGL.starttime',

    if (!defined('STATICINFOTABLESTAXES_LANGUAGE_LGL')) {
        define('STATICINFOTABLESTAXES_LANGUAGE_LGL', 'LLL:EXT:lang/Resources/Private/Language/locallang_general.xlf:LGL.');
    }

    $GLOBALS['TYPO3_CONF_VARS']['EXTCONF'][STATIC_INFO_TABLES_TAXES_EXT]['tables']['static_taxes'] =
        [
            'label_fields' => [
                'tx_name_##', 'tx_name_en'
            ],
            'isocode_field' => [
                'tx_code', 'tx_country_iso_##', 'tx_zn_code'
            ]
        ];
});


