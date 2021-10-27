package co.ebook.prj.login.vo;

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
	private String memberNicknm;
	private String memberFlCd;
	private String memberStCd;
	private String cartCnt;
	
}
