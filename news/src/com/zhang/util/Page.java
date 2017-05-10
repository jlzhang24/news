package com.zhang.util;

public class Page {

	private int currentPage;
	private int pageSize;
	private int recordCount;
	
	public Page(int pageSize, int recordCount, int currentPage)
	{
		this.pageSize = pageSize;
		this.recordCount = recordCount;
		this.setCurrentPage(currentPage);
	}
	
	//�����ܵ�ҳ��
	public int getPageCount()
	{
		int size = recordCount/pageSize;
		int flag = recordCount%pageSize;
		if(flag != 0)
		{
			size++;
		}
		
		if(recordCount == 0)
		{
			return 1;
		}
		return size;
	}
	
	//����sql��䣬limit��������0��ʼ
	public int getFromIndex()
	{
		return (currentPage-1)*pageSize;
	}
	
	//���õ�ǰҳ
	public void setCurrentPage(int currentPage)
	{
		int vaildPage = currentPage<=0?1:currentPage;
		vaildPage = vaildPage>this.getPageCount()?this.getPageCount():vaildPage;
		this.currentPage = vaildPage;
	}
	
	//�õ���ǰҳ��������ʾ��jsp��
	public int getCurrentPage()
	{
		return currentPage;
	}
	
	public int getPageSize()
	{
		return pageSize;
	}
}
