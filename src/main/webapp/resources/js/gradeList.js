                //등급 변경
                 function gradeUpdate(g_number, id){
                  		var grade = document.getElementById('grade_' + id).value;
                  		 
        		        $.ajax({
       				  	url : "/gradeUpdate",
        				data :JSON.stringify({  
           					 "g_number": g_number,
           					 "id": id,
           					 "grade" : grade
        				}),
        				type : "PUT",
        				contentType: "application/json",
        				success: function(data){
        				
        				 alert(`학번 ${id}의 등급이 '${grade}'로 수정되었습니다.`);
        				 
       					},error: function(){
           				 alert("등급 변경에 실패했습니다. 다시 시도해주세요.");
         				}
     					 });
                 }


			//검색
			function search(){
					let keyword = document.getElementById("keyword").value;
					let g_number = document.getElementById("g_number").value;
					let c_number = document.getElementById("c_number").value;
					let searchType = document.getElementById("searchType").value;
					
					if (!keyword) {
				        alert('검색어를 입력해주세요.');
				        return;
				    }
				    
				        $.ajax({
       				  	url : "/gradeSearch",
        				data :{  
           					 "g_number": g_number,
           					 "keyword": keyword,
            			     "c_number": c_number,
            			     "searchType": searchType
        				},
        				type : "GET",
        				success: function(data){
        				    $('#table').empty(); 
        				    $('#table').append(
        				    `
        				       <tr>
                                  <th>학번</th>
                                  <th>이름</th>
                                  <th>점수</th>
                                  <th>등급</th>
                                  <th>등급수정(+/-)</th>
                                </tr>
                            `
        				    );
					  		       				 
				            values = data.gradeList;
				            console.log(values);
				            $.each(values, function(index, value){
								$("#table").append(
								      ` 
								      <tr id ="gradeList">
                                                <td><input type="text" name="id_${value.id}"  value="${value.id}" style="display:none;" readonly />${value.id}</td>
                                                <td>${value.name}</td>
                                                <td><input type="text" name="level_${value.id}"  value="${value.level}" maxlength="3" required/></td>
                                                <td><input type="text" name="grade_${value.id}"  id = "grade_${value.id}" value="${value.grade}" required/></td>
                                                <td><button type="button" class="upbut" onclick="gradeUpdate('${value.g_number}', '${value.id}')">등급수정</button></td>
                                                </tr>
                                      `
				 			 );
				 			});
       					},error: function(){
           				 alert("검색 결과가 없습니다.");
         				}
     					 });
				}
