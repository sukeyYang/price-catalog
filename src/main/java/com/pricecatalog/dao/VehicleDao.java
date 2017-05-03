package com.pricecatalog.dao;

import java.util.*;

import com.pricecatalog.common.BaseDao;
import com.pricecatalog.entity.Vehicle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by sukey on 2016/12/27.
 */
@Repository
public class VehicleDao extends BaseDao {

    public List<Vehicle> findAllVehicle() {
        String sql = "From Vehicle t GROUP BY t.book,t.marketdivision,t.series,t.vehicle_year,t.brand,t.seriescode,t.emission";
        return findObjects(sql, new Vehicle());
    }

    public List<Map<String, String>> findSeries(String brand) {
        Map<String, String> map = new HashMap<>();
        map.put("brand", brand);
        String sql = "select distinct series from  vehicle where brand=:brand";

        return findResult(sql, map);
    }

    public List<Map<String, String>> findVehicleYear(String series) {
        Map<String, String> map = new HashMap<>();
        map.put("series", series);
        String sql = "select distinct vehicle_year from  vehicle where series=:series order by vehicle_year desc";

        return findResult(sql, map);
    }

    public List<Map<String, String>> findEmission(String series,String vehicle_year ) {
           Map<String, String> map = new HashMap<>();
           map.put("series", series);
        map.put("vehicle_year", vehicle_year);

           String sql = "select distinct emission from  vehicle where series=:series and vehicle_year=:vehicle_year";

           return findResult(sql, map);
       }
}
