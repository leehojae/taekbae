window.onload = function() {
	showViewItems(false);
	
	listMember();
	selectOffice();
	
	$('cancelBtn').click( function() {
		showViewItems(false);
	});
	
	$('addBtn').click( function() {
		$.ajax( 'ajax/add.do', {
				method: 'POST',
				data: {
					officeNum: $('selectOffice').value,
					name: $('mName').value,
					id: $('mID').value,
					password: $('mPassword').value,
					tel: $('mTel').value,
					personalNumber: $('mPersonalNo').value
				},
				success: function(members){
					location.href = 'app.html';
		}});
	});
	
	$('updateBtn').click( function() {
		$.ajax( 'ajax/update.do', {
				method: 'POST',
				data: {
					no: $('mNo').value,
					name: $('mName').value,
					id: $('mID').value,
					password: $('mPassword').value,
					tel: $('mTel').value,
					personalNumber: $('mPersonalNo').value
				},
				success: function(members){
					location.href = 'app.html';
		}});
	});
	
	$('delBtn').click( function() {
		if (confirm('정말 삭제하시겠습니까?')) {
			$.ajax( 'ajax/delete.do?no=' + $('mNo').value, { 
					method: 'GET', 
					success: function(members){
						location.href = 'app.html';
			}});
		}
	});
};

function listMember() {
	
	$.ajax('ajax/list.do', {
			method: 'GET', 
			success: function(members){
				var m = null;
				var tr = null;
				var html = null;
				var table = $('listTable');
				for (var i = 0; i < members.length; i++) {
					m = members[i];
					tr = document.createElement('tr');
					html = '';
					html += '<td>' + m.no + '</td>'; 
					html += '<td><a href="#" class="memberName" data-no="' + 
						m.no + '">' + 
						m.name + '</a></td>';	
					html += '<td>' + m.id + '</td>';	
					html += '<td>' + m.tel + '</td>';	
					html += '<td>' + m.personalNumber + '</td>';	
					html += '<td>' + m.rank + '</td>';	
				  tr.innerHTML = html;
				  table.appendChild(tr);
				}
				
				var alist = document.querySelectorAll('.memberName');
				for (var i = 0; i < alist.length; i++) {
					alist[i].onclick = function() {
						loadMember(this.getAttribute("data-no"));
					};
				}
			}, 
			error: function(){
				alert('시스템이 바쁩니다.\n나중에 다시 시도해 주세요!');
	}});
}


function selectOffice() {
	
	$.ajax('ajax/officeList.do', {
		method: 'GET', 
		success: function(office)
		{
			var o = null;
			var option = null;
			var html = null;
			var selectbox = $('selectOffice');
			
			for (var i = 0; i < office.length; i++)
			{
				o = office[i];
				option = document.createElement('option');
				html = '';
				html += ' <option value='+ o.officeNum  +'>' +o.officeName + '</option>'; 
				
				option.innerHTML = html;
				selectbox.appendChild(option);
			}
		}, 
		error: function()
		{
			alert('시스템이 바쁩니다.\n나중에 다시 시도해 주세요!'); 
		}
			
	}
	);
}




function loadMember(no) {
	$.ajax('ajax/read.do?no=' + no, {
			method: 'GET', 
			success: function(member){
		$("mNo").value = member.no;
		$("mID").value = member.id;
		$("mPassword").value = member.password;
		$("mName").value = member.name;
		$("mTel").value = member.tel;
		$("mAge").value = member.age;
		$("mPersonalNo").value = member.personalNumber;
		$("mPhoto").src = "../files/" + member.photo;
		
		showViewItems(true);
	}});
}

function showViewItems(b) {
	var elements = document.querySelectorAll('.view');
	for (var i = 0; i < elements.length; i++) {
		if (b) {
			elements[i].style.display = '';
		} else {
			elements[i].style.display = 'none';
		}
		
		if (b) {
			$('addBtn').style.display = 'none';
			$('delBtn').style.display = '';
		} else {
			$('addBtn').style.display = '';
			$('delBtn').style.display = 'none';
		}
	}
}













