package co.ebook.prj.bucket.vo;

import lombok.Data;

@Data
public class RutinListVO {
	private String bookId; 
	private String bookNm;
	private String bookPublCo;
	private String bookWriter;
	private String bookCover;
	private String bookCoverPath;
	private String bucketDoneDt;
	private String lendHit;
	private String insDt;
}
