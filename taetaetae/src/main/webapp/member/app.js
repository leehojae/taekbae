window.onload = function() {
	showViewItems(false);
	
	listMember();
	
	$('cancelBtn').click( function() {
		showViewItems(false);
	});
	
	$('addBtn').click( function() {
		$.ajax( 'ajax/add.do', {
				method: 'POST',
				data: {
					name: $('mName').value,
					email: $('mEmail').value,
					tel: $('mTel').value,
					age: $('mAge').value,
					password: $('mPassword').value
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
					email: $('mEmail').value,
					tel: $('mTel').value,
					age: $('mAge').value,
					password: $('mPassword').value
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
					html += '<td>' + m.email + '</td>';	
					html += '<td>' + m.tel + '</td>';	
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

function loadMember(no) {
	$.ajax('ajax/read.do?no=' + no, {
			method: 'GET', 
			success: function(member){
		$("mNo").value = member.no;
		$("mName").value = member.name;
		$("mTel").value = member.tel;
		$("mAge").value = member.age;
		$("mEmail").value = member.email;
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













