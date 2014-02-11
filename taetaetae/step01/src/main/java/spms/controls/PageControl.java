package spms.controls;

import java.util.Map;

// 프론트 컨트롤러와 페이지 컨트롤러 사이의 호출 규칙이다.
public interface PageControl {
	String execute(
			Map<String,Object> paramMap, Map<String,Object> resultMap)
		throws Exception;
}
