package com.whh.controller;

import com.whh.domain.Department;
import com.whh.domain.Msg;
import com.whh.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class DepartmentControl {

    @Autowired
    @Qualifier("departmentServiceImpl")
    private DepartmentService departmentService;


    //ajax请求获取department表所有数据
    @RequestMapping("/getAllDepartments")
    @ResponseBody
    public Msg getAllDepartments(){
        List<Department> departments = departmentService.queryAllDepartments();
        return Msg.success().add("depts",departments);

    }
}
