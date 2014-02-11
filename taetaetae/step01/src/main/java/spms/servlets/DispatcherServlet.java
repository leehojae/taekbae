package spms.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import spms.controls.PageControl;

@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

	@Override
	protected void service(
			HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
		try {
			String servletPath = request.getServletPath();
			
			HashMap<String,Object> resultMap = new HashMap<String,Object>();
			
			HashMap<String,Object> paramMap = prepareParameterMap(request);
			
			paramMap.put("cookieMap", getCookieMap(request));
			
			paramMap.put("contextPath", request.getContextPath());
			
			String contentPage = executePageController(
					servletPath, paramMap, resultMap);
			
			processRefresh(resultMap, response);
			
			processCookie(resultMap, response);
			
			processSession(resultMap, request);
			
			copyFromResultMapToServletRequest(resultMap, request);
			
			processView(request, response, contentPage); 
			
		} catch (Exception e) {
			e.printStackTrace();
	  		request.setAttribute("error", e);
	  		RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
		  rd.forward(request, response);
		}
		
	}

	private String executePageController(String servletPath, 
			HashMap<String, Object> paramMap, 
			HashMap<String, Object> resultMap) throws Exception {
		/* spms.listeners.ContextLoaderListener를 사용할 때
		ApplicationContext ctx = (ApplicationContext) this.getServletContext()
				.getAttribute("applicationContext");
		*/
		
		/* 스프링에서 제공하는 ContextLoaderListener를 사용할 때 */
		WebApplicationContext ctx = 
				WebApplicationContextUtils.getWebApplicationContext(
						this.getServletContext());
		
		PageControl pageControl = 
				(PageControl)ctx.getBean(servletPath);
		
		if (pageControl == null) {
			throw new Exception("해당 서비스가 존재하지 않습니다.");
		}
		
		return pageControl.execute(paramMap, resultMap);
  }

	private void processView(HttpServletRequest request,
      HttpServletResponse response, String contentPage) throws Exception {
		if (contentPage.startsWith("redirect:")) {
			response.sendRedirect( contentPage.substring(9) );
		} else {
			request.setAttribute("contentPage", contentPage);
			RequestDispatcher rd = request.getRequestDispatcher("/template.jsp");
			rd.forward(request, response);
		}
  }

	private void processRefresh(HashMap<String, Object> resultMap,
      HttpServletResponse response) {
		String refresh = (String)resultMap.get("Refresh");
		if (refresh != null) {
			response.setHeader("Refresh", refresh);
		}
  }

	private void processSession(HashMap<String, Object> resultMap,
      HttpServletRequest request) {
		for (String name : resultMap.keySet()) {
			if (name.startsWith("session:")) {
				request.getSession().setAttribute(
						name.substring(8), resultMap.remove(name));
			}
		}
  }

	private void processCookie(HashMap<String, Object> resultMap,
      HttpServletResponse response) {
		String cookieName = null;
		String[] cookieValues = null;
		Cookie cookie = null;
		for (String name : resultMap.keySet()) {
			if (name.startsWith("cookie:")) {
				cookieName = name.substring(7);
				cookieValues = ((String)resultMap.remove(name)).split(",");
				cookie = new Cookie(cookieName, cookieValues[0]);
				if (cookieValues.length > 1) {
					cookie.setMaxAge( Integer.parseInt(cookieValues[1]) );
				}
				response.addCookie(cookie);
			}
		}
  }

	private void copyFromResultMapToServletRequest(
      HashMap<String, Object> resultMap, HttpServletRequest request) {
		for(String key : resultMap.keySet()) {
			request.setAttribute(key, resultMap.get(key));
		}
  }

	private HashMap<String, Object> prepareParameterMap(
			HttpServletRequest request) {
		HashMap<String,Object> paramMap = new HashMap<String,Object>();
		
		Map<String,String[]> map = request.getParameterMap();
		
		for(String key : map.keySet()) {
			paramMap.put(key, map.get(key)[0]);
		}
		
		return paramMap;
  }
	
	private Map<String,String> getCookieMap(HttpServletRequest request) {
		HashMap<String,String> cookieMap = new HashMap<String,String>();
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for(Cookie c : cookies) {
				cookieMap.put(c.getName(), c.getValue());
			}
		}
		return cookieMap;
	}
}
















