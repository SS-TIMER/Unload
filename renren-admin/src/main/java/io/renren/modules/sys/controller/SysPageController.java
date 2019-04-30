/**
 * Copyright (c) 2016-2019 排污许可申报系统 All rights reserved.
 * <p>
 * https://www.renren.io
 * <p>
 * 版权所有，侵权必究！
 */

package io.renren.modules.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 系统页面视图
 *
 * @author Mark sunlightcs@gmail.com
 */
@Controller
public class SysPageController {

    @RequestMapping("modules/{module}/{url}.html")
    public String module(@PathVariable("module") String module, @PathVariable("url") String url) {
        return "modules/" + module + "/" + url;
    }

    @RequestMapping(value = {"/", "index.html"})
    public String index() {
        return "index";
    }

    @RequestMapping("index1.html")
    public String index1() {
        return "index1";
    }

    @RequestMapping("login.html")
    public String login() {
        return "login";
    }



    @RequestMapping("main.html")
    public String main() {
        return "main";
    }

    @RequestMapping("main1.html")
    public String main1() {
        return "main1";
    }

    @RequestMapping("applytable.html")
    public String applytable() {
        return "applytable";
    }

    @RequestMapping("found.html")
    public String found() {
        return "found";
    }

    @RequestMapping("companyinfo.html")
    public String companyinfo() {
        return "companyinfo";
    }

    @RequestMapping("basicinfo.html")
    public String basicinfo() {
        return "basicinfo";
    }

    @RequestMapping("404.html")
    public String notFound() {
        return "404";
    }



    @RequestMapping("home.html")
    public String home() {
        return "index2";
    }
    @RequestMapping("register1.html")
    public String register1() {
        return "register1";
    }
    @RequestMapping("register2.html")
    public String register2() {
        return "register2";
    }
    @RequestMapping("register3.html")
    public String register3() {
        return "register3";
    }

}
