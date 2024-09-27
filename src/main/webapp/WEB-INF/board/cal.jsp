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

#calendar {
    width: 80%; /* 너비를 조정, 필요에 따라 변경 */
    height: 400px; /* 높이를 조정, 필요에 따라 변경 */
    margin: 0 auto; /* 중앙 정렬 */
}
</style>
</head>
<body style="padding: 30px;">
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
					<!--             배경색상 : -->
					<!--             <select id="color"> -->
					<!--               <option value="red">빨강색</option> -->
					<!--               <option value="orange">주황색</option> -->
					<!--               <option value="yellow">노랑색</option> -->
					<!--               <option value="green">초록색</option> -->
					<!--               <option value="blue">파랑색</option> -->
					<!--               <option value="indigo">남색</option> -->
					<!--               <option value="purple">보라색</option> -->
					<!--             </select> -->
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
//   (function(){
    $(function(){
      
      
      // 현재 시간 값 넣기
      document.getElementById('cal_create_date').value = new Date().toISOString().slice(0, -1);

      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      var calendar = new FullCalendar.Calendar(calendarEl, {
//         googleCalendarApiKey: '',// 여기에 구글캘린더 api키 입력하시면 됩니다.
        height: '700px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
        customButtons: {
          myCustomButton: {
            text: "일정 추가하기",
            click: function(){
              $("#exampleModal").modal("show");
            }
          },
          mySaveButton: {
            text: "저장하기",
            click: async function(){
              if(confirm("저장하시겠습니까?")) {
                var allEvent = calendar.getEvents().map(event => ({
                  cal_title: event.title,
                  cal_date: event.start.toISOString(),
                  cal_edate: event.end ? event.end.toISOString() : null,
                  cal_writer: event.extendedProps.writer || "관리자",
                  cal_create_date: event.extendedProps.create_date || new Date().toISOString()
                }));
                console.log("allEvent", allEvent);
                const saveEvent = await axios({
                  method: "POST",
                  url: "insertCal",
                  data: allEvent,
                });
                console.log("데이터 삽입 완료");
              }
            },
          }
        },
        
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today,myCustomButton,mySaveButton',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        // initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        editable: true, // 수정 가능?
        selectable: true, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
          console.log(obj);
        },
        eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
          console.log(obj);
        },
        eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
          console.log(obj);
        },
        select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
          var title = prompt('Event Title:');
          if (title) {
            calendar.addEvent({
              title: cal_title,
              start: arg.cal_date,
              end: arg.cal_edate,
              allDay: arg.allDay
            })
          }
          calendar.unselect()
        },
        
        
      //데이터 가져오는 이벤트
        eventSources:[
          {
            events: async function (info, successCallback, failureCallback) {
          const eventResult = await axios({
            method: "GET",
            url: "getCalList",
            responseType: "json",
          });
          const eventData = eventResult.data;
          console.log(eventData);
          //이벤트에 넣을 배열 선언하기
          const eventArray = [];
          eventData.forEach((res) => {
            eventArray.push({
            	 id: res.id, // 이벤트 ID 추가
                 title: res.cal_title,
                 start: res.cal_date,
                 end: res.cal_edate,
//               backgroundColor: res.backgroundColor,
            });
          });
          successCallback(eventArray);
        
        },
          },
            {
//               googleCalendarId : 'ko.south_korea.official#holiday@group.v.calendar.google.com',
//               backgroundColor: 'red',
            }
        ],
        
        eventContent: function(arg) {
        	  // HTML 요소 생성
        	  const button = document.createElement('button');
        	  button.innerHTML = 'X';
        	  button.classList.add('delete-button');
        	  button.setAttribute('data-id', arg.event.);

        	  // 버튼 클릭 이벤트 처리
        	  button.addEventListener('click', function() {
        	    // 해당 이벤트의 제목, 시작 날짜, 종료 날짜
        	    const title = arg.event.title;
        	    const date = arg.event.start;
        	    const edate = arg.event.end;

        	    // deleteCal 메서드 호출, 필요한 값을 모두 전달
        	    deleteCal(title, date, edate);
        	  });

        	  // 이벤트 제목과 버튼을 포함한 요소 생성
        	  const container = document.createElement('div');
        	  container.innerHTML = arg.event.title; // 제목 추가
        	  container.appendChild(button); // 버튼 추가

        	  return { domNodes: [container] }; // 반환
        	}
      });
      
      async function deleteCal(calNumber) {
    	    console.log("삭제할 cal_number:", calNumber);
    	    
    	    try {
    	        const response = await axios.delete("/deleteCal", {
    	            data: {
    	                cal_number: calNumber // cal_number로 삭제 요청
    	            }
    	        });
    	        
    	        console.log('Event deleted:', response.data);
    	        // 추가 작업: UI 업데이트 등
    	    } catch (error) {
    	        console.error('Error deleting event:', error);
    	    }
    	}
      
      
      
   // 모달창 이벤트
      $("#saveChanges").on("click", function () {
        var eventData = {
          title: $("#cal_title").val(),
          start: $("#cal_date").val(),
          end: $("#cal_edate").val(),
          writer: $("#cal_writer").val(),
          create_date: $("#cal_create_date").val(),
        };

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
        }
      });
      // 캘린더 랜더링
      calendar.render();
    });
//   })();
</script>

<style>
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