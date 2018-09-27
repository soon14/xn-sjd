package com.ogc.standard.api.impl;

import com.ogc.standard.ao.IAdoptOrderAO;
import com.ogc.standard.api.AProcessor;
import com.ogc.standard.common.JsonUtil;
import com.ogc.standard.core.ObjValidater;
import com.ogc.standard.dto.req.XN629031Req;
import com.ogc.standard.exception.BizException;
import com.ogc.standard.exception.ParaException;
import com.ogc.standard.spring.SpringContextHolder;

/**
 * 取消认养订单
 * @author: jiafr 
 * @since: 2018年9月27日 上午11:40:14 
 * @history:
 */
public class XN629031 extends AProcessor {
    private IAdoptOrderAO adoptOrderAO = SpringContextHolder
        .getBean(IAdoptOrderAO.class);

    private XN629031Req req = null;

    @Override
    public Object doBusiness() throws BizException {
        adoptOrderAO.cancelAdoptOrder(req.getCode());
        return new Boolean(true);
    }

    @Override
    public void doCheck(String inputparams, String operator)
            throws ParaException {
        req = JsonUtil.json2Bean(inputparams, XN629031Req.class);
        ObjValidater.validateReq(req);
    }

}
