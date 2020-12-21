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
  <td><c:out value="${satir.idpersonel}"></c:out></td>
  <td><c:out value="${satir.personeladi }"></c:out></td>
  <td><c:out value="${satir.personelsoyadi }"></c:out></td>
  <td><c:out value="${satir.personelmaasi }"></c:out></td>
 </c:forEach>
 </tr>
 </table>

<%@page import="java.util.Date,java.text.*" %>
<%Date tarih=new Date("1453/05/23");
java.util.Date zaman= new java.util.Date();
int secilenid=1;

%>
Web sayfasında görülen:<%=zaman %>

Web sayfasında görülen:<%out.println(String.valueOf(zaman)); %>


<sql:update  dataSource="${veriKaynagi}" var="veri_silme_ekleme_guncelleme">

UPDATE personel SET  personelkayittarihi=?  WHERE idpersonel=?

<sql:dateParam value="<%=tarih %>"/>
<sql:param value="<%=secilenid %>"/>

</sql:update> 

 <sql:query dataSource="${veriKaynagi }" sql="SELECT * FROM personel;" var="sorgu1"/>
 <table border="1" width="500">
 <tr>
 <th>ID</th>
 <th>ADI</th>
 <th>SOYADI</th>
 <th>MAAŞI</th>
 <th>KAYIT TARİHİ</th>
 
 </tr>
 
 <c:forEach var="satir" items="${sorgu1.rows }" >
 <tr>
  <td><c:out value="${satir.idpersonel}"></c:out></td>
  <td><c:out value="${satir.personeladi }"></c:out></td>
  <td><c:out value="${satir.personelsoyadi }"></c:out></td>
  <td><c:out value="${satir.personelmaasi }"></c:out></td>
  <td><c:out value="${satir.personelkayittarihi }"></c:out><td>
 </c:forEach>
 </tr>
 </table>






</body>
</html>