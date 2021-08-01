package com.whh.service;


import com.whh.domain.Employee;

import java.util.List;

public interface EmployeeService {

    /**
     * 查询全部员工
     */
    List<Employee> queryAllEmployee();

    /**
     * 新增employee
     */
    Integer addEmployee(Employee employee);

    /**
     * 用于检查用户名是否可用
     */
    Employee queryEmployeeByName(String empName);

    /**
     * 根据id查询employee表中一条记录
     */
    Employee queryEmployeeById(Integer empId);

    /**
     * 修改employee表中一条记录
     */
    Integer updateEmployee(Employee employee);

    /**
     * 删除单条记录
     */
    Integer deleteEmployeeById(Integer empId);

    /**
     * 模糊查询根据empName
     */
    List<Employee> queryLikeByName(String empName);


}
