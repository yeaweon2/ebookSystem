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
	
	private int todayRegCnt;	// 오늘 회원가입수
	private int userCnt;		// 일반 회원수
	private int managerCnt;		// 메니저 회원수
	private int adminCnt;		// 관리자 회원수
	
	private int todayRepCnt;	// 오늘 등록된 댓글수
	private int todayNotiCnt;	// 오늘 등록된 공지사항 수
	private int todayQustCnt;	// 오늘 등록된 1:1 문의사항 수
	private int comunityCnt;	// 전체 게시글수
	
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date subspEdt;
	private Date mcnfmCntrEdt; 
	private Date mcnfmCntrSdt;
	
	
}
