function taskUpdate(event) {
    event.preventDefault(); // 기본 동작 방지

    // FormData 객체 생성
    var formData = new FormData(document.getElementById("taskForm"));

    // 각 필드의 값을 콘솔에 출력
    formData.forEach((value, key) => {
        console.log(`${key}: ${value}`);
    });

    // AJAX 요청
    $.ajax({
        url: "/student/task",
        type: "PUT",
        data: formData,
        processData: false,
        contentType: false,
        success: function(data) {
            console.log(data);
            const t_number = formData.get("t_number");
            alert("과제가 수정되었습니다.");
            window.location.href = data + t_number; // 서버에서 반환된 URL로 이동
        },
        error: function() {
            alert("과제 수정에 실패했습니다. 다시 시도해주세요.");
        }
    });
}