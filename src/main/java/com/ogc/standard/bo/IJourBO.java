package com.ogc.standard.bo;

import java.math.BigDecimal;
import java.util.List;

import com.ogc.standard.bo.base.IPaginableBO;
import com.ogc.standard.domain.Account;
import com.ogc.standard.domain.Jour;
import com.ogc.standard.enums.EBoolean;
import com.ogc.standard.enums.EChannelType;

/**
 * @author: xieyj 
 * @since: 2016年12月23日 下午2:40:13 
 * @history:
 */
public interface IJourBO extends IPaginableBO<Jour> {

    // 不需要对账的新增
    public String addJourForHL(Account dbAccount, String bizType);

    // 余额流水新增
    public String addJour(Account dbAccount, EChannelType channelType,
            String channelOrder, String refNo, String bizType, String bizNote,
            BigDecimal transAmount);

    // 冻结流水新增
    public String addFrozenJour(Account dbAccount, EChannelType channelType,
            String channelOrder, String refNo, String bizType, String bizNote,
            BigDecimal transAmount);

    // 对账结果录入
    public void doCheckJour(Jour jour, EBoolean checkResult,
            BigDecimal checkAmount, String checkUser, String checkNote);

    // 当前流水，调整不通过。即账其实是平的
    public void adjustJourNO(Jour jour, String adjustUser, String adjustNote);

    public void adjustJourYES(Jour jour, String adjustUser, String adjustNote);

    public List<Jour> queryJourList(Jour condition);

    public Jour getJour(String code);

    public Jour getJourNotException(String code);

    public BigDecimal getTotalAmount(String bizType, String channelType,
            String accountNumber, String dateStart, String dateEnd);

    public BigDecimal getTotalAmount(Jour condition);
}
