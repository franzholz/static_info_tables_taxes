<?php

$extensionPath = t3lib_extMgm::extPath('static_info_tables_taxes');
return array(
	'JambageCom\\StaticInfoTablesTaxes\\Api\\TaxApi' => $extensionPath . 'Classes/Api/TaxApi.php',
	'JambageCom\\StaticInfoTablesTaxes\\Api\\StaticInfoApi' => $extensionPath . 'Classes/Api/StaticInfoApi.php',
);

