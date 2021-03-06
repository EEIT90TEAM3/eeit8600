package tw.com.queautiful.index;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.com.queautiful.commons.util.RealIpUtils;
import tw.com.queautiful.product.entity.Brand;
import tw.com.queautiful.product.service.BrandService;
import tw.com.queautiful.product.service.MemberService;

@Controller
public class IndexController {
	 @Autowired
	    private BrandService brandService;
	 @Autowired
	 private MemberService memberService;
	 
	@RequestMapping("/")
	public String indexPage() {
		return "/fms";
	}
	
	@RequestMapping("/report")
	public String testPage(Model model,HttpServletRequest request) {
		RealIpUtils.getRealIpAddr(request);
		return "/report/reportTest";
	}
	
//	@RequestMapping("/connect/facebook")
//	public String test() {
//		System.out.println("test");
//		return "/connect/facebookConnected";
//	}
	
}
