package sb.datetime
{
	import org.flexunit.asserts.assertEquals;

	public class DateTimeByUtcDateTest
	{
		[Test]
		public function test():void {
			
			var date:Date = new Date("Tue Feb 1 00:00:00 GMT-0000 2005");
			var dateTime:DateTime = DateTime.byUtcDate(date);
			
			assertEquals(TimeZone.UTC, dateTime.timeZone);
			assertEquals("year", dateTime.year, 2005);
			assertEquals("month", dateTime.month, DateTimeConstant.FEB);
			assertEquals("day", dateTime.day, 1);
			assertEquals("hour", dateTime.hour, 0);
			assertEquals("minute", dateTime.minute, 0);
		}
	}
}