<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header_3.jsp"%>


	<section>
		<div>
			<h2>영화별 예매정보 조회</h2>
		</div>

		<table border="1" width="600" style="margin: 0 auto">
			<tr>
				<th>영화제목</th>
				<th>시청등급</th>
				<th>예매횟수</th>
			</tr>

			<%
			sql += "select mo_name,mo_limit,count(mo_name)";
			sql += " from movie_2 natural join movie_3";
			sql += " group by mo_name,mo_limit";
			sql += " order by 3 desc, 1 desc";

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
			%>
			<tr align="center">
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
			</tr>

			<%
				}
			%>
		</table>
	</section>
	<%@ include file="footer_4.jsp"%>
</body>
</html>