package com.pricecatalog.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import com.pricecatalog.dao.MaintenanceDao;
import com.pricecatalog.entity.Maintenance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * Created by sukey on 2017/2/28.
 */
@Service
public class MaintenanceService {

    @Autowired
    private MaintenanceDao maintenanceDao;

    public List<Map<String, String>> findSeries(String brand) {
        return maintenanceDao.findSeries(brand);
    }

    public List<Maintenance> findMaintenanceInfo(String series, String mile, String month) {

        Maintenance maintenance = new Maintenance();
        maintenance.setSeries(series);
        List<Maintenance> result = maintenanceDao.findMaintenanceInfo(maintenance);
        List<Maintenance> dataRet = new ArrayList<>();
        int currentMile = 0;
        if (!StringUtils.isEmpty(mile)) {
            currentMile = Integer.parseInt(mile);
        }

        int monthGap = 0;
        if (!StringUtils.isEmpty(month)) {

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = Calendar.getInstance();
            Calendar currentDay = Calendar.getInstance();

            try {
                cal.setTime(sdf.parse(month));
            } catch (ParseException e) {
                e.printStackTrace();
            }
            monthGap = (int)((currentDay.getTimeInMillis()-cal.getTimeInMillis())/(1000 * 60 * 60 * 24*30L));


        }


        if (StringUtils.isEmpty(mile) && StringUtils.isEmpty(month)) {
            return result;
        } else {
            for (int i = 0; i < result.size(); i++) {
                Maintenance data = result.get(i);
                if (currentMile != 0 && data.getMile() != 0) {
                    if ((data.getMile()-currentMile % data.getMile() <= data.getMile() * 0.2 )  || (currentMile % data.getMile()  <= data.getMile() * 0.3)) {
                        dataRet.add(data);
                    }
                } else if (monthGap != 0 && data.getMonth() != 0) {
                    if (Math.abs(monthGap % data.getMonth() - data.getMonth()) <= 2) {
                        dataRet.add(data);
                    }
                }else {
                    dataRet.add(data);
                }
            }

            return dataRet;
        }

    }

}
