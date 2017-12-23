package bean;

import annotation.Column;
import annotation.Table;

@Table(tableName = "t_user")
public class User {

	//属性
	@Column(type = "varchar(100)" ,field = "id" ,primaryKey = true ,defaultNull = false)
	private String id;        //主键，采用UUID
	
	@Column(type = "VARCHAR(20)", field = "username")
	private String username;  //用户名

	@Column(type = "VARCHAR(20)", field = "password")
	private String password;  //密码

	@Column(type = "VARCHAR(60)", field = "headerPic")
	private String headerPic; //头像

	@Column(type = "VARCHAR(60)", field = "email")
	private String email;     //电子邮箱

	@Column(type = "VARCHAR(2)", field = "sex")
	private Integer sex;      //性别 0男 1女 3保密

	@Column(type = "datetime", field = "create_time")
	private String createTime;//创建时间

	@Column(type = "timestamp", field = "update_time")
	private String updateTime;//最后更新时间

	@Column(type = "int(1)", field = "is_delete")
	private Integer isDelete; // 删除状态  0未删除  1删除

	@Column(type = "VARCHAR(200)", field = "address")
	private String address;   //地址

	@Column(type = "VARCHAR(15)", field = "telephone")
	private String telephone; //电话

	@Column(type = "int(100)", field = "age")
	private Integer age; //年龄
	
	@Column(type = "VARCHAR(20)", field = "political_status")
	private String political_status;   //政治面貌
	
	@Column(type = "int(100)", field = "birthYear")
	private Integer birthYear; //出生年份

	@Column(type = "int(50)", field = "birthMonth")
	private Integer birthMonth; //出生月份
	
	@Column(type = "int(50)", field = "birthDay")
	private Integer birthDay; //出生日期
	
	@Column(type = "VARCHAR(20)", field = "marital_status")
	private String marital_status; //婚姻状况
	
	@Column(type = "VARCHAR(50)", field = "scholl")
	private String school; //学校名称
	
	@Column(type = "int(100)", field = "studyYear")
	private Integer studyYear; //入学年份
	
	@Column(type = "int(50)", field = "studyMonth")
	private Integer studyMonth; //入学月份
	
	@Column(type = "int(100)", field = "graduateYear")
	private Integer graduateYear; //毕业年份
	
	@Column(type = "int(50)", field = "graduateMonth")
	private Integer graduateMonth; //毕业月份
	
	@Column(type = "VARCHAR(50)", field = "major")
	private String major; //专业名称
	
	@Column(type = "VARCHAR(20)", field = "degree")
	private String degree; //学历
	
	@Column(type = "VARCHAR(10)", field = "isEntrance")
	private String isEntrance; //统招
	
	@Column(type = "VARCHAR(500)", field = "ExtraComment")
	private String ExtraComment; //附加说明
	
	@Column(type = "int(100)", field = "JoinYear")
	private Integer JoinYear; //入职年份
	
	@Column(type = "int(50)", field = "JoinMonth")
	private Integer JoinMonth; //入职月份
	
	@Column(type = "VARCHAR(50)", field = "company")
	private String company; //公司名称
	
	@Column(type = "VARCHAR(50)", field = "position")
	private String position; //职位名称
	
	@Column(type = "VARCHAR(500)", field = "description")
	private String description; //职位名称
	
	@Column(type = "VARCHAR(20)", field = "city")
	private String city; //城市名称
	
	@Column(type = "VARCHAR(500)", field = "touristSpot")
	private String touristSpot; //景点
	
	@Column(type = "VARCHAR(500)", field = "people")
	private String people; //人物
	
	@Column(type = "VARCHAR(500)", field = "food")
	private String food; //美食
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getHeaderPic() {
		return headerPic;
	}

	public void setHeaderPic(String headerPic) {
		this.headerPic = headerPic;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	
	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getPolitical_status() {
		return political_status;
	}

	public void setPolitical_status(String political_status) {
		this.political_status = political_status;
	}

	public Integer getBirthYear() {
		return birthYear;
	}

	public void setBirthYear(Integer birthYear) {
		this.birthYear = birthYear;
	}

	public Integer getBirthMonth() {
		return birthMonth;
	}

	public void setBirthMonth(Integer birthMonth) {
		this.birthMonth = birthMonth;
	}

	public Integer getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Integer birthDay) {
		this.birthDay = birthDay;
	}

	public String getMarital_status() {
		return marital_status;
	}

	public void setMarital_status(String marital_status) {
		this.marital_status = marital_status;
	}
	
	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public Integer getStudyYear() {
		return studyYear;
	}

	public void setStudyYear(Integer studyYear) {
		this.studyYear = studyYear;
	}

	public Integer getStudyMonth() {
		return studyMonth;
	}

	public void setStudyMonth(Integer studyMonth) {
		this.studyMonth = studyMonth;
	}

	public Integer getGraduateYear() {
		return graduateYear;
	}

	public void setGraduateYear(Integer graduateYear) {
		this.graduateYear = graduateYear;
	}

	public Integer getGraduateMonth() {
		return graduateMonth;
	}

	public void setGraduateMonth(Integer graduateMonth) {
		this.graduateMonth = graduateMonth;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getDegree() {
		return degree;
	}

	public void setDegree(String degree) {
		this.degree = degree;
	}

	public String getIsEntrance() {
		return isEntrance;
	}

	public void setIsEntrance(String isEntrance) {
		this.isEntrance = isEntrance;
	}

	public String getExtraComment() {
		return ExtraComment;
	}

	public void setExtraComment(String extraComment) {
		ExtraComment = extraComment;
	}

	public Integer getJoinYear() {
		return JoinYear;
	}

	public void setJoinYear(Integer joinYear) {
		JoinYear = joinYear;
	}

	public Integer getJoinMonth() {
		return JoinMonth;
	}

	public void setJoinMonth(Integer joinMonth) {
		JoinMonth = joinMonth;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getTouristSpot() {
		return touristSpot;
	}

	public void setTouristSpot(String touristSpot) {
		this.touristSpot = touristSpot;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", headerPic=" + headerPic + ", email=" + email
				+ ", sex=" + sex + ", createTime=" + createTime
				+ ", updateTime=" + updateTime + ", isDelete=" + isDelete
				+ ", address=" + address + ", telephone=" + telephone
				+ ", age=" + age + ", political_status=" + political_status
				+ ", birthYear=" + birthYear + ", birthMonth=" + birthMonth
				+ ", birthDay=" + birthDay + ", marital_status="
				+ marital_status + ", school=" + school + ", studyYear="
				+ studyYear + ", studyMonth=" + studyMonth + ", graduateYear="
				+ graduateYear + ", graduateMonth=" + graduateMonth
				+ ", major=" + major + ", degree=" + degree + ", isEntrance="
				+ isEntrance + ", ExtraComment=" + ExtraComment + ", JoinYear="
				+ JoinYear + ", JoinMonth=" + JoinMonth + ", company="
				+ company + ", position=" + position + ", description="
				+ description + ", city=" + city + ", touristSpot="
				+ touristSpot + ", people=" + people + ", food=" + food + "]";
	}

	
	


}
