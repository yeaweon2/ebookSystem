package co.ebook.prj.login.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class LoginHistoryVO {
	private int loginId;
	private String memberId;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yy-MM-dd", timezone = "Asia/Seoul")
	private Date loginDt;
	private Date logoutDt;
}
