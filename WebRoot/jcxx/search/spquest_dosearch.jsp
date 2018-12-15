<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.io.*,java.sql.*"%>

<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>
<jsp:useBean id="qu" scope="page" class="com.infinity.info.QuestString"/>
<jsp:useBean id="trans" scope="page" class="com.infinity.chinese.ToChinese"/>
<html>
<head>
	<meta charset="UTF-8">
	<title>商品查询</title>	

    <link href="../../CSS/style.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="../../layui/css/layui.css " media="all">
    <link href="../../CSS/bootstrap.min.css" rel="stylesheet" type="text/css" />
    
    <style>
    	body {
		background-image: url(../../images/blank2.jpg); 
		background-size:cover;  
		margin:0;
		}
		.form-control{
			display:inline-block;
			width:40;
		}
		.input-sm{
			height:20px;
			margin-left:5;
			margin-right:5;
		}
		#td1{
		text-align:right;
		}
 	</style>
 	
</head>
<body>
<%
   request.setCharacterEncoding("UTF-8");
   String table="tb_brand";//设置所要查询的表名；
   String httpFile="spquest_dosearch.jsp";//设置处理请求的JSP文件
   String pages=request.getParameter("pages");//接收当前是第几页
   String qvalue = request.getParameter("qvalue");
   String cif=request.getParameter("cif");//保存查询字段	
   String ccif=request.getParameter("ccif");//保存查询运算符
   //查询关键字，并将其值通过中文处理，即用户输入中文可以正确识别
   //qvalue=trans.trans(request.getParameter("qvalue"));
   
   //向QuestString中设置属性值
   qu.setCcif(ccif);qu.setCif(cif);qu.setQValue(qvalue);
   //调用QuestString的getCount(String table)方法，并根据查询条件得出所要查询记录的总数量
   String strCount=qu.getCount(table);
   //判断pages是否为null,如果为null将pages的值设为"0"
   if(pages==null||pages.equals("null")){
     pages="0";
   }
   //调用QuestString的setQuerySql()方法来设置Bean中的属性
   qu.setQuerySql(httpFile,pages,strCount);
   //调用QuestString的getString()方法来获得可执行的SQL语句，并获得ResultSet
   ResultSet rs=rst.getResult((String)qu.getString(table));
   //从QuestString中取出当前页和每页显示的记录数
   int i=0,Page=qu.getCurPage(),pagesize=qu.getPageSize();
   while(rs.next()){
     //定义整型变量i用来将记录指针定位到待显示页的第一条记录上
    if(i>(Page-1)*pagesize-1){ 
%>
<!--通过循环将检索出来的记录通过表格形式在客户端显示出来-->
<table style="width:97% ;margin-left:10;border-width:2;border-color:#666"  class="table table-bordered" >
  <tr>
    <td width="202" height="27" bgcolor="#E9F2F6">商品编号:
      <%=rs.getString("ID")%></td>
    <td width="185" bgcolor="#E9F2F6">规格:
      <%=rs.getString("gg")%></td>
    <td width="195" bgcolor="#E9F2F6">简称:
      <%=rs.getString("jc")%></td>
  </tr>
  <tr>
    <td width="202" height="27" bgcolor="#E9F2F6">商品名称：
      <%=rs.getString("spname")%></td>
    <td width="202" bgcolor="#E9F2F6">包装:
      <%=rs.getString("bz")%></td>
    <td width="202" bgcolor="#E9F2F6">产地:
      <%=rs.getString("cd")%></td>
  </tr>
  <tr>
    <td width="202" height="27" bgcolor="#E9F2F6">批号:
      <%=rs.getString("ph")%></td>
    <td width="202" bgcolor="#E9F2F6">供应商全称:
      <%=rs.getString("gysname")%></td>
    <td width="202" bgcolor="#E9F2F6">计量单位:
      <%=rs.getString("dw")%></td>
  </tr>
  <tr>
    <td  bgcolor="#E9F2F6">批准文号:
      <%=rs.getString("pzwh")%></td>
    <td colspan="2"  bgcolor="#E9F2F6">备注:
      <%=rs.getString("memo")%></td>
  </tr>
  
  <tr>
  	<td width="202" height="26" bgcolor="#E9F2F6">商品编号:
      <%=rs.getString("ID")%></td>
    <td bgcolor="#E9F2F6">
      </td>
    <td width="202" bgcolor="#E9F2F6" id="td1">
    	 <button class="layui-btn layui-btn-sm layui-btn-normal" name="<%=rs.getString("ID")%>" onClick="DeleteData(this)">
    	 	<i class="layui-icon"></i> 删除
    	 </button>
    </td>
  </tr>
</table>
<br>
<%}i++;}
rs.close();
String str_parameter="&cif="+qu.getCif()+"&ccif="+qu.getCcif()+"&qvalue="+qu.getQValue()+"";
//设置分页栏中连接标签<a>的参数
qu.setStr_parameter(str_parameter);
%>
<!--读取分页拦-->
<%=qu.pageFooter()%>

</body>
</html>

<script src="../../layui/layui.js" charset="utf-8"></script>
<script type="text/javascript">
layui.use(['layer', 'form'], function(){
  var layer = layui.layer
  ,form = layui.form;
  
  form.on('select(rkspname)', function(){
 	 form1.submit();
  });    
});

function DeleteData(input){
    var dataid = input.name;
    var DeleteSql = "delete  from tb_brand where ID = '"+dataid+"'";
    showcheck(DeleteSql);
    
    //alert(DeleteSql);
}



function showcheck(DeleteSql){
	layer.confirm('确定要删除该条记录吗？', {
  	btn: ['确定','取消'] //按钮
	}, function(){
  		window.location.href='../delete/jcxxdelete.jsp?DeleteSql='+ DeleteSql; 
	}, function(){
  		
	});
}


</script>