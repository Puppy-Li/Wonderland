package util;

import java.util.regex.Pattern;

import sun.management.counter.Variability;

public class StringUtils {
  public static boolean isEmpty(String str){
	  return null == str || str.equals("") || str.matches("\\s*");  //匹配任何空白字符，包括空格、制表符、换页符等
  }
  
  public static String defaultValue(String content, String defaultValue){
	  if(isEmpty(content)){
		  return defaultValue;
	  }
	  return content;
  }
  
  //把数据库字段名改为驼峰式
  public static String columnToProperty(String column){
	  //如果字段名为空，返回空字符串
	  if(isEmpty(column)) return "";
	  //获取字段长度
	  Byte length = (byte) column.length();
	  StringBuilder sb = new StringBuilder(length);
	  int i=0;
	  //遍历字段的每一个字符
	  for(int j=0;j<length;j++){
		  //匹配第一个
		  if(column.charAt(j) == '_'){
			  /**如果后面还有_,也就是连续的_,那么j就需要自增一个单位，直到后面不是_为止* */
              while(column.charAt(j+1)=='_'){
            	  j+=1;
              }
              sb.append(("" + column.charAt(++j)).toUpperCase());
		  }else{
			  //如果循环到的字符不是_,就保存下来
			  sb.append(column.charAt(j));
		  }
	  }
	  return sb.toString();
  }
  
      //将一个字符串的首字母改为大写
      public static String upperCaseFirstCharacter(String str){
    	  StringBuilder sb = new StringBuilder();
    	  char[] arr=str.toCharArray();
    	  for(int i = 0;i<arr.length;i++){
    		  if(i==0) sb.append((arr[i]+"").toUpperCase());
    		  else sb.append((arr[i]+""));
    	  }
    	  return sb.toString();
      }
      
      //正则
      public static boolean testName(String name){
    	  String username = name;
          String pattern = "/^[a-zA-Z][a-zA-Z0-9_]*$/";
        if( Pattern.matches(pattern, username))
        	return false;
        else 
        	return true;
      }
      
      public static boolean testPassword(String psd){
    	  String password = psd;
          if(password.length() > 5 && password.length() < 17){
        	  return true;
          }
          return false; 
      }
       
      public static boolean testEmail(String email){
    	  String useremail = email;
          String pattern = "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z0-9]+$";
        return Pattern.matches(pattern, useremail);
      }
      
      public static boolean testPhone(String phone){
    	  String userphone = phone;
          String pattern = "^(((13[0-9])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8})|(0\\d{2}-\\d{8})|(0\\d{3}-\\d{7})$";
        return Pattern.matches(pattern, userphone);
      }
      
      public static void main(String[] args) {
//    	  
//    	  System.out.println(testEmail("247735945@qq.com"));
//    	  System.out.println(testName("Puppy"));
//    	  System.out.println(testPassword("123456"));
//    	  System.out.println(testPhone("18721267196"));
//    	  boolean flag=true;
//    	  boolean flag2=true;
//    	  boolean flag3=true;
//    	  boolean flag4=true;
//    	  if(!flag||!flag2||!flag3|!flag4)System.out.println("false");
//    	  else System.out.println("true");
    	  
      }
}
