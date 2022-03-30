<?php

namespace JambageCom\StaticInfoTablesTaxes\Api;

/***************************************************************
*  Copyright notice
*
*  (c) 2020 Franz Holzinger (franz@ttproducts.de)
*  All rights reserved
*
*  This script is part of the Typo3 project. The Typo3 project is
*  free software; you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation; either version 2 of the License, or
*  (at your option) any later version.
*
*  The GNU General Public License can be found at
*  http://www.gnu.org/copyleft/gpl.html.
*
*  This script is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*  GNU General Public License for more details.
*
*  This copyright notice MUST APPEAR in all copies of the script!
***************************************************************/
/**
* static info tables for taxes
* for the EU: see document
* http://ec.europa.eu/taxation_customs/resources/documents/taxation/vat/how_vat_works/rates/vat_rates_de.pdf
* https://ec.europa.eu/taxation_customs/sites/taxation/files/resources/documents/taxation/vat/how_vat_works/rates/vat_rates_en.pdf
* https://ec.europa.eu/taxation_customs/sites/taxation/files/resources/documents/taxation/vat/how_vat_works/rates/vat_rates_de.pdf

* @author  Franz Holzinger <franz@ttproducts.de>
* @package TYPO3
*/


class TaxApi {
    const EU_CATEGORY_DIGITAL_MEDIA = 304;
    const EU_CATEGORY_DIGITAL_MEDIA_EBOOK = 305;
    static public $initTaxInfoArray = [];
    static protected $countryCodeArray = [];
    static protected $subdivisionCodeArray = [];


    static public function init (
        $shopCountryCode = '',
        $shopSubdivisionCode = '',
        $shippingCountryCode = '',
        $shippingSubdivisionCode = '',
        $billingCountryCode = '',
        $billingSubdivisionCode = '',
        $whereArray = [],
        $taxRateArray = [],
        $taxTitleArray = []
    ) {
        static::$countryCodeArray = [];
        static::$subdivisionCodeArray = [];
        static::$initTaxInfoArray = [];
        $countryCode = '';
        $zoneCode = '';

        if ($shopCountryCode != '') {
            static::$countryCodeArray['shop'] = $shopCountryCode;
        }

        if ($shopSubdivisionCode != '') {
            static::$subdivisionCodeArray['shop'] = $shopSubdivisionCode;
        }

        if ($shippingCountryCode != '') {
            static::$countryCodeArray['shipping'] = $shippingCountryCode;
        }

        if ($shippingSubdivisionCode != '') {
            static::$subdivisionCodeArray['shipping'] = $shippingSubdivisionCode;
        }

        if ($billingCountryCode != '') {
            static::$countryCodeArray['billing'] = $billingCountryCode;
        }

        if ($billingSubdivisionCode != '') {
            static::$subdivisionCodeArray['billing'] = $billingSubdivisionCode;
        }

        if (static::$countryCodeArray['shipping'] != '') {
            $countryCode = static::$countryCodeArray['shipping'];
            if (static::$subdivisionCodeArray['shipping'] != '') {
                $zoneCode = static::$subdivisionCodeArray['shipping'];
            }
        } else if (static::$countryCodeArray['billing'] != '') {
            $countryCode = static::$countryCodeArray['billing'];
            if (static::$subdivisionCodeArray['billing'] != '') {
                $zoneCode = static::$subdivisionCodeArray['billing'];
            }
        }

        if (
            $countryCode != '' &&
            isset($whereArray) &&
            is_array($whereArray) &&
            isset($taxRateArray) &&
            is_array($taxRateArray)
        ) {
            foreach ($whereArray as $key => $whereClause) {

                if ($whereClause != '') {
                    $whereClause .= ' AND cn_iso_3=' .
                        $GLOBALS['TYPO3_DB']->fullQuoteStr(
                            $countryCode,
                            'static_countries'
                        );

                        // Apply EU Internal Market rules for under threshold sales and for Digital Services
                    $row = $GLOBALS['TYPO3_DB']->exec_SELECTgetSingleRow(
                        'cn_iso_3',
                        'static_countries',
                        $whereClause
                    );

                    if (
                        !empty($row) &&
                        $row['cn_iso_3'] == $countryCode &&
                        isset($taxRateArray[$key])
                    ) {
                        $row['country_code'] = $countryCode;
                        $row['country_zone'] = $zoneCode;
                        $row['tx_rate'] = $taxRateArray[$key];
                        if (
                            isset($taxTitleArray) &&
                            is_array($taxTitleArray)
                        ) {
                            $row['title'] = $taxTitleArray[$key];
                        }
                        static::$initTaxInfoArray[$countryCode][] = $row;
                        break;
                    }
                }
            }
        }
    }


