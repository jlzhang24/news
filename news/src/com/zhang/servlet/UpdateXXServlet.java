package com.zhang.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.zhang.dao.JWXXDao;
import com.zhang.model.JWXX;

public class UpdateXXServlet extends HttpServlet {

	private ServletConfig config;
	private String fileName;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		SmartUpload mySmartUpload = new SmartUpload();
		String jwxx_attach = null;
		int count = 0;
		mySmartUpload.initialize(config, request, response);
		try {
			mySmartUpload.setDeniedFilesList("exe");
			mySmartUpload.setMaxFileSize(50000000);
			mySmartUpload.setTotalMaxFileSize(50000000);// һ���ϴ��ļ���С��಻����50000000bytes
			try {
				mySmartUpload.upload();
				fileName = mySmartUpload.getFiles().getFile(0).getFileName();
				count = mySmartUpload.save("F:/upload");
			} catch (SmartUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}// ��ֹ�ϴ����ļ�
		jwxx_attach = fileName;
		int jwxx_id = Integer.parseInt(mySmartUpload.getRequest().getParameter("jwxx_id"));
		String jwxx_title = mySmartUpload.getRequest().getParameter("title");
		String jwxx_type = mySmartUpload.getRequest().getParameter("list");
		String jwxx_author = mySmartUpload.getRequest().getParameter("author");
		String jwxx_time = mySmartUpload.getRequest().getParameter("time");
		String jwxx_content = mySmartUpload.getRequest().getParameter("content");

		JWXX jwxx = new JWXX();
		jwxx.setJwxx_title(jwxx_title);
		jwxx.setJwxx_type(jwxx_type);
		jwxx.setJwxx_author(jwxx_author);
		jwxx.setJwxx_date(jwxx_time);
		jwxx.setJwxx_content(jwxx_content);
		jwxx.setJwxx_attachment(jwxx_attach);
		if (new JWXXDao().updateJWXX(jwxx, jwxx_id) == 1) {
			out.print("<script language='javascript'>alert('update success!');window.location.href='/news/yiguadmin/Template/right_jwxx.jsp';</script>");
		}
	}

	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config = config;
	}
}
