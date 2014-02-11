package spms.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharEncodingFilter implements Filter {
	FilterConfig config;
	String charset = "UTF-8";
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.config = filterConfig;
		
		if (config.getInitParameter("charset") != null) {
			charset = config.getInitParameter("charset");
		}
	}
	
	@Override
	public void destroy() {}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
	    FilterChain chain) throws IOException, ServletException {
	  //1. 서블릿 또는 다음 필터 실행 전 해야 할 작업 
		// 예) 압축 해제, 암호 해제, 로그 남기기, 디코딩 등 
		request.setCharacterEncoding(charset);

		//2. 서블릿 또는 다음 필터 실행
	  chain.doFilter(request, response);
	
	  //3. 서블릿 또는 다음 필터를 실행한 후 해야 할 작업
	  // 예) 응답 데이터 압축, 암호화, 인코딩 등
	}
}












