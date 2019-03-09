package com.sunday.filter;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.filter.OncePerRequestFilter;

public class SessionFilter extends OncePerRequestFilter {

	@Override
	public void destroy() {

	}
	/**
	 * 过滤实现
	 */
	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain  filterChain)
			throws ServletException, IOException {
		
		//String[] undoFilter = {".do",".jsp",".js",".css",".png",".jpg","otf","eot","ttf","woff","woff2","less"};
		String[] undoFilter = {"/sunday/login.jsp","/sunday/login.do",".js",".css",".png",".jpg","otf","eot","ttf","woff","woff2","less"};
		String uri = request.getRequestURI();
		boolean doFilter = true;
		for(String s:undoFilter){
			
			if(uri.indexOf(s)!=-1){
				doFilter = false;
			}
			
		}
		if(doFilter){
			Object object = request.getSession().getAttribute("account");
			if(null==object){
				String path = request.getContextPath();
				String basePath = request.getScheme() + "://"
						+ request.getServerName() + ":" + request.getServerPort()
						+ path + "/";
				System.out.println("Session 超时已经重定向至登陆页面");
				response.sendRedirect(basePath+"login.jsp");
				return;
				
			}else{
				 filterChain.doFilter(request, response);  
			}
		}else{
			
			filterChain.doFilter(request, response);  
		}
		
	}


}
