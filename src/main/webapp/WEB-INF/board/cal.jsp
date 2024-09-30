<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Axios CDN 추가 -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<style>
/* body 스타일 */
html, body {
/* 	overflow: hidden; */
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}
/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
 	padding-top: 1em; 
 	padding-left: 1em; 
 	padding-right: 1em; 
}

.fc-listWeek-button,
.fc-timeGridDay-button,
.fc-timeGridWeek-button, 
.fc-dayGridMonth-button {
 	color : #000 !important; 
    display: none !important; 
}

.fc-daygrid-event {
    border-color: #fff !important;
}

#calendar {
    width: 80%; /* 너비를 조정, 필요에 따라 변경 */
    height: 400px; /* 높이를 조정, 필요에 따라 변경 */
    margin: 0 auto; /* 중앙 정렬 */
}
</style>
</head>
<body>
	<!-- calendar 태그 -->
	<div id='calendar-container'>
		<div id='calendar'></div>
	</div>
	<!-- 부트스트랩 modal 부분 -->
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일정 추가하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					일정이름 : <input type="text" id="cal_title" /><br /> 시작시간 : <input
						type="datetime-local" id="cal_date" /><br /> 종료시간 : <input
						type="datetime-local" id="cal_edate" /><br /> 작성자 : <input
						style="display: none;" type="text" id="cal_writer" value="관리자" /><br />
					생성시간 : <input style="display: none;" type="datetime-local"
						id="cal_create_date" /><br />
					            배경색상 :
					            <select id="cal_color">
					              <option value="red">빨강색</option>
					              <option value="orange">주황색</option>
					              <option value="yellow">노랑색</option>
					              <option value="green">초록색</option>
					              <option value="blue">파랑색</option>
					              <option value="indigo">남색</option>
					              <option value="purple">보라색</option>
					            </select>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="saveChanges">
						추가</button>
				</div>
			</div>
		</div>
	</div>

