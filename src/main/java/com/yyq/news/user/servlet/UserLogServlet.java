package com.yyq.news.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import com.yyq.news.user.service.UserService;
import com.yyq.news.utils.FileUtils;
import com.yyq.news.utils.JsonUtil;

/**
 * Servlet implementation class UserLogServlet
 */
@WebServlet("/UserLogServlet.so")
@MultipartConfig(
		maxFileSize=82536541,
		fileSizeThreshold=236541783
		)
public class UserLogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserService userService = UserService.getInstance();
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try {
			String img = FileUtils.getInstance().generateFileName(request);
			Integer id = Integer.parseInt(request.getParameter("id"));
			
			Integer res = userService.userLog(img, id);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('上传成功');window.top.location.href='MemberServlet.so?id="+id+"'</script>");
			out.flush();
			out.close();
		} catch (Exception e) {
			request.setAttribute("message", e.getMessage());
		}
	}

}
