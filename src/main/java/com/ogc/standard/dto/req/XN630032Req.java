package com.ogc.standard.dto.req;

import org.hibernate.validator.constraints.NotBlank;

/**
 * @author: xieyj 
 * @since: 2016年9月17日 下午4:09:03 
 * @history:
 */
public class XN630032Req {
    // 编号（必填）
    @NotBlank
    private String id;

    // value（必填）
    @NotBlank
    private String dvalue;

    // 修改人（必填）
    @NotBlank
    private String updater;

    // 备注（选填）
    private String remark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDvalue() {
        return dvalue;
    }

    public void setDvalue(String dvalue) {
        this.dvalue = dvalue;
    }

    public String getUpdater() {
        return updater;
    }

    public void setUpdater(String updater) {
        this.updater = updater;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}
