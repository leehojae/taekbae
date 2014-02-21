

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
		          
			{ field: 'no', caption: 'no', size: '33%', sortable: true, searchable: true },
			{ field: 'name', caption: 'Name', size: '33%', sortable: true, searchable: true },
			
		],

		onClick: function(event) {
			var grid = this;
			var form = w2ui.form;
			event.onComplete = function () {
				var sel = grid.getSelection();
				if (sel.length == 1) {
					form.recid  = sel[0];
					form.record = $.extend(true, {}, grid.get(sel[0]));
					form.refresh();
				} else {
					form.clear();
				}
			}
		}
	},
	form: { 
		header: 'Edit Record',
		name: 'form',
		fields: [
			{ name: 'recid', type: 'text', html: { caption: 'ID', attr: 'size="10" readonly' } },
			{ name: 'fname', type: 'text', required: true, html: { caption: 'First Name', attr: 'size="40" maxlength="40"' } },
			{ name: 'lname', type: 'text', required: true, html: { caption: 'Last Name', attr: 'size="40" maxlength="40"' } },
			{ name: 'email', type: 'email', html: { caption: 'Email', attr: 'size="30"' } },
			{ name: 'sdate', type: 'date', html: { caption: 'Date', attr: 'size="10"' } }
		],
		actions: {
			Reset: function () {
				this.clear();
			},
			Save: function () {
				var errors = this.validate();
				if (errors.length > 0) return;
				if (this.recid == 0) {
					w2ui.grid.add($.extend(true, { recid: w2ui.grid.records.length + 1 }, this.record));
					w2ui.grid.selectNone();
					this.clear();
				} else {
					w2ui.grid.set(this.recid, this.record);
					w2ui.grid.selectNone();
					this.clear();
				}
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
		title 	: 'Popup',
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
	$.getJSON('ajax/list.do', function(data){
		var records = data.jsonResult.data;
		for (var i = 0; i < records.length; i++){
			records[i].recid = records[i].no;
		}
		
		console.log(records);
		w2ui.grid.records = records;
		w2ui.grid.refresh();
	});
});