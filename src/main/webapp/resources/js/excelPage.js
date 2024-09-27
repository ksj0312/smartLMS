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
    
    
window.onload = function() {
    var msg = document.getElementById("msg").value;
    if (msg) {
        if (msg === "success") {
            alert("회원 등록에 성공했습니다.");
        } else if (msg === "fail") {
            alert("회원 등록에 실패했습니다. 다시 시도해주세요.");
        }
    }
};