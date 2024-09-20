$(document).on("click", ".stuInfo", function () {
    var id = $(this).val();
    var data = {id : id};
  	 $.ajax({
       url: "stuInfo", 
       type: "GET", 
       data: date, 
       contentType: "application/json",
       success: function(response) { 
				console.log("response: " + response);
              $("#id").val(response.id);
              $("#name").val(response.name);
              $("#gender").val(response.gender);
              $("#birth").val(response.birth);
              $("#zipcode").val(response.zipcode);
              $("#addr").val(response.addr);
              $("#detail_addr").val(response.detail_addr);
              $("#email").val(response.email);
              $("#department").val(response.department);
              $("#grade").val(response.grade);
              $("#admission_date").val(response.admission_date);
              $("#graduation_date").val(response.graduation_date);
              $("#status").val(response.status);
       },
       error: function(xhr, status, error) { 
       }
   });
   });
			