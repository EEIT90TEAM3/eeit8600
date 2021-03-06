package tw.com.queautiful.product.service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Properties;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.queautiful.product.entity.Article;
import tw.com.queautiful.product.entity.Member;
import tw.com.queautiful.product.entity.Review;
import tw.com.queautiful.product.entity.WebMail;

@Service
public class ReportService {
	@Autowired
	private Article_reportService article_reportService;
	
	@Autowired
	private Review_reportService review_reportService;

	@Autowired
	private ArticleService articleService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private MemberService memberService;
	
	@PersistenceContext
	private EntityManager manager;
	
	public String postReport(WebMail webMail){
		String report_date= new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(webMail.getMailSendDate());
		long athorId=0;
		String result="新增檢舉事件成功";
		
		Properties properties = new Properties();
		String configFile = "src/main/resources/report.properties";

		try {
			properties.load(new FileInputStream(configFile));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String reportPropertyStr=properties.getProperty("reportProperty");
		int reportProperty=Integer.valueOf(reportPropertyStr);
		
		if(webMail.getArticleId()!=null){
		Article	article=articleService.getById(webMail.getArticleId());
		int articleReportCount=(article.getArticleReport()+1);
		article.setArticleReport(articleReportCount);
		if(articleReportCount>=5){
			article.setArticleShow(false);
		}
		articleService.update(article);
		Member member=article.getMember();
		long article_athorId=member.getMemberId();
		athorId=article_athorId;
		result=article_reportService.insertReport(webMail.getArticleId(),
					webMail.getWebMailSender(),webMail.getMailContent(),
					report_date,article_athorId,webMail.getMailTitle());
		
		}else if(webMail.getReviewId()!=null){
			Review review=reviewService.getById(webMail.getReviewId());
			long review_author=review.getMemberId();
			int reviewReportCount=review.getReviewReport()+1;
			review.setReviewReport(reviewReportCount);
			if(reviewReportCount>=reportProperty){
				review.setReviewShow(false);	
			}
			athorId=review_author;
			String insertReport=
" insert into [review_report] ([reviewid], memberid, [report_content] , report_date , [review_author] , report_title) values"
+"("+webMail.getReviewId()+","+webMail.getWebMailSender()+",'"+webMail.getMailContent()+"','"+report_date+"',"+review_author+",'"+webMail.getMailTitle()+"')";
							
			manager.createNativeQuery(insertReport).executeUpdate();
		
		}else{}
		
		
		List<Object[]> article_reportList=article_reportService.findByMemberId(athorId);
		List<Object[]> review_reportList=review_reportService.findBymenberId(athorId);
		
		int ReportsSum=(article_reportList.size()+review_reportList.size());
		
		if(ReportsSum>=reportProperty){
			Member member=memberService.getById(athorId);
			member.setMemberSuspend(true);
			member.setMemberSuspendStart(webMail.getMailSendDate());
			member.setMemberSuspendDays(30);
			int memberSuspendCount=member.getMemberSuspendCount();
			member.setMemberSuspendCount(memberSuspendCount+1);
			result="該會員已被檢舉多次，已實施停權";
		}
		return result;
		
	}
	
}
