package com.ogc.standard.ao.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ogc.standard.ao.IProductAO;
import com.ogc.standard.bo.ICategoryBO;
import com.ogc.standard.bo.IProductBO;
import com.ogc.standard.bo.IProductSpecsBO;
import com.ogc.standard.bo.ITreeBO;
import com.ogc.standard.bo.base.Paginable;
import com.ogc.standard.common.DateUtil;
import com.ogc.standard.core.OrderNoGenerater;
import com.ogc.standard.core.StringValidater;
import com.ogc.standard.domain.Category;
import com.ogc.standard.domain.Product;
import com.ogc.standard.domain.ProductSpecs;
import com.ogc.standard.domain.Tree;
import com.ogc.standard.dto.req.XN629010Req;
import com.ogc.standard.dto.req.XN629010ReqSpecs;
import com.ogc.standard.dto.req.XN629010ReqTree;
import com.ogc.standard.dto.req.XN629011Req;
import com.ogc.standard.enums.EBoolean;
import com.ogc.standard.enums.ECategoryStatus;
import com.ogc.standard.enums.EGeneratePrefix;
import com.ogc.standard.enums.EProductStatus;
import com.ogc.standard.enums.ESellType;
import com.ogc.standard.exception.BizException;

@Service
public class ProductAOImpl implements IProductAO {

    @Autowired
    private IProductBO productBO;

    @Autowired
    private ICategoryBO categoryBO;

    @Autowired
    private IProductSpecsBO productSpecsBO;

    @Autowired
    private ITreeBO treeBO;

    @Override
    @Transactional
    public String addProduct(XN629010Req req) {
        Category category = categoryBO.getCategory(req.getCategoryCode());
        if (ECategoryStatus.PUT_OFF.getCode().equals(category.getStatus())) {
            throw new BizException("xn0000", "产品分类已下架，请重新选择！");
        }

        Product data = new Product();
        String code = OrderNoGenerater
            .generate(EGeneratePrefix.Product.getCode());
        data.setCode(code);
        data.setName(req.getName());
        data.setSellType(req.getSellType());
        data.setCategoryCode(req.getCategoryCode());
        data.setOwnerId(req.getOwnerId());

        data.setListPic(req.getListPic());
        data.setBannerPic(req.getBannerPic());
        data.setOriginPlace(req.getOriginPlace());
        data.setScientificName(req.getScientificName());
        data.setVariety(req.getVariety());

        data.setRank(req.getRank());
        data.setProvince(req.getProvince());
        data.setCity(req.getCity());
        data.setArea(req.getArea());
        data.setTown(req.getTown());

        data.setRaiseStartDatetime(DateUtil.strToDate(
            req.getRaiseStartDatetime(), DateUtil.FRONT_DATE_FORMAT_STRING));
        data.setRaiseEndDatetime(DateUtil.strToDate(req.getRaiseEndDatetime(),
            DateUtil.FRONT_DATE_FORMAT_STRING));
        data.setRaiseCount(StringValidater.toInteger(req.getRaiseCount()));
        data.setStatus(EProductStatus.DRAFT.getCode());
        data.setUpdater(req.getUpdater());
        data.setUpdateDatetime(new Date());

        productBO.saveProduct(data);

        // 添加产品规格
        for (XN629010ReqSpecs productSpecs : req.getProductSpecsList()) {
            productSpecsBO.saveProductSpecs(code, productSpecs);
        }

        // 添加古树
        for (XN629010ReqTree tree : req.getTreeList()) {
            // 判断重复的树
            if (treeBO.isTreeNumberExist(tree.getTreeNumber())) {
                throw new BizException("xn0000", "树木编号已存在，请重新输入！");
            }

            treeBO.saveTree(data, tree);
        }

        return code;
    }

