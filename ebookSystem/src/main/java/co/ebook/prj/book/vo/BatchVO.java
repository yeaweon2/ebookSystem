package co.ebook.prj.book.vo;

import java.util.Date;
import lombok.Data;

@Data
public class BatchVO {
	private int batchId;
	private String bookId;
	private int batchOrd;
	private String batchNm;
	private String batchPath;
	private String batchWriter;
	private String batchWriterNm;
	private String bookNm;
	private String bookIntro;
	private String bookCover;
	private String bookCoverPath;
	private String bookManagerNm;
	private Date insDt;
	private Date udtDt;
}

