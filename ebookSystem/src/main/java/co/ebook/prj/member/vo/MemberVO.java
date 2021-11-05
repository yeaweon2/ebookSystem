package co.ebook.prj.member.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MemberVO {
	private String memberId;
	private int mcnfmId;
	private String memberPw;
	private String memberNm;
	private String memberNicknm;
	private String memberStCd;
	private String memberStNm;
	private String memberFlCd;  
	private String memberFlNm;
	private String memberEmail;
	private String memberBirth;
	private String memberGen;
	private int memberMile;
	private String memberTel;
	private String memberPhoneVld;
	private String managerCnfmYn;
	private String memberLikeFld;
	private String memberProfileNm;
	private String memberProfilePath; 
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date insDt;
	private Date udtDt;
	
	
	
		
}

