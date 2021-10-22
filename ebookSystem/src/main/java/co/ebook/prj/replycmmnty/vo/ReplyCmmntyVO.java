package co.ebook.prj.replycmmnty.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyCmmntyVO {
	private int creplyId;
	private int cmmntyId;
	private String creplyWriter;
	private String creplyClass;
	private String creplyOrd;
	private String creplyGr;
	private String creplyCloseYn;
	private String creplyContents;
	private String insDt;
	private String udtDt;
}
