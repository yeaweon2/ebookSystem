package co.ebook.prj.bucket.service;

import java.util.List;

import co.ebook.prj.book.vo.BookVO;
import co.ebook.prj.bucket.vo.BucketVO;
import co.ebook.prj.bucket.vo.RutinListVO;
import co.ebook.prj.bucket.vo.RutinVO;

public interface BucketService {
	 
	List<BucketVO> bucketList(BucketVO vo);
	
	// BOOK 검색어 조회
	List<BookVO> bucketSearChList(String txt);
	
	BucketVO bucketDetail(BucketVO vo);
	
	int bucketInsert(BucketVO vo);
	
	int bucketUpdate(BucketVO vo);
	
	int bucketDelete(BucketVO vo);
	
	// 버킷등록시 중복체크
	List<BucketVO> bucketDuplChk(BucketVO vo);

	int bucketDoneCancelUpdate(BucketVO vo);

	
	// BOOK 루틴 조회 -----------------------------------------
	
	List<RutinVO> bookLoginRutin(RutinVO vo);
	
	List<RutinVO> bookLendRutin(RutinVO vo);
	
	List<RutinVO> bookBucketRutin(RutinVO vo);
	
	List<RutinListVO> bookLendRutinList(RutinVO vo);
	
	List<RutinListVO> bookBucketRutinList(RutinVO vo);
	
	
	
}

