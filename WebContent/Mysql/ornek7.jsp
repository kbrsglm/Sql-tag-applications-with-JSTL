<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
  <%@page import="java.io.*,java.util.*,java.sql.*"%>
<%@page import="javax.servlet.http.*,javax.servlet.*"%>
<%@page import="java.util.Date,java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Translation işlemleri </title>
</head>
<body>
 <h2>SQL de translation İşlemleri</h2>
 <sql:setDataSource var="veriKaynagi" 
                      driver="com.mysql.jdbc.Driver"
                      url="jdbc:mysql://localhost:3306/firmaveritabani"
                      user="root"
                      password="Kubra_saglam36"/>
<sql:query dataSource="${veriKaynagi}" var="sorgu" sql="SELECT*FROM personel;">
</sql:query> 
<table border="1" width="800" >
<tr>
<th>ID</th>
<tH>ADI</th>
<th>SOYADO</th>
<th>EPOSTA</th>
<th>GOREVİ</th>
<th>MAASI</th>
<th>Kayıt Tarihi</th>

</tr>
<c:forEach var ="satir"  items="${sorgu.rowsByIndex }">
<tr>
 <c:forEach var="kolon"  items="${satir}">
  <td> <c:out value="${kolon }"></c:out></td>

 </c:forEach>
  
 </tr>
</c:forEach>
</table>
<% 
Date tarih=new Date();
SimpleDateFormat ft=new SimpleDateFormat("E yyyy.MM.dd");
 out.println("ZAMAN  BİLGİSİ :" + ft.format(tarih));
 int secilenid=4;

%>


<sql:transaction dataSource="${veriKaynagi}" >
<c:set var="parametreid" value="<%=secilenid %>"/>
<sql:update var="veri_ekleme_silme_guncelleme">

  UPDATE personel SET personeladi='kaan' , personelkayittarihi=? WHERE idpersonel=? 
  <sql:dateParam value="<%=tarih %>"/>
  <sql:param value="${parametreid }"></sql:param>
  
</sql:update>
<sql:update var="veri_ekleme_silme_guncelleme">
INSERT INTO personel(personeladi,personelsoyadi,personeleposta,personelgorevi,personelmaasi)
VALUE("Azra","Altuntaş","azr@gmail.com","Doktor",7000);

</sql:update>

<sql:update var="veri_ekleme_silme_guncelleme">

UPDATE personel SET personeladi='Umut', personelsoyadi='Karan' WHERE idpersonel=5;

</sql:update>

<sql:update var="veri_ekleme_silme_guncelleme">
DELETE FROM personel WHERE personeladi='elif'
</sql:update>

</sql:transaction>

<sql:query   dataSource="${veriKaynagi }" var="sorgu2"  sql="SELECT *FROM  personel " /> 
<table border="1" width="800" >
<tr>
<th>ID</th>
<tH>ADI</th>
<th>SOYADO</th>
<th>EPOSTA</th>
<th>GOREVİ</th>
<th>MAASI</th>
<th>Kayıt Tarihi</th>

</tr>
<c:forEach var ="satir"  items="${sorgu2.rowsByIndex }">
<tr>
 <c:forEach var="kolon"  items="${satir}">
  <td> <c:out value="${kolon }"></c:out></td>

 </c:forEach>
  
 </tr>
</c:forEach>
</table>

        
</body>
</html>