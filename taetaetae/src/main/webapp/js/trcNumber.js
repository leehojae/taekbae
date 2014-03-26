	function countNumber() {
		// prompt dialog
		alertify.prompt("운송장번호입력", function(e, str) {
			// str is the input text
			if (e) {

				if (str.length == 13) {

					// user clicked "ok"
					$.ajaxSettings.traditional = true;
					$.post('excel/searchUser.do', {
						trcno : str
					}, function(data) {
						if (data.jsonResult.data[0] !== null) {
							if (data.jsonResult.data[0].state == 0) {
								alertify.success("이미 배달이 완료되었습니다.");
							} else {
								alertify.success("당신의 대기번호는 " + data.jsonResult.data[0].state
										+ "번째 입니다.");

								$.post('excel/getDelayTime.do', {
									trcno : str
								}, function(data) {
									var d = new Date();
									var newTime = new Date();
									newTime.setMinutes(d.getMinutes()
											+ parseInt(data.integerList[0] / 60 + data.integerList[0]
													/ 60 * 0.3));
									alertify.success("현재시간 " + d.getHours() + "시" + d.getMinutes()
											+ "분입니다.");
									alertify.success("도착예정 " + newTime.getHours() + "시"
											+ newTime.getMinutes() + "분입니다.");
								});
							}
						} else {
							alertify.error("잘못된 번호입니다.");
						}
					});
				} else {
					alertify.error("잘못된 번호입력입니다.");
				}
			} else {
				// user clicked "cancel"
				alertify.error("취소하였습니다");
			}
		}, "");
	}