    /**
    * Applying taxes to a given amount. You must call fetchCountryTaxes to get the tax array.
    *
    * @param	array		in: A 4-plet of applied taxes: ('tx_name_en', 'tx_rate',  'tx_priority')
    * 				out: 'tx_amount'
    * @param	double		An amount to which taxes should be applied
    * @param	integer		Number of digits for rounding.
    *                      0 ... if no rounding shall be done.
    *                     -1 ... if the rounding comes from the field currencyInfo['cu_decimal_digits']
    *                     of the parameter $staticInfoObj
    * @param	object		object of the class tx_staticinfotables_pi1. Only needed if you use the rounding.
    * @return	double		applied taxes amount
    */
    static public function applyConsumerTaxes (
        array &$taxArray,
        $amount,
        $decimalDigits = 0,
        $staticInfoObj = null
    ) {
        $taxArrayAmount = false;

            // Apply rates
        if(
            is_double($amount) &&
            count($taxArray) &&
            (
                $decimalDigits >= 0 ||
                (
                    $staticInfoObj instanceof \SJBR\StaticInfoTables\PiBaseApi
                )
            )
        ) {
            if ($decimalDigits = -1) {
                $decimalDigits = $staticInfoObj->currencyInfo['cu_decimal_digits'];
            }
            $priority = [];
            foreach ($taxArray as $key => $row) {
                $priority[$key] = $row['tx_priority'];
            }
            array_multisort($priority, SORT_ASC, $taxArray);
            $priority = $priority['0'];
            $taxArrayAmount = $amount;
            $baseAmount = $taxArrayAmount;

            foreach ($taxArray as $key => $row) {
                if ($row['tx_priority'] > $priority) {
                    $baseAmount = $taxArrayAmount;
                    $priority = $row['tx_priority'];
                }
                $taxedAmount = ($row['tx_rate'] / 100) * $baseAmount;
                if ($decimalDigits) {
                    $taxedAmount = round($taxedAmount, $decimalDigits);
                }
                $taxArray[$key]['tx_amount'] = $taxedAmount;
                $taxArrayAmount += $taxedAmount;
            }
        }

        return $taxArrayAmount;
    }


    static public function getCategoryRootline (
        array $categoryArray,
        $recursionLevel = 0
    ) {
        $result = [];
        $select_fields = 'uid,parentid';
        $from_table = 'static_tax_categories';
        $whereClause = 'uid IN (' . implode(',', $categoryArray) . ')';
        $enableClause =
            $GLOBALS['TSFE']->sys_page->enableFields($from_table);
        $whereClause .= $enableClause;

        $rowArray = $GLOBALS['TYPO3_DB']->exec_SELECTgetRows(
            $select_fields,
            $from_table,
            $whereClause
        );

        if (
            is_array($rowArray) &&
            !empty($rowArray)
        ) {
            foreach ($rowArray as $row) {
                $result[] = $row['uid'];
                if (!empty($row['parentid']) && $recursionLevel < 10) {
                    $parentArray =
                        static::getCategoryRootline(
                            array($row['parentid']),
                            $recursionLevel + 1
                        );
                    $result = array_merge($result, $parentArray);
                }
            }
        }

        if ($recursionLevel == 0) {
            $result = array_unique($result);
        }
        return $result;
    }


