var emailSent = false; // 이메일 전송 여부를 추적하는 변수
var check5 = false;
var timer;
var isRunning = false;
var code;
var checkPhone = false;
var checkPhone1 = false;
var telSent = false;
$(document).ready(function(){
    $('#findIdBtn').click(function(){
        $('#formArea').html(`
            <div class="form-group">
                <label for="email">이메일 입력</label>
                <input type="email" class="form-control" id="email" placeholder="이메일을 입력해주세요." required>
                <input type="email" class="form-control" id="emailChk" placeholder="인증번호를 입력해주세요." required><span id="timer2" ></span>
                <button type="button" id="sendMail" class="btn btn-success mt-2">인증 이메일 전송</button>
                <button type="button" id="findId" class="btn btn-success mt-2">아이디찾기</button>
            </div>
            <div id="verificationMessage1"></div>
        `);
    });

    $('#findPwdBtn').click(function(){
        $('#formArea').html(`
            <div class="form-group">
        		<div>
                <label for="phone">핸드폰 번호</label>
                <input type="text" class="form-control" id="tel" placeholder="휴대폰 번호를 입력해주세요." required>
                <input type="text" class="form-control" id="telChk" class="changechk" placeholder="인증번호를 입력해주세요." required><span id="timer0" ></span>
                <button type="button" id="sendPhone" class="btn btn-success mt-2">인증요청</button>
            <div id="verificationMessage2"></div>
                </div>
                <div>
                <label for="email">변경할 비밀번호</label>
                <input type="password" class="form-control" id="pwdInput" placeholder="비밀번호를 입력해주세요." required>
                <input type="password" class="form-control" id="pwdChk" placeholder="다시한번 입력해주세요." required><span class="pwdchk2"></span>
                <button type="button" id="changePhone" class="btn btn-success mt-2">변경하기</button>
            <div id="verificationMessage3"></div>
                </div>
            </div>
        `);
    });

    $(document).on('click', '#sendMail', function(){
        var email = $('#email').val();
        var emailChk = $('#emailChk').val();
        if (!email.trim()) {
            alert('이메일을 입력해주세요.');
            return;
        }
        if (emailSent) {
            alert('이미 이메일이 전송되었습니다. 인증번호를 확인해주세요.');
            return; // 함수 종료하여 이메일을 여러 번 보내는 것을 방지
        }
        // AJAX 요청으로 이메일 인증 보내기
        $.ajax({
            url: '/mailCheck', // 서버에서 이메일 인증을 처리하는 URL
            method: 'GET',
            data: {
           	 email: email 
            },
            success: function(response) {
            	code = response;
                $('#verificationMessage1').text("인증 이메일이 발송되었습니다.");
                sendAuthNum();
                emailSent = true;
            },
            error: function(xhr, status, error) {
                $('#verificationMessage1').text("이메일 발송에 실패했습니다.");
            }
        });
    });

    $(document).on('click', '#sendVerificationPwd', function(){
        const email = $('#email').val();
        // AJAX 요청으로 이메일 인증 보내기
        $.ajax({
            url: '/sendVerificationPwd', // 서버에서 이메일 인증을 처리하는 URL
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({email: email}),
            success: function(response) {
                $('#verificationMessage2').text("인증 이메일이 발송되었습니다.");
            },
            error: function(xhr, status, error) {
                $('#verificationMessage2').text("이메일 발송에 실패했습니다.");
            }
        });
    });
});


function sendAuthNum() {
    // 남은 시간 설정
    var leftSec = 180;
    var display = document.querySelector('#timer2');  // 타이머 표시할 요소
    
    // 이미 타이머가 작동 중이면 중지
    if (isRunning) {
        clearInterval(timer1);  // 기존 타이머 중지
    } 

    isRunning = true;  // 타이머 실행 상태로 설정
    startTimer1(leftSec, display);  // 타이머 시작
}

