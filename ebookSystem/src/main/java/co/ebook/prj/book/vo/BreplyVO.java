package co.ebook.prj.book.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BreplyVO {
	private int breplyId;
	private String bookId;
	private int breplyClass;
	private int breplyOrd;
	private int breplyGr;
	private String breplyContents;
	private String breplyCloseYn;
	private String breplyWriter;
	private String breplyWriterNm;
	private String udtDt;	
	private String insDt;
	private int breplyStar;
}
