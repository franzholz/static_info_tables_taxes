<?php

########################################################################
# Extension Manager/Repository config file for ext: "static_info_tables_taxes"
########################################################################

$EM_CONF[$_EXTKEY] = array(
    'title' => 'Static taxes.',
    'description' => 'Tables and functions used for dealing with taxes',
    'category' => 'misc',
    'author' => 'Franz Holzinger',
    'author_email' => 'franz@ttproducts.de',
    'shy' => '',
    'dependencies' => 'static_info_tables',
    'priority' => '',
    'module' => '',
    'state' => 'stable',
    'internal' => '',
    'uploadfolder' => 0,
    'createDirs' => '',
    'modify_tables' => '',
    'clearCacheOnLoad' => 0,
    'lockType' => '',
    'author_company' => '',
    'version' => '0.3.2',
    'constraints' => array(
        'depends' => array(
            'php' => '5.3.3-7.99.99',
            'typo3' => '6.2.0-8.99.99',
            'static_info_tables' => '6.0.7-6.99.99',
        ),
        'conflicts' => array(
            'static_info_tables' => '1.0.0-2.0.7',
        ),
        'suggests' => array(
        ),
    )
);

