package com.eagleeyes.view.actionjdbc;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import com.eagleeyes.jdbc.bean.PayInfo;
import com.eagleeyes.jdbc.dao.PayInfoDAO;
import com.eagleeyes.jdbc.db.ConnDB;
import com.eagleeyes.util.GlobalConstant;
import com.eagleeyes.util.Page;

/**
 * 导出excel信息
 */
public class DownloadExcelAction extends BaseAction implements ServletRequestAware,ServletResponseAware, SessionAware {
	
	private static final long serialVersionUID = -4899940468781419196L;
	
	
	@SuppressWarnings("unused")
	private HttpServletRequest  request; 
	private HttpServletResponse response; 
	private Map<String, Object> session;
	
	public void setServletRequest(HttpServletRequest req) {
		this.request = req;
	}
	public void setServletResponse(HttpServletResponse res) {
		this.response = res;
	}
	@SuppressWarnings("unchecked")
	public void setSession(Map session) {
		this.session = session;
	}
	
	private String fileName;      //文件名  
	private String tempPath;      //临时文件目录 
	private InputStream excelFile;
	
	//////////////////////////////
	private String 	name;
	private String 	dep;
	
	
	PayInfoDAO	payInfoDAO = new  PayInfoDAO();
	
    public InputStream getExcelFile() {
		return excelFile;
	}
	public void setExcelFile(InputStream excelFile) {
		this.excelFile = excelFile;
	}
	
	//执行下载excel文件方法
	public String download() throws Exception{
        initExcel();  
        return "excel"; 
    }
	
	@SuppressWarnings({ "unused", "unchecked" })
    public void initExcel() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		/*ConnDB  connDB =  new ConnDB();
		String sql  = "select * from  tb_driver ";
		ResultSet rs  = connDB.executeQuery(sql);*/
		
		List<PayInfo>  payinfoList = getAllPayInfos();
		
    	HSSFWorkbook workbook = resultSetToExcel(payinfoList,"工资明细信息");
    	
