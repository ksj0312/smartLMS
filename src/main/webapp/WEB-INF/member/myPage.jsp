<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    // 세션에서 mem_id 가져오기
    String userId = (String) session.getAttribute("userId");
    String userName = (String) session.getAttribute("userName");	
%>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>
.tab {
    display: none; /* 기본적으로 모든 탭 콘텐츠를 숨김 */
}
.tab.active {
    display: block; /* 활성화된 탭 콘텐츠만 표시 */
}


</style>
<script>
function getClassList(){
	$.ajax({
		url: '/getClassList',
		type: 'GET',
		success: function(data){
			
		},
		error: function(xhr, status, error){
			
		}
	});
}

document.addEventListener("DOMContentLoaded", function() {
    document.querySelectorAll('.tab-link').forEach(tab => {
        tab.addEventListener('click', () => {
            // 현재 활성화된 탭과 콘텐츠에서 active 클래스를 제거
            const activeTab = document.querySelector('.tab-link.active');
            const activeContent = document.querySelector('.tab.active');

            if (activeTab) activeTab.classList.remove('active');
            if (activeContent) activeContent.classList.remove('active');

            // 클릭한 탭에 active 클래스 추가
            tab.classList.add('active');

            // data-tab 속성으로 연관된 콘텐츠를 활성화
            const tabId = tab.getAttribute('data-tab');
            document.getElementById(tabId).classList.add('active');
			
            // 수강과목 탭 클릭 시 getClassList() 호출
            if (tabId == 'mypage_classList') {
                getClassList();
            }
        });
    });
});
</script>

<script>
// 인증번호 요청 함수
var timer;
var isRunning = false;
var code;
var telSent = false; // 문자 전송 여부를 추적하는 변수
var check1 = false;
var check2 = false;
var check3 = false;
var check4 = false;

function telCheckBtn() {
    $('#tel-Check-Btn').click(function() {
        let tel = $('#tel').val()
        console.log('입력 전화번호 : ' + tel);
        let checkInput = $('.tel-check-input');
        $('.tel-check-input').show();
        if (!validatePhoneNumber(tel)) {
            return; // 전화번호가 유효하지 않으면 함수 종료
        }
        // 이미  문자가 전송되었는지 확인
        if (telSent) {
            alert('이미 문자가 전송되었습니다. 인증번호를 확인해주세요.');
            return; // 함수 종료하여 문자를 여러 번 보내는 것을 방지
        }

        $.ajax({
            url: "telCheck",
            type: 'GET',
            data: { 
            	tel: tel
            	}, // 폰 번호 데이터 전송
            success: function(code1) {
                checkInput.prop('disabled', false);
                code = code1;
                console.log(code);
                alert('인증번호가 전송되었습니다.');
                sendAuthNum1(); // 인증번호 발송 및 타이머 시작 함수 호출
                telSent = true; // 문자 전송 상태 업데이트
                $('#tel-check-warn').show();
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
            }
        });
                $('#tel-check-Btn').hide();
                checkInput.prop('disabled', false);

      telSent = true;
      sendAuthNum1();
    });
}

function telPwdCheckBtn() {
    $('.chkpwdphone').click(function() {
        let tel = $('.tel').val()
        console.log('입력 전화번호 : ' + tel);
        let changechk = $('.changechk');
//         $('.tel-check-input').show();
        // 이미  문자가 전송되었는지 확인
        if (telSent) {
            alert('이미 문자가 전송되었습니다. 인증번호를 확인해주세요.');
            return; // 함수 종료하여 문자를 여러 번 보내는 것을 방지
        }

        $.ajax({
            url: "telCheck",
            type: 'GET',
            data: { 
            	tel: tel
            	}, // 폰 번호 데이터 전송
            success: function(code1) {
            	changechk.prop('disabled', false);
                code = code1;
                console.log(code);
                alert('인증번호가 전송되었습니다.');
                sendAuthNum2(); // 인증번호 발송 및 타이머 시작 함수 호출
                telSent = true; // 문자 전송 상태 업데이트
            },
            error: function(xhr, status, error) {
                console.error(xhr.responseText);
            }
        });
        changechk.prop('disabled', false);

      telSent = true;
      sendAuthNum1();
    });
}

