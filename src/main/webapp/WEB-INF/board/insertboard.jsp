<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" context="width=device-width; initial-scale=1">
<meta http-equiv="Content-Script-Type" content="text/javascript">
<meta http-equiv="Content-Style-Type" content="text/css">
<title>네이버 :: Smart Editor 2 &#8482;</title>
<link href="${pageContext.request.contextPath }/resources/smarteditor/css/smart_editor2.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/smarteditor/css/smart_editor2_items.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/smarteditor/css/smart_editor2_out.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/resources/smarteditor/css/smart_editor2_in.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="${pageContext.request.contextPath }/resources/smarteditor/js/lib/jindo2.all.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/smarteditor/js/lib/jindo_component.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/smarteditor/js/SE2M_Configuration.js" charset="utf-8"></script>	<!-- 설정 파일 -->
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/smarteditor/js/SE2BasicCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/smarteditor/js/smarteditor2.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/smarteditor/js/smarteditor2.min.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/smarteditor/sample/js/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/board.css">

<!-- 20240503_ym 스타일추가 시작 -->
<style type="text/css">
	div.se2_input_area.husky_seditor_editing_area_container {width:100vw !important; height: 600px !important;}
	div#se2_iframe {width:100vw !important;height: 100% !important;}
	#smart_editor2 {width: 50%  !important;margin: 0 auto;}
</style>
<!-- 20240503_ym 스타일추가 종료 -->
</head>
<body>

<div class="insert_tdiv">

	<form action="/board" method="post" id="dataTransferForm" enctype="multipart/form-data">
	<div class="b_title_div">
		<label for="b_title" class="b_title_label">제목</label>
		<input type="text" class="b_title_input" name="b_title" placeholder="${b_type } 제목입력" required>
	</div>
		
		<input type="text" class="board_hide" name="b_type" placeholder="타입 입력" value="${b_type}" readonly>
		
		<input type="text" class="board_hide" name="b_id" value="<%=userId %>" placeholder="타입 입력">
		
		<input type="text" class="board_hide" name="b_name" value="${userName }" placeholder="타입 입력">
		
	<div id="se2_sample">
		<textarea name="b_info" id="ir1" rows="10" cols="100" style="width:766px; height:412px;" required></textarea>
	</div>
		<div class="b_bottom_div">
		  <input class="b_file" type="file" name="uploadFile">
		<input class="b_insert_button" type="submit" onclick="submitContents(this);" value="등록" />
		</div>
	</form>

</div>
<script type="text/javascript">
    var contextPath = "${pageContext.request.contextPath}";
</script>
<script src="${pageContext.request.contextPath}/resources/js/smartedtior.js"></script>

</body>
</html>