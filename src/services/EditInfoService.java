package services;

import util.DataBaseUtils;
import bean.User;

public class EditInfoService {
	public static void editUser(User user){
		String sql="update t_user set username=?,password=?,email=?,address=?,telephone=?,headerPic=? where id = ?";
		DataBaseUtils.update(sql,user.getUsername(),user.getPassword(),user.getEmail(),user.getAddress(),user.getTelephone(),user.getHeaderPic(),user.getId());
	}
	
	public static void editBasicInfo(User user){
		String sql="update profile set age=?,political_status=?,birthYear=?,birthMonth=?,birthDay=?,marital_status=? where id = ?";
		DataBaseUtils.update(sql,user.getAge(),user.getPolitical_status(),user.getBirthYear(),user.getBirthMonth(),user.getBirthDay(),user.getMarital_status(),user.getId());
	}
	
	public static void editEducateInfo(User user){
		String sql="update education set school=?,studyYear=?,studyMonth=?,graduateYear=?,graduateMonth=?,major=?,degree=?,isEntrance=?,ExtraComment=? where id=?";
		DataBaseUtils.update(sql,user.getSchool(),user.getStudyYear(),user.getStudyMonth(),user.getGraduateYear(),user.getGraduateMonth(),user.getMajor(),user.getDegree(),user.getIsEntrance(),user.getExtraComment(),user.getId());
	}
	
	public static void editDescriptionInfo(User user){
		String sql="update description set description=? where id=?";
		DataBaseUtils.update(sql,user.getDescription(),user.getId());
	}
	
	public static void editTravelSpot(User user){
		String sql="update travel set touristSpot=? where username=? and city = ?";
		DataBaseUtils.update(sql,user.getTouristSpot(),user.getUsername(),user.getCity());
	}
}
