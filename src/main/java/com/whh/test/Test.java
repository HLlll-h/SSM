package com.whh.test;

import com.whh.dao.EmployeeDao;
import com.whh.domain.Employee;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {

    @org.junit.Test
    public void test(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("conf/applicationContext.xml");
        EmployeeDao dao = (EmployeeDao) ac.getBean("employeeDao");
        Employee employee = dao.selectById(1);
        System.out.println(employee);
    }

}
