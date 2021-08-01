package com.whh.test;

import com.whh.dao.DepartmentDao;
import com.whh.dao.EmployeeDao;
import com.whh.domain.Department;
import com.whh.domain.Employee;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class Test {

    @org.junit.Test
    public void test(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("conf/applicationContext.xml");
        EmployeeDao dao = (EmployeeDao) ac.getBean("employeeDao");
        Employee employee = dao.selectById(1);
        System.out.println(employee);
    }

    @org.junit.Test
    public void test2(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("conf/applicationContext.xml");
        DepartmentDao dao = (DepartmentDao) ac.getBean("departmentDao");
        List<Department> departments = dao.selectAll();
        System.out.println(departments);
    }

    @org.junit.Test
    public void test3(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("conf/applicationContext.xml");
        EmployeeDao dao = (EmployeeDao) ac.getBean("employeeDao");
        Employee employee = dao.selectByName("张e勇");
        System.out.println("====="+employee);
    }

}
