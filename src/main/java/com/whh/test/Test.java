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

    @org.junit.Test
    public void test4(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("conf/applicationContext.xml");
        EmployeeDao dao = (EmployeeDao) ac.getBean("employeeDao");
        Employee employee = dao.selectById(1);
        System.out.println("====="+employee);
    }

    @org.junit.Test
    public void test5(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("conf/applicationContext.xml");
        EmployeeDao dao = (EmployeeDao) ac.getBean("employeeDao");
        Employee employee = new Employee();
        employee.setEmpId(48);
        employee.setEmail("sjakdhaj@qq.com");
        employee.setGender("M");
        employee.setdId(1);
        Integer nums = dao.updateEmployee(employee);
        System.out.println("====="+employee);
    }

    @org.junit.Test
    public void test6(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("conf/applicationContext.xml");
        EmployeeDao dao = (EmployeeDao) ac.getBean("employeeDao");
        List<Employee> employees = dao.selectLike("李");
        System.out.println("====="+employees);
    }

}
