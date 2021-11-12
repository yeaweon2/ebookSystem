package co.ebook.prj.payHistory.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class PayVO {
	private int payId;
	private int mcnfmId;
	private String impUid;
	private String payStCd;
	private String payMthd;
	private int payAmt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date payDt;
	private Date mcnfmCntrSdt;
	private Date mcnfmCntrEdt;
	private Date insDt;
	private Date udtDt;
}
