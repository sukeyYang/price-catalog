package com.pricecatalog.dao;

import java.util.*;

import com.pricecatalog.common.BaseDao;
import com.pricecatalog.common.SearchTemplate;
import com.pricecatalog.entity.Maintenance;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

/**
 * Created by sukey on 2017/2/28.
 */
@Repository
public class MaintenanceDao extends BaseDao {


    public List<Map<String, String>> findSeries(String brand) {
        Map<String, String> map = new HashMap<>();
        map.put("brand", brand);
        String sql = "select distinct series from  maintenance where brand=:brand";

        return findResult(sql, map);
    }

    public List findMaintenanceInfo(Maintenance maintenance) {
        StringBuilder sql = new StringBuilder();
        sql.append("from Maintenance where 1=1 ");

        if (!StringUtils.isEmpty(maintenance.getSeries())) {
            sql.append(" and series=:series");
        }

        return super.findObjects(sql.toString(), maintenance);
    }


}
