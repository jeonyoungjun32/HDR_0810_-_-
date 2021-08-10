<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 회원&예매 관리 프로그램</title>
</head>
<script type="text/javascript">
function check() {
		if (!f.me_id.value) { /* 회원아이디가 입력되지 않았으면 포커스(focus)하고 return false를 돌려준다 */
			//아이디와 패스워드 값 데이터 정규화 공식
			const regIDPass = /^[a-zA-Z0-9]{4,12}$/;  //4자리 부터 최대12자리 까지

			
			//이름 정규화 공식
			const regName = /^[가-힝a-zA-z]{2,}$/; //2자리부터해서 무제한
			
			//전화번호 정규화 공식
			const regTel = /^\d{3}-\d(3,4)-\d{4}$/;  //숫자만 들어올수있다
			
			
			//회원아이디 유효성 검사
			alert("회원아이디를 입력해주세요");
			f.me_id.focus();
			return false;
		}
		/*
		입력한 데이터를 검사하는 tset()
		입력한 값이 정규화 데이터를 사용했다면  true를 반환해서 호출된 곳으로 리턴됨
		*/
		else if(!regIDPass.test(f.me_id.value)){ 
			alert("아이디를 4~12자리의 대소문자와 숫자로만 입력가능합니다");
			return f.me_id.select();
		}
		
		
		
		//회원비밀번호 유효성 검사
		if(!f.me_pass.value){
			alert("회원비밀번호를 입력해주세요");
			return f.me_pass.focus();
		}else if (!regIDPass.test(f.me_pass.value)) {
			alert("비밀번호는 4~12자리의 대소만자와 숫자로만 가능합니다.")
			return f.me_pass.select();
		}
		
		
		
		//회원이름 유호성 감사
		if(!f.me_name.value){
			alert("회원이름를 입력해주세요");
			return f.me_name.focus();
		}else if (!regName.test(f.me_name.value)) { // 이름에 특수문자가 들어가면 
			alert("이름이 잘못 입력되었습니다")
			return f.me_name.select();
		}
		
		
		
		
		if(!f.gender[0].checked == false && f.gender[1].checked == false){
			alert("성별을 입력해주세요");
			return f.gender.focus();
		}
		if(!f.birth.value){
			alert("회원비밀번호를 입력해주세요");
			return f.birth.focus();
		}
		if(!f.address.value){
			alert("회원비밀번호를 입력해주세요");
			return f.address.focus();
		}
		if(!f.tel.value){
			alert("전화번호를 입력해주세요");
			return f.tel.focus();
		}else if (!regTel.test(f.tel.value)) { // 이름에 특수문자가 들어가면 
			alert("이름이 잘못 입력되었습니다")
			return f.tel.select();
		}
		
		
		f.submit();
}
function rewrite() {
	f.reset();
	f.me_id.focos();
}
</script>


<body>



	<%@ include file="header_3.jsp"%>
	<section>
		<div>
			<h2>회원등록</h2>
		</div>

	<form action="insertPro_9.jsp" method="post" name="f">

	<table border="1" width="600" style="margin: 0 auto">

	<tr>
		<th>회원아이디</th>
		<td><input type="text" name="me_id" value="" size="10" maxlength="12">
			&nbsp; 4 ~ 12자의 영문 대소문자로 숫자로만 입력</td>
	</tr>

	<tr>
		<th>회원비밀번호</th>
		<td><input type="password" name="me_pass" value="" size="11" maxlength="15">
			&nbsp; 4 ~ 12자의 영문 대소문자로 숫자로만 입력</td>
	</tr>

	<tr>
		<th>회원이름</th>
		<td><input type="text" name="me_name" value="" size="10" maxlength="20"></td>
	</tr>

	<tr>
		<th>성별</th>
		<td>
		&nbsp;&nbsp;<label><input type="radio" name="gender" value="M" >남</label>
		&nbsp;&nbsp;<label><input type="radio" name="gender" value="F" >여</label>
		</td>
	</tr>

	<tr>
		<th>생년월일</th>
		<td><input type="text" name="birth" value="" size="10"maxlength="10">(예)1999-10-10</td>
	</tr>

	<tr>
		<th>주소</th>
		<td><input type="text" name="address" value="" size="40"maxlength="100"></td>
	</tr>

	<tr>
		<th>전화번호</th>
		<td><input type="text" name="tel" value="" size="20"maxlength="13">(예)010-1234-5678</td>
	</tr>


	<tr>
		<th colspan="2">
			<input type="submit" values="회원등록" size="5" onclick="check(); return false">
			<input type="button" values="다시쓰기" size="5" onclick="rewrite()">
		</th>	
	</tr>

	</table>
	
	</form>
	
</section>
 <%@ include file= "footer_4.jsp"%>  
</body>
</html>