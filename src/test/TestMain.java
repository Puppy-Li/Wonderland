package test;

import bean.Article;
import bean.User;
import util.TableUtils;

public class TestMain {
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
        String sql= TableUtils.getCreateTableSQL(User.class);
        System.out.println(sql);
        
        String sqlArticle = TableUtils.getCreateTableSQL(Article.class);
        System.out.println(sqlArticle);

	}

}
