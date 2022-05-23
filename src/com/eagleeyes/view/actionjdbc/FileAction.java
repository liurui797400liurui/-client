package com.eagleeyes.view.actionjdbc;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.Random;

import org.apache.struts2.ServletActionContext;

public class FileAction extends BaseAction{


	private static final long serialVersionUID = 5789934103138578415L;
	
	private File   image; 			 
    private String imageFileName; 	  
    private String imageContentType;  
    private String message = "图片文件上传成功！";
    private String savePath ;  
    
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public File getImage() {
		return image;
	}
	public void setImage(File image) {
		this.image = image;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getImageContentType() {
		return imageContentType;
	}
	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}
	public String getSavePath() {
		return savePath;
	}
	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	
    private static String getExtention(String fileName) {
       int pos = fileName.lastIndexOf(".");
       return fileName.substring(pos);
    }
	public String executeUpload() throws IOException{
		String path = ServletActionContext.getServletContext().getRealPath("/uploadimages");
		File file = new File(path);
        if (!file.exists()) {
        	file.mkdirs();
        }
        try {
            File f = this.getImage();  
            if(imageFileName.endsWith(".exe")){  
                message="文件格式错误,不能上传.exe格式的文件";  
                return ERROR;  
            }
            if(f.length()>1024*1024*4){
            	message="上传文件过大";
            	return "error";
            }
            if(f.length()<=0){
            	message="上传文件大小不能为0";
            	return "error";
            }
            String imgFileName = "";  
            Random random = new Random(new Date().getTime());
            imgFileName = new Date().getTime() + "_" + String.valueOf(Math.abs(random.nextInt())) + getExtention(this.getImageFileName());
            FileInputStream inputStream = new FileInputStream(f);
            FileOutputStream outputStream = new FileOutputStream(path + "/"+ imgFileName);
            byte[] buf = new byte[1024];  
            int length = 0;  
            while ((length = inputStream.read(buf)) != -1) {
                outputStream.write(buf, 0, length);  
            }  
            inputStream.close();  
            outputStream.flush();
            outputStream.close();
            this.setMessage(message);
            this.setSavePath("uploadimages/"+imgFileName);
        } catch (Exception e) {  
            e.printStackTrace();  
            message = "上传异常!!!!";  
        }
        return SUCCESS;  
	}
	
    
    
    
	public static void main(String[] args) {
	}

}
