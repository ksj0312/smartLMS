function stuInfo(id) {
    var data = {id : id};
  	 $.ajax({
       url: "/admin/students/student", 
       type: "GET", 
       data: data, 
       contentType: "application/json",
       success: function(response) { 
       
      		 let date = new Date(response.admission_date); 
					
			 let adDate = date.getFullYear() + '-' +
				('0' + (date.getMonth() + 1)).slice(-2) + '-' +
				('0' + date.getDate()).slice(-2);
				
			if(response.graduation_date != null){
			   let date2 = new Date(response.graduation_date); 
					
				 let grDate = date2.getFullYear() + '-' +
				('0' + (date2.getMonth() + 1)).slice(-2) + '-' +
				('0' + date2.getDate()).slice(-2); 
				
             	$("#graduation_date").val(grDate);
			}
              $("#id").val(response.id);
              $("#stuname").val(response.name);
              $("#gender").val(response.gender);
              $("#birth").val(response.birth);
              $("#tel").val(response.tel);
              $("#zipcode").val(response.zipcode);
              $("#addr").val(response.addr);
              $("#detail_addr").val(response.detail_addr);
              $("#email").val(response.email);
              $("#department").val(response.department);
              $("#grade").val(response.grade);
              $("#admission_date").val(adDate);
              $("#status").val(response.status);
       },
       error: function(xhr, status, error) { 
       }
   });
   }
   
   function getUrl(currPageNo, range, searchType, keyword) {
 						 return `/admin/students?currPageNo=${currPageNo}&range=${range}&searchType=${searchType}&keyword=${keyword}`;
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
			