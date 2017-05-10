package com.zhang.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhang.util.DBHelper;

public class AdminVerifyServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 获取登录页面的数据

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		String userid = request.getParameter("username");
		String password = request.getParameter("password");
		if (userid.equals("admin") && password.equals("123456")) {
			request.getSession().setAttribute("session", "right");
			response.sendRedirect("../admin/main.html");// 跳转到管理员界面
		} else {
			out.print("<script>alert('Invalid username or password!'); window.location='../yiguadmin/Template/login.jsp' </script>");
		}
	}
}
