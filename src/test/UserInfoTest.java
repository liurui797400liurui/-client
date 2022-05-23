package test;
import static org.junit.Assert.assertEquals;
import org.junit.BeforeClass;
import org.junit.Test;

import com.eagleeyes.jdbc.bean.UserInfo;
public class UserInfoTest { 
	private static UserInfo userInfo;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		userInfo=new UserInfo();
	}
	@Test
	public void testId()  {
		userInfo.setId(2);
		assertEquals(2, userInfo.getId());
	}
	@Test
	public void testAge()  {
		userInfo.setAge("18");
		assertEquals("18", userInfo.getAge());
	}
	@Test
	public void testSex()  {
		userInfo.setSex(0);
		assertEquals(0, userInfo.getSex());
	}
	@Test
	public void testDep()  {
		userInfo.setDep("test");
		assertEquals("test", userInfo.getDep());
	}
	@Test
	public void testDegree()  {
		userInfo.setDegree("管理员");
		assertEquals("管理员", userInfo.getDegree());
	}
	@Test
	public void testJob()  {
		userInfo.setJob("工人");
		assertEquals("工人", userInfo.getJob());
	}
	@Test
	public void testPic()  {
		userInfo.setPic("uploadimages/1428132410131_1776900261.jpg");
		assertEquals("uploadimages/1428132410131_1776900261.jpg", userInfo.getPic());
	}
	@Test
	public void testIdno()  {
		userInfo.setIdno("656565656565656565");
		assertEquals("656565656565656565", userInfo.getIdno());
	}
	@Test
	public void testMianmao()  {
		userInfo.setMianmao("1");
		assertEquals("1", userInfo.getMianmao());
	}
	@Test
	public void testEmail()  {
		userInfo.setEmail("123@qq.com");
		assertEquals("123@qq.com", userInfo.getEmail());
	}
	@Test
	public void testRoleid()  {
		userInfo.setRoleid(1);
		assertEquals(1, userInfo.getRoleid());
	}
	@Test
	public void testUsername()  {
		userInfo.setUsername("test");
		assertEquals("test", userInfo.getUsername());
	}
	@Test
	public void testPassword()  {
		userInfo.setPassword("123");
		assertEquals("123", userInfo.getPassword());
	}
	@Test
	public void testTruename()  {
		userInfo.setTruename("test");
		assertEquals("test", userInfo.getTruename());
	}
	@Test
	public void testPhone()  {
		userInfo.setPhone("123");
		assertEquals("123", userInfo.getPhone());
	}
	@Test
	public void testAddress()  {
		userInfo.setAddress("深圳市罗湖区区委政府");
		assertEquals("深圳市罗湖区区委政府", userInfo.getAddress());
	}
	

}
