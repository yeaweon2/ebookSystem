package co.ebook.prj.member.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class memberVO {
	private String memberId;
	private String memberPw;
	private String memberNm;
	private String memberNicknm;
	private String memberStCd;
	private String memberFlCd;
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
	private Date insDt;
	private Date udtDt;
}
