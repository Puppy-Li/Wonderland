package test;

import java.util.List;
import java.util.UUID;

import org.junit.Test;

import bean.Article;

import util.DataBaseUtils;

public class TestInsertOperation {
	/**
	 *  测试：给文章插入数据
	 */
	@Test
	public void insertArticle(){
		String sql = "INSERT INTO t_article(id,header,name,content,author,"
            + "description,is_published,is_delete,create_time,update_time"
            + ",user_id,category_id) VALUES (?,?,?,?,?,?,?,?,?,?,?,?) ";
String id = UUID.randomUUID().toString(); //主键
String header = "Java Web实用技术";
String name  = "如何将MyEclipse项目导入eclipse";
String content = "我们经常会在网上下载一些开源项目，或者从别的地方迁移一些项目进来，但经常会发现导入后各种报错。这是初学java肯定会遇到的问题，本文对一些常见的处理方案做一个总结。（本文将MyEclipse项目导入eclipse的过程为例，其他情况也可参考这个流程）";
String author = "Jack";
String description = "解决项目导入的冲突问题...";
int isPublished = 1 ;
int isDelete = 0;
String create_time = "2017-10-30 10:25:10";
String update_time = "2017-10-30 10:25:10";
String userId = "c0f91c17-d599-4583-9067-e5cd0aba7fc9";
int categoryId = 2;
DataBaseUtils.update(sql, id,header,name,content,author,description,isPublished,isDelete,create_time,update_time,userId,categoryId);
System.out.println("新增成功！");
	}
	
	@Test        //@Test是一个注解，加上它以后，才会被JUint测试框架识别。
	public void getArticle(){
	    String sql = "select * from t_article where id = ?";
	    Article article = DataBaseUtils.queryForBean(sql, Article.class, "6ee5e7c3-76ea-4719-9a67-39cc974c5b07");
	    System.out.println(article);
	}
	
	/**
	 * 插入分类数据
	 */
	@Test
	public void insertCategory(){
	    DataBaseUtils.update("insert into t_category set category_name = ?", "连载小说");
	    DataBaseUtils.update("insert into t_category set category_name = ?", "编程代码类");
	    DataBaseUtils.update("insert into t_category set category_name = ?", "生活感悟");
	}
	
	/**
	 * 获取分类列表
	 */
	@Test
	public void getCategoryList(){
	    String sql = "select * from t_category where 1 = 1";
	    List list = DataBaseUtils.queryForList(sql);
	    System.out.println(list);
	}
	
	/**
	 * 注册新用户
	 */
	@Test
	public void insertUser(){
		
	}
}
