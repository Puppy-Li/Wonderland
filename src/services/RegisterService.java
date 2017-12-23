package services;

import java.text.SimpleDateFormat;
import java.util.Date;

import bean.User;
import util.DataBaseUtils;

public class RegisterService {
	//保存用户
	public static void insertUser(User user){
		String sql = "insert into t_user(id,username,password,email,sex,create_time,telephone) values(?,?,?,?,?,?,?)";
		DataBaseUtils.update(sql,user.getId(),user.getUsername(),user.getPassword(),
	            user.getEmail(),user.getSex(),new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()),user.getTelephone());
		
		String profile_id = "insert into profile(id,username) values(?,?)";
		DataBaseUtils.update(profile_id,user.getId(),user.getUsername());
		
		String education_id = "insert into education(id) values(?)";
		DataBaseUtils.update(education_id,user.getId());
		
		String description_id = "insert into description(id) values(?)";
		DataBaseUtils.update(description_id,user.getId());
		
		String travel_username = "insert into travel(username) values(?)";
		DataBaseUtils.update(travel_username,user.getUsername());
	}
	
	
}
