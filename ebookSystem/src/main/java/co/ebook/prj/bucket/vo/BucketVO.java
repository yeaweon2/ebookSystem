package co.ebook.prj.bucket.vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

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
	private String bucketDoneDt;
	private String bucketDelYn;
	private String insDt;
	private String udtDt;
}
