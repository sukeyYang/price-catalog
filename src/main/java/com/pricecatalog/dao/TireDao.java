package com.pricecatalog.dao;

import java.util.*;

import com.pricecatalog.common.BaseDao;
import com.pricecatalog.common.SearchTemplate;
import com.pricecatalog.entity.Vehicle;
import org.springframework.stereotype.Repository;

/**
 * Created by sukey on 2016/12/27.
 */
@Repository
public class TireDao extends BaseDao {


    public List<Map<String, String>> findTireSzie(String series, String vehicle_year) {
        Map<String, String> map = new HashMap<>();
        map.put("series", series);
        map.put("vehicle_year", vehicle_year);

        String sql = "select distinct size from  parts_trie where series=:series and vehicle_year=:vehicle_year";

        return findResult(sql, map);
    }

    public SearchTemplate findTire(Map<String, String> queryCondition) {

        StringBuffer sql = new StringBuffer();
        sql.append("select * from  parts_trie where 1=1 ");

        if (queryCondition.containsKey("brand")) {
            sql.append(" and brand=:brand");
        }

        if (queryCondition.containsKey("series")) {
            sql.append(" and series=:series");
        }

        if (queryCondition.containsKey("vehicle_year")) {
            sql.append(" and vehicle_year=:vehicle_year");
        }

        if (queryCondition.containsKey("size")) {
            sql.append(" and size=:size");
        }

        if (queryCondition.containsKey("partsid")) {
            sql.append(" and partsid=:partsid");
        }

        if (queryCondition.containsKey("keywords")) {
            sql.append(" and (name like :keywords or type like:keywords or series like:keywords or brand like :keywords )");
        }


        return search(sql.toString(), queryCondition);
    }
}
