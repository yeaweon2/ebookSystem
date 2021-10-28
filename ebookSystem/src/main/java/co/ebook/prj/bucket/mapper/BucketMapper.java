package co.ebook.prj.bucket.mapper;

import java.util.List;

import co.ebook.prj.bucket.vo.BucketVO;

public interface BucketMapper {
	List<BucketVO> bucketList(BucketVO vo);
	
	int bucketInsert(BucketVO vo);
	
	int bucketUpdate(BucketVO vo);
	
	int bucketDelete(BucketVO vo);
}
