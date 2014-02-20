function bit(id) {
	var element = document.getElementById(id);
	element.click = function(listener) {
		this.onclick = listener;
	};
	
	return element;
}

bit.ajax = function(url, settings) {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var jsonResult = JSON.parse(xhr.responseText).jsonResult;
				if (jsonResult.resultStatus == 1) {
					if (settings.error) {
						settings.error(jsonResult.error);
					}
				} else {
					if (settings.success) {
						settings.success(jsonResult.data);
					}
				}
			} else {
				if (settings.error) {
					settings.error("요청 실패!");
				}
			}
		}
		
	};
	xhr.open(settings.method, url, true);
	if (settings.method == 'POST') {
		var params = '';
		for (var propName in settings.data) {
			if (params.length > 0) {
				params += '&';
			}
			params += propName + "=" + settings.data[propName];
		}
		xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
		xhr.send(encodeURI(params));
		
	} else {
		xhr.send();
	}
};

//변수 이름으로 $ 를 쓸수 있다. 소스코드를 간결하게 그리고 가독성이 좋게 하기위해 쓴다.  

var $ = bit;