    @Override
    @Transactional
    public void editProduct(XN629011Req req) {
        Category category = categoryBO.getCategory(req.getCategoryCode());
        if (ECategoryStatus.PUT_OFF.getCode().equals(category.getStatus())) {
            throw new BizException("xn0000", "产品分类已下架，请重新选择！");
        }

        Product product = productBO.getProduct(req.getCode());
        // 未提交和已下架后可修改
        if (!EProductStatus.DRAFT.getCode().equals(product.getStatus())
                && !EProductStatus.PUTOFFED.getCode()
                    .equals(product.getStatus())) {
            throw new BizException("xn0000", "产品未处于可修改状态！");
        }

        Product data = new Product();
        data.setCode(req.getCode());
        data.setName(req.getName());
        data.setSellType(req.getSellType());
        data.setCategoryCode(req.getCategoryCode());
        data.setOwnerId(req.getOwnerId());

        data.setListPic(req.getListPic());
        data.setBannerPic(req.getBannerPic());
        data.setOriginPlace(req.getOriginPlace());
        data.setScientificName(req.getScientificName());
        data.setVariety(req.getVariety());

        data.setRank(req.getRank());
        data.setProvince(req.getProvince());
        data.setCity(req.getCity());
        data.setArea(req.getArea());
        data.setTown(req.getTown());

        data.setRaiseStartDatetime(DateUtil.strToDate(
            req.getRaiseStartDatetime(), DateUtil.FRONT_DATE_FORMAT_STRING));
        data.setRaiseEndDatetime(DateUtil.strToDate(req.getRaiseEndDatetime(),
            DateUtil.FRONT_DATE_FORMAT_STRING));
        data.setRaiseCount(StringValidater.toInteger(req.getRaiseCount()));

        data.setUpdater(req.getUpdater());
        data.setUpdateDatetime(new Date());
        productBO.refreshProduct(data);

        // 删除旧产品规格
        productSpecsBO.removeProductSpecsByProduct(req.getCode());

        // 添加新产品规格
        for (XN629010ReqSpecs productSpecs : req.getProductSpecsList()) {
            productSpecsBO.saveProductSpecs(req.getCode(), productSpecs);
        }

        // 删除旧古树
        treeBO.removeTreeByProduct(req.getCode());

        // 添加新古树
        for (XN629010ReqTree tree : req.getTreeList()) {
            // 判断重复的树
            if (treeBO.isTreeNumberExist(tree.getTreeNumber())) {
                throw new BizException("xn0000", "树木编号已存在，请重新输入！");
            }

            treeBO.saveTree(data, tree);
        }
    }

    @Override
    public void submitProduct(String code, String updater, String remark) {
        Product product = productBO.getProduct(code);

        if (!EProductStatus.DRAFT.getCode().equals(product.getStatus())) {
            throw new BizException("xn0000", "产品未处于可提交状态！");
        }

        productBO.refreshSubmitProduct(code, updater, remark);
    }

    @Override
    public void approveProduct(String code, String approveResult,
            String updater, String remark) {
        Product product = productBO.getProduct(code);

        if (!EProductStatus.TO_APPROVE.getCode().equals(product.getStatus())) {
            throw new BizException("xn0000", "产品未处于可审核状态！");
        }

        String status = null;
        if (EBoolean.YES.getCode().equals(approveResult)) {
            status = EProductStatus.TO_PUTON.getCode();
        } else {
            status = EProductStatus.APPROVE_NO.getCode();
        }

        productBO.refreshApproveProduct(code, status, updater, remark);
    }

    @Override
    public void putOnProduct(String code, String location, Integer orderNo,
            String updater, String remark) {
        Product product = productBO.getProduct(code);

        if (!EProductStatus.TO_PUTON.getCode().equals(product.getStatus())) {
            throw new BizException("xn0000", "产品未处于可上架状态！");
        }

        productBO.refreshPutOnProduct(code, location, orderNo, updater, remark);
    }

    @Override
    public void putOffProduct(String code, String updater) {
        Product product = productBO.getProduct(code);

        if (ESellType.COLLECTIVE.getCode().equals(product.getSellType())) {
            // 集体产品
            if (!EProductStatus.TO_PUTOFF.getCode()
                .equals(product.getStatus())) {
                throw new BizException("xn0000", "产品未处于可下架状态！");
            }
        } else {
            // 个人、定向、捐赠产品
            if (!EProductStatus.TO_ADOPT.getCode()
                .equals(product.getStatus())) {
                throw new BizException("xn0000", "产品未处于可下架状态！");
            }
        }

        productBO.refreshPutOffProduct(code, updater);
    }

    @Override
    public Paginable<Product> queryProductPage(int start, int limit,
            Product condition) {
        Paginable<Product> page = productBO.getPaginable(start, limit,
            condition);
        List<Product> list = page.getList();

        if (CollectionUtils.isNotEmpty(list)) {
            for (Product product : list) {
                initProduct(product);
            }
        }

        return page;
    }

    @Override
    public List<Product> queryProductList(Product condition) {
        List<Product> list = productBO.queryProductList(condition);

        if (CollectionUtils.isNotEmpty(list)) {
            for (Product product : list) {
                initProduct(product);
            }
        }
        return list;
    }

    @Override
    public Product getProduct(String code) {
        Product product = productBO.getProduct(code);
        initProduct(product);
        return product;
    }

    private void initProduct(Product product) {
        // 产品规格列表
        List<ProductSpecs> specsList = productSpecsBO
            .queryProductSpecsListByProduct(product.getCode());
        product.setProductSpecsList(specsList);

        // 古树列表
        List<Tree> treeList = treeBO.queryTreeListByProduct(product.getCode());
        product.setTreeList(treeList);

        // 树木数量
        product.setTreeCount(treeList.size());
    }
}
