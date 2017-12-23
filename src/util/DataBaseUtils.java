package util;

import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;

import bean.User;







public class DataBaseUtils {
	private static String username; //用户名
	private static String password; //密码
	private static String dataBaseName; //数据库名
	
	public static void main(String[] args) throws SQLException {
		DataBaseUtils.config("jdbc.properties");
		Connection conn=DataBaseUtils.getConnection();
		System.out.println(conn);
		
		String id = UUID.randomUUID() + "";
		String createTime = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
//	update("INSERT INTO t_user(id,username,password,sex,create_time,is_delete,address,telephone) "
//        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)", id,"Puppy",940814,1,createTime,0,"保密","保密");
//		
//	String sql = TableUtils.getCreateTableSQL(User.class);
//	System.out.println(sql);
//		
		
		List list = DataBaseUtils.queryForList("select * from t_user");
		System.out.println(list);
		
		Map map=DataBaseUtils.queryForMap("select * from t_user where username = ?", "Admin");
		System.out.println(map);
		
		User user=DataBaseUtils.queryForBean("select * from t_user limit 1", User.class);
		System.out.println("user:"+user);
	}
	
	//配置数据库的基本信息
	public static void config(String path){
		InputStream inputStream = DataBaseUtils.class.getClassLoader().getResourceAsStream(path);
		Properties p =new Properties();
		try{
			p.load(inputStream);
			username=p.getProperty("db.username");
			password=p.getProperty("db.password");
			dataBaseName=p.getProperty("db.dataBaseName");
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	
	//该类被加载时会自动配置jdbc.properties
	static{
		config("jdbc.properties");    
	}
	
	//获取数据库连接
	public static Connection getConnection(){
		Connection connection=null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+dataBaseName+"?useUnicode=true&characterEncoding=utf8",username,password);
		}catch (ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		}catch (SQLException ex) {
			// TODO: handle exception
			ex.printStackTrace();
		}
		return connection;
	}
	
	//关闭资源
	public static void closeConnection(Connection connection,PreparedStatement statement,ResultSet rs){
		try{
			if(rs!=null) rs.close();
			if(statement!=null) statement.close();
			if(connection!=null) connection.close();
		}catch (Exception e) {
			// TODO: handle exception
			e.fillInStackTrace();
		}
	}
	
	//DML操作
	//增
	public static void update(String sql,Object...objects){
		Connection connection=getConnection();
		PreparedStatement statement=null;
		try{
			statement=(PreparedStatement)connection.prepareStatement(sql);
			for(int i=0;i<objects.length;i++){
				statement.setObject(i+1, objects[i]);
			}
			statement.executeUpdate();
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			closeConnection(connection, statement, null);
		}
	}
	
	//查   查询所有数据
	/**
	 * 查询出数据，并且list返回
	 * @param sql
	 * @param objects
	 * @return
	 * @throws SQLException
	 */
	public static List<Map<String,Object>> queryForList(String sql,Object...objects){
	    List<Map<String,Object>> result = new ArrayList<Map<String,Object>>();
	    Connection connection = getConnection();
	    PreparedStatement statement = null;
	    ResultSet rs = null;
	    try {
	        statement = connection.prepareStatement(sql);
	        for (int i = 0; i < objects.length; i++) {
	            statement.setObject(i+1, objects[i]);
	        }
	        
	        rs = statement.executeQuery();
	        while(rs.next()){
	            ResultSetMetaData resultSetMetaData = rs.getMetaData();
	            int count = resultSetMetaData.getColumnCount(); //获取列数
	            Map<String,Object> map = new HashMap<String, Object>();
	            for (int i = 0; i < count; i++) {
	                map.put(resultSetMetaData.getColumnName(i+1), rs.getObject(resultSetMetaData.getColumnName(i+1)));
	            }
	            result.add(map);
	        };
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }finally{
	        closeConnection(connection, statement, rs);
	    }
	    
	    return result;
	}
	
	//查  查询一条数据
	public static Map<String, Object> queryForMap(String sql, Object...objects){
		Map<String, Object> result = new HashMap<String, Object>();
		List<Map<String, Object>> list=queryForList(sql, objects);
		if(list.size()!=1){
			return null;
		}
		result = list.get(0);
		return result;
	}
	
	//查 查询出的数据返回一个JavaBean
	public static <T>T queryForBean(String sql,Class clazz,Object...objects){
	    T obj = null;
	    Map<String,Object> map = null;
	    Field field = null;
	    try {
	        try {
				obj = (T) clazz.newInstance();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}   //创建一个新的Bean实例
	        map = queryForMap(sql, objects); //先将结果集放在一个Map中
	    } catch (InstantiationException e) {
	        e.printStackTrace();
	    } 
	    if(map == null){
	        return null;
	    }
	    //遍历Map
	    for (String columnName : map.keySet()) {
	        Method method = null;
	        String propertyName = StringUtils.columnToProperty(columnName); //属性名称
	        
	        try {
	            field = clazz.getDeclaredField(propertyName);
	        } catch (NoSuchFieldException e1) {
	            e1.printStackTrace();
	        } catch (SecurityException e1) {
	            e1.printStackTrace();
	        } 
	        //获取JavaBean中的字段
	        String fieldType = field.toString().split(" ")[1]; //获取该字段的类型
	        //System.out.println(fieldType);
	        Object value = map.get(columnName);
	        if(value == null){
	            continue;
	        }
	        /**获取set方法的名字* */
	        String setMethodName = "set" + StringUtils.upperCaseFirstCharacter(propertyName);
	        //System.out.println(setMethodName);
	        try {
	            /**获取值的类型* */
	            String valueType = value.getClass().getName();
	            
	            /**查看类型是否匹配* */
	            if(!fieldType.equalsIgnoreCase(valueType)){
	                //System.out.println("类型不匹配");
	                if(fieldType.equalsIgnoreCase("java.lang.Integer")){
	                    value = Integer.parseInt(String.valueOf(value));
	                }else if(fieldType.equalsIgnoreCase("java.lang.String")){
	                    value = String.valueOf(value);
	                }else if(fieldType.equalsIgnoreCase("java.util.Date")){
	                    valueType = "java.util.Date";
	                    //将value转换成java.util.Date
	                    String dateStr = String.valueOf(value);
	                    Timestamp ts = Timestamp.valueOf(dateStr);
	                    Date date = new Date(ts.getTime());
	                    value = date;
	                }
	            }
	            
	            /**获取set方法* */
	            //System.out.println(valueType);
	            method = clazz.getDeclaredMethod(setMethodName,Class.forName(fieldType));
	            /**执行set方法* */
	            method.invoke(obj, value);
	        }catch(Exception e){
	            e.printStackTrace();
	            /**如果报错，基本上是因为类型不匹配* */
	        }
	    }
	    //System.out.println(obj);
	    return obj;
	}
	
	
}
