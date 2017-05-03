package com.pricecatalog.controller.sys;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pricecatalog.common.RetModel;
import com.pricecatalog.common.SearchTemplate;
import com.pricecatalog.service.PartsKeywordsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by sukey on 2016/12/28.
 */
@Controller
@RequestMapping("keywords")
public class KeywordsController {

    @Autowired
    private PartsKeywordsService partsKeywordsService;

    @RequestMapping("list")
    public String list() {

        return "/jsp/manage/index";
    }


    @RequestMapping("getListData")
    @ResponseBody
    public RetModel getListData(HttpServletRequest request, HttpServletResponse response) {
        String page = request.getParameter("page");
        String pageSize = request.getParameter("rows");
        Map<String, String> params = new HashMap<>();
        String regex = "[0-9]+";
        if (StringUtils.isEmpty(page) || !page.matches(regex)) {
            page = "1";
            pageSize = "30";
            params.put("page", page);
            params.put("pageSize", pageSize);
        } else {
            params.put("page", page);
            params.put("pageSize", pageSize);
        }
        if (StringUtils.isEmpty(pageSize) || !pageSize.matches(regex)) {
            pageSize = "30";
            params.put("pageSize", pageSize);
        } else {
            params.put("pageSize", pageSize);
        }
        SearchTemplate searchTemplate = partsKeywordsService.findKeyWords(params);
        RetModel retModel = new RetModel();
        retModel.setRows(searchTemplate.getValues());
        retModel.setRecords(searchTemplate.getCount());
        retModel.setPage(Integer.parseInt(page));
        int mod = searchTemplate.getCount() % Integer.parseInt(pageSize);
        retModel.setTotal(mod == 0 ? searchTemplate.getCount() / Integer.parseInt(pageSize) : (searchTemplate.getCount() / Integer.parseInt(pageSize) + 1));
        return retModel;
    }

}
