package test;
import static org.junit.Assert.assertEquals;
import org.junit.BeforeClass;
import org.junit.Test;
import com.eagleeyes.jdbc.bean.PayInfo;

public class PayInfoTest {
	private static PayInfo payInfo;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		payInfo=new PayInfo();
	}
	@Test
	public void testId()  {
		payInfo.setId(2);
		assertEquals(2, payInfo.getId());
	}
	@Test
	public void testName()  {
		payInfo.setName("李小小");
		assertEquals("李小小", payInfo.getName());
	}
	@Test
	public void testDep()  {
		payInfo.setDep("营销部门");
		assertEquals("营销部门", payInfo.getDep());
	}
	@Test
	public void testBasepay()  {
		payInfo.setBasepay("100");
		assertEquals("100", payInfo.getBasepay());
	}
	@Test
	public void testJixiaopay()  {
		payInfo.setJixiaopay("200");
		assertEquals("200", payInfo.getJixiaopay());
	}
	@Test
	public void testFourx()  {
		payInfo.setFourx("10");
		assertEquals("10", payInfo.getFourx());
	}
	@Test
	public void testZhufang()  {
		payInfo.setZhufang("12");
		assertEquals("12", payInfo.getZhufang());
	}
	@Test
	public void testTraffic()  {
		payInfo.setTraffic("0");
		assertEquals("0", payInfo.getTraffic());
	}
	@Test
	public void testCommuni()  {
		payInfo.setCommuni("33");
		assertEquals("33", payInfo.getCommuni());
	}
	@Test
	public void testMealallow()  {
		payInfo.setMealallow("0.1");
		assertEquals("0.1", payInfo.getMealallow());
	}
	@Test
	public void testAttendsub()  {
		payInfo.setAttendsub("3.3");
		assertEquals("3.3", payInfo.getAttendsub());
	}
	@Test
	public void testOtmoney()  {
		payInfo.setOtmoney("11");
		assertEquals("11", payInfo.getOtmoney());
	}
	@Test
	public void testAward()  {
		payInfo.setAward("16");
		assertEquals("16", payInfo.getAward());
	}
	@Test
	public void testShouldgive()  {
		payInfo.setShouldgive("5");
		assertEquals("5", payInfo.getShouldgive());
	}
	@Test
	public void testTax()  {
		payInfo.setTax("1");
		assertEquals("1", payInfo.getTax());
	}
	@Test
	public void testReallygive()  {
		payInfo.setReallygive("555");
		assertEquals("555", payInfo.getReallygive());
	}

}
