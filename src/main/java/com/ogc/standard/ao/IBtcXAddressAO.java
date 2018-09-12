/**
 * @Title IBtcXAddressAO.java 
 * @Package com.ogc.standard.ao 
 * @Description 
 * @author taojian  
 * @date 2018年9月11日 下午2:09:04 
 * @version V1.0   
 */
package com.ogc.standard.ao;

import com.ogc.standard.bo.base.Paginable;
import com.ogc.standard.domain.BtcXAddress;

/** 
 * @author: taojian 
 * @since: 2018年9月11日 下午2:09:04 
 * @history:
 */
public interface IBtcXAddressAO {
    public Paginable<BtcXAddress> queryBtcXAddressPage(int start, int limit,
            BtcXAddress condition);
}