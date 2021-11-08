package co.ebook.prj.common.service;

import java.util.List;

import co.ebook.prj.book.vo.BookVO;
import co.ebook.prj.bucket.vo.BucketVO;
import co.ebook.prj.cmmnty.vo.CmmntyVO;
import co.ebook.prj.common.vo.BookCnfmTopVO;
import co.ebook.prj.common.vo.BucketTopVO;
import co.ebook.prj.common.vo.CommCodeVO;
import co.ebook.prj.common.vo.InquireTopVO;
import co.ebook.prj.common.vo.ReviewTopVO;

public interface CommService {
	
	List<CommCodeVO> commCodeList();
	
	// 메인화면 호출
	// 1. 일반사용자	( 버킷도서 LIST )
	List<BucketTopVO> bucketTop(String id);
	
	// 2. 매니저		( BOOK등록 미승인건 )
	List<BookCnfmTopVO> bookCnfmTop(String id);
	
	// 3. 관리자  	( 1:1문의 미처리건 ) 
	List<InquireTopVO> inquireTop(); 
	
	// 4. 책리뷰 추천순 5건 조회
	List<ReviewTopVO> reviewTop();
	
}
