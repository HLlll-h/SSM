package com.whh.service.impl;

import com.whh.dao.DepartmentDao;
import com.whh.domain.Department;
import com.whh.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("departmentServiceImpl")
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    @Qualifier("departmentDao")
    private DepartmentDao departmentDao;

    @Override
    public List<Department> queryAllDepartments() {
        List<Department> departments = departmentDao.selectAll();
        return departments;
    }

    @Override
    public String queryNameById(Integer depId) {
        String depName = departmentDao.selectName(depId);
        return depName;
    }
}
