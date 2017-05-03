package com.pricecatalog.controller.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by sukey on 2016/10/28.
 */
@Controller
@RequestMapping("/index")
public class LoginController {

    @RequestMapping("showpage")
    public String showpage(){
        return "/jsp/manage/index";
    }

    @RequestMapping("login")
       public String login(){
           return "/jsp/manage/login";
       }

    @RequestMapping("showtab")
        public String showtab(){
            return "/jsp/manage/tab";
        }

}
