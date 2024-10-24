//스마트에디터 등록판 가져오기 
var fullPath = contextPath + "/resources/smarteditor/SmartEditor2Skin.html";
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({
   oAppRef: oEditors,
   elPlaceHolder: "ir1",
   sSkinURI: fullPath,   
   htParams : {
      bUseToolbar : true,            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
      bUseVerticalResizer : true,      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
      bUseModeChanger : true,         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
      //bSkipXssFilter : true,      // client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
      //aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
      fOnBeforeUnload : function(){
         //alert("완료!");
      }
   }, //boolean
   fOnAppLoad : function(){
      //예제 코드
      //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
   },
   fCreator: "createSEditor2"
});

function pasteHTML() {
   var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
   oEditors.getById["ir1"].exec("PASTE_HTML", [sHTML]);
}

function showHTML() {
   var sHTML = oEditors.getById["ir1"].getIR();
   alert(sHTML);
}
   

function setDefaultFont() {
   var sDefaultFont = '궁서';
   var nFontSize = 24;
   oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
}


function submitContents(elClickedObj) {
    // 에디터의 내용이 textarea에 적용됩니다.
    oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);

    // b_title과 b_info 값 가져오기
    var bTitle = document.querySelector('input[name="b_title"]').value.trim();
    var bInfo = document.getElementById("ir1").value.trim();
    
    // 내용이 비어있거나 공백으로만 이루어진 경우 체크
    const strippedInfo = bInfo.replace(/<[^>]+>/g, '').trim(); // HTML 태그 제거 후 공백 체크
    if (bTitle === "" || strippedInfo === "" || bInfo === "<p>&nbsp;</p>" || bInfo === "<p></p>") {
        alert("입력되지 않은 값이 있습니다.");
        event.preventDefault();
        return; // 제출 중단
    }else if(bTitle.length > 20){
    	alert("제목은 20글자를 초과할 수 없습니다.");
    	event.preventDefault();
        reture;
    }else{
    elClickedObj.form.submit(); // 검증 통과 시 폼 제출
    
    }

}