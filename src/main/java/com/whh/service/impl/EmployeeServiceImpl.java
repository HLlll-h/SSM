package com.whh.service.impl;


import com.whh.dao.EmployeeDao;
import com.whh.domain.Employee;
import com.whh.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.lang.invoke.WrongMethodTypeException;
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

    @Override
    public Integer addEmployee(Employee employee) {
        Integer nums = employeeDao.insertEmployee(employee);
        return nums;
    }

    @Override
    public Employee queryEmployeeByName(String empName) {
        Employee employee = employeeDao.selectByName(empName);
        return employee;
    }

    @Override
    public Employee queryEmployeeById(Integer empId) {
        Employee employee = employeeDao.selectById(empId);
        return employee;
    }

    @Override
    public Integer updateEmployee(Employee employee) {
        Integer nums = employeeDao.updateEmployee(employee);
        return nums;
    }

    @Override
    public Integer deleteEmployeeById(Integer empId) {
        Integer nums = employeeDao.deleteEmployeeById(empId);
        return nums;
    }

    @Override
    public List<Employee> queryLikeByName(String empName) {
        List<Employee> employees = employeeDao.selectLike(empName);
        return employees;
    }
}