function startTimer1(count, display) {
    var minutes, seconds;

    // 매 1초마다 타이머 업데이트
    timer1 = setInterval(function () {
        minutes = parseInt(count / 60, 10);
        seconds = parseInt(count % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;  // 화면에 시간 표시

        // 시간이 다 됐을 때 타이머 중지
        if (--count < 0) {
            clearInterval(timer1);  // 타이머 중지
            display.textContent = "";  // 화면에서 타이머 제거
            isRunning = false;  // 타이머 실행 상태 초기화
            code = null;  // 발급받은 코드 초기화
            emailSent  = false;  // 이메일 전송 상태 초기화
            telsent = false;
        }
    }, 1000);  // 1초마다 실행
}

$(document).on('blur', '#emailChk', function() {
    var inputCode = $('#emailChk').val(); 
    var $resultMsg = $('#verificationMessage1');


    if (code === null) { // 인증 시간이 만료되었는지 확인
        $resultMsg.html('*인증 시간이 만료되었습니다. 다시 인증해주세요.');
        $resultMsg.css('color', 'red');
        $resultMsg.css('display', 'inline');
        return; // 함수 종료
    }

    if (inputCode === code) {
        $resultMsg.text('*인증번호가 일치합니다.');
        $resultMsg.css('color', 'green');
        $resultMsg.css('display', 'inline');
        clearTimeout(timer); // 타이머 초기화
        $('#timer2').hide(); // 타이머 숨기기
        check5 = true;
    } else {
        $resultMsg.html('*인증번호가 불일치합니다. 다시 확인해주세요.');
        $resultMsg.css('color', 'red');
        $resultMsg.css('display', 'inline');
    }
});

$(document).on('blur', '#telChk', function() {
    var inputCode = $('#telChk').val(); 
    var $resultMsg = $('#verificationMessage2');


    if (code === null) { // 인증 시간이 만료되었는지 확인
        $resultMsg.html('*인증 시간이 만료되었습니다. 다시 인증해주세요.');
        $resultMsg.css('color', 'red');
        $resultMsg.css('display', 'inline');
        return; // 함수 종료
    }

    if (inputCode === code) {
        $resultMsg.text('*인증번호가 일치합니다.');
        $resultMsg.css('color', 'green');
        $resultMsg.css('display', 'inline');
        clearTimeout(timer); // 타이머 초기화
        $('#timer0').hide(); // 타이머 숨기기
        checkPhone1 = true;
    } else {
        $resultMsg.html('*인증번호가 불일치합니다. 다시 확인해주세요.');
        $resultMsg.css('color', 'red');
        $resultMsg.css('display', 'inline');
    }
});

function getId(){
	var email = $('#email').val();
	 if (!email.trim()) {
	        alert('이메일을 입력해주세요.');
	        return;
	    }
	$.ajax({
		url: '/getId',
		type: 'GET',
		data: {
			email: email
		},
		   success: function(response) {
            if (check5 == true) {
            	 $('#formArea').html("<p>아이디는: <strong>" + response.id + "</strong></p>");
            		$('#findIdBtn').hide();
           			 $('#findPwdBtn').hide();
            } else {
                $('#verificationMessage1').html("<span style='color:red;'>아이디를 찾을 수 없습니다. 다시 시도해 주세요.</span>");
            }
        },
        error: function(xhr, status, error) {
            $('#verificationMessage1').html("<span style='color:red;'>아이디를 찾는 중 오류가 발생했습니다. 다시 시도해 주세요.</span>");
        }
	});
}

$(document).on('click', '#findId', function() {
    getId();
});

$(document).ready(function() {
    // 모달이 완전히 닫힐 때 발생하는 이벤트
    $('#pwdsearch').on('hidden.bs.modal', function () {
        // formArea와 인증 메시지를 비우고, 버튼을 초기 상태로 돌림
        $('#formArea').html('');  // 이메일 입력 폼 내용을 초기화
        $('#verificationMessage1').html(''); // 인증 메시지 초기화
        $('#findIdBtn').show();  // "아이디 찾기" 버튼 다시 보이기
        $('#findPwdBtn').show();  // "비밀번호 찾기" 버튼 다시 보이기
        check5 = false;  // 인증 상태 초기화
    });
});


function telPwdCheckBtn() {
        let tel = $('#tel').val();
        let changechk = $('.changechk');
//         $('.tel-check-input').show();
 if (!validatePhoneNumber(tel)) {
            return; // 전화번호가 유효하지 않으면 함수 종료
        }
        // 이미  문자가 전송되었는지 확인
        if (telSent) {
            alert('이미 문자가 전송되었습니다. 인증번호를 확인해주세요.');
            return; // 함수 종료하여 문자를 여러 번 보내는 것을 방지
        }

        $.ajax({
            url: "/telCheck",
            type: 'GET',
            data: { 
            	tel: tel
            	}, // 폰 번호 데이터 전송
            success: function(code1) {
            	changechk.prop('disabled', false);
                code = code1;
                alert('인증번호가 전송되었습니다.');
                sendAuthNum2(); // 인증번호 발송 및 타이머 시작 함수 호출
                telSent = true; // 문자 전송 상태 업데이트
            },
            error: function(xhr, status, error) {
            }
        });
        changechk.prop('disabled', false);

      telSent = true;
      sendAuthNum1();
}

$(document).on('click', '#sendPhone', function() {
	telPwdCheckBtn();
});

$(document).on('click', '#changePhone', function() {
	changeFindNewPwd();
});
function sendAuthNum1() {
    // 남은 시간 설정
    var leftSec = 180;
    var display = document.querySelector('#timer2');  // 타이머 표시할 요소
    
    // 이미 타이머가 작동 중이면 중지
    if (isRunning) {
        clearInterval(timer1);  // 기존 타이머 중지
    } 

    isRunning = true;  // 타이머 실행 상태로 설정
    startTimer1(leftSec, display);  // 타이머 시작
}

function sendAuthNum2() {
    // 남은 시간 설정
    var leftSec = 180;
    var display = document.querySelector('#timer0');  // 타이머 표시할 요소
    
    // 이미 타이머가 작동 중이면 중지
    if (isRunning) {
        clearInterval(timer1);  // 기존 타이머 중지
    } 

    isRunning = true;  // 타이머 실행 상태로 설정
    startTimer1(leftSec, display);  // 타이머 시작
}

function changeFindNewPwd(){
	var changeNew = false;
	var pwd = $('#pwdInput').val();
	var tel = $('#tel').val();
	var pwdchk = $('#pwdChk').val(); // 비밀번호 확인 입력값

	var pwdchk2 = $('#verificationMessage3');
	
	
	if (!validatePassword(pwd)) {
        return; // 비밀번호가 유효하지 않으면 함수 종료
    }
	
	var dataForm = {
			pwd: pwd,
			tel: tel
	}
	if(pwd == pwdchk)
		changeNew = true;
	else
		changeNew = false;
	if(changeNew){
		pwdchk2.text('*비밀번호가 일치합니다.');
		pwdchk2.css('color', 'green');
		pwdchk2.css('display', 'inline');
		checkPhone = true;
		if(checkPhone1 == true && checkPhone == true){
$.ajax({
    url: '/changeFindNewPwd',
    method: 'PUT',
    contentType: 'application/json',
    data: JSON.stringify(dataForm),
    success: function(data) {
        alert("회원 정보가 변경되었습니다. 다시 로그인하세요.");
        window.location.href = '/';  // 로그인 페이지로 리디렉션	

    },
    error: function(xhr, status, error) {
       
    }
});
    	}
    	else{
    		alert("모든 입력사항을 입력해주세요.");
    	}
	}else{
		pwdchk2.text('*비밀번호가 일치하지 않습니다.');
    	pwdchk2.css('color', 'red');
    	pwdchk2.css('display', 'inline');
	}
}

$(document).on('click', '#findId', function() {
	changeNewPwd();
});

function validatePassword(pwd) {
    // 비밀번호는 최소 8자, 하나 이상의 문자, 숫자 및 특수문자가 포함되어야 함
    const pwdRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

    if (!pwdRegex.test(pwd)) {
        alert("비밀번호는 최소 8자이며, 영문자, 숫자, 특수문자를 포함해야 합니다.");
        return false;
    }
    return true;
}

function validatePhoneNumber(tel) {
					    // 한국 전화번호 형식에 맞춘 정규식 (010, 011 등 시작)
					    const phoneRegex = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;
						
					    if (!phoneRegex.test(tel)) {
					        alert("유효한 전화번호를 입력하세요.");
					        return false;
					    }
					    else {
					    return true;
					    }
					}
