window.onload = function() {
	showViewItems(false);
	
	listArea();
	
	$('cancelBtn').click( function() {
		showViewItems(false);
	});
	
	$('addBtn').click( function() {
		$.ajax( 'ajax/add.do', {
				method: 'POST',
				data: {
					memberNo: $('mNo').value,
					taskArea: $('area').value,
					areaClass: $('areaClass').value
				},
				success: function(areas){
					location.href = 'app.html';
		}});
	});
	
	$('updateBtn').click( function() {
		$.ajax( 'ajax/update.do', {
				method: 'POST',
				data: {
					no: $('aNo').value,
					memberNo: $('mNo').value,
					taskArea: $('area').value,
					areaClass: $('areaClass').value
				},
				success: function(areas){
					location.href = 'app.html';
		}});
	});
	
	$('delBtn').click( function() {
		if (confirm('정말 삭제하시겠습니까?')) {
			$.ajax( 'ajax/delete.do?no=' + $('aNo').value, { 
					method: 'GET', 
					success: function(areas){
						location.href = 'app.html';
			}});
		}
	});
};

function listArea() {
	
	$.ajax('ajax/list.do', {
			method: 'GET', 
			success: function(areas){
				var a = null;
				var tr = null;
				var html = null;
				var table = $('listTable');
				for (var i = 0; i < areas.length; i++) {
					a = areas[i];
					tr = document.createElement('tr');
					html = '';
					html += '<td>' + a.no + '</td>'; 
					html += '<td><a href="#" class="areaName" data-no="' + 
						a.no + '">' + 
						a.memberNo + '</a></td>';	
					html += '<td>' + a.taskArea + '</td>';	
					html += '<td>' + a.areaClass + '</td>';	
				  tr.innerHTML = html;
				  table.appendChild(tr);
				}
				
				var alist = document.querySelectorAll('.areaName');
				for (var i = 0; i < alist.length; i++) {
					alist[i].onclick = function() {
						loadArea(this.getAttribute("data-no"));
					};
				}
			}, 
			error: function(){
				alert('시스템이 바쁩니다.\n나중에 다시 시도해 주세요!');
	}});
}

function loadArea(no) {
	$.ajax('ajax/read.do?no=' + no, {
			method: 'GET', 
			success: function(area){
		$("aNo").value = area.no;
		$("mNo").value = area.memberNo;
		$("area").value = area.taskArea;
		$("areaClass").value = area.areaClass;
		
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
