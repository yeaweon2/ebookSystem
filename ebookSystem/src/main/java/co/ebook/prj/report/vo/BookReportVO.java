package co.ebook.prj.report.vo;

import lombok.Data;

@Data
public class BookReportVO {
	private int bookCnt;
	private int lendCnt;
	private int bucketCnt;
	private int reviewCnt;
	
	private String mon;
}
