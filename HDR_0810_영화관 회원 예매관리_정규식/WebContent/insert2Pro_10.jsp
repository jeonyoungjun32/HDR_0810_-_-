<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbcon_2.jsp"%>
<%
//회원아이디와 비밀번호를 확인하여 회원이면  insert
try{
	String[] mo_name = request.getParameterValues("mo_name");
	
	sql = "select me_pass from movie_1 where me_id=?";
	ps = con.prepareStatement(sql);
	ps.setString(1, request.getParameter("me_id"));
	rs=ps.executeQuery();
	
	String dbpasswd = "";
	if(rs.next()){
		dbpasswd = rs.getString("me_pass");//테이블 안에있는 비밀번호 = 진짜비밀번호
		
		//진짜 비번과 요청된 비번을 비교하고 맞으면 실행 		
		if(dbpasswd.equals(request.getParameter("me_pass"))){//비밀번호 인증 하는중임
		for(int i=0; i<mo_name.length; i++){
			sql="insert into movie_2 values(?,?,?,?)";
			
			ps = con.prepareStatement(sql);
			
			ps.setString(1, request.getParameter("me_id"));
			ps.setString(2, request.getParameter("me_pass"));
			ps.setString(3, mo_name[i]);
			ps.setString(4, request.getParameter("rm_date"));
			
			ps.executeUpdate();
			}
			%>
			<script>
				alert("영화예메가 완료되었습니다.");
				location = "insert2_8.jsp";
			</script>
			<%}//안족 if문
		else{//비번이 틀리면
			%>
				<script>
				alert("비밀번호가 틀렸습니다.");
				history.back();
				</script>
			<%
		}
} //바깥쪽 if문 
	else{%>
	<script>
		alert("아이디가 틀렸습니다");
		history.back();
	</script>
<% 	
}
		}catch(Exception e){
			%>
<script>
	alert("영화예매가 완료되지않았습니다.");
	history.back();
</script>
<%
}finally{
	try{
		if(con != null) con.close();
		if(stmt != null) stmt.close();
		if(ps != null) ps.close();
		if(rs != null) rs.close();
	}catch(Exception e){
		e.printStackTrace();
	}
}
%>