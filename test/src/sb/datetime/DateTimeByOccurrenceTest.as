package sb.datetime
{
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.fail;

	public class DateTimeByOccurrenceTest
	{		
		[Test]
		public function testFirstOccurence():void {
			
			var dateTime:DateTime = DateTime.byOccurrence(TimeZone.AMERICA_LOS_ANGELES, 2010, DateTimeConstant.AUG, 0, 0, 0, DateTimeConstant.THURSDAY, 1);
		
			assertEquals(2010, dateTime.year);
			assertEquals(DateTimeConstant.AUG, dateTime.month);
			assertEquals(5, dateTime.day);
			assertEquals(0, dateTime.hour);
			assertEquals(0, dateTime.minute);
		}
		[Test]
		public function testSecondOccurence():void {
			
			var dateTime:DateTime = DateTime.byOccurrence(TimeZone.AMERICA_LOS_ANGELES, 2010, DateTimeConstant.AUG, 0, 0, 0, DateTimeConstant.THURSDAY, 2);
			
			assertEquals(2010, dateTime.year);
			assertEquals(DateTimeConstant.AUG, dateTime.month);
			assertEquals(12, dateTime.day);
			assertEquals(0, dateTime.hour);
			assertEquals(0, dateTime.minute);
		}
		
		[Test]
		public function testFirstDayOfMonth():void {
			
			var dateTime:DateTime = DateTime.byOccurrence(TimeZone.AMERICA_LOS_ANGELES, 2010, DateTimeConstant.AUG, 0, 0, 0, DateTimeConstant.SUNDAY, 1);
			
			assertEquals(2010, dateTime.year);
			assertEquals(DateTimeConstant.AUG, dateTime.month);
			assertEquals(1, dateTime.day);
			assertEquals(0, dateTime.hour);
			assertEquals(0, dateTime.minute);
		}
		
		[Test]
		public function testLastDayOfMonth():void {
			
			var dateTime:DateTime = DateTime.byOccurrence(TimeZone.AMERICA_LOS_ANGELES, 2010, DateTimeConstant.AUG, 0, 0, 0, DateTimeConstant.TUESDAY, 5);
			
			assertEquals(2010, dateTime.year);
			assertEquals(DateTimeConstant.AUG, dateTime.month);
			assertEquals(31, dateTime.day);
			assertEquals(0, dateTime.hour);
			assertEquals(0, dateTime.minute);
		}
		
		[Test]
		public function testLastOccurence():void {
			
			var dateTime:DateTime = DateTime.byOccurrence(TimeZone.AMERICA_LOS_ANGELES, 2010, DateTimeConstant.AUG, 0, 0, 0, DateTimeConstant.THURSDAY, -1);
			
			assertEquals(2010, dateTime.year);
			assertEquals(DateTimeConstant.AUG, dateTime.month);
			assertEquals(26, dateTime.day);
			assertEquals(0, dateTime.hour);
			assertEquals(0, dateTime.minute);
		}
		
		[Test]
		public function testSecondLastOccurence():void {
			
			var dateTime:DateTime = DateTime.byOccurrence(TimeZone.AMERICA_LOS_ANGELES, 2010, DateTimeConstant.AUG, 0, 0, 0, DateTimeConstant.THURSDAY, -2);
			
			assertEquals(2010, dateTime.year);
			assertEquals(DateTimeConstant.AUG, dateTime.month);
			assertEquals(19, dateTime.day);
			assertEquals(0, dateTime.hour);
			assertEquals(0, dateTime.minute);
		}
		
		[Test]
		public function testZeroOccurrences():void {
			
			var error:Error;
			
			try {
				var dateTime:DateTime = DateTime.byOccurrence(TimeZone.AMERICA_LOS_ANGELES, 2010, DateTimeConstant.AUG, 0, 0, 0, DateTimeConstant.THURSDAY, 0);
			}
			catch(e:Error) {
				error = e;
			}
			
			assertEquals(error.message, DateTimeError.ZERO_OCCURRENCE_MESSAGE);
			assertEquals(error.errorID, DateTimeError.ZERO_OCCURRENCE_ID);
		}
		
		[Test]
		public function testInvalidOccurrences():void {
			
			var error:Error;
			
			try {
				var dateTime:DateTime = DateTime.byOccurrence(TimeZone.AMERICA_LOS_ANGELES, 2010, DateTimeConstant.SEP, 0, 0, 0, DateTimeConstant.SUNDAY, 5);
			}
			catch(e:Error) {
				error = e;
			}
			
			assertEquals(error.message, "5 " + DateTimeError.OCCURRENCE_NOT_IN_MONTH_MESSAGE);
			assertEquals(error.errorID, DateTimeError.OCCURRENCE_NOT_IN_MONTH_ID);
		}
	}
}