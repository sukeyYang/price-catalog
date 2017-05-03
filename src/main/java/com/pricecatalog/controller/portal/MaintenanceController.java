package com.pricecatalog.controller.portal;

import java.text.ParseException;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import com.pricecatalog.entity.Maintenance;
import com.pricecatalog.service.MaintenanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

/**
 * Created by sukey on 2017/2/28.
 */

@Controller
@RequestMapping("maintain")
public class MaintenanceController {

    @Autowired
    private MaintenanceService maintenanceService;

    @RequestMapping("series")
    @ResponseBody
    public List<Map<String, String>> getSeries(String brand) {

        return maintenanceService.findSeries(brand);
    }

    @RequestMapping("search")
    public String search() {
        return "/jsp/portal/maintain_search";
    }

    @RequestMapping(value = "suggest", method = RequestMethod.POST)
    public String suggest(HttpServletRequest request) {
        String brand = request.getParameter("brand");
        String series = request.getParameter("series");
        String mile = request.getParameter("mile");
        String time = request.getParameter("time");

        List<Maintenance> maintenanceList = maintenanceService.findMaintenanceInfo(series, mile, time);

        request.setAttribute("maintenanceList",maintenanceList);
        request.setAttribute("brand",brand);
        request.setAttribute("series",series);
        request.setAttribute("mile",mile);
        request.setAttribute("time",time);

        return "/jsp/portal/maintain_plan";


    }

}
