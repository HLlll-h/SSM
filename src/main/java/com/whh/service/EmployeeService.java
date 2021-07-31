package com.whh.service;


import com.whh.domain.Employee;

import java.util.List;

public interface EmployeeService {

    /**
     * 查询全部员工
     */
    List<Employee> queryAllEmployee();


}
