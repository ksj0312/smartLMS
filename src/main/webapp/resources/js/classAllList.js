
					//url생성 함수
					function getUrl(currPageNo, range, searchType, keyword) {
 						 return `/classAllList?currPageNo=${currPageNo}&range=${range}&searchType=${searchType}&keyword=${keyword}`;
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