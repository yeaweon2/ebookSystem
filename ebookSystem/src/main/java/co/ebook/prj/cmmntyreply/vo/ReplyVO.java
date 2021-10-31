package co.ebook.prj.cmmntyreply.vo;

import lombok.Data;

@Data
public class ReplyVO {
	private int creplyId;   			 //댓글번호
	private int cmmntyId;			 //게시글번호
	private String creplyWriter;	 //댓글작성자
	private String creplyContents; //댓글내용
	private String insDt;			 //댓글작성일
	private String udtDt;			 //댓글수정일
	private int creplyClass; 		 //댓글클래스(부모0/자식1 들여쓰기)
	private int creplyOrd;			 //댓글순서(정렬)
	private int creplyGr; 			 //댓글그룹(부모-자식묶기)
}
