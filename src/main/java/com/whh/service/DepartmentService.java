package com.whh.service;

import com.whh.domain.Department;

import java.util.List;

public interface DepartmentService {

    /**
     * 查询department表中所有记录
     */
    List<Department> queryAllDepartments();


    /**
     * 根据depId查询depName
     */
    String queryNameById(Integer depId);
}
