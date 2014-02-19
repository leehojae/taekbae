window.onload = function() {
	showViewItems(false);
	
	listOffice();
	
	$('cancelBtn').click( function() {
		showViewItems(false);
	});
	
	$('addBtn').click( function() {
		$.ajax( 'ajax/addOffice.do', {
				method: 'POST',
				data: {
					officeNum: $('oNo').value,
					officeName: $('oName').value,
					
					officeTel: $('oTel').value,
					officePostNum: $('oPostNo').value,
					officeAddr: $('oOfficeAddr').value,
					officeFax: $('oFax').value
				},
				success: function(office){
					location.href = 'officeApp.html';
		}});
	});
	
	$('updateBtn').click( function() {
		$.ajax( 'ajax/updateOffice.do', {
				method: 'POST',
				data: {
					officeNum: $('oNo').value,
					officeName: $('oName').value,
					
					officeTel: $('oTel').value,
					officePostNum: $('oPostNo').value,
					officeAddr: $('oOfficeAddr').value,
					officeFax: $('oFax').value
				},
				success: function(offices){
					location.href = 'officeApp.html';
		}});
	});
	
	$('delBtn').click( function() {
		if (confirm('정말 삭제하시겠습니까?')) {
			$.ajax( 'ajax/deleteOffice.do?no=' + $('oNo').value, { 
					method: 'GET', 
					success: function(offices){
						location.href = 'officeApp.html';
			}});
		}
	});
};

function listOffice() {
	
	$.ajax('ajax/officeList.do', {
			method: 'GET', 
			success: function(office){
				var o = null;
				var tr = null;
				var html = null;
				var table = $('listTable');
				for (var i = 0; i < office.length; i++) {
					o = office[i];
					tr = document.createElement('tr');
					html = '';
					html += '<td>' + o.officeNum + '</td>'; 
					html += '<td><a href="#" class="officeName" data-no="' + 
						o.officeNum + '">' + 
						o.officeName + '</a></td>';	
					html += '<td>' + o.officeTel + '</td>';	
					html += '<td>' + o.officePostNum + '</td>';	
					html += '<td>' + o.officeAddr + '</td>';	
					html += '<td>' + o.officeFax + '</td>';	
				  tr.innerHTML = html;
				  table.appendChild(tr);
				}
				
				var alist = document.querySelectorAll('.officeName');
				for (var i = 0; i < alist.length; i++) {
					alist[i].onclick = function() {
						loadOffice(this.getAttribute("data-no"));
					};
				}
			}, 
			error: function(){
			//	alert('시스템이 바쁩니다.\n나중에 다시 시도해 주세요!');
	}});
}

function loadOffice(no) {
	$.ajax('ajax/readOffice.do?no=' + no, {
			method: 'GET', 
			success: function(office){
		$("oNo").value = office.officeNum;
		$("oName").value = office.officeName;
		$("oTel").value = office.officeTel;
		$("oPostNo").value = office.officePostNum;
		$("oOfficeAddr").value = office.officeAddr;
		$("oFax").value = office.officeFax;
		
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













