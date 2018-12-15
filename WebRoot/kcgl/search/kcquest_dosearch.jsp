<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.io.*,java.sql.*"%>
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>
<jsp:useBean id="qu" scope="page" class="com.infinity.info.QuestString"/>
<jsp:useBean id="trans" scope="page" class="com.infinity.chinese.ToChinese"/>
<html>
<head>
	<meta charset="UTF-8">
	<title>库存查询</title>	

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
   String table="tb_kucun",httpFile="kcquest_dosearch.jsp";
   String pages=request.getParameter("pages");
   String cif=request.getParameter("cif");
   String ccif=request.getParameter("ccif");
   String qvalue=trans.trans(request.getParameter("qvalue"));
   qu.setCcif(ccif);qu.setCif(cif);qu.setQValue(qvalue);
   String strCount=qu.getCount(table);
   if(pages==null||pages.equals("null")){
     pages="0";
   }
   qu.setQuerySql(httpFile,pages,strCount);
   ResultSet rs=rst.getResult((String)qu.getString(table));
   int i=0,Page=qu.getCurPage(),pagesize=qu.getPageSize();
   while(rs.next()){
     if(i>(Page-1)*pagesize-1){
%>

<table style="width:97% ;margin-left:10;border-width:2;border-color:#666"  class="table table-bordered" >
  <tr>
    <td width="202" height="29" bgcolor="#E9F2F6">商品名称:
      <%=rs.getString("spname")%></td>
    <td width="195" bgcolor="#E9F2F6">简称:
      <%=rs.getString("jc")%></td>
    <td width="202" bgcolor="#E9F2F6">产地:
      <%=rs.getString("cd")%></td>
  </tr>
  <tr>
    <td width="185" height="29" bgcolor="#E9F2F6">规格:
      <%=rs.getString("gg")%></td>
    <td width="202" bgcolor="#E9F2F6">包装:
      <%=rs.getString("bz")%></td>
    <td width="202" bgcolor="#E9F2F6">计量单位:
      <%=rs.getString("dw")%></td>
  </tr>
  <tr>
    <td width="202" height="26" bgcolor="#E9F2F6">单价:
      <%=rs.getString("dj")%></td>
    <td width="202" bgcolor="#E9F2F6">库存数量:
      <%=rs.getString("kcsl")%></td>
    <td width="202" bgcolor="#E9F2F6">库存金额:
      <%=rs.getString("kcje")%></td>
  </tr>
  <tr>
    <td width="202" height="26" bgcolor="#E9F2F6">商品编号:
      <%=rs.getString("ID")%></td>
    <td width="202" bgcolor="#E9F2F6">
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
session.setAttribute("str_parameter",str_parameter);
qu.setStr_parameter(str_parameter);
%>
<%=qu.pageFooter()%>
</table>
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
    var DeleteSql = "delete  from tb_kucun where ID = '"+dataid+"'";
    showcheck(DeleteSql);
    
    //alert(DeleteSql);
}



function showcheck(DeleteSql){
	layer.confirm('确定要删除该条记录吗？', {
  	btn: ['确定','取消'] //按钮
	}, function(){
  		window.location.href='../delete/kcdatadelete.jsp?DeleteSql='+ DeleteSql; 
	}, function(){
  		
	});
}


</script>

