<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath}/assets/css/mysite.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/guestbook.css" rel="stylesheet" type="text/css">
<!-- 서버  통신 연결용 -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

</head>

<body>
	<div id="wrap">

		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>

	
		<div id="container" class="clearfix">
			<div id="aside">
				<h2>방명록</h2>
				<ul>
					<li>일반방명록</li>
					<li>ajax방명록</li>
				</ul>
			</div>
			<!-- //aside -->

			<div id="content">
				
				<div id="content-head" class="clearfix">
					<h3>일반방명록</h3>
					<div id="location">
						<ul>
							<li>홈</li>
							<li>방명록</li>
							<li class="last">일반방명록</li>
						</ul>
					</div>
				</div>
				<!-- //content-head -->
				
				
				
				
				
				
				

				<div id="guestbook">
				
				
					<form id="guestbookForm" action="${pageContext.request.contextPath}/api/guestbook/write" method="">
						<table id="guestAdd">
							<colgroup>
								<col style="width: 70px;">
								<col>
								<col style="width: 70px;">
								<col>
							</colgroup>
							<tbody>
								<tr>
									<th><label class="form-text" for="input-uname">이름</label></th>
									<td><input id="input-uname" type="text" name="name" value=""></td>
									<th><label class="form-text" for="input-pass">패스워드</label></th>
									<td><input id="input-pass"type="password" name="pass" value=""></td>
								</tr>
								<tr>
									<td colspan="4"><textarea name="content" cols="72" rows="5"></textarea></td>
								</tr>
								<tr class="button-area">
									<td colspan="4" class="text-center"><button type="submit">등록</button></td>
								</tr>
							</tbody>
							
						</table>

						<!-- //guestWrite -->
						<input type="hidden" name="action" value="add">
						
					</form>	
					
					
					
					
					
					
					<!-- 수듄 리스트 -->
					
					<div id="guestbookListArea">
						<!-- afterbegin(시작후) -->
					</div>
					
					<!-- /수듄 리스트 -->
									
					
				</div>
				<!-- //guestbook -->
			
			</div>
			<!-- //content  -->
		</div>
		<!-- //container  -->

		<!-- //footer -->
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		
	</div>
	<!-- //wrap -->
	
	
	
	
	<script>
		//화면 로딩 될때
		document.addEventListener('DOMContentLoaded', function () {
			
			console.log('드개좌~');
			
			//서버로 데이터 요청
			axios({
	
			//요청할때
				method: 'get', // put, post, delete
				url: '${pageContext.request.contextPath}/api/guestbook/list', //어디로 전송할지 주소값 저장하는데 데이터만 받아옴 화면말고
				headers: {"Content-Type" : "application/json; charset=utf-8"}, //전송타입
				//params: guestbookVo, //get방식 파라미터로 값이 전달    //지금은 안써서 주석처리
				//data: guestbookVo, //put, post, delete 방식 자동으로 JSON으로 변환 전달  //지금은 안써서 주석처리
			
			//응답 받을때
				responseType: 'json' //수신타입
				

			}).then(function (response) {

				console.log(response.data); //수신데이타
				
				//let listArea = document.querySelector('#guestbookListArea');
				//console.log(listArea);
				
				for ( let i = 0 ; i < response.data.length ; i++ ) {
					//console.log(response.data[i].name);
					
					//let str = response.data[i].name + ", " + response.data[i].regDate + "<br>"
					
					//listArea.insertAdjacentHTML('afterbegin', str);
					
					let guestbookVo = response.data[i]
					render(guestbookVo);
					
				}
				

			}).catch(function (error) {

				console.log(error);
				

			});
			
			
			
			//전송버튼(form, submit) 클릭했을때
			let guestbookForm = document.querySelector('#guestbookForm');
			
			guestbookForm.addEventListener('submit', function (event) {
				
				
				event.preventDefault();
				console.log('전송');
				
				
				//폼의 데이터 수집(이름 패스워드 본문)
				
				let name = document.querySelector('#input-uname').value; //공부차원에서 id로 가져옴
				//console.log(name);
				
				let password = document.querySelector('[name="pass"]').value; //일관성있게 속성값으로 찾기
				//console.log(password);
				
				let content = document.querySelector('[name="content"]').value;
				//console.log(content);
				
				let guestbookVo = {
					name: name,
					password: password,
					content: content
						
				}
				//console.log(guestbookVo);
				
				
				
				axios({

					method: 'get', // put, post, delete
					url: '${pageContext.request.contextPath}/api/guestbook/write',
					headers: {"Content-Type" : "application/json; charset=utf-8"}, //전송타입
					params: guestbookVo, //get방식 파라미터로 값이 전달
					//data: guestbookVo, //put, post, delete 방식 자동으로 JSON으로 변환 전달

					responseType: 'json' //수신타입

				}).then(function (response) {

					console.log(response); //수신데이타

				}).catch(function (error) {

					console.log(error);

				});
				
				
				
				
				
				
				
				
			}); 
			
		
			
		});
		
		

		
		
		
		//그리기
		function render (guestbookVo) {
			
			
			let listArea = document.querySelector('#guestbookListArea');
			
			
			let str = '';
			
			str += '<table class="guestRead">';
			str += '	<colgroup>';
			str += '		<col style="width: 10%;">';
			str += '		<col style="width: 40%;">';
			str += '		<col style="width: 40%;">';
			str += '		<col style="width: 10%;">';
			str += '	</colgroup>';
			str += '	<tr>';
			str += '		<td>'+guestbookVo.no+'</td>';
			str += '		<td>'+guestbookVo.name+'</td>';
			str += '		<td>'+guestbookVo.regDate+'</td>';
			str += '		<td><a href="">[삭제]</a></td>';
			str += '	</tr>';
			str += '	<tr>';
			str += '		<td colspan=4 class="text-left">'+guestbookVo.content+'</td>';
			str += '	</tr>';
			str += '</table>';
			
			listArea.insertAdjacentHTML('beforeend', str);
				
			
		};
		
		
		
		
	
	</script>
	
	
	

</body>

</html>