package com.pricecatalog.dao;

import java.util.Map;

import com.pricecatalog.common.BaseDao;
import com.pricecatalog.common.SearchTemplate;
import org.springframework.stereotype.Repository;

/**
 * Created by sukey on 2016/12/20.
 */
@Repository
public class RepairDao extends BaseDao {

    public SearchTemplate findRepaired(Map<String, String> params) {
        StringBuffer sql = new StringBuffer();
        sql.append("select * from repaired where 1=1 ");

        if (params.containsKey("series")) {
            sql.append(" and series=:series");
        }

        return super.search(sql.toString(), params);
    }
}
