package kr.co.project.review.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.project.review.dao.ReviewDAO;
import kr.co.project.review.vo.ReviewVO;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewDAO dao;
	
	public void writeReview(ReviewVO review) {
		dao.writeReview(review);
	}
	
	public ReviewVO[] reviewListByBook_id(String book_id) {
		return dao.reviewListByBook_id(book_id);
	}
	
}