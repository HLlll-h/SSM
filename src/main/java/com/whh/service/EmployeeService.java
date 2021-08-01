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


}
