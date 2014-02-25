var config = {
	layout: {
		name: 'layout',
		padding: 4,
		panels: [
			{ type: 'left', size: '50%', resizable: true, minSize: 300 },
			{ type: 'main', minSize: 300 }
		]
	},
	grid: { 
		name: 'grid',
		columns: [
		          
			{ field: 'no', caption: 'no', size: '10%', sortable: true, searchable: true },
			{ field: 'id', caption: '이름', size: '15%', sortable: true, searchable: true },
			{ field: 'tel', caption: 'TEL', size: '33%', sortable: true, searchable: true },
			{ field: 'personalNumber', caption: '주민번호', size: '33%', sortable: true, searchable: true },
			{ field: 'rank', caption: '직위', size: '33%', sortable: true, searchable: true },
			{ field: 'officeNum', caption: '소속', size: '33%', sortable: true, searchable: true },
			{ field: 'officeName', caption: '소속', size: '33%', sortable: true, searchable: true },
		],

		onClick: function(event) {
			var grid = this;
			var form = w2ui.form;
			event.onComplete = function () {
				var sel = grid.getSelection();
				if (sel.length == 1) {
					form.recid  = sel[0];
					console.log( "form.recid  ddd : " + form.recid);
					form.record = $.extend(true, {}, grid.get(sel[0]));
					form.refresh();
				} else {
					form.clear();
				}
			}
		}
	},
	form: { 
		header: '회원 상세',
		//name: 'form',
		fields: [
			{ name: '지점', type: 'list', required: true, 
					options: { 
						match: 'contains',
						items: [
							{ id: 0, text: 'Pickle, Susan' }, 
							{ id: 1, text: 'Adams, John' },
							{ id: 2, text: 'Openhimer, Peter' },
							{ id: 3, text: 'Woznyak, Steve' },
							{ id: 4, text: 'Rusevelt, Franklin' },
							{ id: 5, text: 'Stalone, Silvester' },
							{ id: 6, text: 'Mann, Fred' },
							{ id: 6, text: 'Ford, Mary' },
							{ id: 8, text: 'Purky, Mon' },
							{ id: 9, text: 'Min, Hla' }
						]
					}
				},
			{ name: 'id', type: 'text', required: true, html: { caption: 'id', attr: 'size="40" maxlength="40"' } },
			{ name: 'tel', type: 'text', required: true, html: { caption: '이름', attr: 'size="40" maxlength="40"' } },
			{ name: 'personalNumber', type: 'text', html: { caption: '생년월일', attr: 'size="30"' } },
			{ name: 'rank', type: 'text', html: { caption: '직위', attr: 'size="10"' } },
			{ name: 'officeNum', type: 'text', html: { caption: 'officeNum', attr: 'size="10"' } },
			{ name: 'officeName', type: 'text', html: { caption: 'officeName', attr: 'size="10"' } }
			
		],
		actions: {
			Reset: function () {
				alert("e");
				this.clear();
			},
			
			
			

			
			
			Save: function () {
				//$("#name").w2destroy("name");
				$('#form').w2form({ 
					name     : 'form',
					url      : 'member/ajax/add.do',
					record: {
						field_1 : 1,
						field_2 : 2
					},

					actions: {
						"reset": function () {
							alert("coco55");
							this.clear();
						},
						"save": function () {
							alert("coco");
							this.save();
						}
					}
				});
		}
		}
	}
}

$(function () {
	// initialization in memory
	$().w2layout(config.layout);
	$().w2grid(config.grid);
	$().w2form(config.form);
});

function openPopup() {
	w2popup.open({
		title 	: '회원 목록',
		width	: 900,
		height	: 600,
		showMax : true,
		body 	: '<div id="main" style="position: absolute; left: 5px; top: 5px; right: 5px; bottom: 5px;"></div>',
		onOpen  : function (event) {
			event.onComplete = function () {
				$('#w2ui-popup #main').w2render('layout');
				w2ui.layout.content('left', w2ui.grid);
				w2ui.layout.content('main', w2ui.form);
			};
		},
		onMax : function (event) { 
			event.onComplete = function () {
				w2ui.layout.resize();
			}
		},
		onMin : function (event) {
			event.onComplete = function () {
				w2ui.layout.resize();
			}
		}
	});
}

$(function(){
	$.getJSON('member/ajax/list.do', function(data){
		
		var records = data.jsonResult.data;
		for (var i = 0; i < records.length; i++){
			records[i].recid = records[i].no;
			if(records[i].rank == 0)
			{
				
				
				console.log( i +  "   ,  aa records[i].rank : " + records[i].rank);
				records[i].rank = "방긋";
			}	
			else if(records[i].rank == 1)
			{
				console.log( i +  "   ,  bb records[i].rank : " + records[i].rank);
				records[i].rank = "b";
			}	
			else
			{
				console.log( i +  "   ,  cc records[i].rank : " + records[i].rank);
				records[i].rank = 'c';
			}	
			records[i].officeNum = records[i].officeNum;
		}
		console.log(records);
		w2ui.grid.records = records;
		
		//console.log( "   ,  2ui.grid.records.rank : " + 2ui.grid.records.rank);
		w2ui.form.fields.items = records;
		w2ui.grid.refresh();
	}

	
	);
}

);




