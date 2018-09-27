package com.ogc.standard.dto.req;

import org.hibernate.validator.constraints.NotBlank;

/**
 * 产品规格
 * @author: silver 
 * @since: 2018年9月27日 上午9:51:25 
 * @history:
 */
public class XN629011ReqSpecs extends BaseReq {
    private static final long serialVersionUID = -6875342580769258538L;

    // 规格名称
    @NotBlank
    private String name;

    // 认养价格
    @NotBlank
    private String price;

    // 认养年限
    @NotBlank
    private String year;

    // 认养开始时间
    @NotBlank
    private String startDatetime;

    // 认养结束时间
    @NotBlank
    private String endDatetime;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getStartDatetime() {
        return startDatetime;
    }

    public void setStartDatetime(String startDatetime) {
        this.startDatetime = startDatetime;
    }

    public String getEndDatetime() {
        return endDatetime;
    }

    public void setEndDatetime(String endDatetime) {
        this.endDatetime = endDatetime;
    }

}
