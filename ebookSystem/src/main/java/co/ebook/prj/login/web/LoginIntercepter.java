package co.ebook.prj.login.web;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class LoginIntercepter implements HandlerInterceptor {
//.do 기준(controlloer 기준)
    public List loginEssential
            = Arrays.asList("/login","/loginProc","/home");

   

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String memId = (String)request.getSession().getAttribute("memberId");

        if(memId != null){
        	return true;
        	}
        
        else{
            String destUri = request.getRequestURI();
            String destQuery = request.getQueryString();
            String dest = (destQuery == null) ? destUri : destUri+"?"+destQuery;
            String contextPath = request.getContextPath(); // 요청분석을 위해 contextPath 구함
    		String page = destUri.substring(contextPath.length()); //상세요청한 최종 페이지
    		//for 문으로 list
            for(int i=0; i<loginEssential.size(); i++) {
            	loginEssential.get(i).equals(page);
            	return true;
            }
    		request.getSession().setAttribute("dest", dest);
        
            response.sendRedirect("/main/login");
            return false;
        }
    }
}