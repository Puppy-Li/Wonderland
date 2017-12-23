package services;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import util.DataBaseUtils;
import bean.Comments;

public class CommentService {
	public static void main(String[] args) {
		CommentService cs = new CommentService();
//		Comments comment = new Comments();
//		comment.setId(UUID.randomUUID().toString());
//		comment.setContent("很不错的文章，赞一个！");
//		comment.setArticleId("6ee5e7c3-76ea-4719-9a67-39cc974c5b07");
//		comment.setUserId("c0f91c17-d599-4583-9067-e5cd0aba7fc9");
//		cs.saveComment(comment);
//		System.out.println("保存成功！");
//		System.out.println(DataBaseUtils.queryForList("select a.content from t_comment a left JOIN t_user b "
//		        + "on a.user_id = b.id where a.article_id = '6ee5e7c3-76ea-4719-9a67-39cc974c5b07'"));   
		
//		System.out.println(cs.getCommentsByArticleId("6ee5e7c3-76ea-4719-9a67-39cc974c5b07"));
	}
	
	/**
	 * 保存评论
	 */
	public void saveComment(Comments comment){
	    String sql = "insert into t_comment(id,user_id,content,article_id,create_time,is_delete) values(?,?,?,?,?,?)";
	    DataBaseUtils.update(sql,comment.getId(),comment.getUserId(),
	            comment.getContent(),comment.getArticleId(),new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()),0);
	}
	
	/**
	 * 根据文章id查询它的所有评论
	 * @param id
	 * @return
	 */
	public List<Map<String,Object>> getCommentsByArticleId(String id){
	    return DataBaseUtils.queryForList("select b.username ,a.content from t_comment a left JOIN t_user b " +
	             "on a.user_id = b.id  where a.article_id = ? order by a.create_time desc", id);
	}
}
