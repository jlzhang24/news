package com.zhang.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zhang.dao.TYPEDao;
import com.zhang.model.TYPE;

public class InsertTYPEServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ServletConfig config;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String type_bh = request.getParameter("typebh");
		String type_name = new String(request.getParameter("typename").getBytes("ISO-8859-1"),"GBK");

		TYPE type = new TYPE();
		type.setType_bh(type_bh);
		type.setType_name(type_name);
		if (new TYPEDao().insertType(type) == 1) {
			out.print("<script language='javascript'>alert('Insert Success!');window.location.href='/news/yiguadmin/Template/right_type.jsp';</script>");
		}
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		this.config = config;
	}
}
