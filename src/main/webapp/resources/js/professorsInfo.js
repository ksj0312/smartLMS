function professor(id) {
    var data = {id : id};
  	 $.ajax({
       url: "professor", 
       type: "GET", 
       data: data, 
       contentType: "application/json",
       success: function(response) { 
       
              $("#proname").val(response.name);
              $("#gender").val(response.gender);
              $("#birth").val(response.birth);
              $("#email").val(response.email);
              $("#lesson").val(response.lesson);
       },
       error: function(xhr, status, error) { 
       }
   });
   }
   
   function getUrl(currPageNo, range, searchType, keyword) {
 						 return `/professors?currPageNo=${currPageNo}&range=${range}&searchType=${searchType}&keyword=${keyword}`;
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
			