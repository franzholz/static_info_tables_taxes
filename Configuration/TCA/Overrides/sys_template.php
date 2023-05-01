<?php
defined('TYPO3') || die('Access denied.');

\TYPO3\CMS\Core\Utility\ExtensionManagementUtility::addStaticFile(
    'static_info_tables_taxes',
    'Configuration/TypoScript/',
    'Static Info Tables Taxes'
);

