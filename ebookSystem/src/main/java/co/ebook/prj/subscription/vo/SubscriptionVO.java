package co.ebook.prj.subscription.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class SubscriptionVO {
	private int subspId;
	private String memberId;
	private Date subspSdt;
	private Date subspEdt;
	private String subspPaySt;
	private String subspPayNm;
	private int subspAmt;
	private String subspPayMthd;
	private int subspPayAmt;
	private int subspMile;
	private String impUid;
	
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date insDt;
	private Date udtDt;
	
	
}
