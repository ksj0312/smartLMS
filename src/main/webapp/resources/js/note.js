
$(document).ready(function() {
    
    var noteList = $('#noteList');
    var currentPage = 1;
    var pageSize = 5;



    // 공통적으로 사용할 함수
    function loadNoteList() {
		console.log('AJAX 요청: ', {
    page: currentPage,
    size: pageSize,
    search: search,
    userId: userId
});
    	var search = $('#searchInput').val();
    	console.log(search);
    	$.ajax({
            url: search ? '/searchnote':'/receivnote',
            type: 'GET',
            dataType: 'json',
            data: {
                page: currentPage,
                size: pageSize,
                search: search,
                userId: userId
            },
            cache: false,
            success: function(data) {
                console.log(data); // 서버에서 받은 JSON 데이터를 콘솔에 출력
                noteList.empty(); // 기존 리스트 항목 삭제
                console.log(data.totalPages);
                console.log(data.notes.length);
                
                $('.searchdiv').show();
                $('#pagination').show();

                // JSON 데이터를 기반으로 리스트 항목 추가
                if(data.notes.length > 0){
                $.each(data.notes, function(index, note) {
                    if(userId == note.n_reciver){
                        noteList.append(
                            '<li>' + 
                            '<strong>보낸사람: ' + note.n_sender+ '</strong> ' + 
                            '<br>제목: ' + note.n_title + 
            		<!--	'<button class="writeBtn">글쓰기</button>' + 	-->
                            '<button class="detailBtn1" data-number="' + note.n_number + '">보기</button>&nbsp;' +
                            '<br>' + 
                            '</li>'
                        );
                    }
                });
                }else{
                	noteList.append('<p>검색 결과가 없습니다.</p>');
                }
                $('#pagination').empty();
                var paginationHtml = '';
                if (data.prev) {
                    paginationHtml += '<button class="prevPageBtn ">이전</button>';
                }
                
                // 페이지 번호 생성
                for (var i = 1; i <= data.totalPages; i++) {
                    if (i === currentPage) {
                        paginationHtml += '<li class="active">' + i + '</li>';
                    } else {
                        paginationHtml += '<li class="page-link" data-page="' + i + '">' + i + '</li>';
                    }
                }
                
                if (data.next) {
                    paginationHtml += '<button class="nextPageBtn">다음</button>';
                }
                $('#pagination').append(paginationHtml);
                
                // 모달 창 표시
                $('#noteModal').show();
            },
            error: function(xhr, status, error) {
                console.error('AJAX Error: ' + status + ' ' + error);
            }
        });
    }

    // 모달 창 열기 버튼 클릭 시
    $('.openModalBtn').click(function() {
    	currentPage = 1;
        loadNoteList(); // 쪽지 목록 로드 함수 호출
    });

    // 검색 버튼 클릭 시

	$('#searchButton').click(function() {
		currentPage = 1;
		loadNoteList();
});


function checkUser(n_reciver, callback) {
    $.ajax({
        url: '/checkUser',
        type: 'GET',
        data: { 
            n_reciver: n_reciver // 인수로 받은 수신자 ID
        },
        success: function(response) {
            callback(response); // 응답을 콜백 함수로 전달
        },
        error: function(xhr, status, error) {
            console.error('AJAX Error: ' + status + ' ' + error);
            alert('사용자 확인 중 오류가 발생했습니다.');
        }
    });
}

    // "보내기" 버튼 클릭 시
function sendNote() {
    var formData = {
        n_sender: $('#n_sender').val(),
        n_reciver: $('#n_reciver').val(),
        n_title: $('#n_title').val(),
        n_info: $('#n_info').val()
    };

    if (!formData.n_reciver || !formData.n_title || !formData.n_info) {
        alert('모든 필드를 입력해주세요.');
        return;
    }

    // 사용자 존재 여부 확인
    checkUser(formData.n_reciver, function(userExist) {
        if (userExist) {
            $.ajax({
                url: '/sendnote',
                type: 'POST',
                data: formData,
                success: function(response) {
                    console.log(response);
                    alert('쪽지가 성공적으로 보내졌습니다!');
                    loadNoteList();
                    closeModal();
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error: ' + status + ' ' + error);
                    alert('쪽지 전송 중 오류가 발생했습니다.');
                }
            });
        } else {
            alert('받는사람 아이디가 존재하지 않습니다.');
        }
    });
}

						// 동적으로 생성된 "보기" 버튼에 이벤트는 on으로 해라
						$('#noteList')
								.on(
										'click',
										'.detailBtn1',
										function() {
											var number = $(this).data('number'); // 버튼에 설정한 data-number 값을 가져옴
											var n_reciver = $('#n_reciver');
											$
													.ajax({
														url : '/detailnote',
														type : 'GET',
														data : {
															n_number : number
														}, // 데이터를 객체로 전송
														success : function(data) {
															console.log(data); // 서버에서 받은 데이터를 출력
															$('.searchdiv')
																	.hide();
															$('#pagination').hide();
															noteList
																	.html('<h3>제목: '
																			+ data.n_title
																			+ '</h3>'
																			+ '<p>보낸 사람: '
																			+ data.n_sender
																			+ '</p>'
																			+ '<p>내용: '
																			+ data.n_info
																			+ '</p>'
																			+ '<button class="responBtn" data-reciver="' + data.n_sender + '">답장</button>'
																			+ '&nbsp;'
																			+ '<button class="deleteBtn" data-delnum="' + data.n_number + '">삭제</button>'
																			+ '&nbsp;'
																			+ '<button class="openListBtn">목록</button>');
															n_reciver
																	.val(data.n_sender);
														},
														error : function(xhr,
																status, error) {
															console
																	.error('AJAX Error: '
																			+ status
																			+ ' '
																			+ error);
														}
													});
										});

						// 삭제 버튼 클릭 시
						$('#noteList')
								.on(
										'click',
										'.deleteBtn',
										function() {
											var delnum = $(this).data('delnum'); // 버튼에 설정한 data-delnum 값을 가져옴
											var isConfirmed = confirm("정말로 이 쪽지를 삭제하시겠습니까?");
											if (isConfirmed) {
												$
														.ajax({
															url : '/deletenote?n_number='
																	+ delnum, // URL에 n_number를 쿼리 파라미터로 전달
															type : 'DELETE',
															success : function(
																	data) {
																console
																		.log(data); // 서버에서 받은 JSON 데이터를 콘솔에 출력
																loadNoteList(); // 쪽지 목록 다시 로드
															},
															error : function(
																	xhr,
																	status,
																	error) {
																console
																		.error('AJAX Error: '
																				+ status
																				+ ' '
																				+ error);
															}
														});
											} else {
												// 사용자가 취소를 누르면 아무 일도 일어나지 않음
												console.log("삭제가 취소되었습니다.");
											}
										});
						// 모달 창 닫기 함수
						function closeModal() {
							$('#noteModal').hide(); // 모달 창 숨기기
							$('#noteList').empty(); // <ul> 태그의 내용을 비움
							$('#searchInput').val(''); // 검색 필드 초기화
							$('#sendNoteForm').hide(); // 답장 폼 숨기기
						}

						// 이전 페이지로 이동
						$(document).on('click', '.prevPageBtn', function() {
							if (currentPage > 1) {
								currentPage--;
								loadNoteList(); // 이전 페이지 데이터 로드
							}
						});

						// 다음 페이지로 이동
						$(document).on('click', '.nextPageBtn', function() {
							currentPage++;
							loadNoteList(); // 다음 페이지 데이터 로드
						});

						// "답장" 버튼 클릭 시 폼을 모달에 추가
						$('#noteList').on('click', '.responBtn', function() {
							noteList.html($('#sendNoteForm').clone().show());
							$('#pagination').hide();
							$('.searchdiv').hide();
							
							
						});
						//"글쓰기" 버튼 클릭시 
   						$(document).on('click', '.writeBtn', function() {

							noteList.html($('#sendNoteForm').clone().show());
							$('#n_reciver').val('');
							$('#pagination').hide();
							$('.searchdiv').hide();
							$('#n_reciver').prop('readonly', false);
							
							
						});
						
						
   						$(document).on('click', '#sendBtn', function() {
    						sendNote(); // 동적으로 생성된 #sendBtn에 대해서도 작동
							});

			

						// "목록" 버튼 클릭 시 쪽지 목록을 다시 로드
						$('#noteList').on('click', '.openListBtn', function() {
							loadNoteList(); // 쪽지 목록 로드 함수 호출
						});

						// 모달 창 닫기
						$('.close').click(function() {
							closeModal();
							
						});
						
						// 모달 창 바깥 클릭 시 닫기
						$(window).click(function(event) {
							if ($(event.target).is('#noteModal')) {
				
								closeModal();
							
							}
						});
						
						$(document).on('click', '.page-link', function() {
						    currentPage = $(this).data('page');
						    loadNoteList(); // 선택한 페이지 데이터 로드
						});
						//답장할때 리드온니
						$(document).on('click', '.responBtn', function(){
							$('#n_reciver').prop('readonly', true)
						});

						$(document).on('click', '.page-link', function() {
							currentPage = $(this).data('page');
							loadNoteList(); // 선택한 페이지 데이터 로드
						});
					});

