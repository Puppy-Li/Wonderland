package services;


import java.sql.SQLException;

import bean.User;
import util.DataBaseUtils;

public class LoginService {
	public static void main(String[] args) throws SQLException {
		LoginService loginService = new LoginService();
		//User user = loginService.getId("00d7b55d-0747-4827-9d70-8c0023adea56");
		User user=loginService.getTravel("Admin", "北京");
		System.out.println(user);
	}
	
	public User getUser(String username){
        String sql = "select * from t_user where username = ?;";
        User user = DataBaseUtils.queryForBean(sql, User.class, username);
        if(user == null){
            return null;
        }
        //System.out.println(user);
        return user;
    }
	
	public User getId(String id){
        String sql = "select * from t_user a , education b , description c where a.id=b.id and b.id=c.id and a.id = ?;";
        User user = DataBaseUtils.queryForBean(sql, User.class, id);
        if(user == null){
            return null;
        }
        //System.out.println(user);
        return user;
    }
	
	public User getTravel(String username,String city){
        String sql = "select * from travel where username = ? and city = ?";
        User user = DataBaseUtils.queryForBean(sql, User.class, username,city);
        if(user == null){
            return null;
        }
        //System.out.println(user);
        return user;
    }
	
}
