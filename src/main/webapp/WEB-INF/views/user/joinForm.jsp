<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/mysite/assets/css/mysite.css" rel="stylesheet" type="text/css">
<link href="/mysite/assets/css/user.css" rel="stylesheet" type="text/css">
<!-- 서버  통신 연결용 -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

</head>

<body>
	<div id="wrap">

		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>

		<div id="container" class="clearfix">
			<div id="aside">
				<h2>회원</h2>
				<ul>
					<li>회원정보</li>
					<li>로그인</li>
					<li>회원가입</li>
				</ul>
			</div>
			<!-- //aside -->

			<div id="content">
			
				<div id="content-head">
					<h3>회원가입</h3>
					<div id="location">
						<ul>
							<li>홈</li>
							<li>회원</li>
							<li class="last">회원가입</li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<!-- //content-head -->
	
				<div id="user">
					<div id="joinForm">
						<form action="/mysite/joinUser" method="get">
	
							<!-- 아이디 -->
							<div class="form-group">
								<label class="form-text" for="input-uid">아이디</label> 
								<input type="text" id="input-uid" name="id" value="" placeholder="아이디를 입력하세요">
								<button type="button" id="btnIdCheck">중복체크</button>
							</div>
							<div id="message"></div>
	
							<!-- 비밀번호 -->
							<div class="form-group">
								<label class="form-text" for="input-pass">패스워드</label> 
								<input type="text" id="input-pass" name="pw" value="" placeholder="비밀번호를 입력하세요"	>
							</div>
	
							<!-- 이메일 -->
							<div class="form-group">
								<label class="form-text" for="input-name">이름</label> 
								<input type="text" id="input-name" name="name" value="" placeholder="이름을 입력하세요">
							</div>
	
							<!-- //나이 -->
							<div class="form-group">
								<span class="form-text">성별</span> 
								
								<label for="rdo-male">남</label> 
								<input type="radio" id="rdo-male" name="gender" value="male" > 
								
								<label for="rdo-female">여</label> 
								<input type="radio" id="rdo-female" name="gender" value="female" > 
	
							</div>
	
							<!-- 약관동의 -->
							<div class="form-group">
								<span class="form-text">약관동의</span> 
								
								<input type="checkbox" id="chk-agree" value="" name="">
								<label for="chk-agree">서비스 약관에 동의합니다.</label> 
							</div>
							
							<!-- 버튼영역 -->
							<div class="button-area">
								<button type="submit" id="btn-submit">회원가입</button>
							</div>
							
						</form>
					</div>
					<!-- //joinForm -->
				</div>
				<!-- //user -->
			</div>
			<!-- //content  -->
		</div>
		<!-- //container  -->
		
		<!-- //footer -->
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

	</div>
	<!-- //wrap -->
	
	
	
	
	<script>
	
	//화면 로딩 될때 돔트리 완료되었을떄 이벤트 등록	
	document.addEventListener('DOMContentLoaded', function () {
		
		console.log('드개좌~');
		
		let btnIdCheck = document.querySelector('#btnIdCheck');
		console.log(btnIdCheck);
		
		btnIdCheck.addEventListener( 'click', function () {
			
			console.log('클릭');
			
			//데이터 수집
			//<input type="text" id="input-uid" name="id" value="" placeholder="아이디를 입력하세요">
			let txtIdTag = document.querySelector('#input-uid');
			//console.log(txtIdTag.value);
			let id = txtIdTag.value;
			
			/*
			let userVo = {
					id: id
			};*/
			
			
			
			//요청 통신
			axios({

				method: 'get', // put, post, delete
				url: '${pageContext.request.contextPath}/api/user/idcheck',
				headers: {"Content-Type" : "application/json; charset=utf-8"}, //전송타입
				params: { id: id }, //get방식 파라미터로 값이 전달
				//data: guestbookVo, //put, post, delete 방식 자동으로 JSON으로 변환 전달

				responseType: 'json' //수신타입

			}).then(function (response) {

				//console.log(response); //수신데이타 전체 데이터
				console.log(response.data); //내가 보낸 데이터
				
				let can = response.data;
				let messageTag = document.querySelector('#message');
				
				//그리기
				
				if ( can == true ) {
					messageTag.txtContent = '사용할 수 있는 아이디입니다.';
					messageTag.style.color= '#0000ff';
				} else {
					messageTag.txtContent = '이미 사용중인 아이디입니다.';
					messageTag.style.color= '#ff0000';
				}
				
				
				
				
				
				
				

			}).catch(function (error) {

				console.log(error);

			});
			
			
				//화면 그리기
				
				
			
			//
			
			
		} );
		
		
		
		
		
		
	});
	
	
	</script>
	
	
	
	

</body>

</html>