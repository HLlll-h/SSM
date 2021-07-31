<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        String basePath = request.getScheme()
                + "://"
                + request.getServerName()
                + ":"
                + request.getServerPort()
                + request.getContextPath()
                + "/";

        request.setAttribute("basePath",basePath);
    %>


    <%--写base标签，永远固定相对路径跳转的结果--%>
    <base href="<%=basePath%>">
    <%--引入jQuery--%>
    <script type="text/javascript" src="static/js/jquery-3.4.1.js"></script>
    <%--引入bootstrap--%>
    <link href="static/bootstrap-3.4.1-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

</body>
</html>
