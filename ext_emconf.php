<?php

########################################################################
# Extension Manager/Repository config file for ext: "static_info_tables_taxes"
########################################################################

$EM_CONF[$_EXTKEY] = [
    'title' => 'Static taxes.',
    'description' => 'Tables and functions used for dealing with taxes',
    'category' => 'misc',
    'author' => 'Franz Holzinger',
    'author_email' => 'franz@ttproducts.de',
    'state' => 'stable',
    'uploadfolder' => 0,
    'createDirs' => '',
    'clearCacheOnLoad' => 0,
    'author_company' => '',
    'version' => '0.6.0',
    'constraints' => [
        'depends' => [
            'typo3' => '10.4.0-11.5.99',
            'static_info_tables' => '6.7.3-11.5.99',
        ],
        'conflicts' => [
        ],
        'suggests' => [
            'typo3db_legacy' => '1.0.0-1.1.99',
        ],
    ]
];

