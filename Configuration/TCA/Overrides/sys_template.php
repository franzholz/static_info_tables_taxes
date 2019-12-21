<?php
defined('TYPO3_MODE') || die('Access denied.');

if (!defined ('STATIC_INFO_TABLES_TAXES_EXT')) {
    define('STATIC_INFO_TABLES_TAXES_EXT', 'static_info_tables_taxes');
}

\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addStaticFile(
    STATIC_INFO_TABLES_TAXES_EXT,
    'Configuration/TypoScript/',
    'Static Info Tables Taxes'
);

