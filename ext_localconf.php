<?php
defined('TYPO3') || die('Access denied.');

call_user_func(function () {
    $GLOBALS['TYPO3_CONF_VARS']['EXTCONF']['static_info_tables_taxes']['tables']['static_taxes'] =
        [
            'label_fields' => [
                'tx_name_##', 'tx_name_en'
            ],
            'isocode_field' => [
                'tx_code', 'tx_country_iso_##', 'tx_zn_code'
            ]
        ];
});
