<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.io.*,java.sql.*"%>
<%@ page import="org.json.* " %>
<jsp:useBean id="rst" scope="page" class="com.infinity.dbconn.DBConn"/>
<%
	String SqlStr = "select * from tb_user";
	ResultSet rs = rst.getResult(SqlStr);
	
   // json数组  
   JSONArray array = new JSONArray();  
    
   // 获取列数  
   ResultSetMetaData metaData = rs.getMetaData();  
   int columnCount = metaData.getColumnCount();  
   int rowCount=0;
    
   // 遍历ResultSet中的每条数据  
    while (rs.next()) {  
        JSONObject jsonObj = new JSONObject();  
         rowCount ++;
        // 遍历每一列  
        for (int i = 1; i <= columnCount; i++) {  
            String columnName =metaData.getColumnLabel(i);  
            String value = rs.getString(columnName);  
            jsonObj.put(columnName, value);  
        }   
        array.put(jsonObj);   
    }  
    
    String datahead = " {\"code\":0,\"msg\":\"\",\"count\":"+ rowCount +",\"data\": ";
    out.print(datahead);
    out.print(array.toString());
    out.print("}");
 
%>
