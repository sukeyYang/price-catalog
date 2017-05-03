package com.pricecatalog.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.pricecatalog.common.SearchTemplate;
import com.pricecatalog.dao.RepairDao;
import com.pricecatalog.entity.Maintenance;
import com.pricecatalog.entity.Repaired;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * Created by sukey on 2016/12/20.
 */
@Service
public class RepairService {

    @Autowired
    RepairDao repairDao;

    public SearchTemplate findParts(Map<String, String> params) {


        if (!params.containsKey("mile") && !params.containsKey("time")) {
            SearchTemplate searchTemplate = repairDao.findRepaired(params);
            return searchTemplate;
        }
        SearchTemplate searchTemplate;
        Map<String, String> paramsCondition = new HashMap<>();
        if (params.containsKey("series")) {

            paramsCondition.put("series", params.get("series"));
            searchTemplate = repairDao.findRepaired(paramsCondition);
        } else {
            searchTemplate = repairDao.findRepaired(paramsCondition);
        }
        List<Map<String, Object>> result = searchTemplate.getValues();
        List<Map<String, Object>> dataRet = new ArrayList<>();
        int currentMile = 0;
        if (params.containsKey("mile") && !StringUtils.isEmpty(params.get("mile"))) {
            currentMile = Integer.parseInt(params.get("mile"));
        }

        int monthGap = 0;
        if (params.containsKey("time")) {

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = Calendar.getInstance();
            Calendar currentDay = Calendar.getInstance();

            try {
                cal.setTime(sdf.parse(params.get("time")));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            monthGap = (int) ((currentDay.getTimeInMillis() - cal.getTimeInMillis()) / (1000L * 60L * 60L * 24L * 30L));


        }

        int totalCount = 0;

        for (int i = 0; i < result.size(); i++) {
            Map<String, Object> data = result.get(i);
            int mile = 0;
            if (data.get("mile") != null) {
                mile = (int) data.get("mile");

            }
            int month = 0;
            if (data.get("month") != null) {
                month = (int) data.get("month");

            }
            if (currentMile != 0 && mile != 0) {
                if ((mile - currentMile % mile <= mile * 0.2) || (currentMile % mile <= mile * 0.3)) {
                    dataRet.add(data);
                    totalCount++;
                }
            } else if (monthGap != 0 && month != 0) {
                if (Math.abs(monthGap % month - month) <= 2) {
                    dataRet.add(data);
                    totalCount++;
                }
            } else {
                dataRet.add(data);
                totalCount++;
            }
        }

        int pageSize = Integer.parseInt(params.get("pageSize"));
        int page = Integer.parseInt(params.get("page"));
        int start =page == 1 ? 0 : (page - 1) * pageSize;
        if (dataRet.size() > start) {
            // Iterator
            Iterator<Map<String, Object>> it = dataRet.iterator();

            int removeCount =0;
            while (it.hasNext()) {
                it.next();
                if(removeCount>=start)
                    break;
                it.remove();
                removeCount++;
            }
        }
        searchTemplate.setValues(dataRet);
        searchTemplate.setCount(totalCount);

        return searchTemplate;


    }

    public void save(Repaired repaired) {
        repairDao.save(repaired);
    }

    public void save(List<Repaired> partsList) {
        repairDao.saveBatch(partsList);
    }
}
