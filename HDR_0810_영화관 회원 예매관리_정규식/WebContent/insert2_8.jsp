<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	function check(){
		if(!f.me_id.value){
			alert("회원아이디를 입력해주세요")
			return f.me_id.focus();
		}
		if(!f.me_pass.value){
			alert("회원비밀번호를 입력해주세요.")
			return f.me_pass.focus();
		}
		if(!f.mo_name.value){
			alert("영화제목을 선택해주세요.")
			return f.mo_name.focus();
		}
		if(!f.rm_date.value){
			alert("예매일시를 입력해주세요.")
			return f.rm_date.focus();
		}
		f.submit();
	}

	
</script>
<body>
<%@ include file = "header_3.jsp" %>
<%
	sql = "select to_char(sysdate,'yyyy-mm-dd') as rm_date from dual";
	rs = stmt.executeQuery(sql);//sql을 DBMS로 넘겨서 컴파일함->속도 느림
	rs.next();
    String rm_date = rs.getString("rm_date");
	
	
	sql = "select mo_name from movie_3";
	rs = stmt.executeQuery(sql);
	if(!rs.next()){
		//out.print("등록된 영화가 없습니다"); //이건 콘솔에 출력함
%>		
		<script>
			alert("등록된 영화가 없습니다.")
		</script>
	<%
	}
	
	%>
<section>
	<div>
		<h2>영화 예매</h2>
	</div>
	<form action="insert2Pro_10.jsp" name = "f" method="post">
		<table border = "1" width ="700" style = "margin : 0 auto">
		<tr>
			<th>회원아이디</th>
			<td>
				<input type="text" name="me_id" value="" size="10" maxlength="20" >
			</td>
		</tr>
		<tr>
			<th>회원비밀번호</th>
			<td>
				<input type="password" name ="me_pass" value ="" size="11" maxlength="20">
			</td>
		</tr>
		<tr>
			<th>영화제목</th>
			<td>
				<select name="mo_name" multiple>
					<option disabled="disabled">영화제목을 선택해주세요</option>
					<!-- 주의 : 반드시 do ~ while문만 사용 가능 -->
					<%
					do{
						
					%>
										
					<option value="<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
					<%
					}while(rs.next());
					%>
				</select>
			</td>
		</tr>
		<tr>
			<th>예매일시</th>
			<td>
				<input type="text" name ="tel" value ="<%=rm_date %>" size="20" maxlength="" readonly="readonly">자동입력
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="영화예매" onclick="check(); return false">
				<input type="button" value="조회" onclick = "location = 'select_11.jsp'"> 
			</th>
		</tr>
		</table>
		
	</form>
</section>
 <%@ include file = "footer_4.jsp" %> 
</body>
</html>