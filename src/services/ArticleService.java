package services;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import util.DataBaseUtils;

public class ArticleService {
	public static void main(String[] args) {
		ArticleService ArticleService = new ArticleService();
		List list = ArticleService.getArticlesByCategoryId(2,0,10);
		System.out.println(list);
	}
	
	
	/**
	 * 通过类别获取文章列表
	 * @param categoryId
	 * @param start 
	 * @param end  
	 */
	public List<Map<String,Object>> getArticlesByCategoryId(Integer categoryId,Integer start,Integer end){
	    String sql = "select id,header,name,author,"
	        + "description from t_article where 1 = 1 "
	        + " and is_delete = 0"
	        + " and is_published = 1"
	        + " and category_id = ?"
	        + "  order by update_time desc limit ?,?";
	    return DataBaseUtils.queryForList(sql, categoryId,start,end);
	}
	
	/**
	 * 通过文章id获取文章内容
	 * @param id
	 * @return
	 */
	public Map<String,Object> getContentByArticleId(String id){
	    String sql = "select * from t_article a inner join t_category b on a.category_id = b.category_id where a.id = ?";
	    return DataBaseUtils.queryForList(sql,id).get(0);
	}
}
