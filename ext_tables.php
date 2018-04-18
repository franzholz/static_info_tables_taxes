<?php
if (!defined ('TYPO3_MODE')) {
    die ('Access denied.');
}


$emClass = '\\TYPO3\\CMS\\Core\\Utility\\ExtensionManagementUtility';

call_user_func($emClass . '::addStaticFile', STATIC_INFO_TABLES_TAXES_EXT, 'Configuration/TypoScript/', 'Static Info Tables Taxes');

