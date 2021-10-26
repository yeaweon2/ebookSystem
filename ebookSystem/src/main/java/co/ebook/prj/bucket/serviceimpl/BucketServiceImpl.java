package co.ebook.prj.bucket.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.bucket.mapper.BucketMapper;
import co.ebook.prj.bucket.service.BucketService;
import co.ebook.prj.bucket.vo.BucketVO;

@Repository
public class BucketServiceImpl implements BucketService {

	@Autowired
	BucketMapper map ; 
	
	@Override
	public List<BucketVO> bucketList() {
		return map.bucketList();
	}

	@Override
	public int bucketInsert(BucketVO vo) {
		return map.bucketInsert(vo);
	}

	@Override
	public int bucketUpdate(BucketVO vo) {
		return map.bucketUpdate(vo);
	}

	@Override
	public int bucketDelete(BucketVO vo) {
		return map.bucketDelete(vo);
	}

}
