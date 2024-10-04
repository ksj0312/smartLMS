function attInfo(c_number) {
    $.ajax({
     url: "/myPageClassInfo", 
     type: "GET", 
     data: {c_number : c_number},  	
     contentType: "application/json",
     success: function(response) { 
    	 console.log(response.attendance);
    	   $('#attMo').empty();
           $('#attMo').append(
        		    `<tr>
                    	<th>출석</th>
                    	<th>지각</th>
                    	<th>조퇴</th>
                    	<th>결석</th>
                    </tr>
        		   `);
                    $('#attMo').append(
               		+'<tr id="trModal">'+
        		   '<td>' + response.attendance + '</td>'+
        		   '<td>' + response.tardy + '</td>'+
        		   '<td>' + response.early + '</td>'+
        		   '<td>' + response.absent + '</td>'+
        		   '</tr>'
             );
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
       
         $("#c_name").val(response.c_name);
         $("#c_create_date").val(createDate);
         $("#c_start_date").val(startDate);
         $("#c_end_date").val(endDate);
         $("#c_prof_name").val(response.c_prof_name);
         $("#c_stu_count").val(response.c_stu_count);
         $("#c_info").val(response.c_info);
         $("#c_term").val(response.c_term);
         $("#attendance").val(response.attendance);
         $("#tardy").val(response.tardy);
         $("#early").val(response.early);
         $("#absent").val(response.absent);
     },
     error: function(xhr, status, error) { 
           alert("상세보기 조회에 실패하였습니다. 다시 시도해주세요.");
     }
 });
} 
 	