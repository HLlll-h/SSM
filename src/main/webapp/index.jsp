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
        <table class="table table-hover" id="emps_table">
            <thead>
                <tr>
                    <td>序号</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>邮箱</td>
                    <td>部门</td>
                    <td>操作</td>
                </tr>
            </thead>
            <tbody>

            </tbody>

        </table>
    </div>
</div>

<%--第四行 分页条--%>
<div class="row">
    <div class="col-md-3 col-md-offset-3" id="page_info_area">

    </div>
    <div class="col-md-6" id="page_nav_area">

    </div>
</div>

<%--============================================================================--%>
<%--================JavaScript部分 用于ajax请求====================================================--%>
<%--============================================================================--%>


<%--=================employee列表展示+分页条(查询)================================================--%>
<script type="text/javascript">
    //1.页面加载完成后，直接发送ajax请求
    $(function (){
        to_page(1)
    });

    //ajax请求 pageNo是当前页码
    function to_page(pageNo){
        $.ajax({
            url:"emps",
            data:{
                "pageNo":pageNo
            },
            dataType:"json",
            success:function (data){
                // console.log(data)
                //1.解析并显示员工信息
                build_emps_table(data);
                //2.解析并显示分页信息(左)
                build_page_info(data);
                //3.解析并显示分页条(右)
                build_page_nav(data);
            }
        });
    }

    //解析表格信息
    function build_emps_table(data){
        //再次发送ajax请求时，清空原有的table表格
        $("#emps_table tbody").empty();

        var emps = data.extend.pageInfo.list;
        //遍历employee数据
        $.each(emps,function (index,item){
            var empIdTd = $("<td></td>").append(item.empId);
            var empNameTd = $("<td></td>").append(item.empName);
            var genderTd = $("<td></td>").append(item.gender=='M'?"男":"女");
            var emailTd = $("<td></td>").append(item.email);
            if(item.dId==1){
                var dIdTd = $("<td></td>").append("学生部");
            }
            if(item.dId==2){
                var dIdTd = $("<td></td>").append("信息部");
            }
            if(item.dId==3){
                var dIdTd = $("<td></td>").append("记者部");
            }
            if(item.dId==4){
                var dIdTd = $("<td></td>").append("实创部");
            }
            var editBtn = $("<button></button>").addClass("btn btn-primary")
                .append($("<span></span>").addClass("glyphicon glyphicon-edit")).append(" 编辑");
            var delBtn = $("<button></button>").addClass("btn btn-danger")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append(" 删除");
            var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);


            //append方法执行完成以后还是返回原来的元素
            $("<tr></tr>").append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(dIdTd)
                .append(btnTd)
                .appendTo("#emps_table tbody");
        });
    }
    //解析分页信息(左)
    function build_page_info(data){
        //再次发送ajax请求时，清空原有的数据
        $("#page_info_area").empty();

        $("#page_info_area").append("当前是第[ "+ data.extend.pageInfo.pageNum +" ]页，总共有[ " + data.extend.pageInfo.pages +" ]页，总共有[ " + data.extend.pageInfo.total +" ]条数据")
    }
    //解析分页条(右)
    function build_page_nav(data){
        //再次发送ajax请求时，清空原有的数据
        $("#page_nav_area").empty();

        var ul = $("<ul></ul>").addClass("pagination");

        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if(data.extend.pageInfo.hasPreviousPage == false){
            //如果没有前一页(即在第一页)，则给首页和前一页加上不可点击效果
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        }else{
            //首页和上一页添加单击事件
            firstPageLi.click(function (){
                to_page(1);
            });
            prePageLi.click(function (){
                to_page(data.extend.pageInfo.pageNum-1);
            });
        }



        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        if(data.extend.pageInfo.hasNextPage == false){
            //如果没有后一页(即在最后一页)，则给首页和前一页加上不可点击效果
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else{
            //末页和下一页添加单击事件
            nextPageLi.click(function (){
                to_page(data.extend.pageInfo.pageNum+1);
            });
            lastPageLi.click(function (){
                to_page(data.extend.pageInfo.pages);
            });
        }




        //添加首页和上一页
        ul.append(firstPageLi).append(prePageLi);


        //遍历 [1,2,3,4,5]
        $.each(data.extend.pageInfo.navigatepageNums,function (index,items){

            var numLi = $("<li></li>").append($("<a></a>").append(items));
            if(data.extend.pageInfo.pageNum == items){
                //如果当前页和分页条页码一致时，给页码加上高亮
                numLi.addClass("active");
            }
            //给分页条的各元素绑定单击事件
            numLi.click(function (){
                to_page(items);
            });
            ul.append(numLi);
        });
        //添加末页和下一页
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

</script>



</body>
</html>
