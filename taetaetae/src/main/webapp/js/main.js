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
                    html += '<td>' + e.num + '</td>'; 
                    html += '<td><a href="#" class="excelName" data-no="' + 
                        e.num + '">' + 
                        e.sender + '</a></td>';   
                    html += '<td>' + e.receiver + '</td>'; 
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
