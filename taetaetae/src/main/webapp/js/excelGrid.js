        $(function() {
          $('#grid').w2grid(
              {
                name : 'grid',
                header : '금일 작업리스트',
                //url: 'data/list.json',
                options : 
                       		{ overflow: 'auto' },
                show : {
                  header : true,
                  toolbar : true,
                  footer : true,
                  lineNumbers : true,
                  selectColumn : true,
                  expandColumn : true
                },
                searches : [ {
                  type : 'int',
                  field : 'trcno',
                  caption : '운송장번호'
                }, {
                  type : 'int',
                  field : 'orderNo',
                  caption : '주문번호'
                }, {
                  type : 'text',
                  field : 'office',
                  caption : '배송사'
                }, {
                  type : 'date',
                  field : 'receiveDate',
                  caption : '접수일'
                } ],
                columns : [ {
                  field : 'trcno',
                  caption : '운송장번호',
                  size : '30%'
                }, {
                  field : 'orderNo',
                  caption : '주문번호',
                  size : '30%'
                }, {
                  field : 'deliverDate',
                  caption : '배달예정일',
                  size : '26%'
                }, {
                  field : 'receiverName',
                  caption : '받는분',
                  size : '15%'
                }, {
                  field : 'receiverAddrRoad',
                  caption : '받는분주소',
                  size : '60%'
                }, {
                  field : 'receiverTel1',
                  caption : '받는분전화1',
                  size : '25%'
                }, {
                  field : 'productName',
                  caption : '품명',
                  size : '10%'
                }, {
                  field : 'size',
                  caption : '크기',
                  size : '10%'
                }, {
                  field : 'weight',
                  caption : '중량',
                  size : '10%'
                }, {
                  field : 'payment',
                  caption : '운임구분',
                  size : '15%'
                }, {
                  field : 'pay',
                  caption : '운임결제',
                  size : '20%'
                }, {
                  field : 'returnBox',
                  caption : '반품',
                  size : '10%'
                } ],
                onExpand : function(event) {
                  $('#' + event.box_id).html(
                      '<div style="padding: 10px">Expanded content</div>')
                      .animate({
                        'height' : 100
                      }, 100);
                }
              });
        });
        $(function() {
          $.getJSON('excel/ajax/list.do', function(data) {
            var records = data.jsonResult.data;
            for (var i = 0; i < records.length; i++) {
              records[i].recid = records[i].trcno;
            }
            
            w2ui.grid.records = records;
            w2ui.grid.refresh();

          });
        });