package co.ebook.prj.bucket.service;

import java.util.List;

import co.ebook.prj.bucket.vo.BucketVO;

public interface BucketService {
	 
	List<BucketVO> bucketList(BucketVO vo);
	
	int bucketInsert(BucketVO vo);
	
	int bucketUpdate(BucketVO vo);
	
	int bucketDelete(BucketVO vo);
	
}
