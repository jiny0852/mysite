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




<style>
/* 모달창 배경 회색부분 */
.modal {
	width: 100%; /* 가로전체 */
	height: 100%; /* 세로전체 */
	display: none; /* 시작할때 숨김처리 */
	position: fixed; /* 화면에 고정 */
	left: 0; /* 왼쪽에서 0에서 시작 */
	top: 0; /* 위쪽에서 0에서 시작 */
	z-index: 999; /* 제일위에 */
	overflow: auto; /* 내용이 많으면 스크롤 생김 */
	background-color: rgba(0, 0, 0, 0.4); /* 배경이 검정색에 반투명 */
}

/* 모달창 내용 흰색부분 */
.modal .modal-content {
	width: 400px;
	margin: 100px auto; /* 상하 100px, 좌우 가운데 */
	padding: 0px 20px 20px 20px; /* 안쪽여백 */
	background-color: #ffffff; /* 배경색 흰색 */
	border: 1px solid #888888; /* 테두리 모양 색 */
}

/* 닫기버튼 */
.modal .modal-content .closeBtn {
	text-align: right;
	color: #aaaaaa;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
	border: none;
	background-color: #ffffff;
}
</style>





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
									<td><input id="input-pass" type="password" name="pass" value=""></td>
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





					<!-- 모달 창 컨텐츠 -->
					<div id="myModal" class="modal">

						<div id="guestbook" class="modal-content">
							<button type="button" class="closeBtn">×</button>
							<div class="m-header">패스워드를 입력하세요</div>
							<div class="m-body">
								<input id="modalPw" class="m-password" type="password" name="password" value=""><br> <input id="modalNo" class="m-no" type="text" name="no" value="">
							</div>
							<div class="m-footer">
								<button id="btnDelete" class="btnDelete" type="button">삭제</button>
							</div>
						</div>

					</div>



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
			
			
			
			/////////////////리스트 가져와서 그리기///////////////////////////////////////////////
			getListRender();
			
			
			
			/////////////글 저장하고 그리기 이벤트 등록///////////////////////////////////////////////
			//전송버튼(form, submit) 클릭했을때
			let guestbookForm = document.querySelector('#guestbookForm');
			
			guestbookForm.addEventListener('submit', addRender); //addRender() 가 되면 바로 실행되버림 들어왔을떄만 실행하기 위해 한번 싼거임 뤺뤺  
			
		
			
			/////////////////모달창 띄우기 버튼 클릭이벤트 등록//////////////////////////////////////////////
			let listArea = document.querySelector('#guestbookListArea');
			
			listArea.addEventListener( 'click', callModal ); //실행하면 안됨 callModal()
			
			
			let closeBtn = document.querySelector('.closeBtn');
			closeBtn.addEventListener( 'click', closeModal );
			
			
			//"모달창에 삭제버튼 클릭할때" 이벤트 등록
			let btnDelete = document.querySelector('#btnDelete');
			console.log(btnDelete);
			btnDelete.addEventListener( 'click', deleteRemove );
			
			
			
			
			//  DOMContentLoaded 끝 //
			
		});
		// ---------------    함 수 정 의    ----------------
		
		
		/////////////////삭제(삭제 폼 아님) 메소드///////////////////////////////////////////////
		
		function deleteRemove () {
			
			console.log('삭제');
			
			//<input id="modalPw" class="m-password" type="password" name="password" value=""><br> 
			//<input id="modalNo" class="m-no" type="text" name="no" value="">
			
			//데이터 수집
			let modalPwTag = document.querySelector('#modalPw');
			let modalNoTag = document.querySelector('#modalNo');
			
			let password = modalPwTag.value;
			let no = modalNoTag.value;
			
			let guestbookVo = {
					no: no,
					password: password
					
			};
			
			console.log(guestbookVo);
			
			
			//db삭제
			
			axios({

				method: 'get', // put, post, delete
				url: '${pageContext.request.contextPath}/api/guestbook/remove',
				headers: {"Content-Type" : "application/json; charset=utf-8"}, //전송타입
				params: guestbookVo, //get방식 파라미터로 값이 전달
				//data: guestbookVo, //put, post, delete 방식 자동으로 JSON으로 변환 전달

				responseType: 'json' //수신타입

			}).then(function (response) {

				console.log(response); //수신데이타 전체 데이터
				console.log(response.data); //내가 보낸 데이터
				
				if ( response.data == 1 ) {
					
					//화면에서 지우기
					let delId = '#t-' + no;
					let removeTable = document.querySelector('#delId');
					console.log(removeTable);
					removeTable.remove();
					
					closeModal();
					
					
				} else {
					
					alert('비밀번호를 확인하세요');
					
				}
				
				

			}).catch(function (error) {

				console.log(error);

			});
			
			
			
			//화면에서 제거
			
			
		};
		
		/////////////////삭제 메소드///////////////////////////////////////////////
		
		
		
		
		/////////////////모달 닫기 메소드///////////////////////////////////////////////
		function  closeModal (  ) {
			console.log('모달창 닫기');
				
			//모달창 보이게 처리 (display: block;)
			let modalTag = document.querySelector('#myModal');
			modalTag.style.display = 'none';
		};
				
		/////////////////모달 닫기 메소드///////////////////////////////////////////////
		
		
		
		
		/////////////////콜 모달///////////////////////////////////////////////
		
		//모달창 보이기 메소드
		function callModal( event ) {
			
			//console.log('클릭');	
			
			//console.log(this); //지역
			//console.log(event.target); //이벤트 걸린놈
		
			//console.log(event.target.tagName);
			
			if (event.target.tagName == 'BUTTON'){
				console.log('클릭');
				
				//버튼안에 태그에서 data-no값 가져오기
				let no = event.target.dataset.no;
				console.log(no);
				
				//모달 창의 input의 value = no
				let txtNoTag = document.querySelector('#modalNo');
				txtNoTag.value = no;
													
				//모달창 보이게 처리 (display: block;)
				let modalTag = document.querySelector('#myModal');
				modalTag.style.display = 'block';
									
			} 
			
		};
		
		/////////////////콜 모달///////////////////////////////////////////////
		
		
		
		
		/////////////////글 저장///////////////////////////////////////////////
		function addRender(event) {
			
			
			event.preventDefault();
			console.log('전송');
			
			
			//폼의 데이터 수집(이름 패스워드 본문)
			
			let name = document.querySelector('#input-uname').value; //공부차원에서 id로 가져옴
			//console.log(name);
			
			let password = document.querySelector('[name="pass"]').value; //일관성있게 속성값으로 찾기
			//console.log(password);
			
			let content = document.querySelector('[name="content"]').value;
			//console.log(content);
			/*
			let name = nameTag.value;
			let password = passwordTag.value;
			let content = contentTag.value;
			*/
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
				console.log(response.data); //수신데이타
				
				render(response.data, 'up');
				
				//폼비우기
				guestbookForm.reset();
				/*
				nameTag.value;='';
				passwordTag.value='';
				contentTag.value='';
				*/
				

			}).catch(function (error) {

				console.log(error);

			});
			
			
		};
		/////////////////글 저장///////////////////////////////////////////////
		
		

		
		
		//리스트 가져와서 그리기
		/////////////////리스트 가져오기///////////////////////////////////////////////
		function getListRender() {
			
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
					render(guestbookVo, 'down');
					
				}
				

			}).catch(function (error) {

				console.log(error);

			});
			
		};
		/////////////////리스트 가져오기///////////////////////////////////////////////
		
		
		
		
		
		/////////////////한개 가져오기///////////////////////////////////////////////
		//한개 그리기
		function render (guestbookVo, dir) {
			
			
			let listArea = document.querySelector('#guestbookListArea');
			
			
			let str = '';
			
			str += '<table id="t-'+guestbookVo.no+'" class="guestRead">';
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
			str += '		<td><button class="callModal" type="button" data-no="'+guestbookVo.no+'">삭제(모달창보이기)</button></tds>';
			str += '	</tr>';
			str += '	<tr>';
			str += '		<td colspan=4 class="text-left">'+guestbookVo.content+'</td>';
			str += '	</tr>';
			str += '</table>';
			
			
			
			if ( dir == 'down' ) {
				
				listArea.insertAdjacentHTML('beforeend', str);
				
			} else if ( dir == 'up' ) {
				
				listArea.insertAdjacentHTML('afterbegin', str);
				
			} else {
				
				consol.log('방향체크');
				
			}
			
		
			
		};
		/////////////////한개 가져오기///////////////////////////////////////////////
		

		
		
		
		
	
	</script>




</body>

</html>