window.onload = function() {
    var msg = document.getElementById("msg").value;
    if (msg) {
        if (msg === "success") {
            alert("출석 등록에 성공했습니다.");
        } else if (msg === "fail") {
            alert("출석 등록에 실패했습니다. 다시 시도해주세요.");
        }
    }
};	