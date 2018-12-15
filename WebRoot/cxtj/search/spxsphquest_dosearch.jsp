<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*,java.io.*"%>
<jsp:useBean id="qu" scope="page" class="com.infinity.info.QuestString"/>
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>
<html>
	<title>商品销售排行</title>
	<meta charset="UTF-8">
	<link href="../../CSS/style.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="../../layui/css/layui.css " media="all">
	<link href="../../CSS/bootstrap.min.css" rel="stylesheet" type="text/css"/>

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
		text-align:center;
		}
	 </style>

<body>
<table style="width:97% ;margin-left:10;border-width:2;border-color:#666"  class="table table-bordered">
  <tr bgcolor="#dddddd">
     <td width="55" bgcolor="#E9F2F6">
       <div align="center">商品编号</font></div>    </td>
     <td width="88" bgcolor="#E9F2F6">
       <div align="center">商品名称</font></div>    </td>
     <td width="52" bgcolor="#E9F2F6">
       <div align="center">产地</font></div>    </td>
     <td width="71" bgcolor="#E9F2F6">
       <div align="center">规格</font></div>    </td>
     <td width="74" bgcolor="#E9F2F6">
       <div align="center">包装</font></div>    </td>
     <td width="72" bgcolor="#E9F2F6">
       <div align="center">数量</font></div>    </td>
     <td width="72" bgcolor="#E9F2F6">
       <div align="center">金额</font></div>    </td>
</tr>
<%
   request.setCharacterEncoding("UTF-8");
   String table="tb_sell"; String httpFile="spxsphquest_dosearch.jsp";
   String date="xsdate";
   String pages=request.getParameter("pages");
   String sdate=request.getParameter("sdate");
   String edate=request.getParameter("edate");
   String orderby=request.getParameter("orderby");
   String paixu=request.getParameter("paixu");
   qu.setSdate(sdate);qu.setEdate(edate);
   qu.setOrderby(orderby);qu.setPaixu(paixu);
   qu.setPageSize(10);
   String strCount=qu.getOrderCount(table,date);
   if(pages==null||pages.equals("")){
     pages="0";
   }
   qu.setQuerySql(httpFile,pages,strCount);
   ResultSet rs=rst.getResult((String)qu.getOrderString(table,date));
   int i=0,Page=qu.getCurPage(),pagesize=qu.getPageSize();
   while(rs.next()){
     if(i>(Page-1)*pagesize-1){
%>
   <tr>
     <td width="75" bgcolor="#E9F2F6">
     <%=rs.getString("spid")%>     </td>
     <td width="88" bgcolor="#E9F2F6">
     <%=rs.getString("spname")%> </td>
     <td width="52" bgcolor="#E9F2F6">
     <%=rs.getString("cd")%>     </td>
     <td width="50" bgcolor="#E9F2F6">
     <%=rs.getString("gg")%>  </td>
     <td width="50" bgcolor="#E9F2F6">
     <%=rs.getString("bz")%></td>
     <td width="72" bgcolor="#E9F2F6">
     <%=rs.getString("sl")%>(<%=rs.getString("dw")%>)    </td>
     <td width="72" bgcolor="#E9F2F6">
    <%=rs.getString("je")%>    </td>
    
   </tr>
   
<%
}i++;}
   rs.close();
   String str_parameter="&sdate="+qu.getSdate()+"&edate="+qu.getEdate()+
                      "&orderby="+qu.getOrderby()+"&paixu="+qu.getPaixu();
   //session.setAttribute("str_parameter",str_parameter);
   qu.setStr_parameter(str_parameter);
%>

</table>
<%=qu.pageFooter()%>

</body>
</html>

