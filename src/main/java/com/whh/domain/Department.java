package com.whh.domain;

public class Department {

    private Integer depId;
    private String depName;

    public Department() {
    }

    @Override
    public String toString() {
        return "Department{" +
                "depId=" + depId +
                ", depName='" + depName + '\'' +
                '}';
    }

    public Department(Integer depId, String depName) {
        this.depId = depId;
        this.depName = depName;
    }
}
