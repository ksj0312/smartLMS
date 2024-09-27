				function search(){
					let searchDate = document.getElementById("searchDate").value;
					let keyword = document.getElementById("keyword").value;
					let c_number = document.getElementById("c_number").value;
					let searchType = document.getElementById("searchType").value;
					
					if (!searchDate && !keyword) {
				        alert('검색어나 날짜를 입력해주세요.');
				        return;
				    }else if(!searchDate){
				      	alert('날짜를 입력해주세요.');
				        return;
				    }
				        $.ajax({
       				  	url : "/attendSearch",
        				data :{  
           					 "searchType": searchType,
           					 "keyword": keyword,
            			     "c_number": c_number,
            			     "searchDate": searchDate
        				},
        				type : "GET",
        				success: function(data){
        				    $('#table').empty(); 
        				    $('#table').append(
        				    `
        				    <tr>		
	        				    <th>날짜</th>
	                            <th>학번</th>
	                            <th>이름</th>
	                            <th>출결</th>
	                            <th>출결 수정</th>
                            </tr>`
        				    );
					  		       				 
				            values = data.attList;
				            $.each(values, function(index, value){
				            let date = new Date(value.a_date); 
					
					        let formattedDate = date.getFullYear() + '-' +
					            ('0' + (date.getMonth() + 1)).slice(-2) + '-' +
					            ('0' + date.getDate()).slice(-2); 
								$("#table").append(
				                    `<tr id ="attList">
				                           <td class="tdCenter"> 
								                           <input type="text" name="a_date" id="a_date" value="${formattedDate}" readonly> 
                                                </td>
                                                <td><input type="text" name="id_${value.id}"  value="${value.id}" style="border:none;" readonly /></td>
                                                <td><input type="text" name="name_${value.id}"  value="${value.name}" style="border:none;" readonly/></td>
                                                <td>
                                                <input type="radio" name="a_status_${value.id}" value="출석" ${value.a_status === '출석' || value.a_status == null ? 'checked' : ''} />출석
								                <input type="radio" name="a_status_${value.id}" value="지각" ${value.a_status === '지각' ? 'checked' : ''} />지각
								                <input type="radio" name="a_status_${value.id}" value="조퇴" ${value.a_status === '조퇴' ? 'checked' : ''} />조퇴
								                <input type="radio" name="a_status_${value.id}" value="결석" ${value.a_status === '결석' ? 'checked' : ''} />결석
								                </td>
                                                </td>
                                                <td> <button type="button" onclick="updateAttendance('${value.id}', '${value.c_number}')"> 수정 </button> </td>
                                                </tr>
                                                `
				 			 );
				 			});
       					},error: function(){
           				 alert("검색 결과가 없습니다.");
         				}
     					 });
				}

                //출석부 출결 상태 변경
                 function updateAttendance(id, c_number){
                   let a_status_radio = document.getElementsByName(`a_status_${id}`);
                   let a_date = document.getElementById("a_date").value;
                   let a_status = "";
                   
                    if (!a_date) {
       				 alert("날짜를 선택하세요.");
      				 return;
   					}
                   
                   for (const radio of a_status_radio) {
    				if (radio.checked) {
        			a_status = radio.value;
       				 break;
    				}
    				}
        		        $.ajax({
       				  	url : "/updateAttendance",
        				data :JSON.stringify({  
           					 "a_status": a_status,
           					 "id": id,
            			     "c_number": c_number,
            			     "a_date": a_date
        				}),
        				type : "PUT",
        				contentType: "application/json",
        				success: function(data){
        				
        				 alert(`학번 ${id}의 출결 상태가 '${a_status}'로 수정되었습니다.`);
        				 
       					},error: function(){
           				 alert("출결 상태 변경에 실패했습니다. 다시 시도해주세요.");
         				}
     					 });
                 }

