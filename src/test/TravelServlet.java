package test;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.Random;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;

import services.EditInfoService;
import services.LoginService;
import util.DataBaseUtils;
import bean.User;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

/**
 * Servlet implementation class TravelServlet
 */
@WebServlet("/TravelServlet")
public class TravelServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
	// 上传文件存储目录
    private static final String UPLOAD_DIRECTORY = "upload";
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TravelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getSession().getAttribute("username").toString();
		
		SmartUpload su = new SmartUpload(); //新建一个SmartUpload对象
        JspFactory _jspxFactory = null;
        PageContext pageContext = null;
        _jspxFactory = JspFactory.getDefaultFactory();
        pageContext = _jspxFactory.getPageContext(this,request,response,"",true,8192,true);
        
        String uploadPath = request.getServletContext().getRealPath("./") + File.separator + UPLOAD_DIRECTORY;
        //String uploadPath="D:\\Pics"+UPLOAD_DIRECTORY;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        su.initialize(pageContext);//初始化上传操作
        try {
			su.upload();
			String fileName=su.getFiles().getFile(0).getFileName();
			fileName=new java.text.SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(new Date())+new Random()+fileName;//时间+随机数防止重复
			System.out.println(fileName);
			su.save("upload");
			
			for (int i=0;i<su.getFiles().getCount();i++)
			{ 
			com.jspsmart.upload.File file = su.getFiles().getFile(i); 
			// 若文件不存在则继续 
			if (file.isMissing()) continue; 
			// 将文件另存为 
			file.saveAs("/upload/" + fileName); 
			} 
			
			int  byteread  =  0; 
			File oldFile = new File(uploadPath+"\\"+fileName);  
			File newFile = new File("D:\\code\\Wonderland\\WebContent\\Static\\uploadedFiles" + File.separator + oldFile.getName());
			if  (oldFile.exists())  {  //文件存在时    
	               InputStream  inStream  =  new  FileInputStream(uploadPath+"\\"+fileName);  //读入原文件   
	               FileOutputStream  fs  =  new  FileOutputStream(newFile);    
	               byte[]  buffer  =  new  byte[1444];    
//	               int  length;    
	               while  (  (byteread  =  inStream.read(buffer))  !=  -1)  {    
//	                   bytesum  +=  byteread;  //字节数  文件大小    
//	                   System.out.println(bytesum);    
	                   fs.write(buffer,  0,  byteread);    
	               }    
	               inStream.close(); 
	               //System.out.println("success");
	           } 
			
			String nFile = newFile.getPath();
			String  filePath  =  uploadPath+"\\"+fileName;
			filePath  =  filePath.toString();    
	        java.io.File  myDelFile  =  new  java.io.File(filePath);    
	        myDelFile.delete(); 

	        
		        String city = su.getRequest().getParameter("searchCity"); 
		       
		        DataBaseUtils.getConnection();
		        
		        LoginService loginService = new LoginService();
		        User user = loginService.getUser(username);

		        user.setTouristSpot("Static\\uploadedFiles" + File.separator + oldFile.getName());
		        user.setCity(city);
		        EditInfoService.editTravelSpot(user);
		        request.setAttribute("message",
		        "资料保存成功!");
		        request.setAttribute("user", user);
		        System.out.println(user);
		        request.setAttribute("spot1",user.getTouristSpot());
		        request.setAttribute("searchCity",user.getCity());
		        // 跳转到 message.jsp
		        request.getServletContext().getRequestDispatcher("/message.jsp").forward(
		                request, response);
		       
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
	}

}
