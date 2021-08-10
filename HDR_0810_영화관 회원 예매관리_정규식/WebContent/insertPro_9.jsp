<%@page import="oracle.net.aso.p"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="dbcon_2.jsp"%>

<!-- 처리한걸 받아오는곳 -->

<%
	try {
	sql = "insert into movie_1 values(?,?,?,?,?,?,?)";
	ps = con.prepareStatement(sql);

	ps.setString(1, request.getParameter("me_id"));
	ps.setString(2, request.getParameter("me_pass"));
	ps.setString(3, request.getParameter("me_name"));
	ps.setString(4, request.getParameter("gender"));
	ps.setString(5, request.getParameter("birth"));
	ps.setString(6, request.getParameter("address"));
	ps.setString(7, request.getParameter("tel"));

	ps.executeUpdate();
%>
<script>
	alert("회원등록이 완료되었습니다");
	location = "select_11.jsp"
</script>
<%
	} catch (Exception e) {
%>
<script>
	alert("회원등록 실패 했습니다.");
	history.back();
</script>
<%
	}  finally {
	try {
		if (con != null)
	con.close();
		if (stmt != null)
	stmt.close();
		if (ps != null)
	ps.close();
		if (rs != null)
	rs.close();
	} catch (Exception e) {
		e.printStackTrace();
	}
} 
%>





