package com.whh.controller;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.whh.domain.Employee;
import com.whh.domain.Msg;
import com.whh.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.lang.invoke.WrongMethodTypeException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 处理employee的CRUD
 */
@Controller
public class EmployeeController {

    @Autowired
    @Qualifier("employeeServiceImpl")
    private EmployeeService employeeService;


    /**
     * 使用ajax请求查询所有employee 展示列表
     */
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


    /**
     * 查询所有employee 展示列表
     * 只适用于BS架构，需使用CS架构+ajax
     */
//    @RequestMapping("/emps")
    public ModelAndView getAllEmployee(@RequestParam(value = "pageNo",defaultValue = "1")Integer pageNo){
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


    /**
     * 新增一条employee
     */
    @RequestMapping(value = "/emp",method = RequestMethod.POST)
    @ResponseBody
    //@Valid注解是使用CSR3030校验 BindingResult result封装校验的结果
    public Msg addEmp(@Valid Employee employee, BindingResult result){
        //CSR3030校验---防止绕过前端校验
        if(result.hasErrors()){//校验失败
            Map<String,Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error : errors) {
                System.out.println("错误的字段名:"+error.getField());
                System.out.println("错误信息:"+error.getDefaultMessage());
                map.put(error.getField(),error.getDefaultMessage());
            }
            return Msg.fail().add("errorFields",map);
        }else {
            employeeService.addEmployee(employee);
            return Msg.success();
        }
    }

    /**
     * 检查用户名是否重复
     */
    @RequestMapping(value = "/checkEmpName")
    @ResponseBody
    public Msg checkEmpName(String empName){
        //先判断用户名格式是否合法
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if(!empName.matches(regx)){//不合法
            return Msg.fail().add("result","用户名需为3-16位字母数字下划线或2-5位中文");
        }else{//用户名格式合法再判断用户名是否重复
            Employee employee = employeeService.queryEmployeeByName(empName);
            String result = "";
            if(employee == null){//用户名可用
                result = "用户名可用";
            }else{
                result = "用户名已存在";
            }
            return Msg.success().add("result",result);
        }

    }

    /**
     * 根据empId查询employee
     */
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmployee(@PathVariable("id") Integer empId){
        Employee employee = employeeService.queryEmployeeById(empId);
        return Msg.success().add("emp",employee);
    }


    /**
     * 修改信息
     */
    @RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmployee(Employee employee){
        employeeService.updateEmployee(employee);
        return Msg.success();
    }

    /**
     * 删除单个记录
     */
    /*@RequestMapping(value = "/emp/{empId}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmployeeById(@PathVariable("empId") Integer empId){
        employeeService.deleteEmployeeById(empId);
        return Msg.success();
    }*/

    /**
     * 删除单个记录+多个删除二合一
     * 多个删除：1-2-3
     * 单个删除：1
     */
    @RequestMapping(value = "/emp/{empIds}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmployeeById(@PathVariable("empIds") String empIds){
        if(empIds.contains("-")){//删除多个
            String[] str_empIds = empIds.split("-");
            for (String str_empId : str_empIds) {
                employeeService.deleteEmployeeById(Integer.parseInt(str_empId));
            }
        }else{//删除单个
            employeeService.deleteEmployeeById(Integer.parseInt(empIds));
        }
        return Msg.success();

    }

    /**
     * 模糊查询根据empName
     */
    @RequestMapping("/empslike")
    @ResponseBody
    public Msg getEmployeesLike(@RequestParam(value = "pageNo",defaultValue = "1")Integer pageNo,String empName){
        //使用pageHelper分页插件
        //在查询之前调用startPage 传入页码，以及每页的条数
        PageHelper.startPage(pageNo,5);
        //startPage后的查询就是分页查询
        List<Employee> employees = employeeService.queryLikeByName(empName);
        //使用pageInfo包装查询后的结果,只需将pageInfo交给页面即可
        //封装了详细的分页信息 包括查询出的数据 传入连续显示的页数5[1,2,3,4,5]
        PageInfo page = new PageInfo(employees,5);
        return Msg.success().add("pageInfo",page);
    }




}
