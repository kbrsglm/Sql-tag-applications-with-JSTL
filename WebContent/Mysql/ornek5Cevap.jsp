<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page import="java.io.*,java.util.*,java.sql.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Gelen değerleri alan jsp sayfası</h2>
<sql:setDataSource var="verikaynagi"
                    driver="com.mysql.jdbc.Driver"
                     url="jdbc:mysql://localhost:3306/firmaveritabani"
                     user="root"
                     password="Kubra_saglam36"/>
                     
  <sql:query dataSource ="${verikaynagi}"   var="sorgu">
  SELECT*FROM personel WHERE idpersonel=?
  <sql:param value="${param.adiSoyadi }"/>
    </sql:query> 
    
   <table border="1" >
   
   <tr>
     <c:forEach var="kolbasligi" items="${sorgu.columnNames}">
     <td><c:out value="${kolbasligi }"></c:out></td>
     </c:forEach>
     
   </tr>
      
      <c:forEach var="satir" items="${sorgu.rowsByIndex}">
           <tr>
        <c:forEach var="kolon" items="${ satir}">
       <td> <c:out value="${kolon }"></c:out></td>
        </c:forEach>
         </tr>
     </c:forEach>
      
   </table>  
<c:set var="row2"  scope="request" value="${sorgu.rows[0]}"/>
<hr>

<table border="1">
<thead>
<tr>
<th colspan="2">Personel Bilgileri</th>
</tr>
</thead>
<tr>
<td><strong>ID</strong></td>
<td>"${row2.idpersonel}"</td>
</tr>
<tr>
<td><strong>ADI SOYADI</strong></td>
<td>"${row2.personeladi} "${row2.personelsoyadi}"</td>
</tr>
<tr>
<td><strong>ID</strong></td>
<td>"${row2.personelgorevi}"</td>
</tr>
<tr>
<td><strong>EPOSTA</strong></td>
<td><a href ="mailto:${row2.personeleposta}">"${row2.personeleposta}"</a></td>
</tr>
</table>
</body>
</html>