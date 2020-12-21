<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="java.io.*,java.util.*,java.sql.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SQL de update islemleri</title>
</head>
<body>
<h2>Sql Update islemleri</h2>
<sql:setDataSource var="veriKaynagi"
                     driver="com.mysql.jdbc.Driver"
                     url="jdbc:mysql://localhost:3306/firmaveritabani"
                      user="root"
                     password="Kubra_saglam36"/>

 <sql:query dataSource="${veriKaynagi }" sql="SELECT * FROM personel;" var="sorgu"/>
 <table border="1" width="500">
 <tr>
 <th>ID</th>
 <th>ADI</th>
 <th>SOYADI</th>
 <th>MAAŞI</th>
 </tr>
 
 <c:forEach var="satir" items="${sorgu.rows }" >
 <tr>
  <td><c:out value="${satir.idpersonel }"></c:out></td>
  <td><c:out value="${satir.personeladi }"></c:out></td>
  <td><c:out value="${satir.personelsoyadi }"></c:out></td>
  <td><c:out value="${satir.personelmaasi }"></c:out></td>
 </c:forEach>
 </tr>
 </table>

 
</body>
</html>