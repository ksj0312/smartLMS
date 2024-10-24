function validateForm() {
        // 각 필드의 값을 변수로 저장
        const id = document.forms["taskForm"]["id"].value;
        const title = document.forms["taskForm"]["title"].value;
        const deadline = document.forms["taskForm"]["deadline"].value;
        const info = document.forms["taskForm"]["info"].value;

        // 작성자 필드 확인
        if (id === "") {
            alert("작성자를 입력해주세요.");
            return false; // 폼 제출 중단
        }

        // 제목 필드 확인
        if (title === "") {
            alert("제목을 입력해주세요.");
            return false;
        }

        // 과제 마감일 필드 확인
        if (deadline === "") {
            alert("과제 마감일을 입력해주세요.");
            return false;
        }

        // 과제 내용 필드 확인
        if (info === "") {
            alert("과제 내용을 입력해주세요.");
            return false;
        }

        // 모든 값이 정상적으로 입력되었을 때만 폼이 제출됨
        return true;
    }