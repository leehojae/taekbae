//var fileInput = document.getElementById("excelFile");
//var file = fileInput.files[0];
var formData = new FormData();
formData.append("excelFile", file);

var xhr = new XMLHttpRequest();
xhr.open("POST", "excel/add.do", true);
xhr.send(formData);
