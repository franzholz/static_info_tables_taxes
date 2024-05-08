<?php

########################################################################
# Extension Manager/Repository config file for ext: "static_info_tables_taxes"
########################################################################

$EM_CONF[$_EXTKEY] = [
    'title' => 'Static Taxes.',
    'description' => 'Tables and functions used for dealing with taxes',
    'category' => 'misc',
    'author' => 'Franz Holzinger',
    'author_email' => 'franz@ttproducts.de',
    'state' => 'stable',
    'clearCacheOnLoad' => 0,
    'author_company' => '',
    'version' => '0.7.1',
    'constraints' => [
        'depends' => [
            'typo3' => '10.4.0-12.4.99'
        ],
        'conflicts' => [
        ],
        'suggests' => [
            'typo3db_legacy' => '1.0.0-1.1.99',
        ],
    ]
];

