<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
 <%@page import="java.io.*,java.util.*,java.sql.*" %>
 <%@page import ="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sql:query etiketi</title>
</head>
<body>
<h2>SQL Query Etiketi</h2>
<sql:setDataSource var="veriKaynagi"
             driver="com.mysql.jdbc.Driver"
             url="jdbc:mysql://localhost:3306/depotakip"
             user="root"
             password="Kubra_saglam36"
/>
<sql:query dataSource="${veriKaynagi }" sql="SELECT * FROM deneme;" var="result"/>

</body>
</html>