package co.ebook.prj.login.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class LoginVO {
	private String memberId;
	private String memberPw;
	private String memberNm;
	private String memberTel;
	private String memberNicknm;
	private String memberFlCd;
	private String memberFlNm;
	private String memberStCd;
	private String memberSubYn;
	private String managerCnfmYn;
	private String memberProfilePath;
	private String memberProfileNm;
	private int memberMile;
	private String mcnfmId;
	private String cartCnt;
	private String updatePw;
	private String updateid;
	private int payAmt;
	private int impUid;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date subspEdt;
	private Date mcnfmCntrEdt; 
	private Date mcnfmCntrSdt;
	
	
}
