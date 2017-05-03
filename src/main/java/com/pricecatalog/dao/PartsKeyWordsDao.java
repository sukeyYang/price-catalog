package com.pricecatalog.dao;

import java.util.List;
import java.util.Map;

import com.pricecatalog.common.BaseDao;
import com.pricecatalog.common.SearchTemplate;
import com.pricecatalog.entity.PartsKeywords;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by sukey on 2016/12/26.
 */
@Repository
@Transactional
public class PartsKeyWordsDao extends BaseDao {

    public List<PartsKeywords> findAllPartsKeyword() {
        String querySql = "From PartsKeywords where 1=1 ";

        return super.findObjects(querySql, new PartsKeywords());
    }

    public SearchTemplate findKeyWords(Map<String,String> params){
            StringBuffer sql = new StringBuffer();
            sql.append("select * from parts_keywords where 1=1 ");
            return super.search(sql.toString(),params);
        }

}
