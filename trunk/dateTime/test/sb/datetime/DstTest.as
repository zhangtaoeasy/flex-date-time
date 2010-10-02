package sb.datetime
{
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.asserts.fail;

	public class DstTest
	{
		[Test]
		public function testIsDst():void {
			
			var dst:DST = new DST(TimeZone.AMERICA_LOS_ANGELES, 2010, DateTimeConstant.JUL, 1, 0, 0);
			
			assertTrue(dst.isDst());
		}
		
		[Test]
		public function testIsNotDst():void {
			
			var dst:DST = new DST(TimeZone.AMERICA_LOS_ANGELES, 2010, DateTimeConstant.DEC, 1, 0, 0);
			
			assertFalse(dst.isDst());
		}
		
		[Test]
		public function testDstStart():void {
			
			var dst:DST = new DST(TimeZone.AMERICA_LOS_ANGELES, 2010, DateTimeConstant.MAR, 14, 2, 0);
			
			assertTrue(dst.isDst());
		}
		
		[Test]
		public function testDstEnd():void {
			
			var dst:DST = new DST(TimeZone.AMERICA_LOS_ANGELES, 2010, DateTimeConstant.NOV, 7, 2, 0);
			
			assertFalse(dst.isDst());
		}
	}
}