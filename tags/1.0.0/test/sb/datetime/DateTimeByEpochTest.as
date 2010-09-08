package sb.datetime
{
	import org.flexunit.asserts.assertEquals;

	public class DateTimeByEpochTest
	{
		[Test]
		public function testUtc():void {
			
			var dateTime:DateTime = new DateTimeByEpoch(TimeZone.UTC, 1283734140000);
			
			assertEquals("year", dateTime.year, 2010);
			assertEquals("month", dateTime.month, DateTimeConstant.SEP);
			assertEquals("day", dateTime.day, 6);
			assertEquals("hour", dateTime.hour, 0);
			assertEquals("minute", dateTime.minute, 49);
			assertEquals("second", dateTime.second, 0);
		}
		
		[Test]
		public function testPst():void {
			
			var dateTime:DateTime = new DateTimeByEpoch(TimeZone.AMERICA_LOS_ANGELES, 1283734140000);
			
			assertEquals("year", dateTime.year, 2010);
			assertEquals("month", dateTime.month, DateTimeConstant.SEP);
			assertEquals("day", dateTime.day, 5);
			assertEquals("hour", dateTime.hour, 17);
			assertEquals("minute", dateTime.minute, 49);
			assertEquals("second", dateTime.second, 0);
		}
		
		[Test]
		public function testTime():void {
			
			var dateTime:DateTime = new DateTimeByEpoch(TimeZone.AMERICA_NEW_YORK, 1283734140000);
			
			assertEquals(dateTime.time, 1283734140000);
		}
	}
}