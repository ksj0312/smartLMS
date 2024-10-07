function logout() {
  window.history.forward();
  location.href="/logout";
}


$(document).ready(function(){
	var b = '게시판';
	$.ajax({
	   url: "/board/main", 
       type: "GET", 
       data: {b_type : b}, 
		success: function(response) { 
		      values = response.board;
	       	 $('.mainta').empty(); 
	       	 $(".mainta").append(
	       	 `<tr>
	       	 	<th></th>
				<th></th>
				<th></th>
			</tr>`
	       	 );
				$.each(values, function(index, value){
				$(".mainta").append(
				`
				<tr onclick="location.href='/boarddetail?b_number=${value.b_number}'" style="cursor:hand">
				<td>-</td>
				<td> ${value.b_title}</td>
				<td> ${value.b_name}</td>
				</tr>
				`
				)
				});
		},error: function(xhr, status, error) { 
       		$(".mainul").append(
				`
				<div>등록된 공지사항 내역이 없습니다.</div>
				`
				)
       }
	
	});
});


$(document).ready(function(){
    var uid = document.getElementById("uid").value;
    
    if(uid !== null && uid.trim() !== "") {
        $.ajax({
            url: "/message", 
            type: "GET", 
            data: {}, 
            success: function(response) { 
            },
            error: function(xhr, status, error) { 
            }
        });
    }
});
