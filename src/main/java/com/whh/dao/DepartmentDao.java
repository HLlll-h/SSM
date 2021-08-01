package com.whh.dao;

import com.whh.domain.Department;

import java.util.List;

public interface DepartmentDao {

    /**
     * 根据depId查询depName
     */
    String selectName(Integer depId);


    /**
     * 查询所有的department
     */
    List<Department> selectAll();
}
