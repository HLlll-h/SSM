package com.whh.service.impl;


import com.whh.dao.EmployeeDao;
import com.whh.domain.Employee;
import com.whh.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;


@Service("employeeServiceImpl")
public class EmployeeServiceImpl implements EmployeeService {

    @Autowired
    @Qualifier("employeeDao")
    private EmployeeDao employeeDao;

    @Override
    public List<Employee> queryAllEmployee() {
        List<Employee> employees = employeeDao.selectAll();
        return employees;
    }
}
