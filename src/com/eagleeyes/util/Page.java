package com.eagleeyes.util;

public class Page {
	
	private int pageRows;		 
	private int totalPages;		 
	private int currentPage; 	 
	private int totalRecords;	 
	private int startRecord;	 
	private int endRecord;	    
	
	public void setTotalRecords(int totalRecords) {	
		if(totalRecords<1){
			this.totalRecords=0;		
		}else{
			this.totalRecords=totalRecords;
		}		
	}

	public void setPageRows(int pageRows) {
		if(pageRows<=0){
			this.pageRows=20;
		}else{
			this.pageRows=pageRows;
		}			
		if(this.totalRecords%this.pageRows==0){
			this.totalPages=this.totalRecords/this.pageRows;
		}else{
			this.totalPages=this.totalRecords/this.pageRows+1;			
		}	
	}
	public void setCurrentPage(int currentPage) {
		
		if(currentPage<1){
			this.currentPage=1;			
		}else if(currentPage>this.totalPages){
			this.currentPage=this.totalPages;
		}else{
			this.currentPage=currentPage;
		}	
		if(this.totalRecords == 0){
			this.startRecord = 0;
		}else{
			this.startRecord=(this.currentPage-1)*this.pageRows;
		}
	}

	public int getPageRows() {
		return pageRows;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public int getStartRecord() {
		return startRecord;
	}
	
	public void setStartRecord(int startRecord) {
		this.startRecord = startRecord;
	}
	
	public void setEndRecord(int endRecord) {
		this.endRecord = endRecord;
	}

	public int getEndRecord() {
		return endRecord;
	}
	
}