    	ByteArrayOutputStream output = new ByteArrayOutputStream();
    	workbook.write(output);
    	byte[] ba = output.toByteArray();
    	excelFile = new ByteArrayInputStream(ba);
    	output.flush();
    	output.close();
    }
	
	// 设置excel的title样式
	private HSSFCellStyle createTitleStyle(HSSFWorkbook wb) {
		HSSFFont boldFont = wb.createFont();
		boldFont.setFontHeight((short) 200);
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
		style.setFont(boldFont);
		style.setDataFormat(HSSFDataFormat.getBuiltinFormat("###,##0.00"));
		return style;
	}
	
	/**
	 * 根据你数据里面的记录有多少列，就设置多少列
	 */
	private void setSheetColumnWidth(HSSFSheet sheet) {
		sheet.setColumnWidth((short)3, (short) ((short)13*256));//基本工资
		sheet.setColumnWidth((short)5, (short) ((short)13*256));//交通费
		
		sheet.setColumnWidth((short)6, (short) ((short)12*256));//通讯费
		sheet.setColumnWidth((short)7, (short) ((short)20*256));//就餐补助
		
		sheet.setColumnWidth((short)8, (short) ((short)20*256));//加班金额
		sheet.setColumnWidth((short)9, (short) ((short)13*256));//奖金
		
		sheet.setColumnWidth((short)10, (short) ((short)25*256));//四险
		sheet.setColumnWidth((short)11, (short) ((short)25*256));//住房公积金
		
		sheet.setColumnWidth((short)12, (short) ((short)18*256));//考勤扣除额
		
		sheet.setColumnWidth((short)14, (short) ((short)25*256));//扣除个人所得税
		
		
		sheet.setColumnWidth((short)15, (short) ((short)20*256));//实发工资
		
		//sheet.setColumnWidth(1, 8000);
	}
	
	//设置表格头描述信息
	private void  setExcelTitle(HSSFRow row,HSSFCellStyle style) {
		//创建第一行标题
		HSSFCell cell_0 = row.createCell((short) 0);
		cell_0.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell_0.setCellStyle(style);
		cell_0.setCellValue("序号");
		
		HSSFCell cell_1 = row.createCell((short) 1);
		cell_1.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell_1.setCellStyle(style);
		cell_1.setCellValue("姓名");
		
		HSSFCell cell_2 = row.createCell((short) 2);
		cell_2.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell_2.setCellStyle(style);
		cell_2.setCellValue("部门");
		
		HSSFCell cell_3 = row.createCell((short) 3);
		cell_3.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell_3.setCellStyle(style);
		cell_3.setCellValue("基本工资");
		
		HSSFCell cell_4 = row.createCell((short) 4);
		cell_4.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell_4.setCellStyle(style);
		cell_4.setCellValue("绩效工资"); 
		
		HSSFCell cell_5 = row.createCell((short) 5);
		cell_5.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell_5.setCellStyle(style);
		cell_5.setCellValue("交通费");
		
		HSSFCell cell_6 = row.createCell((short) 6);
		cell_6.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell_6.setCellStyle(style);
		cell_6.setCellValue("通讯费");
		
		HSSFCell cell_7 = row.createCell((short) 7);
		cell_7.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell_7.setCellStyle(style);
		cell_7.setCellValue("就餐补助");
		 
		HSSFCell cell_8 = row.createCell((short) 8);
		cell_8.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell_8.setCellStyle(style);
		cell_8.setCellValue("加班金额");
		
		HSSFCell cell_9 = row.createCell((short) 9);
		cell_9.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell_9.setCellStyle(style);
		cell_9.setCellValue("奖金");
		
		HSSFCell cell_10 = row.createCell((short) 10);
		cell_10.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell_10.setCellStyle(style);
		cell_10.setCellValue("四险");
		
		HSSFCell cell_11 = row.createCell((short) 11);
		cell_11.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell_11.setCellStyle(style);
		cell_11.setCellValue("住房公积金");
		
		HSSFCell cell_12 = row.createCell((short) 12);
		cell_12.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell_12.setCellStyle(style);
		cell_12.setCellValue("考勤扣除额");
		
		HSSFCell cell_13 = row.createCell((short) 13);
		cell_13.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell_13.setCellStyle(style);
		cell_13.setCellValue("应发工资");
		
		HSSFCell cell_14 = row.createCell((short) 14);
		cell_14.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell_14.setCellStyle(style);
		cell_14.setCellValue("扣除个人所得税");
		
		HSSFCell cell_15 = row.createCell((short) 15);
		cell_15.setEncoding(HSSFCell.ENCODING_UTF_16);
		cell_15.setCellStyle(style);
		cell_15.setCellValue("实发工资");
		
		
	}
	
	
	public HSSFWorkbook  resultSetToExcel(List<PayInfo> list,String sheetName) throws Exception{
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet();
		//设置表格的列宽度
		setSheetColumnWidth(sheet);
		wb.setSheetName(0, sheetName, HSSFWorkbook.ENCODING_UTF_16);
		HSSFRow row = sheet.createRow((short) 0);
		
		//设置表格样式 包括字体 格式化 文字居中等
		HSSFCellStyle style = createTitleStyle(wb);
		
		//设置表格头描述信息
		setExcelTitle(row, style);
		 
		
		for (int i = 0; i < list.size(); i++) {
			row = sheet.createRow((int) i + 1);
			PayInfo payInfo = (PayInfo) list.get(i);
			// 第四步,创建单元格，并设置值
			//row.createCell((short) 0).setCellValue((double) stu.getId());
			//序号
			HSSFCell cell_0 = row.createCell((short) 0);
			cell_0.setCellStyle(style);
			cell_0.setCellValue((double) i+1 );
			//姓名
			HSSFCell cell_1 = row.createCell((short) 1);
			cell_1.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell_1.setCellStyle(style);
			cell_1.setCellValue(payInfo.getName());
			//部门
			HSSFCell cell_2 = row.createCell((short) 2);
			cell_2.setEncoding(HSSFCell.ENCODING_UTF_16);
			String dep = payInfo.getDep();
			cell_2.setCellValue( dep );
			cell_2.setCellStyle(style);
			//基本工资
			HSSFCell cell_3 = row.createCell((short) 3);
			cell_3.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell_3.setCellValue(payInfo.getBasepay());
			cell_3.setCellStyle(style);
			
			//绩效工资
			HSSFCell cell_4 = row.createCell((short) 4);
			cell_4.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell_4.setCellValue( payInfo.getJixiaopay() );
			cell_4.setCellStyle(style);
			
			//交通费
			HSSFCell cell_5 = row.createCell((short) 5);
			cell_5.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell_5.setCellStyle(style);
			cell_5.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell_5.setCellValue( payInfo.getTraffic() );
			
			//通讯费
			HSSFCell cell_6 = row.createCell((short) 6);
			cell_6.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell_6.setCellValue( payInfo.getTraffic() );
			cell_6.setCellStyle(style);
			
			//就餐补助
			HSSFCell cell_7 = row.createCell((short) 7);
			cell_7.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell_7.setCellValue( payInfo.getMealallow() );
			cell_7.setCellStyle(style);
			
			//加班金额
			HSSFCell cell_8 = row.createCell((short) 8);
			cell_8.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell_8.setCellValue( payInfo.getOtmoney() );
			cell_8.setCellStyle(style);
			//奖金
			HSSFCell cell_9 = row.createCell((short) 9);
			cell_9.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell_9.setCellValue( payInfo.getAward() );
			cell_9.setCellStyle(style);
			
			//四险
			String Fourx = payInfo.getFourx();
			HSSFCell cell_10 = row.createCell((short) 10);
			cell_10.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell_10.setCellValue( Fourx );
			cell_10.setCellStyle(style);
			
			//住房公积金
			String zhufang = payInfo.getZhufang();
			HSSFCell cell_11 = row.createCell((short) 11);
			cell_11.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell_11.setCellValue( zhufang  );
			cell_11.setCellStyle(style);
			
			//考勤扣除额
			HSSFCell cell_12 = row.createCell((short) 12);
			cell_12.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell_12.setCellValue( payInfo.getAttendsub() );
			cell_12.setCellStyle(style);
			 
			//应发工资
			HSSFCell cell_14 = row.createCell((short) 13);
			cell_14.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell_14.setCellValue(   payInfo.getShouldgive()   );
			cell_14.setCellStyle(style);
			
			//扣除个人所得税
			HSSFCell cell_15 = row.createCell((short) 14);
			cell_15.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell_15.setCellValue(  payInfo.getTax()  );
			cell_15.setCellStyle(style);
			
			//实发工资
			HSSFCell cell_16 = row.createCell((short) 15);
			cell_16.setEncoding(HSSFCell.ENCODING_UTF_16);
			cell_16.setCellValue( payInfo.getReallygive()  );
			cell_16.setCellStyle(style);
			 
			
		}
		 
		return wb;
	}
	
	
	
	public HSSFWorkbook  resultSetToExcel_2(ResultSet rs,String sheetName) throws Exception{
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet();
			workbook.setSheetName(0, sheetName, HSSFWorkbook.ENCODING_UTF_16);
			HSSFRow row = sheet.createRow((short) 0);
			
			HSSFCell cell;
			ResultSetMetaData md = rs.getMetaData();
			int nColumn = md.getColumnCount();
			// 写入各个字段的名称
			for (int i = 1; i <= nColumn; i++) {
				cell = row.createCell((short) (i - 1));
				cell.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell.setEncoding(HSSFCell.ENCODING_UTF_16);
				cell.setCellValue(md.getColumnLabel(i));
			}
			int iRow = 1;
			// 写入各条记录，每条记录对应Excel中的一行
			while (rs.next()) {
				row = sheet.createRow((short) iRow);
				
				for (int j = 1; j <= nColumn; j++) {
					cell = row.createCell((short) (j - 1));
					cell.setCellType(HSSFCell.CELL_TYPE_STRING);
					cell.setEncoding(HSSFCell.ENCODING_UTF_16);
					cell.setCellValue(rs.getObject(j).toString());
				}
				iRow++;
			}
			//FileOutputStream fOut = new FileOutputStream(xlsName);
			//workbook.write(fOut);
			//fOut.flush();
			//fOut.close();
			//JOptionPane.showMessageDialog(null, "导出数据成功！");
			return workbook;
		}
	 
	 
	
	//返回带有条件的工资明细信息数据
	public List<PayInfo>  getAllPayInfos() throws SQLException  {
		List<PayInfo>  payInfoList = new ArrayList<PayInfo>();
		try {
			PayInfo  payInfo = new PayInfo();
			if (StringUtils.isNotBlank(this.name)) {
				name = URLDecoder.decode(name, "UTF-8");
				payInfo.setName(name.trim());
			}
			if (StringUtils.isNotBlank(this.dep)) {
				dep = URLDecoder.decode(dep, "UTF-8");
				payInfo.setDep(dep);
			}
			payInfoList = payInfoDAO.getAllPayInfosNoPage(payInfo);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return payInfoList;
	}
	  
    
	
	
	
	
	/** 
     * 将最新的数据插入excel 
     */  
	@SuppressWarnings({ "unused", "unchecked" })
	public void initExcel_2(){
		List list = new ArrayList();   
        //这里是获取需要填充的数  
        //list = //XXXService().getXXX();        
        //excel模板绝对路径  
      String path = "/Edu/exceltemplet/";
       try{
            String filepath = ServletActionContext.getServletContext().getRealPath(path+ fileName +".xls");  
            FileInputStream fis = new FileInputStream(filepath);  
            //ExcelUtils eu = new ExcelUtils();  
            tempPath = "";//exportExcel(fis,"temp/"+createFileName(), fileName, list);
       }catch(Exception e){  
            e.printStackTrace();  
       }  
    }
    
    /** 
     * 以年月日时分秒毫秒+4位随机数的格式来创建一个文件名，不带扩展名 
     * @return 文件名
     */  
    public static String createFileName() {
        StringBuffer sb = new StringBuffer();  
        Date date = new Date();  
        //获取年月日时分秒  
        sb.append(new SimpleDateFormat("yyyyMMddHHmmss").format(date));  
        //毫秒  
        String milli = String.valueOf(date.getTime() % 1000);  
        while (milli.length() < 3) {  
            milli = "0" + milli;  
        }  
        sb.append(milli);  
        //四位随机数  
        String rondom = String.valueOf(new Random().nextInt(10000));  
        while (rondom.length() < 4) {  
            rondom = "0" + rondom;  
        }  
        sb.append(rondom);  
        return sb.toString();  
    }  
  
      
    public String getFileName() {
    	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
    	String fileName = (sf.format(new Date()).toString())+ " 工资明细信息";// 工资明细信息.xls
    	
    	try {
    		fileName = new String(fileName.getBytes(),"ISO8859-1");
    	} catch (UnsupportedEncodingException e) {
    		e.printStackTrace();
    	}
        return fileName;  
    }  
  
    public void setFileName(String fileName) {  
        this.fileName = fileName;  
    }  
    
    /** 
     * @param sheet 要添加数据的工作表 
   * @param list 填充的数据 
   */  
  public void addCellOfBug(WritableSheet sheet, List list) {  
      if (list.size() > 0) {  
          int i = 0;  
          for (Iterator it = list.iterator(); it.hasNext();) {  
              int j = 0;  
//              BugStat bs = (BugStat) it.next();  
//              if (null != bs) {  
//                  try {  
//                      String bugs = bs.getBugs();  
//                      String[] strs = bugs.split(";");  
//                      //第一列,填充 XXX, Label(列,行,值)  
//                      sheet.addCell(new Label(j++, i + 3, bs.getSiteName()));  
//                      //第二列,填充 XXXXX  
//                       sheet.addCell(new Label(j++, i + 3, strs[0].equals("1") ? "是" : "否"));  
//                   } catch (WriteException ex) {  
//                      ex.printStackTrace();  
//                  }  
//              }
              i++;  
          }  
      }  
  }  
  
  /** 
    * 得到实际保存文件根目录 
   */  
    public static String getRootPath() {
        return ServletActionContext.getServletContext().getRealPath("").replace("\\", "/") + "/Edu/exceltemplet/";  
    }
    
    
    /** 
     * 输出excel 
     * @param is 原始excel模版输入流 
     * @param path 临时文件目录 
     * @param fileName 文件名 
     * @param list 要填充的数据 
     * @return 返回相对临时文件的目录 
     */  
//    public String exportExcel(InputStream is, String path, String fileName, List list) {  
//        //临时目录,用于生成临时文件  
//        String tempPath = null ;  
//        WritableWorkbook wb = null;  
//        File f = new File(getRootPath() + path);  
//        //不存在则创建它  
//        if (!f.exists())   
//            f.mkdirs();  
//        tempPath = getRootPath() + path + "/" + fileName + ".xls";  
//        final File file = new File(tempPath);  
//        OutputStream oss = null;  
//        try {  
//            //创建临时文件  
//            if(file.createNewFile()){  
//                oss = new FileOutputStream(file);  
//                wb = Workbook.createWorkbook(oss, Workbook.getWorkbook(is));  
//                WritableSheet sheet = wb.getSheet(0);  
//                if ("bug".equals(fileName)) {  
//                    addCellOfBug(sheet, list);  
//                }  
//                wb.write();  
//            }  
//        } catch (Exception e) {  
//            e.printStackTrace();  
//        } finally {  
//            try {  
//                wb.close();  
//                oss.flush();  
//                oss.close();  
//            } catch (Exception e) {  
//                e.printStackTrace();  
//            }  
//        }  
//  
//        //过一段时间之后,删除临时文件  
//        new Thread(new Runnable() {  
//            public void run() {  
//                try {  
//                    // 线程睡20秒  
//             Thread.sleep(20000);  
//                } catch (InterruptedException e) {  
//                    e.printStackTrace();  
//                }  
//                // 删除临时文件  
//                file.delete();  
//            }  
//        }).start();  
//        return path + "/" + fileName + ".xls";  
//    }  
 
/////////////////////////////////////////////////////////////////////////
    public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDep() {
		return dep;
	}
	public void setDep(String dep) {
		this.dep = dep;
	}
	
	
	
}
