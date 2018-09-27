package com.ogc.standard.dto.req;

import java.util.List;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * 新增产品
 * @author: silver 
 * @since: 2018年9月27日 上午9:51:25 
 * @history:
 */
public class XN629010Req extends BaseReq {
    private static final long serialVersionUID = -6875342580769258538L;

    // 名称
    @NotBlank
    private String name;

    // 销售分类（0个人/1定向/2捐赠/3集体）
    @NotBlank
    private String sellType;

    // 产权方编号
    @NotBlank
    private String ownerId;

    // 产品分类
    @NotBlank
    private String categoryCode;

    // 列表图片
    @NotBlank
    private String listPic;

    // 详情banner图
    @NotBlank
    private String bannerPic;

    // 产地
    @NotBlank
    private String originPlace;

    // 学名
    @NotBlank
    private String scientificName;

    // 品种
    @NotBlank
    private String variety;

    // 级别
    @NotBlank
    private String rank;

    // 省
    @NotBlank
    private String province;

    // 市
    @NotBlank
    private String city;

    // 区
    @NotBlank
    private String area;

    // 镇
    @NotBlank
    private String town;

    // 募集开始时间
    private String raiseStartDatetime;

    // 募集结束时间
    private String raiseEndDatetime;

    // 募集总量
    private String raiseCount;

    // 产品规格列表
    @NotEmpty
    private List<XN629010ReqSpecs> productSpecsList;

    // 树木列表
    @NotEmpty
    private List<XN629010ReqTree> treeList;

    // 更新人
    @NotBlank
    private String updater;

    // 备注
    private String remark;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSellType() {
        return sellType;
    }

    public void setSellType(String sellType) {
        this.sellType = sellType;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }

    public String getCategoryCode() {
        return categoryCode;
    }

    public void setCategoryCode(String categoryCode) {
        this.categoryCode = categoryCode;
    }

    public String getListPic() {
        return listPic;
    }

    public void setListPic(String listPic) {
        this.listPic = listPic;
    }

    public String getBannerPic() {
        return bannerPic;
    }

    public void setBannerPic(String bannerPic) {
        this.bannerPic = bannerPic;
    }

    public String getRaiseStartDatetime() {
        return raiseStartDatetime;
    }

    public void setRaiseStartDatetime(String raiseStartDatetime) {
        this.raiseStartDatetime = raiseStartDatetime;
    }

    public String getRaiseEndDatetime() {
        return raiseEndDatetime;
    }

    public void setRaiseEndDatetime(String raiseEndDatetime) {
        this.raiseEndDatetime = raiseEndDatetime;
    }

    public String getRaiseCount() {
        return raiseCount;
    }

    public void setRaiseCount(String raiseCount) {
        this.raiseCount = raiseCount;
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

    public List<XN629010ReqSpecs> getProductSpecsList() {
        return productSpecsList;
    }

    public void setProductSpecsList(List<XN629010ReqSpecs> productSpecsList) {
        this.productSpecsList = productSpecsList;
    }

    public String getOriginPlace() {
        return originPlace;
    }

    public void setOriginPlace(String originPlace) {
        this.originPlace = originPlace;
    }

    public String getScientificName() {
        return scientificName;
    }

    public void setScientificName(String scientificName) {
        this.scientificName = scientificName;
    }

    public String getVariety() {
        return variety;
    }

    public void setVariety(String variety) {
        this.variety = variety;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town;
    }

    public List<XN629010ReqTree> getTreeList() {
        return treeList;
    }

    public void setTreeList(List<XN629010ReqTree> treeList) {
        this.treeList = treeList;
    }

}
