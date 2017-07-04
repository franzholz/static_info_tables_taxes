<?php
/***************************************************************
*  Copyright notice
*
*  (c) 2004-2015 Stanislas Rolland <stanislas.rolland(arobas)sjbr.ca>
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
 *
 * $Id$
 *
 * @author	Stanislas Rolland <stanislas.rolland(arobas)sjbr.ca>
 * @package TYPO3
 */


 class tx_staticinfotablestaxes_div {

	/**
	 * Applying taxes to a given amount. You must call fetchCountryTaxes to get the tax array.
	 *
	 * @param	object		object of the class tx_staticinfotables_pi1
	 * @param	float		An amount to which taxes should be applied
	 * @param	array		in: A 4-plet of applied taxes: ('tx_name','tx_rate', 'tx_priority')
	 * 				out: 'tx_amount'
	 * @return	float		applied taxes amount
	 */
	public function applyConsumerTaxes (
		$staticInfoObj,
		$amount,
		&$taxArray
	) {
			// Apply rates
		if( count($taxArray) ) {
			$priority = array();
			foreach ($taxArray as $key => $row) {
				$priority[$key] = $row['tx_priority'];
			}
			array_multisort($priority, SORT_ASC, $taxArray);
			$priority = $priority['0'];
			$taxArrayAmount = $amount;
			$baseAmount = $taxArrayAmount;
			foreach ($taxArray as $key => $row) {
				if( $row['tx_priority'] > $priority ) {
					$baseAmount = $taxArrayAmount;
					$priority = $row['tx_priority'];
				}
				$taxedAmount = $row['tx_rate']*$baseAmount;
				$taxArray[$key]['tx_amount'] =
					round($taxedAmount, ceil(0 - log10($taxedAmount)) + $staticInfoObj->currencyInfo['cu_decimal_digits']);
				$taxArrayAmount += $taxArray[$key]['tx_amount'];
			}
		}
		return $taxArrayAmount;
	}

	/**
	 * Fetch the taxes for a state and country
	 *
	 * @param	object		object of the class tx_staticinfotables_pi1
	 * @param	integer		The class of taxation of the product
	 * @param	integer		The tax id of the tax rate to be used
	 * @param	string		The ISO alpha-3 code of the country of the selling shop
	 * @param	string		The country subdivision code of the region of the selling shop
	 * @param	string		The ISO alpha-3 code of the country of the buying consumer
	 * @param	string		The country subdivision code of the region of the buying consumer
	 * @param	boolean		Should be set if the shop has sales of goods beyond the regulatory threshold in the buyer's country (when both shop and buyer in EU)
	 * @param	float		out: applied taxes amount
	 * @return	array		An array of 4-plets of applied taxes: ('tx_name','tx_rate','tx_priority')
	 */
	public function fetchCountryTaxes (
		$staticInfoObj,
		$taxClass = 3,
		$taxId = 1,
		$shopCountryCode,
		$shopCountrySubdivisionCode,
		$buyerCountryCode,
		$buyerCountrySubdivisionCode,
		$EUThreshold = 0
	) {
		if (!is_object($staticInfoObj)) {
			return array('error');
		}
		$taxArrayIndex = 0;
		$taxArray = array();
		$shopCountryCode = ($shopCountryCode) ? $shopCountryCode : $staticInfoObj->defaultCountry;
		$buyerCountryCode = ($buyerCountryCode) ? $buyerCountryCode : $staticInfoObj->defaultCountry;

			// Not taxable!
		if (!$taxClass || !trim($shopCountryCode) || !trim($buyerCountryCode)) {
			return $taxArray;
		}

			// Get national taxes
		if (trim($shopCountryCode) == trim($buyerCountryCode)) {
			if ($taxClass != '3') {
				$class3Where = ' OR tx_class=\'3\'';
			}
			$where = 'mm1.uid_local = mm2.uid_local AND mm1.uid_foreign = mm2.uid_foreign' .
				' AND tx_country_iso_3=' . $GLOBALS['TYPO3_DB']->fullQuoteStr(trim($shopCountryCode), 'static_taxes') .
				' AND tx_scope="1"' .
				' AND (tx_class=' . $GLOBALS['TYPO3_DB']->fullQuoteStr($taxClass, 'static_taxes') . $class3Where . ')' .
				' AND tx_rate_id=' . $GLOBALS['TYPO3_DB']->fullQuoteStr($taxId, 'static_taxes') .
				$GLOBALS['TSFE']->sys_page->enableFields('static_taxes') .
				' AND mm1.deleted=0' .
				$GLOBALS['TSFE']->sys_page->enableFields('static_tax_rates');
			$res = $GLOBALS['TYPO3_DB']->exec_SELECTquery(
				'*',
				'static_taxes LEFT JOIN static_taxes_mm_tax_rates mm1 ON static_taxes.uid = mm1.uid_local, static_taxes_mm_tax_rates mm2 LEFT JOIN static_tax_rates ON mm2.uid_foreign = static_tax_rates.uid',
				$where
			);

			while($row = $GLOBALS['TYPO3_DB']->sql_fetch_assoc($res)) {
				$taxArray[$taxArrayIndex] = array();
				$taxTitle = $staticInfoObj->getStaticInfoName('TAXES', $row['tx_code'], trim($shopCountryCode));
				$taxArray[$taxArrayIndex] = $row;
				$taxArray[$taxArrayIndex]['tx_name'] = $taxTitle;
				$taxArrayIndex++;
			}

			$GLOBALS['TYPO3_DB']->sql_free_result($res);

	 			// Get state or provincial taxes
			if (
				trim($shopCountrySubdivisionCode) &&
				trim($buyerCountrySubdivisionCode) &&
				trim($shopCountrySubdivisionCode) == trim($buyerCountrySubdivisionCode)
			) {
				$res = $GLOBALS['TYPO3_DB']->exec_SELECTquery(
					'*',
					'static_taxes LEFT JOIN static_taxes_mm_tax_rates mm1 ON static_taxes.uid = mm1.uid_local, static_taxes_mm_tax_rates mm2 LEFT JOIN static_tax_rates ON mm2.uid_foreign = static_tax_rates.uid',
					'mm1.uid_local = mm2.uid_local AND mm1.uid_foreign = mm2.uid_foreign'.
						' AND tx_country_iso_3=' . $GLOBALS['TYPO3_DB']->fullQuoteStr(trim($shopCountryCode), 'static_taxes') .
						' AND tx_zn_code=' . $GLOBALS['TYPO3_DB']->fullQuoteStr(trim($shopCountrySubdivisionCode), 'static_taxes') .
						' AND tx_scope="2"' .
						' AND (tx_class=' . $GLOBALS['TYPO3_DB']->fullQuoteStr($taxClass,'static_taxes') . ' OR tx_class="3")' .
						' AND tx_rate_id=' . $GLOBALS['TYPO3_DB']->fullQuoteStr($taxId,'static_taxes') .
						$GLOBALS['TSFE']->sys_page->enableFields('static_taxes') .
						' AND mm1.deleted=0' .
						$GLOBALS['TSFE']->sys_page->enableFields('static_tax_rates')
				);
				if ($res !== FALSE)	{
					while($row = $GLOBALS['TYPO3_DB']->sql_fetch_assoc($res)) {

						$taxArray[$taxArrayIndex] = array();
						$taxTitle =
							$staticInfoObj->getStaticInfoName(
								'SUBTAXES',
								$row['tx_code'],
								trim($shopCountryCode),
								trim($shopCountrySubdivisionCode)
							);
						$taxArray[$taxArrayIndex] = $row;
						$taxArray[$taxArrayIndex]['tx_name'] = $taxTitle;
						$taxArrayIndex++;
					}
					$GLOBALS['TYPO3_DB']->sql_free_result($res);
				}
			}
		} else	{
			$where = 'cn_iso_3=' . $GLOBALS['TYPO3_DB']->fullQuoteStr(trim($shopCountryCode), 'static_countries');

	 			// Apply EU Internal Market rules for under threshold sales
			$res = $GLOBALS['TYPO3_DB']->exec_SELECTquery(
				'cn_eu_member',
				'static_countries',
				$where
			);

			if ($res !== FALSE)	{
				$row = $GLOBALS['TYPO3_DB']->sql_fetch_assoc($res);
				$GLOBALS['TYPO3_DB']->sql_free_result($res);
				$shop_cn_eu_member = $row['cn_eu_member'];
			}

			if ($shop_cn_eu_member) {
				$res = $GLOBALS['TYPO3_DB']->exec_SELECTquery(
					'cn_eu_member',
					'static_countries',
					'cn_iso_3=' . $GLOBALS['TYPO3_DB']->fullQuoteStr(trim($buyerCountryCode), 'static_countries')
				);
				$row = $GLOBALS['TYPO3_DB']->sql_fetch_assoc($res);

				$GLOBALS['TYPO3_DB']->sql_free_result($res);
				$buyer_cn_eu_member = $row['cn_eu_member'];
				if ($buyer_cn_eu_member) {
							// Here we apply the rules of the European Union Internal Market
					$taxCountryCode = trim($shopCountryCode);
					if ($taxClass == '1' && $EUThreshold) {
						$taxCountryCode = trim($buyerCountryCode);
					}
					$res = $GLOBALS['TYPO3_DB']->exec_SELECTquery(
						'*',
						'static_taxes LEFT JOIN static_taxes_mm_tax_rates mm1 ON static_taxes.uid = mm1.uid_local, static_taxes_mm_tax_rates mm2 LEFT JOIN static_tax_rates ON mm2.uid_foreign = static_tax_rates.uid',
						'mm1.uid_local = mm2.uid_local AND mm1.uid_foreign = mm2.uid_foreign' .
							' AND tx_country_iso_3=' . $GLOBALS['TYPO3_DB']->fullQuoteStr($taxCountryCode,'static_taxes') .
							' AND tx_scope="1"' .
							' AND (tx_class=' . $GLOBALS['TYPO3_DB']->fullQuoteStr($taxClass,'static_taxes') . ' OR tx_class="3")'.
							' AND tx_rate_id=' . $GLOBALS['TYPO3_DB']->fullQuoteStr($taxId,'static_taxes') .
							$GLOBALS['TSFE']->sys_page->enableFields('static_taxes') .
							' AND mm1.deleted=0' .
							$GLOBALS['TSFE']->sys_page->enableFields('static_tax_rates')
					);

					if ($res !== FALSE) {
						while($row = $GLOBALS['TYPO3_DB']->sql_fetch_assoc($res)) {

							$taxArray[$taxArrayIndex] = array();
							$taxArray[$taxArrayIndex] = $row;
							$taxArray[$taxArrayIndex]['tx_name'] =  $staticInfoObj->getStaticInfoName('TAXES', $row['tx_code'], trim($shopCountryCode));
							$taxArrayIndex++;
						}
						$GLOBALS['TYPO3_DB']->sql_free_result($res);
					}
				}
			}
		}

		return $taxArray;
	}
}


if (defined('TYPO3_MODE') && $GLOBALS['TYPO3_CONF_VARS'][TYPO3_MODE]['XCLASS']['ext/static_info_tables_taxes/class.tx_staticinfotablestaxes_div.php'])    {
	include_once($GLOBALS['TYPO3_CONF_VARS'][TYPO3_MODE]['XCLASS']['ext/static_info_tables_taxes/class.tx_staticinfotablestaxes_div.php']);
}

?>