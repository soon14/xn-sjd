package com.ogc.standard.dao;

import com.ogc.standard.dao.base.IBaseDAO;
import com.ogc.standard.domain.Tree;

public interface ITreeDAO extends IBaseDAO<Tree> {
    String NAMESPACE = ITreeDAO.class.getName().concat(".");

    // 修改古树
    public int updateTree(Tree data);

    // 认养树
    public int updateAdoptTree(Tree data);

    // 删除产品下的树
    public int deleteByProduct(Tree data);

    // 更新文章数
    public int updateArticleCount(Tree data);

    // 更新点赞数
    public int updatePointCount(Tree data);

    // 更新收藏数
    public int updateCollectionCount(Tree data);

    // 更新认养数
    public int updateAdoptCount(Tree data);
}
