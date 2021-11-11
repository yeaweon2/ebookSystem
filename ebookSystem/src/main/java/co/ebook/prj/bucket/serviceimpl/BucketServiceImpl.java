package co.ebook.prj.bucket.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.ebook.prj.book.vo.BookVO;
import co.ebook.prj.bucket.mapper.BucketMapper;
import co.ebook.prj.bucket.service.BucketService;
import co.ebook.prj.bucket.vo.BucketVO;

@Repository
public class BucketServiceImpl implements BucketService {

	@Autowired
	BucketMapper map ; 
	
	@Override
	public List<BucketVO> bucketList(BucketVO vo) {
		return map.bucketList(vo);
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

	@Override
	public List<BookVO> bucketSearChList( String txt) {
		return map.bucketSearChList(txt);
	}

	@Override
	public List<BucketVO> bucketDuplChk(BucketVO vo) {
		return map.bucketDuplChk(vo);
	}

	@Override
	public BucketVO bucketDetail(BucketVO vo) {
		return map.bucketDetail(vo);
	}

	@Override
	public int bucketDoneCancelUpdate(BucketVO vo) {
		return map.bucketDoneCancelUpdate(vo);
	}

}