//인증번호 발송하고 타이머 함수 실행
var timer1;  // 타이머를 저장할 변수
var isRunning = false;  // 타이머가 실행 중인지 여부를 추적하는 변수

function sendAuthNum1() {
    // 남은 시간 설정
    var leftSec = 180;
    var display = document.querySelector('#timer3');  // 타이머 표시할 요소
    
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
    var display = document.querySelector('#timer4');  // 타이머 표시할 요소
    
    // 이미 타이머가 작동 중이면 중지
    if (isRunning) {
        clearInterval(timer1);  // 기존 타이머 중지
    } 

    isRunning = true;  // 타이머 실행 상태로 설정
    startTimer1(leftSec, display);  // 타이머 시작
}

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
            telSent = false;  // 이메일 전송 상태 초기화
        }
    }, 1000);  // 1초마다 실행
}


var isCodeVerified = false; // 인증번호 확인 상태를 추적하는 변수

function compareCode1() {
    $('.tel-check-input').blur(function() {
        const inputCode = $(this).val();
        const $resultMsg = $('#tel-check-warn');

        if (code === null) {
            $resultMsg.html('*인증 시간이 만료되었습니다. 다시 인증해주세요.');
            $resultMsg.css('color', 'red');
            $resultMsg.css('display', 'inline');
            return; 
        }

        if (inputCode === code) {
            $resultMsg.html('*인증번호가 일치합니다.');
            $resultMsg.css('color', 'green');
            $resultMsg.css('display', 'inline');
            isCodeVerified = true; // 인증번호가 맞으면 상태 업데이트
//             var check1 = true;
        } else {
            $resultMsg.html('*인증번호가 불일치 합니다. 다시 확인해주세요.');
            $resultMsg.css('color', 'red');
            $resultMsg.css('display', 'inline');
            isCodeVerified = false; // 인증번호가 틀리면 상태 초기화
            $('.change_btn_tel').hide(); // 변경하기 버튼 숨기기
        }
    });
}

function compareCode2() {
    $('.changechk').blur(function() {
        const inputCode = $(this).val();
        const $resultMsg = $('#tel-check-warn2');

        if (code === null) {
            $resultMsg.html('*인증 시간이 만료되었습니다. 다시 인증해주세요.');
            $resultMsg.css('color', 'red');
            $resultMsg.css('display', 'inline');
            return; 
        }

        if (inputCode === code) {
            $resultMsg.html('*인증번호가 일치합니다.');
            $resultMsg.css('color', 'green');
            $resultMsg.css('display', 'inline');
            isCodeVerified = true; // 인증번호가 맞으면 상태 업데이트
            check2 = true;
            
        } else {
            $resultMsg.html('*인증번호가 불일치 합니다. 다시 확인해주세요.');
            $resultMsg.css('color', 'red');
            $resultMsg.css('display', 'inline');
            isCodeVerified = false; // 인증번호가 틀리면 상태 초기화
          
        }
    });
}

