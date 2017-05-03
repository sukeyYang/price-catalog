package com.pricecatalog.dao;

import java.util.List;
import java.util.Map;

import com.pricecatalog.common.BaseDao;
import com.pricecatalog.common.SearchTemplate;
import com.pricecatalog.entity.Parts;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by sukey on 2016/12/6.
 */
@Repository
@Transactional
public class PartsDao extends BaseDao {

    public SearchTemplate findParts(Map<String, String> params) {
        StringBuffer sql = new StringBuffer();
        sql.append("select * from parts where 1=1 ");

        if (params.containsKey("brand")) {
            sql.append(" and brand=:brand");
        }

        if (params.containsKey("series")) {
            sql.append(" and series=:series");
        }

        if (params.containsKey("type")) {
            sql.append(" and type=:type");
        }

        if (params.containsKey("emission")) {
            sql.append(" and emission=:emission");
        }

        if (params.containsKey("vehicle_year")) {
            sql.append(" and vehicle_year=:vehicle_year");
        }

        if (params.containsKey("partsId")) {
            sql.append(" and partsid=:partsId");
        }

        if (params.containsKey("keywords")) {
            sql.append(" and (name like :keywords or type like:keywords or series like:keywords or brand like :keywords )");
        }

        return super.search(sql.toString(), params);
    }

    public SearchTemplate findOilParts(Map<String, String> params) {
        StringBuffer sql = new StringBuffer();
        sql.append("select * from parts_oil where 1=1 ");


        if (params.containsKey("type")) {
            sql.append(" and type=:type");
        }

        if (params.containsKey("partsId")) {
            sql.append(" and partsid=:partsId");
        }

        if (params.containsKey("keywords")) {
            sql.append(" and (name like :keywords or type like:keywords or series like:keywords or brand like :keywords )");
        }


        return super.search(sql.toString(), params);
    }


}
