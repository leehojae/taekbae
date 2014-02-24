window.onload = function() {
	showViewItems(false);
	
	listCar();
	
	$('cancelBtn').click( function() {
		showViewItems(false);
	});
	
	$('addBtn').click( function() {
		$.ajax( 'ajax/add.do', {
				method: 'POST',
				data: {
					no: $('mNo').value,
					carNumber: $('carNumber').value,
					carLoad: $('carLoad').value,
					carType: $('carType').value
					},
				success: function(cars){
					location.href = 'app.html';
		}});
	});
	
	$('updateBtn').click( function() {
		$.ajax( 'ajax/update.do', {
				method: 'POST',
				data: {
					carNumber: $('carNumber').value,
					carLoad: $('carLoad').value,
					carType: $('carType').value
				},
				success: function(cars){
					location.href = 'app.html';
		}});
	});
	
	$('delBtn').click( function() {
		if (confirm('정말 삭제하시겠습니까?')) {
			$.ajax( 'ajax/delete.do?no=' + $('cNo').value, { 
					method: 'GET', 
					success: function(cars){
						location.href = 'app.html';
			}});
		}
	});


function listCar() {
	
	$.ajax('ajax/list.do', {
			method: 'GET', 
			success: function(cars){
				var c = null;
				var tr = null;
				var html = null;
				var table = $('listTable');
				for (var i = 0; i < cars.length; i++) {
					c = cars[i];
					tr = document.createElement('tr');
					html = '';
					html += '<td>' + c.no + '</td>'; 
					html += '<td><a href="#" class="carName" data-no="' + 
						c.no + '">' + 
						c.carNumber + '</a></td>';	
					html += '<td>' + c.carLoad + '</td>';	
					html += '<td>' + c.carType + '</td>';	
					tr.innerHTML = html;
				  table.appendChild(tr);
				}
				
				var alist = document.querySelectorAll('.carNumber');
				for (var i = 0; i < alist.length; i++) {
					alist[i].onclick = function() {
						loadMember(this.getAttribute("data-no"));
					};
				}
			}, 
			error: function(){
				alert('커피한잔하고 오세요!');
	}});
}

function loadArea(no) {
	$.ajax('ajax/read.do?no=' + no, {
			method: 'GET', 
			success: function(car){
		$("cNo").value = car.no;
		$("mNo").value = area.memberNo;
		$("carNumber").value = car.carNumber;
  	$("carLoad").value = car.carLoad;
		$("carType").value = car.carType;
		
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

$('#form').w2form({ 
	name   : 'form',
	header : 'Large Form',
	url    : 'server/post',
	fields : [
		{ name: 'first_name', type: 'text', required: true },
		{ name: 'last_name',  type: 'text', required: true },
		{ name: 'comments',   type: 'text'},
		{ name: 'address1', type: 'text', required: true },
		{ name: 'address2', type: 'text' },
		{ name: 'city', type: 'text', required: true },
		{ name: 'state', type: 'text', required: true },
		{ name: 'zip', type: 'int', required: true },
		{ name: 'short_bio', type: 'text' },
		{ name: 'talk_name', type: 'text', required: true },
		{ name: 'description', type: 'text' }
	],
	actions: {
		reset: function () {
			this.clear();
		},
		save: function () {
			this.save();
		}
	}
});


}










