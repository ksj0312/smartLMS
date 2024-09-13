<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../member/adminIndex.jsp"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">
    
    $(document).ready(function() {
      var msg = "${resMap.msg}";
        if(msg != "") alert(msg);
    });
    
    function _onSubmit(){
        
        if($("#file").val() == ""){
            alert("파일을 업로드해주세요.");
            $("#file").focus();
            return false;
        }
        if(!confirm(gTxt("confirm.save"))){
            return false;
        }
        return true;
    }
    
</script>
<body>
<div class="bcl">
<div class = divall>
<c:choose>
    <c:when test="${success == true}">
        <p style="color: green;">업로드에 성공하였습니다.</p>
    </c:when>
    <c:when test="${success == false}">
        <p style="color: red;">업로드에 실패하였습니다. 다시 시도해주세요.</p>
    </c:when>
    <c:otherwise>
        <p></p>
    </c:otherwise>
</c:choose>
    
<div id="contAreaBox">
    <form name="inputForm" method="post" onsubmit="return _onSubmit();" action="${pageContext.request.contextPath}/upload/excel" enctype="multipart/form-data" class="form-horizontal">
        <div class="panel">
            <div class="panel-body">
            <h4 class="mt0"><i class="fa fa-cube" aria-hidden="true"></i>학생 아이디 생성</h4>
                <div class="table-responsive">
                <p> - 파일 업로드 시 양식파일 다운로드 후 파일 내 모든 항목을 채워서 업로드하셔야 정상 등록됩니다.</p>
                <p> - 엑셀 파일의 빈 행은 모두 지우고 업로드해주세요.</p>
                <p> - 반드시 형식에 맞춰서 작성해주세요.</p>
                <table id="datatable-scroller" class="table table-bordered tbl_Form">
                        <caption></caption>
                        <colgroup>
                            <col width="250px" />
                            <col />
                        </colgroup>
                        <tbody>
                            <tr>
                                <th class="active" style="text-align:right"><label class="control-label" for="">파일 업로드</label></th>
                                <td>
                                    <input type="file" name="file" id="file" accept=".xlsx, .xls"/>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        
        <div class="pull-right">
            <input type="submit" value="엑셀파일 업로드" class="btn btn btn-primary btn-lg" />
			<a href="${pageContext.request.contextPath}/download/excel" class="btn btn btn-primary btn-lg">양식파일 다운로드</a>
        </div>
    </form>
</div>
 </div>
 </div>
</body>
</html>