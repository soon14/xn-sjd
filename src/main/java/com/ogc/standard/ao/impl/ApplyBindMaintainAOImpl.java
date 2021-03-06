package com.ogc.standard.ao.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ogc.standard.ao.IApplyBindMaintainAO;
import com.ogc.standard.bo.IApplyBindMaintainBO;
import com.ogc.standard.bo.base.Paginable;
import com.ogc.standard.domain.ApplyBindMaintain;
import com.ogc.standard.dto.req.XN629600Req;
import com.ogc.standard.dto.req.XN629601Req;
import com.ogc.standard.dto.req.XN629602Req;
import com.ogc.standard.enums.EApplyBindMaintainStatus;
import com.ogc.standard.enums.EBoolean;
import com.ogc.standard.exception.BizException;

@Service
public class ApplyBindMaintainAOImpl implements IApplyBindMaintainAO {

    @Autowired
    private IApplyBindMaintainBO applyBindMaintainBO;

    @Override
    public String addApplyBindMaintain(XN629600Req req) {
        ApplyBindMaintain data = new ApplyBindMaintain();
        data.setOwnerId(req.getOwnerId());
        data.setMaintainId(req.getMaintainId());
        data.setStatus(EApplyBindMaintainStatus.APPROVE.getCode());
        data.setUpdater(req.getUpdater());
        data.setUpdateDatetime(new Date());
        data.setRemark(req.getRemark());
        return applyBindMaintainBO.saveApplyBindMaintain(data);
    }

    @Override
    public boolean editApplyBindMaintain(XN629601Req req) {
        if (null != req
                && applyBindMaintainBO.isApplyBindMaintainExist(req.getCode())) {
            ApplyBindMaintain data = applyBindMaintainBO
                .getApplyBindMaintain(req.getCode());
            data.setMaintainId(req.getMaintainId());
            data.setUpdater(req.getUpdater());
            data.setRemark(req.getRemark());
            data.setStatus(EApplyBindMaintainStatus.APPROVE.getCode());
            data.setUpdateDatetime(new Date());
            applyBindMaintainBO.refreshApplyBindMaintain(data);
        } else {
            throw new BizException("xn0000", "记录编号不存在");
        }
        return true;
    }

    @Override
    public int dropApplyBindMaintain(String code) {
        if (!applyBindMaintainBO.isApplyBindMaintainExist(code)) {
            throw new BizException("xn0000", "记录编号不存在");
        }
        return applyBindMaintainBO.removeApplyBindMaintain(code);
    }

    @Override
    public Paginable<ApplyBindMaintain> queryApplyBindMaintainPage(int start,
            int limit, ApplyBindMaintain condition) {
        return applyBindMaintainBO.getPaginable(start, limit, condition);
    }

    @Override
    public List<ApplyBindMaintain> queryApplyBindMaintainList(
            ApplyBindMaintain condition) {
        return applyBindMaintainBO.queryApplyBindMaintainList(condition);
    }

    @Override
    public ApplyBindMaintain getApplyBindMaintain(String code) {
        return applyBindMaintainBO.getApplyBindMaintain(code);
    }

    @Override
    public void approveApplyBindMaintain(XN629602Req req) {
        ApplyBindMaintain data = applyBindMaintainBO.getApplyBindMaintain(req
            .getCode());
        if (EBoolean.YES.getCode().equals(req.getApproveResult())) {
            data.setStatus(EApplyBindMaintainStatus.BIND.getCode());
        } else {
            data.setStatus(EApplyBindMaintainStatus.NO_PASS.getCode());
        }
        data.setUpdater(req.getUpdater());
        data.setUpdateDatetime(new Date());
        data.setRemark(req.getRemark());
        applyBindMaintainBO.approveApplyBindMaintain(data);
    }
}
