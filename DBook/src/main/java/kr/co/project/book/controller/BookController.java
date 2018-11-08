package kr.co.project.book.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.project.book.service.BookService;
import kr.co.project.book.vo.BookVO;
import kr.co.project.review.service.ReviewService;

@Controller
@RequestMapping("/book")
public class BookController {
	
	@Autowired
	private BookService bookService; 
	
	// 카테고리 검색 페이지
	@RequestMapping("/booklist/category.do/{category}")
	public ModelAndView booklistByCategory(@PathVariable("category") String category) {

		System.out.println("booklistByCategory()진입");
		
		String[] categories = category.split(";");
		String categoryNumber = null;
		
		List<BookVO> list = new ArrayList<>();
		
		if(categories.length >= 3) {
			for(int i=0; i<categories.length; i++) {
				categoryNumber += categories[i];
			}
			list = bookService.booklistByCategory("1", "20", categoryNumber);
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("categories", categories);
		mav.setViewName("booklist/category");
		
		return mav;
	}
	
	// 키워드 검색 페이지
	@RequestMapping("/bookSearch/searchResult.do")
	public ModelAndView booksearchByKeyword(@RequestParam("keyword") String keyword) {
		
		System.out.println("booksearchByKeyword()진입");
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("keyword", keyword);
		mav.setViewName("bookSearch/searchResult");
		
		return mav;
	}
	
	// 책 세부 페이지
	@RequestMapping("/bookDetail/{book_id}.do")
	public ModelAndView bookDetail(@PathVariable("book_id") String book_id) {
		
		System.out.println("bookDetail()진입");
		ReviewService reviewService = new ReviewService();
		
		bookService.upView_cnt(book_id);
		BookVO book = bookService.bookDetail(book_id);
		
		ModelAndView mav = new ModelAndView();
		
		if(book!=null) {
			String book_intro = book.getBook_introduction();
			String author_intro = book.getAuthor_introduction();
			String cont = book.getContents();
			
			if(book_intro != null) {
				String[] book_introduction = book.getBook_introduction().split(";");
				mav.addObject("book_introduction", book_introduction);
			}
			if(author_intro != null) {
				String[] author_introduction = book.getAuthor_introduction().split(";");
				mav.addObject("author_introduction", author_introduction);
			}
			if(cont != null) {
				String[] contents = book.getContents().split(";");
				mav.addObject("contents", contents);
			}
			
			mav.addObject("book", book);
			
			//mav.setViewName("forward:/review/bookDetail_review.do");
			mav.setViewName("/bookDetail/detail");
		}
		else {
			mav.setViewName("error/error");
		}
		
		return mav;
	}
	
}
