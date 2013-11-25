<?php

/**
 *
 * @category   Inovarti
 * @package    Inovarti_GoogleAdwords
 * @author     Suporte <webmaster@inovarti.com>
 */
class Inovarti_GoogleAdwords_Block_Block extends Mage_Core_Block_Abstract {

    public function __construct() {
        parent::__construct();
        $this->setGoogleConversionId(Mage::getStoreConfig('inovarti_googleadwords/googleadwords/google_conversion_id'));
        $this->setGoogleConversionLanguage(Mage::getStoreConfig('inovarti_googleadwords/googleadwords/google_conversion_language'));
        $this->setGoogleConversionFormat(Mage::getStoreConfig('inovarti_googleadwords/googleadwords/google_conversion_format'));
        $this->setGoogleConversionColor(Mage::getStoreConfig('inovarti_googleadwords/googleadwords/google_conversion_color'));
        $this->setGoogleConversionLabel(Mage::getStoreConfig('inovarti_googleadwords/googleadwords/google_conversion_label'));
    }
    protected function _toHtml() {
        $html = "";
        if (Mage::helper('inovarti_googleadwords')->isTrackingAllowed()) {
            $this->setAmount(Mage::helper('inovarti_googleadwords')->getOrderTotal());
            $html .= '
                    <script type="text/javascript">
                     /* < ![CDATA[ */
                    var google_conversion_id = '.$this->getGoogleConversionId().';
                    var google_conversion_language = "'.$this->getGoogleConversionLanguage().'";
                    var google_conversion_format = "'.$this->getGoogleConversionFormat().'";
                    var google_conversion_color = "'.$this->getGoogleConversionColor().'";
                    var google_conversion_label = "'.$this->getGoogleConversionLabel().'";
                    var google_conversion_value = 0;
                    if ('.$this->getAmount().') {
                        google_conversion_value = '.$this->getAmount().';
                    }
                    /* ]]> */
                    </script>
                    <script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script>

                    <noscript>
                        <div style="display:inline;">
                        <img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/' . $this->getGoogleConversionId() . '/?value=' . $this->getAmount() . '&amp;label=' . $this->getGoogleConversionLabel() . '&amp;guid=ON&amp;script=0"/>
                        </div>
                    </noscript>';

        }
        return $html;
    }

}
