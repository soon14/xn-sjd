package com.ogc.standard.domain;

import com.ogc.standard.dao.base.ABaseDO;

/**
* 公司
* @author: jiafr 
* @since: 2018-09-26 16:28:25
* @history:
*/
public class Company extends ABaseDO {

	private static final long serialVersionUID = 1L;

	// 编号
	private String code;

	// 用户编号
	private String userId;

	// 公司名称
	private String name;

	// 负责人
	private String charger;

	// 联系方式
	private String chargeMobile;

	// 地址
	private String address;

	// 简介
	private String description;

	// 营业执照
	private String bussinessLicense;

	// 组织机构代码
	private String organizationCode;

	// 证书模板
	private String certificateTemplate;

	// 合同模板
	private String contractTemplate;

	// 创建时间
	private String createDatetime;

	// 更新人
	private String updater;

	// 更新时间
	private String updateDatetime;

	// 备注
	private String remark;

	public void setCode(String code) {
		this.code = code;
	}

	public String getCode() {
		return code;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserId() {
		return userId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setCharger(String charger) {
		this.charger = charger;
	}

	public String getCharger() {
		return charger;
	}

	public void setChargeMobile(String chargeMobile) {
		this.chargeMobile = chargeMobile;
	}

	public String getChargeMobile() {
		return chargeMobile;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress() {
		return address;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}

	public void setBussinessLicense(String bussinessLicense) {
		this.bussinessLicense = bussinessLicense;
	}

	public String getBussinessLicense() {
		return bussinessLicense;
	}

	public void setOrganizationCode(String organizationCode) {
		this.organizationCode = organizationCode;
	}

	public String getOrganizationCode() {
		return organizationCode;
	}

	public void setCertificateTemplate(String certificateTemplate) {
		this.certificateTemplate = certificateTemplate;
	}

	public String getCertificateTemplate() {
		return certificateTemplate;
	}

	public void setContractTemplate(String contractTemplate) {
		this.contractTemplate = contractTemplate;
	}

	public String getContractTemplate() {
		return contractTemplate;
	}

	public void setCreateDatetime(String createDatetime) {
		this.createDatetime = createDatetime;
	}

	public String getCreateDatetime() {
		return createDatetime;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdateDatetime(String updateDatetime) {
		this.updateDatetime = updateDatetime;
	}

	public String getUpdateDatetime() {
		return updateDatetime;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getRemark() {
		return remark;
	}

}