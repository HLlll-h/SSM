package com.whh.dao;

import com.whh.domain.Employee;

import java.util.List;

public interface EmployeeDao {

    /**
     * 增加Employee表数据
     */
    Integer insertEmployee(Employee employee);

    /**
     * 删除Employee表中数据根据empId
     */
    Integer deleteEmployeeById(Integer empId);

    /**
     * 修改Employee表数据
     */
    Integer updateEmployee(Employee employee);

    /**
     * 查询Employee表一条记录根据empId
     */
    Employee selectById(Integer empId);

    /**
     * 查询Employee表全部数据
     */
    List<Employee> selectAll();

    /**
     * 查询Employee表一条记录根据empName
     */
    Employee selectByName(String empName);


}
