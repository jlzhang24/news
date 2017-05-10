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

public class UpdateTYPEServlet extends HttpServlet {

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
		int type_id = Integer.parseInt(request.getParameter("type_id"));
		String type_bh = request.getParameter("type_bh");
		String type_name = new String(request.getParameter("type_name").getBytes("ISO-8859-1"),"GBK");
		TYPE type = new TYPE();
		type.setType_id(type_id);
		type.setType_bh(type_bh);
		type.setType_name(type_name);
		if (new TYPEDao().updateTYPE(type, type_id) == 1) {
			out.print("<script language='javascript'>alert('update success!');window.location.href='/news/yiguadmin/Template/right_type.jsp';</script>");
		}
	}

	public void init(ServletConfig config) throws ServletException {
		this.config = config;
	}
}
