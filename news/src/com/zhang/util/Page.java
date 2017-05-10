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
	
	//计算总的页数
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
	
	//设置sql语句，limit的索引从0开始
	public int getFromIndex()
	{
		return (currentPage-1)*pageSize;
	}
	
	//设置当前页
	public void setCurrentPage(int currentPage)
	{
		int vaildPage = currentPage<=0?1:currentPage;
		vaildPage = vaildPage>this.getPageCount()?this.getPageCount():vaildPage;
		this.currentPage = vaildPage;
	}
	
	//得到当前页，用于显示在jsp中
	public int getCurrentPage()
	{
		return currentPage;
	}
	
	public int getPageSize()
	{
		return pageSize;
	}
}
