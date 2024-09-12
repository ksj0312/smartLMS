<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
    <title>Upload Excel File</title>
</head>
<body>

<h2>Upload Excel File</h2>


    <c:if test="${param.success == 'true'}">
        <p style="color: green;">업로드에 성공하였습니다.</p>
    </c:if>
    
    <c:if test="${param.error == 'true'}">
        <p style="color: red;">업로드에 실패하였습니다. 다시 시도해주세요.</p>
    </c:if>


<form action="${pageContext.request.contextPath}/upload/excel" method="post" enctype="multipart/form-data">
    <label for="file">Select Excel File:</label>
    <input type="file" name="file" id="file" accept=".xlsx, .xls"/>
    <br/><br/>
    <input type="submit" value="Upload"/>
</form>

</body>
</html>