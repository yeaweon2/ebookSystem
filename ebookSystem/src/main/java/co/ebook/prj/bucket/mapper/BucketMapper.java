package co.ebook.prj.bucket.mapper;

import java.util.List;

import co.ebook.prj.book.vo.BookVO;
import co.ebook.prj.bucket.vo.BucketVO;
import co.ebook.prj.bucket.vo.RutinVO;

public interface BucketMapper {
	List<BucketVO> bucketList(BucketVO vo);
	
	List<BookVO> bucketSearChList(String txt);
	
	BucketVO bucketDetail(BucketVO vo);
	
	int bucketInsert(BucketVO vo);
	
	int bucketUpdate(BucketVO vo);
	
	int bucketDelete(BucketVO vo);
	
	List<BucketVO> bucketDuplChk(BucketVO vo); 
	
	int bucketDoneCancelUpdate(BucketVO vo);
	
	List<RutinVO> bookLoginRutin(RutinVO vo);
	
	List<RutinVO> bookLendRutin(RutinVO vo);
	
	List<RutinVO> bookBucketRutin(RutinVO vo);
}
