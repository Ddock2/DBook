package kr.co.project;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/main")
public class MainController {
	
	@RequestMapping("/home.do")
	public ModelAndView home() {

		System.out.println("home()진입");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main/home");
		
		return mav;
	}
	
	@RequestMapping("/test.do")
	public ModelAndView test(HttpSession session) {

		System.out.println("test()진입");
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}

	
}

