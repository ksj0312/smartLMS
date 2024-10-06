			var c_number = document.getElementById('c_number').value;
			var c_name = document.getElementById('c_name').value;
			
				function testInfo(g_number){
					
				        $.ajax({
       				  	url : "/professor/test/classlist/testinfo",
        				data :{  
           					 "g_number": g_number
        				},
        				type : "GET",
        				success: function(response){
        					console.log(response);
				            let date = new Date(response.start_time);
				            let year = date.getFullYear();
				            let month = ("0" + (date.getMonth() + 1)).slice(-2); 
				            let day = ("0" + date.getDate()).slice(-2);
				            let hours = ("0" + date.getHours()).slice(-2);
				            let minutes = ("0" + date.getMinutes()).slice(-2);
				            let start_time = `${year}-${month}-${day}T${hours}:${minutes}`;
				            
				            let date2 = new Date(response.end_time);
				            let year2 = date2.getFullYear();
				            let month2 = ("0" + (date2.getMonth() + 1)).slice(-2); 
				            let day2 = ("0" + date2.getDate()).slice(-2);
				            let hours2 = ("0" + date2.getHours()).slice(-2);
				            let minutes2 = ("0" + date2.getMinutes()).slice(-2);
				            let end_time = `${year2}-${month2}-${day2}T${hours2}:${minutes2}`;
						
        				     $("#c_number1").val(response.c_number);
        				     $("#g_number").val(response.g_number);
          					 $("#id").val(response.id);
             				 $("#test_type").val(response.test_type);
             				 $("#start_time").val(start_time);
             				 $("#end_time").val(end_time);
             				 $("#test_time").val(response.test_time);
             				 $("#status").val(response.status);
             				 
       					},error: function(){
           				 alert("다시 시도해주세요.");
         				}
     					 });
				}

                //시험 정보 수정
                 function testUpdate(){
                 
              		   let g_number = document.getElementById("g_number").value;
					   let test_type = document.getElementById("test_type").value;
					   let start_time = document.getElementById("start_time").value;
					   let end_time = document.getElementById("end_time").value;
					   let test_time = document.getElementById("test_time").value;
					   let status = document.getElementById("status").value;
					
        		        $.ajax({
       				  	url : "/professor/test",
        				data :JSON.stringify({  
           					 "g_number": g_number,
           					 "test_type": test_type,
            			     "start_time": start_time,
            			     "end_time": end_time,
            			     "test_time": test_time,
            			     "status": status
        				}),
        				type : "PUT",
        				contentType: "application/json",
        				success: function(data){
        				
        				 alert(`시험 번호 ${g_number}의 정보가 수정되었습니다.`);
        				 
        				 
       					},error: function(){
           				 alert("시험 정보 수정에 실패하였습니다. 다시 시도해주세요.");
         				}
     					 });
                 }
                 
                  function getUrl(c_number, c_name ,currPageNo, range, searchType, keyword) {
 						 return `/professor/test/classlist/test?c_number=${c_number}&c_name=${c_name}&currPageNo=${currPageNo}&range=${range}&searchType=${searchType}&keyword=${keyword}`;
						}
						
                     //이전 버튼
                                function fn_prev(currPageNo, range, pageSize) {
        
                                        var searchType = document.getElementById('paginationData')
                                                        .getAttribute('data-searchType');
                                        var keyword = document.getElementById('paginationData')
                                                        .getAttribute('data-keyword');
                                        var currPageNo = (range - 1) * pageSize;
                                        var range = range - 1;
        
                                        location.href = getUrl(c_number, c_name, currPageNo, range, searchType, keyword);
        
                                }

                                //페이지 번호 클릭
        
                                function fn_pagination(currPageNo, range) {
        
                                        var searchType = document.getElementById('paginationData')
                                                        .getAttribute('data-searchType');
                                        var keyword = document.getElementById('paginationData')
                                                        .getAttribute('data-keyword');
                                 
                                        location.href = getUrl(c_number, c_name, currPageNo, range, searchType, keyword);
        
                                }
                                //다음 버튼 이벤트
                                function fn_next(currPageNo, range, pageSize) {
        
                                        var searchType = document.getElementById('paginationData')
                                                        .getAttribute('data-searchType');
                                        var keyword = document.getElementById('paginationData')
                                                        .getAttribute('data-keyword');
                                        var currPageNo = (range * pageSize) + 1;
                                        var range = parseInt(range) + 1;
        
                                        location.href =  getUrl(c_number, c_name, currPageNo, range, searchType, keyword);
                                }
			