    /**
    * Fetch the taxes for a state and country
    *
    * @param	string		return: The ISO alpha-3 code of the country for which the tax is calculated
    * @param	string		return: The country subdivision code of the region for which the tax is calculated
    * @param	object		object of a static_info_tables class
    * @param	float		The tax rate to be used. Set it to zero (0.0) if the following parameters shall be used to determine the tax.
    * @param	array		array of the taxation categories of the product
    * @param	integer		The tax id of the tax rate to be used.
    *                      values: 0 .. 5  This will read only one tax.
    *                      -1 read in all taxes of one or two countries or of a country zone
    *                      This first country it the shop country, the second country
    *                      is the shipping or the billing country
    * @param	string		The ISO alpha-3 code of the country of the selling shop
    * @param	string		The country subdivision code of the region of the selling shop
    * @param	string		The ISO alpha-3 code of the country of the customer's shipping address
    * @param	string		The country subdivision code of the region of the customer shipping address
    * @param	string		The ISO alpha-3 code of the country of the customer's billing address
    * @param	boolean		Should be set if the shop has sales of goods beyond the regulatory threshold in the buyer's country (when both shop and buyer in EU)
    * @return	array		An array of country code of an array of 4-plets of applied taxes: ['cn_iso_3	', 'country_code', 'country_zone', 'tx_rate', 'title']
    */
    static public function fetchCountryTaxes (
        &$countryCode,
        &$zoneCode,
        $staticInfoObj,
        $tax = 0.0,
        array $categoryArray = [],
        $taxId = 1,
        $shopCountryCode = '',
        $shopSubdivisionCode = '',
        $shippingCountryCode = '',
        $shippingSubdivisionCode = '',
        $billingCountryCode = '',
        $billingSubdivisionCode = '',
        $EUThreshold = 0,
        $useInitTaxInfoArray = true
    ) {
        if (
            !is_object($staticInfoObj) ||
            (
                !($staticInfoObj instanceof \JambageCom\Div2007\Api\StaticInfoTablesApi) &&
                !($staticInfoObj instanceof \JambageCom\Div2007\Api\OldStaticInfoTablesApi) &&
                !($staticInfoObj instanceof \SJBR\StaticInfoTables\PiBaseApi)
            )
        ) {
            $errorDetail = '';
            if (is_object($staticInfoObj)) {
                $errorDetail = ' "' . get_class($staticInfoObj) . '" is no supported object.';
            } else {
                $errorDetail = ' "' . $staticInfoObj . '" is no object';
            }
            throw new \RuntimeException ('Parameter 3 of fetchCountryTaxes' . $errorDetail);
        }

        if (!is_numeric($tax)) {
            throw new \RuntimeException ('Parameter 4 of fetchCountryTaxes "' . $tax . '" is no float value in TAX API');
        }

        $tax = str_replace(',', '.', $tax);

        if (
            empty($shopCountryCode) &&
            !empty(static::$countryCodeArray['shop'])
        ) {
            $shopCountryCode = static::$countryCodeArray['shop'];
        }

        if (
            empty($shopSubdivisionCode) &&
            !empty(static::$subdivisionCodeArray['shop'])
        ) {
            $shopSubdivisionCode = static::$subdivisionCodeArray['shop'];
        }

        if (
            empty($shippingCountryCode) &&
            !empty(static::$countryCodeArray['shipping'])
        ) {
            $shippingCountryCode = static::$countryCodeArray['shipping'];
        }

        if (
            empty($shippingSubdivisionCode) &&
            !empty(static::$subdivisionCodeArray['shipping'])
        ) {
            $shippingSubdivisionCode = static::$subdivisionCodeArray['shipping'];
        }

        if (
            empty($billingCountryCode) &&
            !empty(static::$countryCodeArray['billing'])
        ) {
            $billingCountryCode = static::$countryCodeArray['billing'];
        }

        if (
            empty($billingSubdivisionCode) &&
            !empty(static::$subdivisionCodeArray['billing'])
        ) {
            $billingSubdivisionCode = static::$subdivisionCodeArray['billing'];
        }

        $shopCountryCode = (!empty($shopCountryCode) ? trim($shopCountryCode) : $staticInfoObj->defaultCountry);
        $billingCountryCode = (!empty($billingCountryCode) ? trim($billingCountryCode) : $shopCountryCode);
        $shippingCountryCode = (!empty($shippingCountryCode) ? trim($shippingCountryCode) : $billingCountryCode);
        $shopSubdivisionCode = trim($shopSubdivisionCode);
        $shippingSubdivisionCode = trim($shippingSubdivisionCode);

        $countryCode = $shippingCountryCode;
        $zoneCode = $shippingSubdivisionCode;

        if (
            !is_object($staticInfoObj) ||
            !is_array($categoryArray)
        ) {
            return false;
        }
        $taxArrayIndex = 0;
        $taxArray = [];

            // Not taxable!
        if (
            empty($tax) &&
            empty($categoryArray) &&
            empty($taxId) ||
            empty($shopCountryCode)
        ) {
            return $taxArray;
        }

        if (
            $useInitTaxInfoArray &&
            !empty(static::$initTaxInfoArray)
        ) {            
            return static::$initTaxInfoArray;
        }

        if (
            $taxId == -1
                ||
            // Get state or provincial taxes
            $shopCountryCode == $shippingCountryCode &&
            !empty($shopSubdivisionCode) &&
            !empty($shippingSubdivisionCode) &&
            $shopSubdivisionCode == $shippingSubdivisionCode
        ) {
            $countryCodeArray = [];
            $countryCodeArray[] = $shopCountryCode;
            if (
                $shopCountryCode != $shippingCountryCode
            ) {
                $countryCodeArray[] = $shippingCountryCode;
            }

            foreach ($countryCodeArray as $countryCode) {
                $local_table = 'static_taxes';
                $mm_table = 'static_taxes_mm_rates';
                $foreign_table = 'static_tax_rates';

                $whereClause =
                    'static_taxes.tx_country_iso_3=' .
                    $GLOBALS['TYPO3_DB']->fullQuoteStr(
                        $countryCode,
                        'static_taxes'
                    );

                if (!empty($shopSubdivisionCode)) {
                    if ($shopSubdivisionCode == $shippingSubdivisionCode) {
                        $whereClause .=
                            ' AND static_taxes.tx_zn_code=' .
                            $GLOBALS['TYPO3_DB']->fullQuoteStr(
                                $shopSubdivisionCode,
                                'static_taxes'
                            );
                    } else {
                        $whereClause .=
                        ' AND static_taxes.tx_zn_code IN (' .
                            $GLOBALS['TYPO3_DB']->fullQuoteStr(
                                $shopSubdivisionCode,
                                'static_taxes') .
                                ',' .
                                $GLOBALS['TYPO3_DB']->fullQuoteStr(
                                    $shippingSubdivisionCode,
                                    'static_taxes'
                                ) .
                            ')';
                    }
                }

                if ($tax > 0) {
                    $whereClause .=
                        ' AND static_tax_rates.tx_rate=' . $tax;
                } else if ($taxId > 0) {
                    $whereClause .=
                        ' AND static_taxes.tx_rate_id=' . intval($taxId);
                }

                $whereClause .=
                    $GLOBALS['TSFE']->sys_page->enableFields($local_table);
                $whereClause .=
                    $GLOBALS['TSFE']->sys_page->enableFields($foreign_table);
                $whereClause .=
                    $GLOBALS['TSFE']->sys_page->enableFields($mm_table);

                $fieldArray = [
                    $local_table . '.tx_name_en',
                    $local_table . '.tx_priority',
                    $foreign_table . '.uid',
                    $foreign_table . '.title',
                    $foreign_table . '.tx_rate'
                ];

                $select = implode(',', $fieldArray);

                // regional area taxation
                $taxArray[$countryCode] = $GLOBALS['TYPO3_DB']->exec_SELECTgetRows(
                    $select,
                    'static_taxes LEFT JOIN static_taxes_mm_rates ON static_taxes.uid = static_taxes_mm_rates.uid_local LEFT JOIN static_tax_rates
                    ON static_taxes_mm_rates.uid_foreign = static_tax_rates.uid',
                    $whereClause
                );
            } // foreach ($countryCodeArray as $countryCode)
        } else {
            $useCustomerCountry = false;
            $categoryLines = [];

            if (
                empty($tax) &&
                !empty($categoryArray)
            ) {
                $categoryLines = static::getCategoryRootline($categoryArray);
            }

            if (
                $shopCountryCode != $shippingCountryCode &&
                (
                    $EUThreshold ||
                    in_array(
                        static::EU_CATEGORY_DIGITAL_MEDIA,
                        $categoryLines
                    ) // check for a Digital Service category of the EU rules where the customer's country tax must be used
                )
            ) {
                $whereClause = 'cn_iso_3=' .
                    $GLOBALS['TYPO3_DB']->fullQuoteStr(
                        $shopCountryCode,
                        'static_countries'
                    );

                    // Apply EU Internal Market rules for under threshold sales and for Digital Services
                $row = $GLOBALS['TYPO3_DB']->exec_SELECTgetSingleRow(
                    'cn_eu_member',
                    'static_countries',
                    $whereClause
                );
                $useCustomerCountry = ($row['cn_eu_member'] > 0);
            }
            $countryCode = ($useCustomerCountry ? $shippingCountryCode : $shopCountryCode);
            $zoneCode = ($useCustomerCountry ? $shippingSubdivisionCode : $shopSubdivisionCode);

            $local_table = 'static_taxes';
            $mm_table = 'static_taxes_mm_rates';
            $foreign_table = 'static_tax_rates';
            $whereClause = ' AND ' . $local_table . '.tx_country_iso_3=' .
                $GLOBALS['TYPO3_DB']->fullQuoteStr($countryCode, $local_table) .
                ' AND tx_zn_code=' . $GLOBALS['TYPO3_DB']->fullQuoteStr($zoneCode, $local_table);

            if (!empty($tax)) {
                $whereClause .=
                    ' AND ' . $foreign_table . '.tx_rate=' . $GLOBALS['TYPO3_DB']->fullQuoteStr($tax, $foreign_table);
            } else if (
                empty($categoryArray) &&
                !empty($taxId) &&
                \TYPO3\CMS\Core\Utility\MathUtility::canBeInterpretedAsInteger($taxId)
            ) {
                $whereClause .= ' AND tx_rate_id=' . intval($taxId);
            }

            $whereClause .=
                $GLOBALS['TSFE']->sys_page->enableFields($local_table);
            $whereClause .=
                $GLOBALS['TSFE']->sys_page->enableFields($foreign_table);
            $whereClause .=
                $GLOBALS['TSFE']->sys_page->enableFields($mm_table);

            $config = $GLOBALS['TCA'][$local_table]['columns'];

            $fieldArray = [
                $local_table . '.tx_name_en',
                $local_table . '.tx_priority',
                $foreign_table . '.uid',
                $foreign_table . '.title',
                $foreign_table . '.tx_rate',
                $foreign_table . '.category'
            ];

            $select = implode(',', $fieldArray);

            $res = $GLOBALS['TYPO3_DB']->exec_SELECT_mm_query(
                $select,
                $local_table,
                $mm_table,
                $foreign_table,
                $whereClause
            );

            if (empty($categoryLines)) {
                while($row = $GLOBALS['TYPO3_DB']->sql_fetch_assoc($res)) {
                    $row['country_code'] = $countryCode;
                    $row['country_zone'] = $zoneCode;;
                    $taxArray[$countryCode][] = $row;
                    break;
                }
                $GLOBALS['TYPO3_DB']->sql_free_result($res);
            } else {
                $select = '*';
                $local_table = 'static_tax_rates';
                $mm_table = 'static_tax_rates_mm_categories';
                $foreign_table = 'static_tax_categories';

                $enableClause =
                    $GLOBALS['TSFE']->sys_page->enableFields($foreign_table);
                $enableClause .=
                    $GLOBALS['TSFE']->sys_page->enableFields($mm_table);
                $minimumTaxRate = false;
                $taxRow = [];

                while($row = $GLOBALS['TYPO3_DB']->sql_fetch_assoc($res)) {
                    $whereClause = ' AND ' . $mm_table . '.uid_local=' . $row['uid'] . $enableClause . ' AND ' . $mm_table .'.uid_foreign IN (' . implode(',',  $categoryLines) . ')';

                    $categoryRes = $GLOBALS['TYPO3_DB']->exec_SELECT_mm_query(
                        $select,
                        $local_table,
                        $mm_table,
                        $foreign_table,
                        $whereClause
                    );

                    while($categoryRow = $GLOBALS['TYPO3_DB']->sql_fetch_assoc($categoryRes)) {
                        if (
                            $minimumTaxRate === false ||
                            $categoryRow['tx_rate'] < $minimumTaxRate
                        ) {
                            $minimumTaxRate = $categoryRow['tx_rate'];
                            $taxRow = $row;
                            $taxRow['country_code'] = $countryCode;
                            $taxRow['country_zone'] = $zoneCode;;
                            $taxRow['category'] = $categoryRow['uid_foreign'];
                            $taxRow['category_title'] = $categoryRow['title'];
                        }
                    }
                }

                if (!empty($taxRow)) {
                    $taxArray[$countryCode][] = $taxRow;
                }

                $GLOBALS['TYPO3_DB']->sql_free_result($res);
            }
        }

        return $taxArray;
    }
}

