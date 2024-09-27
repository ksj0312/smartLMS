<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

   <footer class = footer>
      <div class="footerdiv">
         <p class="footer1">
            	<c:choose>
				<c:when test="${userName ne NULL}">
           			 <em>SMARTLMS,<a class= "adminlink" > ◎</a></em>
           		 </c:when>
           		 <c:otherwise>
          		    <em>SMARTLMS,<a class= "adminlink" href="adminLoginPage" > ◎</a></em>
           		 </c:otherwise>
            	</c:choose>
         </p>
         <p class="footer2">
         	20240910
         </p>
         <p class="footer3">
            이 사이트는 교육용 사이트로 실제 사용하실 수 없습니다. 
         </p>
      </div>
   </footer>
   
</body>
</html>