function compareCode() {
    $('.mail-check-input').blur(function() {
        const inputCode = $(this).val();
        const $resultMsg = $('#mail-check-warn');

        if (code === null) { // 인증 시간이 만료되었는지 확인
            $resultMsg.html('*인증 시간이 만료되었습니다. 다시 인증해주세요.');
            $resultMsg.css('color', 'red');
            $resultMsg.css('display', 'inline');

            return; // 함수 종료
        }

        if (inputCode === code) {
            $resultMsg.html('*인증번호가 일치합니다.');
            $resultMsg.css('color', 'green');
            $resultMsg.css('display', 'inline');

            $('#mail-Check-Btn').attr('disabled', true);
            $('#userEamil1').attr('readonly', true);
            $('#userEamil2').attr('readonly', true);
            $('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
            $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
            clearTimeout(timer); // 타이머 초기화
            $('#timer2').hide();
            $('.mail-check-input').attr('readonly', true);
            check4 = true;

        } else {
            $resultMsg.html('*인증번호가 불일치 합니다. 다시 확인해주세요.');
            $resultMsg.css('color', 'red');
            $resultMsg.css('display', 'inline');
        }
        
        
    });
}

$(document).ready(function() {
    telCheckBtn();
    telPwdCheckBtn();
    
    compareCode();
    compareCode1();
    compareCode2();
});

    </script>

    
<div id="mypage_con">
    <div class="mypage_con pd_box inner">
        <div class="mypage_top">
            <h1 class="mypage_title">
            	<span class="find_my_name"></span>${user.name}님의 마이페이지
            </h1>

        </div>
        <div class="mypage_bot">
            <div class="mypage_left_con_box">
                <ul class="mypage_tabs">
                    <li id="my_home" class="tab-link add" data-tab="mypage_home">마이페이지 홈</li>
                    <li class="tab-link" data-tab="mypage_myinfo">내 정보</li>                     
                    <li class="tab-link" data-tab="mypage_classList">수강과목</li>                     
                </ul>
            </div>

            <div class="mypage_right_con_box">


                <!-- 마이페이지 내정보 시작 -->

                <div id="mypage_myinfo" class="tab active">
                    <div class="mycon_title">내 정보</div>

                    <div class="myinfo_con_box">
                        <form action="">       
                                <div class="info_id_box myinfo_box">
                                    <div class="existing_id_box existing_box">
                                        <div class="info_box_title">아이디</div>
                                        <input class="info_id_input" type="text" name="" value="${sessionScope.userId}" readonly>
                                    </div>
                                </div>
                        </form>

                        <form action="">       
                            <div class="info_name_box myinfo_box">
                                <div class="existing_name_box existing_box">
                                    <div class="info_box_title">이름</div>
                                    <input class="info_name_input" type="text" name="" value="${sessionScope.userName}" readonly>
                                </div>
                            </div>
                        </form>
                        <div class="existing_name_box existing_box">
                                    <div class="info_box_title">주소</div>
                                    <input class="info_name_input" type="text" name="" value="${user.addr}" readonly>
                                </div>
                                
                                 <div class="existing_name_box existing_box">
                                    <div class="info_box_title">성별</div>
                                    <input class="info_name_input" type="text" name="" value="${user.gender}" readonly>
                                </div>
                                
                                 <div class="existing_name_box existing_box">
                                    <div class="info_box_title">생년월일</div>
                                    <input class="info_name_input" type="text" name="" value="${user.birth}" readonly>
                                </div>
                                
                                 <div class="existing_name_box existing_box">
                                    <div class="info_box_title">이메일</div>
                                    <input class="info_name_input" type="text" name="" value="${user.email}" readonly>
                                </div>
                                 <div>
                                    <input class="" id="newEmail" name="email" type="text" placeholder="변경할 이메일을 입력해주세요">
                                </div>
                                <div>
                                    <input class="mail-check-input" type="text" style="display:none;" placeholder="인증번호를 입력해주세요"><span id="timer2" ></span>
                                    <span id="mail-check-warn" class="identify" style="display:none;"></span>	
                                </div>
                                   	<button type="button" id="mailCheck">이메일 인증</button>
                                   	<button type="button" id="updateMail">변경하기</button>
                                
                                <div class="existing_name_box existing_box">
                                    <div class="info_box_title">학년</div>
                                    <input class="info_name_input" type="text" name="" value="${user.grade}" readonly>
                                </div>
                                
                                <div class="existing_name_box existing_box">
                                    <div class="info_box_title"></div>
                                    <input class="info_name_input" type="text" name="" value="${user.status}" readonly>
                                </div>
						<!-- 휴대폰 변경 폼 -->
                        <form action="updateTel">       
                                <div class="info_phone_box myinfo_box">
                                    <div class="existing_phone_box existing_box">
                                        <div class="info_box_title">휴대폰</div>
                                        <input class="info_phone_past" type="text" value="${user.tel}" readonly><br>
                                        <div>
                                        <input class="info_phone_input" type="text" id="tel" name="tel" placeholder="새 휴대폰 번호를 입력" style="display:none;">
                                        <div>
                                        <input class="tel-check-input" type="text" name="" style="display:none;" placeholder="인증번호를 입력"><span id="timer3" ></span>
                                        </div>
                                        </div>
                                        <button type="button" class="change_phone">변경하기</button>
                                    <button type="button" id="tel-Check-Btn" class="phone_need_veri_btn" style="display:none;">인증요청</button>
                                        <button type="button" class="change_btn_tel" style="display:none;">변경하기</button>
                                    </div>
                                    <div class="change_phone_box">
                                       <span id="tel-check-warn" class="identify" style="display:none;">* 휴대폰 인증번호를 입력해주세요</span>	
                                        <button type="button" class="veri_confirm_btn" style="display:none;">인증확인</button>
                                    </div>
                                </div>
                            </form>
                            
           <button type="button" class="change_my_pwd_btn">비밀번호 변경하기</button>
	        <form action="changePwd">
	            <div class="change_pwd_box">
	                <div class="label_name" style="display:none;">현재 비밀번호</div>
	                <input id="mem_pwd" name="pwd" type="password" placeholder="현재 비밀번호" style="display:none;" required/><span class="pwdchk"></span>
	                <div>
	                <button type="button" id="btnbtn" style="display:none;">비밀번호 확인</button>
	                </div>
	            </div>
	             <div>
	                <input class="change-pwd-phone tel" type="text" name="tel" placeholder="휴대폰 번호를 입력" style="display:none;">
	             <div>
	                                        <button type="button" class="chkpwdphone" style="display:none;">인증요청</button>
	                                        <div>
	                <input class="change-pwd-phone changechk" type="text" name="" style="display:none;" placeholder="인증번호를 입력"><span id="timer4" ></span>
	                                        </div>
	                                         <span id="tel-check-warn2" class="identify" style="display:none;">* 휴대폰 인증번호를 입력해주세요</span>	
	             </div>
	             </div>
	            <div class="change_pwd_box">
	                <div class="label_name" style="display:none;">변경할 비밀번호</div>
	                <input id="mem_chpwd" name="mem_chpwd" type="password" placeholder="영문, 숫자, 특수기호 모두 조합" style="display:none;" required/>
	            </div>
	            <div class="change_pwd_box">
	                <div class="label_name" style="display:none;">비밀번호 확인</div>
	                <input id="mem_chpwdchk" class="mem_chpwdchk" name="mem_chpwdchk" type="password" placeholder="영문, 숫자, 특수기호 모두 조합" style="display:none;" required/><span class="pwdchk2"></span>
	            </div>  
	
	            <div class="">
	                <button type="button" class="change_pwd_confirm_btn" style="display:none;">변경하기</button>
	            </div>
	            <div>
	                <button type="button" class="change_pwd_cancle_btn" style="display:none;">취소</button>
	            </div>
	        </form>
                </div>
            </div>
            
            <!-- 수강과목 -->
            <div id="mypage_classList" class="tab">
            <div class="container">
  <h2>내 수강과목</h2>
  <p>수강과목 및 성적을 확인할 수 있습니다..</p>            
  <table class="table">
    <thead>
      <tr>
        <th>강의번호</th>
        <th>강의명</th>
        <th>교수이름</th>
        <th>강의시간</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>John</td>
        <td>Doe</td>
        <td>john@example.com</td>
      </tr>
      <tr>
        <td>Mary</td>
        <td>Moe</td>
        <td>mary@example.com</td>
      </tr>
      <tr>
        <td>July</td>
        <td>Dooley</td>
        <td>july@example.com</td>
      </tr>
    </tbody>
  </table>
</div>
            </div>
        </div>
    </div>
</div>

    <script>
    $(document).ready(function() {
        function changePhone() {
        	if (!isCodeVerified) {
                alert("인증번호가 일치하지 않습니다."); // 인증번호가 틀리면 알림
                return; // 함수 종료
            }
            var dataForm = {
                tel: $('.info_phone_input').val(),
                pasttel: $('.info_phone_past').val()
            };

            console.log("전화번호 입력 값:", dataForm.tel);  // 전화번호 확인

            if (!dataForm.tel) {
                alert("새 전화번호를 입력하세요.");  // 전화번호 입력 확인
                return;  // 전화번호가 없으면 요청하지 않음
            }

            $.ajax({
                url: '/updateTel',
                method: 'PUT',
                contentType: 'application/json',
                data: JSON.stringify(dataForm),
                success: function(data) {
                    console.log("전화번호 변경 성공:", dataForm);
                    // 입력 필드를 숨기고 성공 메시지 표시 등 추가 처리
                    $('.info_phone_input').hide();  // 성공 시 입력 필드 숨기기
                    alert("회원 정보가 변경되어 로그아웃되었습니다. 다시 로그인하세요.");
                    window.location.href = 'studentLoginPage';  // 로그인 페이지로 리디렉션
                },
                error: function(xhr, status, error) {
                    console.error("전화번호 변경 실패:", dataForm);
                    console.error("서버 응답:", xhr.responseText);
                }
            });
        }

        $('.change_btn_tel').click(function() {
            changePhone();
        });
        
        
        $('.tel-check-input').on('input', function() {
            // 입력된 값이 있을 경우
            if ($(this).val().trim() !== '') {
                // 변경하기 버튼을 보여줌
            	$('.change_btn_tel').show();
            } else {
                // 입력 값이 없으면 버튼 숨김
                $('.change-btn').hide();
            }
        });
        //현재 비밀번호가 맞는지 가져오는 아작스
        function changePwd(){
        	var pwd = $('#mem_pwd').val();
        	var pwdchk = $('.pwdchk');
        	
        	if (!validatePassword(pwd)) {
                return; // 비밀번호가 유효하지 않으면 함수 종료
            }
        $.ajax({
            url: '/changePwd',
            type: 'POST',
            data: {
            	pwd: pwd
            },
            success: function(data) {
            	console.log(pwd);
                console.log(data);
                if(data == true){
                	pwdchk.html('*현재 비밀번호와 일치합니다.');
                	pwdchk.css('color', 'green');
                	pwdchk.css('display', 'inline');
                	check1 = true;
                $('.change_pwd_confirm_btn').show();
                }else{
                	pwdchk.html('*현재 비밀번호와 일치하지 않습니다.');
                	pwdchk.css('color', 'red');
                	pwdchk.css('display', 'inline');
                	$('.change_pwd_confirm_btn').hide();
                }

            },
            error: function(xhr, status, error) {
               
            }
        });
        }
        
        function changeNewPwd(){
        	var changeNew = false;
        	var pwd = $('#mem_chpwd').val();
        	var pwdchk = $('.mem_chpwdchk').val();
        	var pwdchk2 = $('.pwdchk2');
        	
        	
        	if (!validatePassword(pwd)) {
                return; // 비밀번호가 유효하지 않으면 함수 종료
            }
        	
        	var dataForm = {
        			pwd: pwd,
        			pwdchk: pwdchk2
        	}
        	console.log(pwdchk, pwdchk2);
        	if(pwd == pwdchk)
        		changeNew = true;
        	else
        		changeNew = false;
        	if(changeNew){
        		pwdchk2.html('*비밀번호가 일치합니다.');
        		pwdchk2.css('color', 'green');
        		pwdchk2.css('display', 'inline');
        		check3 = true;
        		if(check1 == true && check2 == true && check3 == true){
        $.ajax({
            url: '/changeNewPwd',
            method: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(dataForm),
            success: function(data) {
                console.log(data);
                alert("회원 정보가 변경되어 로그아웃되었습니다. 다시 로그인하세요.");
                window.location.href = 'studentLoginPage';  // 로그인 페이지로 리디렉션	

            },
            error: function(xhr, status, error) {
               
            }
        });
            	}
            	else{
            		alert("모든 입력사항을 입력해주세요.");
            	}
        	}else{
        		pwdchk2.html('*비밀번호가 일치하지 않습니다.');
            	pwdchk2.css('color', 'red');
            	pwdchk2.css('display', 'inline');
        	}
        }
        
        function changeEmail(){
        	var emailSent = false; // 이메일 전송 여부를 추적하는 변수
        	let email = $('#newEmail').val();
        	let checkInput = $('.mail-check-input');
        	  if (!email.trim()) {
                  alert('이메일을 입력해주세요.');
                  return;
              }
              
              // 이미 이메일이 전송되었는지 확인
              if (emailSent) {
                  alert('이미 이메일이 전송되었습니다. 인증번호를 확인해주세요.');
                  return; // 함수 종료하여 이메일을 여러 번 보내는 것을 방지
              }
        	$.ajax({
        		 url: '/mailCheck',
                 type: 'GET',
                 data: {
                	 email: email 
                 },
                 success: function(data) {
                     console.log(data);
                     checkInput.prop('disabled', false);
                     code = data;
                     alert('인증번호가 전송되었습니다.');
                     sendAuthNum();
                     emailSent = true;
                     $('.mail-check-input').show();
                 },
                 error: function(xhr, status, error) {
                	 console.error(xhr.responseText);
                 }
        	});
        }
        
        function updateMail(){
        	let dataForm = {
        	email: $('#newEmail').val()
        			
        	} 
        	if(check4 == true){
        	$.ajax({
        		url: '/updateMail',
        		method: 'PUT',
        		contentType: 'application/json',
                data: JSON.stringify(dataForm),
        		success: function(data){
        			alert("회원 정보가 변경되어 로그아웃되었습니다. 다시 로그인하세요.");
        			window.location.href = 'studentLoginPage';
        		},
        		error: function(xhr, status, error){
        			
        		}
        	});
        		
        	} else{
        		alert("모든 입력사항을 입력해주세요.");
        	}
        }
        
    
        $('#btnbtn').click(function(){
        	changePwd();
        });
        
        $('.change_pwd_confirm_btn').click(function(){
        	changeNewPwd();        		
        	
        });
        
        $('#mailCheck').click(function(){
        	changeEmail();        		
        	
        });
        
        $('#updateMail').click(function(){
        	updateMail();
        });
    });
    </script>
                    <script>
                            //휴대폰변경하기 눌렀을때
                            $('.change_phone').click(function(){
                            	$('.info_phone_input').show();
                            	$('.change_phone').hide();
                            	$('#tel-Check-Btn').show();
                            });
                            
                            $('.change_my_pwd_btn').click(function(){
                            	$('.label_name').show();
                            	$('#mem_pwd').show();
                            	$('#mem_chpwd').show();
                            	$('#mem_chpwdchk').show();
                            	$('#btnbtn').show();
                            	$('.change-pwd-phone').show();
                            	$('.chkpwdphone').show();
                            	
                            });
							
                       
                         	
                    </script>
 
					<script>
					function validatePhoneNumber(tel) {
					    // 한국 전화번호 형식에 맞춘 정규식 (010, 011 등 시작)
					    const phoneRegex = /^01([0|1|6|7|8|9])([0-9]{3,4})([0-9]{4})$/;

					    if (!phoneRegex.test(tel)) {
					        alert("유효한 전화번호를 입력하세요.");
					        return false;
					    }
					    return true;
					}
					
					function validatePassword(pwd) {
					    // 비밀번호는 최소 8자, 하나 이상의 문자, 숫자 및 특수문자가 포함되어야 함
					    const pwdRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

					    if (!pwdRegex.test(pwd)) {
					        alert("비밀번호는 최소 8자이며, 영문자, 숫자, 특수문자를 포함해야 합니다.");
					        return false;
					    }
					    return true;
					}


                    </script>
                </div>
                <!-- 마이페이지 내정보 끝 -->

