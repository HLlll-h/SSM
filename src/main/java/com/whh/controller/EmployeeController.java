package com.whh.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.whh.domain.Employee;
import com.whh.domain.Msg;
import com.whh.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * 处理employee的CRUD
 */
@Controller
public class EmployeeController {

    @Autowired
    @Qualifier("employeeServiceImpl")
    private EmployeeService employeeService;

    //使用ajax请求查询
    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmployeeWithJson(@RequestParam(value = "pageNo",defaultValue = "1")Integer pageNo){
        //使用pageHelper分页插件
        //在查询之前调用startPage 传入页码，以及每页的条数
        PageHelper.startPage(pageNo,5);
        //startPage后的查询就是分页查询
        List<Employee> employees = employeeService.queryAllEmployee();
        //使用pageInfo包装查询后的结果,只需将pageInfo交给页面即可
        //封装了详细的分页信息 包括查询出的数据 传入连续显示的页数5[1,2,3,4,5]
        PageInfo page = new PageInfo(employees,5);
        return Msg.success().add("pageInfo",page);
    }


    //只适用于BS架构，需使用CS架构+ajax
//    @RequestMapping("/emps")
    public ModelAndView getEmployee(@RequestParam(value = "pageNo",defaultValue = "1")Integer pageNo){
        //使用pageHelper分页插件
        //在查询之前调用startPage 传入页码，以及每页的条数
        PageHelper.startPage(pageNo,5);
        //startPage后的查询就是分页查询
        List<Employee> employees = employeeService.queryAllEmployee();
        System.out.println("----------"+employees);
        //使用pageInfo包装查询后的结果,只需将pageInfo交给页面即可
        //封装了详细的分页信息 包括查询出的数据 传入连续显示的页数5[1,2,3,4,5]
        PageInfo page = new PageInfo(employees,5);
        System.out.println("======="+page);
        ModelAndView mv = new ModelAndView();
        mv.addObject("pageInfo",page);
        mv.setViewName("list");

        return mv;
    }

}
