package com.ogc.standard.domain;

import java.util.Date;

import com.ogc.standard.dao.base.ABaseDO;

/**
* 古树
* @author: silver 
* @since: 2018-09-26 16:40:01
* @history:
*/
public class Tree extends ABaseDO {

    private static final long serialVersionUID = 5051411391450658545L;

    // 编号
    private String code;

    // 产品编号
    private String productCode;

    // 产权方编号
    private String ownerId;

    // 树木编号
    private String treeNumber;

    // 树龄
    private Integer age;

    // 产地
    private String originPlace;

    // 学名
    private String scientificName;

    // 品种
    private String variety;

    // 级别
    private String rank;

    // 省
    private String province;

    // 市
    private String city;

    // 区
    private String area;

    // 镇
    private String town;

    // 经度
    private String longitude;

    // 维度
    private String latitude;

    // 实景图
    private String pic;

    // 状态（0待认养/1已认养）
    private String status;

    // 文章数
    private Integer articleCount;

    // 点赞数
    private Integer pointCount;

    // 收藏数
    private Integer collectionCount;

    // 认养次数
    private Integer adoptCount;

    // 更新人
    private String updater;

    // 更新时间
    private Date updateDatetime;

    // 备注
    private String remark;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getOwnerId() {
        return ownerId;
    }

    public void setOwnerId(String ownerId) {
        this.ownerId = ownerId;
    }

    public String getTreeNumber() {
        return treeNumber;
    }

    public void setTreeNumber(String treeNumber) {
        this.treeNumber = treeNumber;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
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

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getArticleCount() {
        return articleCount;
    }

    public void setArticleCount(Integer articleCount) {
        this.articleCount = articleCount;
    }

    public Integer getPointCount() {
        return pointCount;
    }

    public void setPointCount(Integer pointCount) {
        this.pointCount = pointCount;
    }

    public Integer getCollectionCount() {
        return collectionCount;
    }

    public void setCollectionCount(Integer collectionCount) {
        this.collectionCount = collectionCount;
    }

    public Integer getAdoptCount() {
        return adoptCount;
    }

    public void setAdoptCount(Integer adoptCount) {
        this.adoptCount = adoptCount;
    }

    public String getUpdater() {
        return updater;
    }

    public void setUpdater(String updater) {
        this.updater = updater;
    }

    public Date getUpdateDatetime() {
        return updateDatetime;
    }

    public void setUpdateDatetime(Date updateDatetime) {
        this.updateDatetime = updateDatetime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

}
