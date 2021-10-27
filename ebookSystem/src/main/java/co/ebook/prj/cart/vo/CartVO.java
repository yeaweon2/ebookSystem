package co.ebook.prj.cart.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CartVO {
	private int cartNo;
	private int cartId;
	private String bookId;
	private String bookNm;
	private String bookCover;
	private String bookCoverPath;
	private int bookAmt;
	private int bookDiscnt;
	private String memberId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")	
	private Date insDt;
	private Date udtDt;
}
