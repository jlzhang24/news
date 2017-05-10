package com.zhang.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;
import com.zhang.dao.JWXXDao;
import com.zhang.model.JWXX;

public class InsertXXServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ServletConfig config;
	private String fileName;
	private String fileNameTrans;

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}

	 @Override
	 protected void doPost(HttpServletRequest request,
	 HttpServletResponse response) throws ServletException, IOException {
	 PrintWriter out = response.getWriter();
	 SmartUpload mySmartUpload = new SmartUpload();
	 SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdHHmmss");
	 String jwxx_attach = null;
	 int count = 0;
	 mySmartUpload.initialize(config, request, response);
	 try {
	 mySmartUpload.setDeniedFilesList("exe");
	 mySmartUpload.setMaxFileSize(50000000);
	 mySmartUpload.setTotalMaxFileSize(50000000);// 设置上传文件的大小50000000bytes
	 try {
	 mySmartUpload.upload();
	 fileName = mySmartUpload.getFiles().getFile(0).getFileName();
	 fileNameTrans = sdf.format(new Date())+"."+mySmartUpload.getFiles().getFile(0).getFileExt();
	 System.out.println("上传文件的名称为：" + fileName);
	 count = mySmartUpload.save("F:/upload");
	 } catch (SmartUploadException e) {
	 e.printStackTrace();
	 }
	
	 } catch (SQLException e) {
	 e.printStackTrace();
	 }// ��ֹ�ϴ����ļ�
	 jwxx_attach = fileName;
	 String jwxx_title = mySmartUpload.getRequest().getParameter("title");
	 String jwxx_author = mySmartUpload.getRequest().getParameter("author");
	 String jwxx_time = mySmartUpload.getRequest().getParameter("time");
	 String jwxx_content = mySmartUpload.getRequest().getParameter("content");
	 String jwxx_type = mySmartUpload.getRequest().getParameter("list");
	
	 JWXX jwxx = new JWXX();
	 jwxx.setJwxx_attachment(jwxx_attach);
	 jwxx.setJwxx_title(jwxx_title);
	 jwxx.setJwxx_author(jwxx_author);
	 jwxx.setJwxx_date(jwxx_time);
	 jwxx.setJwxx_content(jwxx_content);
	 if (new JWXXDao().addJwxx(jwxx, jwxx_type) == 1) {
	 out.print("<script language='javascript'>alert('Insert Success!');window.location.href='/news/yiguadmin/Template/right_jwxx.jsp';</script>");
	 }
	 }


	@Override
	public void init(ServletConfig config) throws ServletException {
		this.config = config;
	}
}
