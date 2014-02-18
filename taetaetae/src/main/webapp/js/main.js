window.onload = function() {
    
    listExcel();
};
function listExcel() {
    $.ajax('excel/ajax/list.do', {
            method: 'GET', 
            success: function(excels){
                var e = null;
                var tr = null;
                var html = null;
                var table = $('listTable');
                for (var i = 0; i < excels.length; i++) {
                    e = excels[i];
                    tr = document.createElement('tr');
                    html = '';
                    html += '<td>' + e.tno + '</td>'; 
                    html += '<td>' + e.trcno + '</td>'; 
                    html += '<td>' + e.receiveDate + '</td>'; 
                    html += '<td>' + e.deliveDate + '</td>'; 
                    html += '<td>' + e.senderName + '</td>'; 
                    html += '<td>' + e.senderAddr + '</td>'; 
                    html += '<td>' + e.senderTel1 + '</td>'; 
                    html += '<td>' + e.senderTel2 + '</td>'; 
                    html += '<td>' + e.receiverName + '</td>'; 
                    html += '<td>' + e.receiverAddr + '</td>'; 
                    html += '<td>' + e.receiverTel1 + '</td>'; 
                    html += '<td>' + e.receiverTel2 + '</td>'; 
                    html += '<td>' + e.sendPoint + '</td>'; 
                    html += '<td>' + e.receivePoint + '</td>'; 
                    html += '<td>' + e.packing + '</td>'; 
                    html += '<td>' + e.productName + '</td>'; 
                    html += '<td>' + e.count + '</td>'; 
                    html += '<td>' + e.size + '</td>'; 
                    html += '<td>' + e.weight + '</td>'; 
                    html += '<td>' + e.payment + '</td>'; 
                    html += '<td>' + e.date + '</td>';   
                  tr.innerHTML = html;
                  table.appendChild(tr);
                }
                
                var alist = document.querySelectorAll('.excelName');
                for (var i = 0; i < alist.length; i++) {
                    alist[i].onclick = function() {
                        loadExcel(this.getAttribute("data-no"));
                    };
                }
            }, 
            error: function(){
                alert('시스템이 바쁩니다.\n나중에 다시 시도해 주세요!');
    }});
}

function loadExcel(no) {
    $.ajax('ajax/read.do?no=' + no, {
            method: 'GET', 
            success: function(excel){
        $("eNum").value = excel.num;
        $("eSender").value = excel.sender;
        $("eReceiver").value = excel.receiver;
        $("eDate").value = excel.date;
    }});
}
