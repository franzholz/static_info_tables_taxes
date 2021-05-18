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
    'state' => 'stable',
    'uploadfolder' => 0,
    'createDirs' => '',
    'clearCacheOnLoad' => 0,
    'author_company' => '',
    'version' => '0.5.1',
    'constraints' => array(
        'depends' => array(
            'php' => '5.5.0-7.4.99',
            'typo3' => '6.2.0-10.4.99',
            'static_info_tables' => '6.0.7-6.99.99',
        ),
        'conflicts' => array(
        ),
        'suggests' => array(
            'typo3db_legacy' => '1.0.0-1.1.99',
        ),
    )
);

