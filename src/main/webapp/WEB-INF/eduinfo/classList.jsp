<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../member/adminIndex.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 목록</title>
<script>
/*  document.addEventListener("DOMContentLoaded", function() {
    // 강의 목록에 대해 동적으로 링크 설정
   		var links = document.querySelectorAll(".atag");
    	links.forEach(function(link) {
        var c_number = link.getAttribute("data-c_number"); // data-c_number 속성에서 강의 번호 가져오기
        var currentDate = new Date().toISOString().split('T')[0]; // YYYY-MM-DD 형식의 현재 날짜
        link.href = `attendancePage?c_number=${c_number}&a_date=${currentDate}`;
    });
});  */

function attendancePage(c_number) {
    let a_date = document.getElementById("a_date").value;

    if (!a_date) {
        alert("날짜를 선택해주세요.");
        return;
    }

    location.href = "/attendancePage?c_number=" + c_number + "&a_date=" + a_date;
}
</script>
</head>
<body>
<div class="bcl">
        <div class="divall">
        <%-- <input type="date" name="a_date" id="a_date" value="${fn:substring(LocalDate.now().toString(), 0, 10)}"> --%>
        <h3>출석부 등록</h3>
 			<c:choose>
				<c:when test="${classListCnt != 0}">
					<c:forEach items="${classList}" var="cl">
						<li><a class="atag" href="attendancePage?c_number=${cl.c_number}">${cl.c_name}</a></li>  
						<%--  <li><a class="atag" href="#" onclick="attendancePage(${cl.c_number})">${cl.c_name}</a></li> --%>
					</c:forEach>
				</c:when>
				<c:otherwise>
						<li><a class="atag" href="/"><small>-</small></a></li>
				</c:otherwise> 
			</c:choose> 
			<br><br><br>
</div>
</div>
</body>
</html>