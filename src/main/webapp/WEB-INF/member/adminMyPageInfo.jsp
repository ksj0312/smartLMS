<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String userName = (String) session.getAttribute("userName");	
%>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/myPageInfo.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/myPageInfo.css">

<div id="mypage_con">
    <div class="mypage_con pd_box inner">
        <div class="mypage_top">
            <h1 class="mypage_title">
            	<span class="find_my_name"></span>${user.name}님의 마이페이지
            </h1>

        </div>
        <div class="mypage_bot">
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
                                    <div class="info_box_title">현재 주소</div>
                                    <input class="info_name_input" type="text" name="" value="${user.zipcode}" readonly>
                                    <div>
                                    <input class="info_name_input" type="text" name="" value="${user.addr}" readonly>
                                    </div>
                                    <div>
                                    <input class="info_name_input" type="text" name="" value="${user.detail_addr}" readonly>
                                    </div>
                                </div>
                              
                                    <div class="form-group">
               <div class="addr-group">
               <div class="info_box_title">변경할 주소</div>
                  <input type="text" class="input" id="postcode" name="ZIPCODE" onclick="execDaumPostcode()" placeholder="&#42;&nbsp;우편번호" required readonly>
                  <button type="button" class="button myPageInfoBtn" id="findpost" onclick="execDaumPostcode()">찾기</button>
                  <div id="warningAddr">우편번호 찾기를 통해, 주소를 입력해주세요.</div>
               </div>
               <div class="detail-addr">
                  <input type="text" class="input" onclick="execDaumPostcode()" id="address" name="ADDR" placeholder="&#42;&nbsp;주소"  required readonly>
               </div>
               <div>
                  <input type="text" class="input" id="detailaddress" name="DETAIL_ADDR" maxlength="100" autocomplete="off" placeholder="&nbsp;상세주소">
               </div>
               <button type="button" class="myPageInfoBtn" id="updatePost">주소 변경</button>
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
                                   	<button type="button" class="myPageInfoBtn" id="mailCheck">이메일 인증</button>
                                   	<button type="button" class="myPageInfoBtn" id="updateMail">변경하기</button>
                                
                                <div class="existing_name_box existing_box">
                                    <div class="info_box_title">과목명</div>
                                    <input class="info_name_input" type="text" name="" value="${user.lesson}" readonly>
                                </div>
                                
                                <div class="existing_name_box existing_box">
                                    <div class="info_box_title">가입일</div>
                                    <input class="info_name_input" type="text" name=""  value="<fmt:formatDate value='${user.join_date}' pattern='yyyy-MM-dd' />" readonly>
                                </div>
                                <div class="existing_name_box existing_box">
                                    <div class="info_box_title">개인정보 수정일</div>
                                    <input class="info_name_input" type="text" name=""  value="<fmt:formatDate value='${user.modify_date}' pattern='yyyy-MM-dd' />" readonly>
                                </div>
                                
                                 <div class="existing_name_box existing_box">
                                    <div class="info_box_title">현재 상태</div>
                                    <input class="info_name_input" type="text" id="status" class="status" value="${user.status}" readonly>
                                </div>
                                
                                <div class="existing_name_box existing_box">
                                    <div class="info_box_title">입사일</div>
                                    <input class="info_name_input" type="text" name=""  value="<fmt:formatDate value='${user.indate}' pattern='yyyy-MM-dd' />" readonly> readonly>
                                </div>
                                
						<!-- 휴대폰 변경 폼 -->
                        <form action="">       
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
                                        <button type="button" class="change_phone myPageInfoBtn">휴대폰번호 변경하기</button>
                                    <button type="button" id="tel-Check-Btn" class="phone_need_veri_btn myPageInfoBtn" style="display:none;">인증요청</button>
                                        <button type="button" class="change_btn_tel myPageInfoBtn" style="display:none;">변경하기</button>
                                    </div>
                                    <div class="change_phone_box">
                                       <span id="tel-check-warn" class="identify" style="display:none;">* 휴대폰 인증번호를 입력해주세요</span>	
                                        <button type="button" class="veri_confirm_btn myPageInfoBtn" style="display:none;">인증확인</button>
                                    </div>
                                </div>
                            </form>
                            
           <button type="button" class="change_my_pwd_btn myPageInfoBtn">비밀번호 변경하기</button>
	        <form action="">
	            <div class="change_pwd_box">
	                <div class="label_name" style="display:none;">현재 비밀번호</div>
	                <input id="mem_pwd" name="pwd" type="password" placeholder="현재 비밀번호" style="display:none;" required/><span class="pwdchk"></span>
	                <div>
	                <button type="button" id="btnbtn" style="display:none;" class="myPageInfoBtn">비밀번호 확인</button>
	                </div>
	            </div>
	             <div>
	                <input class="change-pwd-phone tel" type="text" name="tel" placeholder="휴대폰 번호를 입력" style="display:none;">
	             <div>
	                                        <button type="button" class="chkpwdphone myPageInfoBtn" style="display:none;">인증요청</button>
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
	                <button type="button" class="change_pwd_confirm_btn myPageInfoBtn" style="display:none;">변경하기</button>
	            </div>
	            <div>
	                <button type="button" class="change_pwd_cancle_btn myPageInfoBtn" style="display:none;">취소</button>
	            </div>
	        </form>
                </div>
            </div>
            
        </div>
    </div>
</div>
                </div>



