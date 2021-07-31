<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工列表</title>
    <%--静态包含含有base、jquery、bootstrap--%>
    <%@include file="/head.jsp"%>
</head>
<body>

        <%--第一行 标题--%>
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        </div>

        <%--第二行 按钮--%>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button type="button" class="btn btn-primary btn-lg">
                    <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> 新增
                </button>
                <button type="button" class="btn btn-danger btn-lg">
                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
                </button>
            </div>
        </div>

        <%--第三行 数据表--%>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <td>序号</td>
                        <td>姓名</td>
                        <td>性别</td>
                        <td>邮箱</td>
                        <td>部门</td>
                        <td>操作</td>
                    </tr>
                    ${pageInfo}

                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <td>${emp.empId}</td>
                            <td>${emp.empName}</td>
                            <td>${emp.gender=="M"?"男":"女"}</td>
                            <td>${emp.email}</td>
                            <c:if test="${emp.dId==1}">
                                <td>学生部</td>
                            </c:if>
                            <c:if test="${emp.dId==2}">
                                <td>信息部</td>
                            </c:if>
                            <c:if test="${emp.dId==3}">
                                <td>记着部</td>
                            </c:if>
                            <c:if test="${emp.dId==4}">
                                <td>实创部</td>
                            </c:if>

                            <td>
                                <button type="button" class="btn btn-primary">
                                    <span class="glyphicon glyphicon-edit" aria-hidden="true"></span> 编辑
                                </button>
                                <button type="button" class="btn btn-danger">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>

        <%--第四行 分页条--%>
        <div class="row">
            <div class="col-md-3 col-md-offset-3">
                当前是第[${pageInfo.pageNum}]页，总共有[${pageInfo.pages}]页，总共有[${pageInfo.total}]条数据
            </div>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <c:if test="${pageInfo.pageNum > 1}">
                            <li>
                                <a href="emps?pageNo=1" aria-label="Previous">
                                    <span aria-hidden="true">首页</span>
                                </a>
                            </li>
                            <li>
                                <a href="emps?pageNo=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                            <c:if test="${pageInfo.pageNum == pageNum}">
                                <li class="active"><a href="#">${pageNum}</a></li>
                            </c:if>
                            <c:if test="${pageInfo.pageNum != pageNum}">
                            <li><a href="emps?pageNo=${pageNum}">${pageNum}</a></li>
                            </c:if>
                        </c:forEach>

                        <c:if test="${pageInfo.pageNum != pageInfo.pages}">
                            <li>
                                <a href="emps?pageNo=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                            <li>
                                <a href="emps?pageNo=${pageInfo.pages}" aria-label="Next">
                                    <span aria-hidden="true">末页</span>
                                </a>
                            </li>
                        </c:if>

                    </ul>
                </nav>
            </div>
        </div>



</body>
</html>
