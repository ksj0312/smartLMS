                
                //출석부 출결 상태 변경
                 function updateAttendance(id, c_number){
                   let a_status_radio = document.getElementsByName(`a_status_${id}`);
                   let a_date = document.getElementById("a_date").value;
                   let a_status = "";
                   
                    if (!a_date) {
       				 alert("날짜를 선택하세요.");
      				 return;
   					}
                   
                   for (const radio of a_status_radio) {
    				if (radio.checked) {
        			a_status = radio.value;
       				 break;
    				}
    				}
        		        $.ajax({
       				  	url : "/updateAttendance",
        				data :JSON.stringify({  
           					 "a_status": a_status,
           					 "id": id,
            			     "c_number": c_number,
            			     "a_date": a_date
        				}),
        				type : "PUT",
        				contentType: "application/json",
        				success: function(data){
        				
        				 alert(`학번 ${id}의 출결 상태가 '${a_status}'로 수정되었습니다.`);
        				 
       					},error: function(){
           				 alert("출결 상태 변경에 실패했습니다. 다시 시도해주세요.");
         				}
     					 });
                 }


					//url생성 함수
					function getUrl(currPageNo, range, searchType, keyword) {
 						 return `/attendance?currPageNo=${currPageNo}&range=${range}&searchType=${searchType}&keyword=${keyword}`;
						}
						
                     //이전 버튼
                                function fn_prev(currPageNo, range, pageSize) {
        
                                        var searchType = document.getElementById('paginationData')
                                                        .getAttribute('data-searchType');
                                        var keyword = document.getElementById('paginationData')
                                                        .getAttribute('data-keyword');
                                        var currPageNo = (range - 1) * pageSize;
                                        var range = range - 1;
        
                                        location.href = getUrl(currPageNo, range, searchType, keyword);
        
                                }

                                //페이지 번호 클릭
        
                                function fn_pagination(currPageNo, range) {
        
                                        var searchType = document.getElementById('paginationData')
                                                        .getAttribute('data-searchType');
                                        var keyword = document.getElementById('paginationData')
                                                        .getAttribute('data-keyword');
                                 
                                        location.href = getUrl(currPageNo, range, searchType, keyword);
        
                                }
                                //다음 버튼 이벤트
                                function fn_next(currPageNo, range, pageSize) {
        
                                        var searchType = document.getElementById('paginationData')
                                                        .getAttribute('data-searchType');
                                        var keyword = document.getElementById('paginationData')
                                                        .getAttribute('data-keyword');
                                        var currPageNo = (range * pageSize) + 1;
                                        var range = parseInt(range) + 1;
        
                                        location.href =  getUrl(currPageNo, range, searchType, keyword);
                                }