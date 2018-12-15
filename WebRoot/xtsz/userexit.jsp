<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<HTML>
<head>
<%
   //session.removeAttribute("username");
   session.invalidate();
%>
<style type="text/css">      
     body{      
        background-image: url(../images/blank2.jpg);      
        background-size:cover;   
        margin:0;
        
     }     
</style>
<script language="javascript">
  window.top.location.href="../index.jsp"
</script>
</head>
<body>
</body>

</HTML>

