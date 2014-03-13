package spms.services;

import java.util.HashMap;
import com.kt.openplatform.sdk.KTOpenApiHandler;

public class SmsSendService {
	public void smsSend () {
		// 발급 받은 개발자 Key 와 Api_Secret 를 입력 String auth_key = "개발자 키를 넣어주세요";
		// String auth_secret = "비밀키를 넣어주세요";
		String auth_key = "2FKuieS1nQwRYE807KNXDuq3H7uwPyIUlKB939FShAyO0RbH20";
		String auth_secret = "sodh50ncgSU9KlIZyBD08pHqPiBFZrlCm2XDIVsDrr7ZlVaz3d";
		// api id 설정
		String apiId = "1.0.SMS.MAKE";
		// https 이용 여부 설정 false 로 기본 설정. boolean bSSL = false;
		boolean bSSL = true;
		// Make Parameters
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("sender", "");
		params.put("receivers", "");

		params.put("displayaddress", "01047311909");
		params.put("text", "문자메시지 내용을 넣어주세요");
		// make xauth params
		HashMap<String, String> xauth_params = new HashMap<String, String>();
		xauth_params.put("username", "");
		xauth_params.put("password", "");
		KTOpenApiHandler handler = KTOpenApiHandler.createHandler(auth_key,	auth_secret);

		HashMap<?, ?> r = handler.call(apiId, params, xauth_params, bSSL);

		System.out.println("RESULT==>" + r);
	}
}