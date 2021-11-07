package co.ebook.prj.bucket.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BucketVO {
	private String bucketId;
	private String bookId;
	private String bookNm;
	private String memberId;
	private String memberNm;
	private String bookPublCo;
	private String bookWriter;
	private String bookCover;
	private String bookCoverPath;
	private String bookIntro;
	private String bucketStCd;
	private String bucketStNm;
	private String bucketOrd;
	private String bucketNo;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private String bucketDoneDt;
	private String bucketDelYn;
	private Date insDt;
	private Date udtDt;
}
