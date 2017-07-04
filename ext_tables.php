<?php
if (!defined ('TYPO3_MODE')) {
    die ('Access denied.');
}


$emClass = '\\TYPO3\\CMS\\Core\\Utility\\ExtensionManagementUtility';

if (
    class_exists($emClass) &&
    method_exists($emClass, 'extPath')
) {
    // nothing
} else {
    $emClass = 't3lib_extMgm';
}


call_user_func($emClass . '::addStaticFile', STATIC_INFO_TABLES_TAXES_EXT, 'Configuration/TypoScript/', 'Static Info Tables Taxes');

