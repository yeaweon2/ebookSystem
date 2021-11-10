package co.ebook.prj.login.web;

import java.io.IOException;
import java.nio.file.AccessDeniedException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

import lombok.extern.java.Log;

@Log
@Component
public class CustomAccessDeniedHandler {

	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		log.info("접근 거부됨");
		response.sendRedirect(request.getContextPath() + "/accessDenied.jsp");
	}
	
}







