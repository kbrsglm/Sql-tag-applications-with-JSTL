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
	<h2>Sql Update islemleri</h2>
	<sql:setDataSource var="veriKaynagi" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/firmaveritabani" user="root"
		password="Kubra_saglam36" />

	<sql:query dataSource="${veriKaynagi }" sql="SELECT * FROM personel;"
		var="sorgu" />



	<table border="1" width="500">

		<thead>
			<tr>
				<th>PersonelBilgileri</th>
			</tr>
		</thead>

		<tr>
			<th>Bu sayfadan diğer sayfaya değer gönderme..</th>
		</tr>
		<tr>
			<td>
				<form action="ornek5Cevap.jsp">
					<strong>Personel ADI soyadı</strong> <select name="adiSoyadi">
						<c:forEach var="deger" items="${sorgu.rows }">
							<option value="${deger.idpersonel }">
								${deger.personeladi} ${deger.personelsoyadi }</option>
						</c:forEach>
					</select> <input type="submit" value="Gonder" name="gonder">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>