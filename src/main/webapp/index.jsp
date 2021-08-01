<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>员工列表</title>
    <%--静态包含含有base、jquery、bootstrap--%>
    <%@include file="/head.jsp"%>
</head>
<body>
<%--===============新增 模态窗==================================================--%>

<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">新增</h4>
            </div>
            <div class="modal-body">
                    <%--新增表单--%>
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">姓名</label>
                            <div class="col-sm-10">
                                <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="李狗蛋">
                                <span class="help-block"></span><%--校验失败信息--%>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">邮箱</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" id="email_add_input" placeholder="ligoudan@163.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">性别</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">部门</label>
                            <div class="col-sm-5">
                                <%----%>
                                <select class="form-control" name="dId" id="dept_add_select">

                                </select>
                            </div>
                        </div>

                    </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_add_btn">新增</button>
            </div>
        </div>
    </div>
</div>



<%--===============employee表展示==================================================--%>
<%--第一行 标题--%>
<div class="row">
    <div class="col-md-12">
        <h1>SSM-CRUD</h1>
    </div>
</div>

<%--第二行 按钮--%>
<div class="row">
    <div class="col-md-4 col-md-offset-8">
        <button type="button" class="btn btn-primary btn-lg" id="emp_add_modal_btn">
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

<script type="text/javascript">
//===============================================================================
<%--=================employee列表展示+分页条(查询)================================================--%>
//===============================================================================

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

//===============================================================================
//===================新增employee部分=================================================
//===============================================================================

    //给新增按钮绑定单击事件
    $("#emp_add_modal_btn").click(function (){
        //清除表单数据(表单重置+表单样式)
        $("#empAddModal form")[0].reset();
        //清空表单样式
        $("#empAddModal form").find("*").removeClass("has-error has-success");
        $("#empAddModal form").find(".help-block").text("");


        //发送ajax请求查出部门信息 显示在新增下拉列表中
        $("#dept_add_select").empty();
        getDepartments();

        //点击按钮调出新增模态窗
        $("#empAddModal").modal({
            backdrop:"static"
        });
    });

    //查出所有部门信息
    function getDepartments(){
        $.ajax({
            url:"getAllDepartments",
            dataType: "json",
            success:function (data){
                // console.log(data)
                //显示部门信息在下拉列表中
                // $("#dept_add_select").append()
                //遍历部门信息
                $.each(data.extend.depts,function (){
                    var optionEle = $("<option></option>").append(this.depName).attr("value",this.depId);
                    optionEle.appendTo("#dept_add_select");
                });
            }
        });
    }
//======================校验新增表单数据(用户名+邮箱)==============================================

    function validate_add_from(){
        //1.拿到要校验的数据 使用正则表达式
        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if(!regName.test(empName)){//校验不符合
            // alert("用户名需为3-16位字母数字下划线或2-5位中文");
            // $("#empName_add_input").parent().addClass("has-error");
            // $("#empName_add_input").next("span").text("用户名需为3-16位字母数字下划线或2-5位中文")

            show_validate_msg("#empName_add_input", "error", "用户名必须是6-16位数字，字母或者_-，也可以是2-5位中文组成");
            return false;

        }else{//校验符合要求
            // $("#empName_add_input").parent().addClass("has-success");
            // $("#empName_add_input").next("span").text("用户名符合要求")

            show_validate_msg("#empName_add_input", "success", "");

        }
        //2.校验邮箱信息
        var email = $("#email_add_input").val();
        var regEmail =  /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            // alert("邮箱格式需为");
            //再次请求时需清空之前的

            // $("#email_add_input").parent().addClass("has-error");
            // $("#email_add_input").next("span").text("邮箱格式不正确");

            show_validate_msg("#email_add_input", "error", "邮箱格式不正确!");
            return false;
        }else {//校验符合要求
            // $("#email_add_input").parent().addClass("has-success");
            // $("#email_add_input").next("span").text("邮箱格式正确");

            show_validate_msg("#email_add_input", "success", "");
        }

        return true;
    }

    //这里将校验结果的提示信息全部抽取出来
    function show_validate_msg(ele, status, msg) {
        // 当一开始输入不正确的用户名之后，会变红。
        // 但是之后输入了正确的用户名却不会变绿，
        // 因为has-error和has-success状态叠加了。
        // 所以每次校验的时候都要清除当前元素的校验状态。
        $(ele).parent().removeClass("has-success has-error");
        //提示信息默认为空
        $(ele).next("span").text("");

        if("success" == status){
            //如果校验成功
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        }else if("error" == status){
            //如果校验失败
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }
//=====================判断用户名是否重复ajax请求===================================================
    $("#empName_add_input").change(function (){//绑定change事件发起ajax请求
        var empName = $("#empName_add_input").val();
        $.ajax({
            url:"checkEmpName",
            dataType:"json",
            data:{
                "empName":empName
            },
            success:function (data){
                if(data.extend.result=="用户名已存在" || data.extend.result=="用户名需为3-16位字母数字下划线或2-5位中文"){
                    show_validate_msg("#empName_add_input","error",data.extend.result)
                    $("#emp_add_btn").attr("ajax-va","error");
                }
                if(data.extend.result=="用户名可用"){
                    show_validate_msg("#empName_add_input","success","用户名可用")
                    $("#emp_add_btn").attr("ajax-va","success");
                }

            }
        })
    })





//====================发起ajax请求 保存新增数据===================================================
    //给模态窗新增按钮绑定单击事件发送ajax请求
    $("#emp_add_btn").click(function (){
        //1.先对要提交给服务器的数据进行校验
        if(!validate_add_from()){
            return false;
        }
        //判断ajax请求的用户名是否可用 如果可用
        if($(this).attr("ajax-va")=="error"){
            return false;
        }
        //2.新增模态窗中提交表单发送ajax请求
        //获取请求参数 alert($("#empAddModal form").serialize());
        $.ajax({
            url:"emp",
            type:"POST",//get请求会乱码
            dataType:"json",
            data:$("#empAddModal form").serialize(),
            success:function (data){
                // alert(data.msg);

                //JSR303校验
                if(data.code == 200){//校验成功
                    //新增成功需
                    // 1.关闭新增模态窗
                    $("#empAddModal").modal('hide');
                    // 2.来到列表的最后一页查看新增的数据
                    to_page(99999);//pageHelper可以传入一个大于总页码的数就默认是最后一页
                }else{//后端校验失败
                    //显示失败信息
                    if(undefined != data.extend.errorFields.email){
                        //显示邮箱错误信息
                        show_validate_msg("#email_add_input","error",data.extend.errorFields.email)
                    }
                    if(undefined != data.extend.errorFields.empName){
                        //显示名字错误信息
                        show_validate_msg("#empName_add_input","error",data.extend.errorFields.empName)
                    }
                }




            }

        })
    })











</script>


</body>
</html>
