<?php

/**
 *
 * @category   Inovarti
 * @package    Inovarti_GoogleAdwords
 * @author     Suporte <webmaster@inovarti.com>
 */
class Inovarti_GoogleAdwords_Helper_Data extends Mage_Core_Helper_Abstract {

    public function getOrderTotal() {
        $orderId = (int) Mage::getSingleton('checkout/session')->getLastOrderId();

        $resurce = Mage::getModel('sales/order')->getResource();
        $select = $resurce->getReadConnection()->select()
                ->from(array('o' => $resurce->getTable('sales/order')), 'subtotal')
                ->where('o.entity_id=?', $orderId)
        ;

        $result = $resurce->getReadConnection()->fetchRow($select);

        if ($result['subtotal'] > 0)
            return round($result['subtotal'], 2);
        else
            return 1;
    }

    public function isTrackingAllowed() {
        return Mage::getStoreConfigFlag('inovarti_googleadwords/googleadwords/enabled');
    }

}