$(document).on("click", ".classInfo", function () {
    var c_number = $(this).val();
  	 $.ajax({
       url: "/admin/classinfo", 
       type: "GET", 
       data: {"c_number" : c_number}, 
       success: function(response) { 
             let date = new Date(response.c_create_date); 
					
			 let createDate = date.getFullYear() + '-' +
				('0' + (date.getMonth() + 1)).slice(-2) + '-' +
				('0' + date.getDate()).slice(-2); 
				
             let date2 = new Date(response.c_start_date); 
					
			 let startDate = date2.getFullYear() + '-' +
				('0' + (date2.getMonth() + 1)).slice(-2) + '-' +
				('0' + date2.getDate()).slice(-2); 
				
             let date3 = new Date(response.c_end_date); 
					
			 let endDate = date3.getFullYear() + '-' +
				('0' + (date3.getMonth() + 1)).slice(-2) + '-' +
				('0' + date3.getDate()).slice(-2); 
				
              $("#c_number").val(response.c_number);
              $("#c_name").val(response.c_name);
              $("#c_create_date").val(createDate);
              $("#c_start_date").val(startDate);
              $("#c_end_date").val(endDate);
              $("#c_id").val(response.c_id);
              $("#c_prof_name").val(response.c_prof_name);
              $("#c_stu_count").val(response.c_stu_count);
              $("#c_time").val(response.c_time);
              $("#c_info").val(response.c_info);
              $("#c_term").val(response.c_term);
              $("#c_day").val(response.c_day);
              $("#c_status").val(response.c_status);
       },
       error: function(xhr, status, error) { 
       }
   });
   });

					//url생성 함수
					function getUrl(currPageNo, range, searchType, keyword) {
 						 return `/admin/classes?currPageNo=${currPageNo}&range=${range}&searchType=${searchType}&keyword=${keyword}`;
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