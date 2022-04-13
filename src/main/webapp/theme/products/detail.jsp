<%@ page import="com.example.demo123.enity.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% Product obj = (Product)request.getAttribute("obj"); %>

<html>
<head>
    <title>Detail</title>
</head>
<body>
<p><%=obj.getId()%></p>
<p><%=obj.getName()%></p>
<p><%=obj.getName()%></p>
<p><%=obj.getPrice()%></p>
<p><%=obj.getStatus()%></p>
</body>
</html>