<script>
$(function(){
    // 현재 시간 값 넣기
    document.getElementById('cal_create_date').value = new Date().toISOString().slice(0, -1);
    
    // calendar element 취득
    var calendarEl = $('#calendar')[0];
    
    // full-calendar 생성하기
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	googleCalendarApiKey: 'AIzaSyCulx2liTBopHvLm2YQUO2hPI8Wm47eB_s',
        height: '700px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        customButtons: {
            myCustomButton: {
                text: "일정 추가하기",
                click: function() {
                    $("#exampleModal").modal("show");
                }
            },
            mySaveButton: {
                text: "저장하기",
                click: async function() {
                    if (confirm("저장하시겠습니까?")) {
                        var allEvent = calendar.getEvents().map(event => ({
                            cal_title: event.title,
                            cal_date: event.start.toISOString(),
                            cal_edate: event.end ? event.end.toISOString() : null,
                            cal_writer: event.extendedProps.writer || "관리자",
                            cal_create_date: event.extendedProps.create_date || new Date().toISOString(),
                            cal_color: event.backgroundColor
                        }));
                        
                        console.log("allEvent", allEvent);
                        const saveEvent = await axios({
                            method: "POST",
                            url: "insertCal",
                            data: allEvent,
                        });
                        
                        console.log("데이터 삽입 완료");
                        location.reload();
                    }
                },
            }
        },
        
        headerToolbar: {
            left: 'prev,next today,myCustomButton,mySaveButton',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth',
        navLinks: false,
        editable: true,
        selectable: false,
        nowIndicator: false,
        dayMaxEvents: false,
        locale: 'ko',
        
     // 특정 요일에 스타일 적용
        dayCellDidMount: function(arg) {
            var day = arg.date.getDay(); // 0: 일요일, 6: 토요일
            
//             if (day === 0) {
//                 // 일요일 스타일: 빨간 글씨, 연한 빨강 배경
//                 arg.el.style.backgroundColor = '#ffe6e6';  // 연한 빨강 배경색
//             } else if (day === 6) {
//                 // 토요일 스타일: 연파랑 배경
//                 arg.el.style.backgroundColor = '#e6f7ff';  // 연파랑 배경색
//             }
        },
        
        // 데이터 가져오는 이벤트
        eventSources: [
            {
                events: async function(info, successCallback, failureCallback) {
                    const eventResult = await axios({
                        method: "GET",
                        url: "getCalList",
                        responseType: "json",
                    });

                    const eventData = eventResult.data;
                    console.log(eventData);

                    // 중복 확인 후 이벤트에 넣을 배열 선언
                    const existingEventIds = calendar.getEvents().map(e => e.id); // 기존 이벤트 ID 목록

                    const eventArray = [];
                    eventData.forEach((res) => {
                        // 중복된 이벤트는 추가하지 않음
                        if (!existingEventIds.includes(res.cal_number)) {
                            eventArray.push({
                                id: res.cal_number, // 수정된 부분: 중복 방지를 위해 ID 추가
                                number: res.cal_number,
                                title: res.cal_title,
                                start: res.cal_date,
                                end: res.cal_edate,
                                color: res.cal_color,
                            });
                        }
                    });
                    successCallback(eventArray);
                },
            },
            {
            	//공휴일 표시
                googleCalendarId : 'ko.south_korea.official#holiday@group.v.calendar.google.com',
                backgroundColor: 'red',
              }
        ],

        eventContent: function(arg) {
            let eventTitle = document.createElement('div');
            eventTitle.innerHTML = arg.event.title;

            // cal_number가 있는 경우에만 삭제 버튼을 생성
            if (arg.event.extendedProps.number) {
                let deleteBtn = document.createElement('span');
                deleteBtn.innerHTML = ' ❌';
                deleteBtn.style.cursor = 'pointer';
                deleteBtn.style.float = 'right';
//                 deleteBtn.style.transform = 'translateY(-18px)';

                deleteBtn.addEventListener('click', async function() {
                    if (confirm("일정을 삭제하시겠습니까?")) {
                        const cal_number = arg.event.extendedProps.number;

                        try {
                            await axios({
                                method: 'DELETE',
                                url: 'deleteCal?cal_number=' + cal_number,
                                responseType: "json"
                            });
                            console.log("일정 삭제 완료");
                            arg.event.remove();
                        } catch (error) {
                            console.error("일정 삭제 실패", error);
                        }
                    }
                });

                // 삭제 버튼을 이벤트 제목에 추가
                eventTitle.appendChild(deleteBtn);
            }

            return { domNodes: [eventTitle] };
        }
    });

    // 모달창 이벤트
    $("#saveChanges").on("click", function() {
        var eventData = {
            title: $("#cal_title").val(),
            start: $("#cal_date").val(),
            end: $("#cal_edate").val(),
            writer: $("#cal_writer").val(),
            create_date: $("#cal_create_date").val(),
            color: $("#cal_color").val(),
        };

        console.log("eventData ", eventData);

        // 빈값 체크
        if (eventData.title === "" || eventData.start === "") {
            alert("입력하지 않은 값이 있습니다.");
        } else if ($("#cal_date").val() > $("#cal_edate").val()) {
            alert("시간을 잘못입력 하셨습니다.");
        } else {
            // 이벤트 추가
            calendar.addEvent(eventData);
            $("#exampleModal").modal("hide");
            $("#cal_title").val("");
            $("#cal_date").val("");
            $("#cal_edate").val("");
            $("#cal_writer").val("");
            $("#cal_create_date").val("");
            $("#cal_color").val();
        }
    });

    // 캘린더 렌더링
    calendar.render();
});
	</script>

<style>
#stNav{
	z-index:1;
}
.modal-content{
	margin-top : 300px;
}
.event-container {
  display: flex; /* Flexbox 사용 */
  justify-content: space-between; /* 양쪽 끝으로 정렬 */
  align-items: center; /* 수직 중앙 정렬 */
}

.delete-button {
  font-size : smaller;
  float : right; /* 제목과 버튼 사이의 간격 추가 */
  border-radius : 5px;
  transform: translateY(-1px); /* 버튼을 1px 위로 이동 */
  
}
</style>

</body>
</html>