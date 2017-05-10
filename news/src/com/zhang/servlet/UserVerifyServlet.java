package com.zhang.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.zhang.dao.UserDao;

public class UserVerifyServlet extends HttpServlet {

	/**
	 * 用户登录验证
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		PrintWriter out = resp.getWriter();
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		HttpSession session = null;
		int flag = new UserDao().userIsExist(username, password);
		if(flag == 1) {
			session = req.getSession();
			session.setAttribute(username, username);
			out.print("<script language='javascript'>alert('success!');window.location.href='/news/yiguadmin/index.jsp';</script>");
		}
		else {
			out.print("<script language='javascript'>alert('failed!');window.location.href='/news/yiguadmin/login.jsp';</script>");
		}
	}

	
}
