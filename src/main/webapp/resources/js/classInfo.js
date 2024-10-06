$(document).on("click", ".classUpdate", function () {
   let c_number = document.getElementById("c_number").value;
   let c_create_date = document.getElementById("c_create_date").value;
   let c_name = document.getElementById("c_name").value;
   let c_id = document.getElementById("c_id").value;
   let c_prof_name = document.getElementById("c_prof_name").value;
   let c_start_date = document.getElementById("c_start_date").value;
   let c_end_date = document.getElementById("c_end_date").value;
   let c_stu_count = document.getElementById("c_stu_count").value;
   let c_time = document.getElementById("c_time").value;
   let c_day = document.getElementById("c_day").value;
   let c_term = document.getElementById("c_term").value;
   let c_info = document.getElementById("c_info").value;
   let c_status = document.getElementById("c_status").value;
   
  	 $.ajax({
       url: "/admin/classinfo", 
       type: "PUT", 
       data: JSON.stringify({
      		      c_number : c_number,
			      c_create_date : c_create_date,
			      c_name : c_name,
			      c_id : c_id,
			      c_prof_name : c_prof_name,
			      c_start_date : c_start_date,
			      c_end_date : c_end_date,
			      c_stu_count : c_stu_count,
			      c_time : c_time,
			      c_day : c_day,
			      c_term : c_term,
			      c_info : c_info,
			      c_status : c_status
      		 }), 
       contentType: "application/json",
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
              
               alert(`강의 정보가 변경되었습니다.`);
       },
       error: function(xhr, status, error) { 
               alert(`강의 정보 변경에 실패하였습니다. 다시 시도해주세요.`);
       }
   });
   });