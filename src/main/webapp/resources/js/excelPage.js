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