package tw.com.queautiful.product.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import tw.com.queautiful.product.entity.Article;
import tw.com.queautiful.product.entity.Member;

public interface ArticleDao extends JpaRepository<Article, Long>, JpaSpecificationExecutor<Article> {

	List<Article> findByOrderByArticleTimeDesc();
	
	List<Article> findByMember(Member member);
}
