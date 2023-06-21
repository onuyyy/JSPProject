<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
  <style type="text/css">

.container {
margin-top:50px;
}	
.row {
margin:0px suto;
width:700px;
}
h1 {
text-align:center;
 font-family: 'Noto Sans KR', sans-serif;
}
  </style>
  
  <script type="text/javascript">
  
  function board_write() {
	  
	  // 유효성 검사
	  // form 읽기
	  let frm=document.frm;
	  if(frm.name.value=="") {	// frm name의 value가 있냐?
			  					// 오라클에 NOT NULL이 있냐?
		  frm.name.focus();
	  	  return;
	  }
	  
	  if(frm.subject.value=="") {	// frm name의 value가 있냐?
			// 오라클에 NOT NULL이 있냐?
		frm.name.focus();
		return;
		}
	  if(frm.content.value=="") {	// frm name의 value가 있냐?
			// 오라클에 NOT NULL이 있냐?
		frm.name.focus();
		return;
		}
	  
	  if(frm.pwd.value=="") {	// frm name의 value가 있냐?
			// 오라클에 NOT NULL이 있냐?
		frm.name.focus();
		return;
		}
	  
	  	frm.submit();	// submit 버튼을 함수화 시킴
	  
  }
  
  </script>
  
</head>
<body>
	<div class="container">
		<h1>글쓰기</h1>
		<div class="row">
		<form method=post action="insert_ok.jsp" name=frm
		enctype="multipart/form-data"
		>
		<!-- 데이터 많으니까 post / action : 누가 받을지 -->
			<table class="table">
				<tr>
					<th class="text-center danger" width=15%>이름</th>
					<td width=85%>
						<input type=text name=name class="input-sm" size=15>
					</td>
				</tr>
				<tr>
					<th class="text-center danger" width=15%>제목</th>
					<td width=85%>
						<input type=text name=subject class="input-sm" size=50>
					</td>
				</tr>
				<tr>
					<th class="text-center danger" width=15%>내용</th>
					<td width=85%>
						<textarea rows="10" cols="50" name=content></textarea>
					</td>
				</tr>
				<tr>
					<th class="text-center danger" width=15%>첨부파일</th>
					<td width=85%>
						<input type=file name=upload class="input-sm" size=20>
					</td>
				</tr>
				<tr>
					<th class="text-center danger" width=15%>비밀번호</th>
					<td width=85%>
						<input type=password name=pwd class="input-sm" size=10>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="text-center">
						<input type=button value="글쓰기" class="btn btn-sm btn-primary" onclick="board_write()">
						<!-- submit이어야 넘어간다 bitton  -->
						<input type=button value="취소" class="btn btn-sm btn-info"
						onclick="javascript:history.back()">
					</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
</body>
</html>



