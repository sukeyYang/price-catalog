package com.pricecatalog.controller.portal;

import java.util.*;
import javax.servlet.http.HttpServletRequest;

import com.pricecatalog.common.SearchTemplate;
import com.pricecatalog.entity.Parts;
import com.pricecatalog.entity.PartsTrie;
import com.pricecatalog.service.PartsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

/**
 * Created by sukey on 2017/2/16.
 */
@Controller
@RequestMapping("parts-price")
public class PartsSearcchController {


    @Autowired
    private PartsService partsService;

    @RequestMapping("search")
    public String search() {
        return "/jsp/portal/search";
    }

    @RequestMapping(value = "parts-list", method = RequestMethod.POST)
    public String partsList(HttpServletRequest request) {

        String partType = request.getParameter("partType");

        String oilType = request.getParameter("oilType");

        String carBrand = request.getParameter("carBrand");

        String carSeries = request.getParameter("carSeries");

        String vehicleYear = request.getParameter("vehicleYear");

        String tireSize = request.getParameter("tireSize");

        String emission = request.getParameter("vehicleEmission");

        Map<String, String> queryCondition = new HashMap<>();

        if (!StringUtils.isEmpty(partType)) {
            queryCondition.put("type", partType);
            request.setAttribute("type", partType);
        }
        if (!StringUtils.isEmpty(oilType)) {
            queryCondition.put("type", oilType);
        }

        if (!StringUtils.isEmpty(carBrand)) {
            queryCondition.put("brand", carBrand);
            request.setAttribute("brand", carBrand);
        }

        if (!StringUtils.isEmpty(carSeries)) {
            queryCondition.put("series", carSeries);
            request.setAttribute("series", carSeries);
        }

        if (!StringUtils.isEmpty(vehicleYear)) {
            queryCondition.put("vehicle_year", vehicleYear);
            request.setAttribute("vehicle_year", vehicleYear);
        }

        if (!StringUtils.isEmpty(emission)) {
            queryCondition.put("emission", emission);
            request.setAttribute("emission", emission);
        }

        if (!StringUtils.isEmpty(tireSize)) {
            queryCondition.put("size", tireSize);
            request.setAttribute("size", tireSize);
        }

        SearchTemplate searchTemplate;

        if ("轮胎".equals(partType)) {
            searchTemplate = partsService.findTire(queryCondition);
            request.setAttribute("type", "1");

        } else if ("油液".equals(partType)) {
            searchTemplate = partsService.findOilParts(queryCondition);
            request.setAttribute("type", "2");
        } else {
            searchTemplate = partsService.findParts(queryCondition);
            request.setAttribute("type", "3");
        }

        request.setAttribute("result", searchTemplate.getValues());

        request.setAttribute("total", searchTemplate.getCount());

        return "/jsp/portal/parts_list";
    }

    @RequestMapping(value = "keywords-search", method = RequestMethod.POST)
    @ResponseBody
    public List<Map<String, Object>> keyWordsSearch(HttpServletRequest request) {
        String keywords = "%" + request.getParameter("keywords") + "%";
        Map<String, String> queryCondition = new HashMap<>();

        queryCondition.put("keywords", keywords);

        SearchTemplate searchTemplate = partsService.findOilParts(queryCondition);

        if (searchTemplate.getValues().size() == 0) {
            searchTemplate = partsService.findTire(queryCondition);
        }

        if (searchTemplate.getValues().size() == 0) {
            searchTemplate  = partsService.findParts(queryCondition);
        }


        return searchTemplate.getValues();
    }

    @RequestMapping("/detail/{type}")
    public String showDetail(HttpServletRequest request, @PathVariable("type") String type) {
        String id = request.getParameter("id");
        if ("1".equals(type)) {
            PartsTrie partsTrie = partsService.getTirePartsById(Integer.parseInt(id));
            request.setAttribute("parts", partsTrie);
            String matchVehicle = partsService.getAllVehicle(partsTrie.getPartsid(), String.valueOf(partsTrie.getId()), type);
            request.setAttribute("matchVehicle", matchVehicle);
        } else if ("2".equals(type)) {
            request.setAttribute("parts", partsService.getOilPartsById(Integer.parseInt(id)));
        } else {
            Parts parts = partsService.getPartsById(Integer.parseInt(id));
            request.setAttribute("parts", parts);
            String matchVehicle = partsService.getAllVehicle(parts.getPartsid(), String.valueOf(parts.getId()), type);
            request.setAttribute("matchVehicle", matchVehicle);
        }
        request.setAttribute("type", type);
        return "/jsp/portal/detail";
    }

}
