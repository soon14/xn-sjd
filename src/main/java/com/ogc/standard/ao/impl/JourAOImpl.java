package com.ogc.standard.ao.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogc.standard.ao.IJourAO;
import com.ogc.standard.bo.IAccountBO;
import com.ogc.standard.bo.IJourBO;
import com.ogc.standard.bo.base.Paginable;
import com.ogc.standard.domain.Account;
import com.ogc.standard.domain.Jour;
import com.ogc.standard.enums.EBoolean;
import com.ogc.standard.enums.EJourStatus;
import com.ogc.standard.exception.BizException;

/** 
 * @author: xieyj 
 * @since: 2016年12月23日 下午9:16:58 
 * @history:
 */
@Service
public class JourAOImpl implements IJourAO {

    @Autowired
    private IJourBO jourBO;

    @Autowired
    private IAccountBO accountBO;

    /*
     * 人工调账： 1、判断流水账是否平，平则更改订单状态，不平则更改产生红冲蓝补订单，而后更改订单状态
     */
    @Override
    @Transactional
    public void checkJour(String code, BigDecimal checkAmount,
            String checkUser, String checkNote, String systemCode) {
        Jour jour = jourBO.getJourNotException(code);
        if (null != jour) {
            doCheckJourNow(code, checkAmount, checkUser, checkNote, jour);// 现在流水对账
        }
    }

    private void doCheckJourNow(String code, BigDecimal checkAmount,
            String checkUser, String checkNote, Jour jour) {
        if (!EJourStatus.todoCheck.getCode().equals(jour.getStatus())) {
            throw new BizException("xn000000", "该流水<" + code + ">不处于待对账状态");
        }
        if (checkAmount.compareTo(BigDecimal.ZERO) != 0) {
            Account account = accountBO.getAccount(jour.getAccountNumber());
            jourBO.doCheckJour(jour, EBoolean.NO, checkAmount, checkUser,
                checkNote);
        } else {
            jourBO.doCheckJour(jour, EBoolean.YES, checkAmount, checkUser,
                checkNote);
        }
    }

    @Override
    public Paginable<Jour> queryJourPage(int start, int limit, Jour condition) {
        String bizType = condition.getBizType();
        if (StringUtils.isNotBlank(bizType)) {
            String[] bizTypeArrs = bizType.split(",");
            List<String> bizTypeList = new ArrayList<String>();
            for (int i = 0; i < bizTypeArrs.length; i++) {
                bizTypeList.add(bizTypeArrs[i]);
            }
            condition.setBizType(null);
            condition.setBizTypeList(bizTypeList);
        }
        return jourBO.getPaginable(start, limit, condition);
    }

    @Override
    public List<Jour> queryJourList(Jour condition) {
        String bizType = condition.getBizType();
        if (StringUtils.isNotBlank(bizType)) {
            String[] bizTypeArrs = bizType.split(",");
            List<String> bizTypeList = new ArrayList<String>();
            for (int i = 0; i < bizTypeArrs.length; i++) {
                bizTypeList.add(bizTypeArrs[i]);
            }
            condition.setBizType(null);
            condition.setBizTypeList(bizTypeList);
        }
        List<Jour> jourList = jourBO.queryJourList(condition);
        List<Jour> result = new ArrayList<Jour>();
        result.addAll(jourList);
        return result;
    }

    @Override
    public Jour getJour(String code) {
        return jourBO.getJour(code);
    }

    @Override
    public BigDecimal getTotalAmount(String bizType, String channelType,
            String accountNumber, String dateStart, String dateEnd) {
        return jourBO.getTotalAmount(bizType, channelType, accountNumber,
            dateStart, dateEnd);
    }

    // @Override
    // public XN802901Res getTotalAmountByDate(String accountNumber,
    // String dateStart, String dateEnd) {
    // Jour condition = new Jour();
    // condition.setAccountNumber(accountNumber);
    // condition
    // .setCreateDatetimeStart(DateUtil.getFrontDate(dateStart, false));
    // condition.setCreateDatetimeEnd(DateUtil.getFrontDate(dateEnd, true));
    //
    // List<Jour> jourList = jourBO.queryJourList(condition);
    // BigDecimal incomeAmount = BigDecimal.ZERO;// 收入金额
    // BigDecimal withdrawAmount = BigDecimal.ZERO;// 取现金额
    // for (Jour jour : jourList) {
    // BigDecimal transAmount = jour.getTransAmount();
    // if (transAmount.compareTo(BigDecimal.ZERO) == 1
    // && !EJourBizTypeUser.AJ_WITHDRAW.getCode()
    // .equals(jour.getBizType())) {// 取现解冻排除
    // incomeAmount = incomeAmount.add(transAmount);
    // }
    // if (EJourBizTypeUser.AJ_WITHDRAW.getCode()
    // .equals(jour.getBizType())) {
    // withdrawAmount = withdrawAmount.add(transAmount);
    // }
    // }
    // return new XN802901Res(incomeAmount, withdrawAmount.negate());
    // }
}
