package co.ebook.prj.cart.vo;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
	private int cartId;
	private String bookId;
	private String bookNm;
	private String bookCover;
	private String bookCoverPath;
	private int bookAmt;
	private int bookDiscnt;
	private String memberId;
	private Date insDt;
	private Date udtDt;
}
