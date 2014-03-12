//var btn = w2obj.grid.prototype.buttons;
//btn['reload'].icon = 'icon/icon-repeat';
//btn['columns'].icon = 'icon-layers';

	$('#grid').w2grid(
			{
				name : 'grid',
				header : '금일 작업리스트',
				// url: 'data/list.json',
				multiSearch : true,
				fixedBody : true,
				
				
				show : {
					header : true,
					toolbar : true,
					footer : true,
					lineNumbers : true,
					selectColumn : true,
					expandColumn : true
				},
				
				toolbar: {
					
					items: [
						{ type: 'break' },
						{ type: 'menu',   id: 'roadSel', caption: '도로선택', icon: 'icon-add'},
						{ type: 'button',   id: 'memSel', caption: '기사선택', icon: 'icon-add'},
						{ type: 'html',   id: 'item3', html: '<select>' + 
																								 '<option>Option</option>' +
																								 '</select>'},
						                                                                           
						{ type: 'button', id: 'mybutton', caption: '전송', img: 'icon-add' }
					],
					onClick: function (target, data) {
						console.log(target);
						console.log(data);
						console.log(data.item.items);
						
						switch (data.subItem) {
						case '강남대로':
							w2ui.grid.search('receiverAddrRoad', '강남대로');
						break;
						case '고무래로':
							w2ui.grid.search('receiverAddrRoad', '고무래로');
							break;
						case '남부순환로':
							w2ui.grid.search('receiverAddrRoad', '남부순환로');
							break;
						case '명달로':
							w2ui.grid.search('receiverAddrRoad', '명달로');
							break;
						case '반포대로':
							w2ui.grid.search('receiverAddrRoad', '반포대로');
							break;
						case '법원로':
							w2ui.grid.search('receiverAddrRoad', '법원로');
							break;
						case '사임당로':
							w2ui.grid.search('receiverAddrRoad', '사임당로');
							break;
						case '사평대로':
							w2ui.grid.search('receiverAddrRoad', '사평대로');
							break;
						case '서리풀길':
							w2ui.grid.search('receiverAddrRoad', '서리풀길');
							break;
						case '서운로':
							w2ui.grid.search('receiverAddrRoad', '서운로');
							break;
						case '서초대로':
							w2ui.grid.search('receiverAddrRoad', '서초대로');
							break;
						case '서초중앙로':
							w2ui.grid.search('receiverAddrRoad', '서초중앙로');
							break;
						case '효령로':
							w2ui.grid.search('receiverAddrRoad', '효령로');
							break;
						}
						
						
//						if (data.subItem == '강남대로') {
//							console.log("ok");
//							w2ui.grid.search('receiverAddrRoad', '강남대로');
//						}
						
					}
				},
				
				searches : [ { type : 'int', field : 'trcno',	caption : '운송장번호'}, 
				             { type : 'int', field : 'orderNo', caption : '주문번호'}, 
				             { type : 'text',	field : 'receiverAddrRoad',	caption : '받는분주소'}, 
				             { type : 'date',	field : 'receiveDate', caption : '접수일'} ],
				             
				columns : [ {	field : 'trcno', caption : '운송장번호',	size : '30%'}, 
				            {	field : 'orderNo',	caption : '주문번호',	size : '30%'}, 
				            {	field : 'deliverDate', caption : '배달예정일',	size : '26%'}, 
				            {	field : 'receiverName',	caption : '받는분',	size : '15%'}, 
				            {	field : 'receiverAddrRoad',	caption : '받는분주소',	size : '60%',	type : 'text',	sortable : true}, 
				            {	field : 'receiverTel1',	caption : '받는분전화1',	size : '25%'}, 
				            {	field : 'productName',	caption : '품명', 	size : '10%'}, 
				            {	field : 'size',	caption : '크기', 	size : '10%'}, 
				            {	field : 'weight',	caption : '중량',	size : '10%'}, 
				            {	field : 'payment', caption : '운임구분',	size : '15%'}, 
				            {	field : 'pay', caption : '운임결제', size : '20%'}, 
				            {	field : 'returnBox', caption : '반품',	size : '10%'} ],
				            
				onExpand : function(event) {
					$('#' + event.box_id).html(
							'<div style="padding: 10px">Expanded content</div>').animate({
						'height' : 100
					}, 100);
				}
				
			});

$(function() {
	$.getJSON('excel/ajax/list.do', function(data) {
		var records = data.jsonResult.data;
		for (var i = 0; i < records.length; i++) {
			if (records[i].id != 0){
				records[i].recid = records[i].trcno;
			}
		}
		
		w2ui.grid.records = records;
		w2ui.grid.refresh();
		w2ui.grid.multiSelect = true;
		w2ui.grid.multiSort = true;
	});
});

$(function() {
	$.getJSON('excel/ajax/list.do', function(data) {
		var addrItem = data.jsonResult.data;
		var uniqueAddrItem = [];
		for (var i = 0; i < addrItem.length; i++) {
			addrItem[i] = (addrItem[i].receiverAddrRoad);
		}
		$.each(addrItem, function(i, el){
	    if($.inArray(el, uniqueAddrItem) === -1) uniqueAddrItem.push(el);
		});
		
		uniqueAddrItem.sort();
		
		w2ui.grid.toolbar.set('roadSel', { items: uniqueAddrItem });
	});
});

$(function() {
	$.getJSON('member/ajax/list.do', function(data) {
		var memItem = data.jsonResult.data;
		for (var i = 0; i < memItem.length; i++) {
			memItem[i] = memItem[i].name;
		}
		w2ui.grid.toolbar.set('memSel', { items: memItem });
	});
});
