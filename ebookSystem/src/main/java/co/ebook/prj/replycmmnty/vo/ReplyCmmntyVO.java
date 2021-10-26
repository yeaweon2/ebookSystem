package co.ebook.prj.replycmmnty.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyCmmntyVO {
	private int creplyId;    //댓글순서
	private int cmmntyId;	//게시글번호
	private String creplyWriter; //댓글작성자
	private String creplyClass; //댓글클래스(부모/자식)
	private String creplyOrd; //댓글순서
	private String creplyGr; //댓글그룹
	private String creplyContents; //댓글내용
	private String insDt; //댓글작성일
	private String udtDt; //댓글수정일
}
