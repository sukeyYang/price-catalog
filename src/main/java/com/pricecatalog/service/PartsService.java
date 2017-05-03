package com.pricecatalog.service;

import java.util.*;

import com.pricecatalog.common.SearchTemplate;
import com.pricecatalog.dao.PartsDao;
import com.pricecatalog.dao.TireDao;
import com.pricecatalog.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by sukey on 2016/12/6.
 */

@Service("partsService")
@Transactional
public class PartsService {

    @Autowired
    private PartsDao partsDao;

    @Autowired
    private TireDao tireDao;

    public SearchTemplate findParts(Map<String, String> params) {
        return partsDao.findParts(params);
    }

    public void save(Parts parts) {
        partsDao.save(parts);
    }

    public void save(List<Parts> partsList) {
        partsDao.saveBatch(partsList);
    }

    public void savePartsAttached(List<PartsAttached> partsAttachedList) {
        partsDao.saveBatch(partsAttachedList);
    }

    public void savePartsTrie(List<PartsTrie> partsTries) {
        partsDao.saveBatch(partsTries);
    }

    public List<Map<String, String>> getTireSize(String series, String vehicle_year) {
        return tireDao.findTireSzie(series, vehicle_year);
    }


    public SearchTemplate findTire(Map<String, String> queryCondition) {
        return tireDao.findTire(queryCondition);
    }

    public SearchTemplate findOilParts(Map<String, String> params) {
        return partsDao.findOilParts(params);
    }

    public Parts getPartsById(int id) {
        return (Parts) partsDao.getObjectById(id, Parts.class);
    }

    public Parts getOilPartsById(int id) {
        return (Parts) partsDao.getObjectById(id,Parts.class);
    }

    public PartsTrie getTirePartsById(int id) {
        return (PartsTrie) partsDao.getObjectById(id,PartsTrie.class);
    }

    public String getAllVehicle(String partsid,String id,String type){
        Map<String,String> param = new HashMap<>();
        param.put("partsid",partsid);
        SearchTemplate searchTemplate = partsDao.findParts(param);
        String allVehicle="" ;
        for(Map<String,Object> result : searchTemplate.getValues()){
            if(String.valueOf(result.get("id")).equals(id)){
                continue;
            }
            allVehicle = "<span>"+String.valueOf(result.get("brand"))+ " " +String.valueOf(result.get("series")) + " " +String.valueOf(result.get("vehicle_year"))+"款 " ;
            if("3".equals(type)){
                allVehicle +=String.valueOf(result.get("emission"));
            }
            allVehicle +="</span>";
        }
        return allVehicle;
    }

}
