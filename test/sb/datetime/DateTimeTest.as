package sb.datetime
{
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.asserts.fail;

	public class DateTimeTest 
	{		
		[Test]
		public function testTime():void {
			
			var utcDateTime:DateTime = new DateTime(TimeZone.UTC, 2010, DateTimeConstant.SEP, 6, 0, 0, 0);
			var estDateTime:DateTime = new DateTime(UsTimeZone.EST, 2010, DateTimeConstant.SEP, 6, 0, 0, 0);
			var cstDateTime:DateTime = new DateTime(UsTimeZone.CST, 2010, DateTimeConstant.SEP, 6, 0, 0, 0);
			var mstDateTime:DateTime = new DateTime(UsTimeZone.MST, 2010, DateTimeConstant.SEP, 6, 0, 0, 0);
			var arizonaDateTime:DateTime = new DateTime(UsTimeZone.ARIZONA, 2010, DateTimeConstant.SEP, 6, 0, 0, 0);
			var pstDateTime:DateTime = new DateTime(UsTimeZone.PST, 2010, DateTimeConstant.SEP, 6, 0, 0, 0);
			
			assertEquals("UTC", utcDateTime.time, 1283731200000);
			assertEquals("EST", estDateTime.time, 1283731200000 - DateTimeConstant.UTC_MINUS_4);
			assertEquals("CST", cstDateTime.time, 1283731200000 - DateTimeConstant.UTC_MINUS_5);
			assertEquals("MST", mstDateTime.time, 1283731200000 - DateTimeConstant.UTC_MINUS_6);
			assertEquals("MST_NO_DST", arizonaDateTime.time, 1283731200000 - DateTimeConstant.UTC_MINUS_7);
			assertEquals("PST", pstDateTime.time, 1283731200000 - DateTimeConstant.UTC_MINUS_7);
		}
		
		[Test]
		public function testDstStart():void {
			
			var dateTime:DateTime = new DateTime(TimeZone.AMERICA_NEW_YORK, 2010, DateTimeConstant.MAR, 14, 2, 0, 0);
			
			assertTrue(dateTime.dst);
			assertFalse(dateTime.addMinute(-1).dst);
			assertTrue(dateTime.addMinute(1).dst);
			
			dateTime = new DateTime(TimeZone.AMERICA_PHOENIX, 2010, DateTimeConstant.MAR, 14, 2, 0, 0);
			
			assertFalse(dateTime.dst);
			assertFalse(dateTime.addMinute(-1).dst);
			assertFalse(dateTime.addMinute(1).dst);
		}
		
		public function testDstEnd():void {
			
			var dateTime:DateTime = new DateTime(TimeZone.AMERICA_NEW_YORK, 2010, DateTimeConstant.NOV, 7, 2, 0, 0);
			
			assertFalse(dateTime.dst);
			assertTrue(dateTime.addMinute(-1).dst);
			assertFalse(dateTime.addMinute(1).dst);
			
			dateTime = new DateTime(TimeZone.AMERICA_PHOENIX, 2010, DateTimeConstant.MAR, 14, 2, 0, 0);
			
			assertFalse(dateTime.dst);
			assertFalse(dateTime.addMinute(-1).dst);
			assertFalse(dateTime.addMinute(1).dst);
		}
		
		[Test]
		public function testEst():void {
			
			var dateTime:DateTime = new DateTime(TimeZone.AMERICA_NEW_YORK, 2010, DateTimeConstant.DEC, 25, 12, 0, 0);
			
			assertOffset(dateTime, TimeZone.UTC, -5);
			assertOffset(dateTime, TimeZone.AMERICA_NEW_YORK, 0);
			assertOffset(dateTime, TimeZone.AMERICA_CHICAGO, 1);
			assertOffset(dateTime, TimeZone.AMERICA_DENVER, 2);
			assertOffset(dateTime, TimeZone.AMERICA_PHOENIX, 2);
			assertOffset(dateTime, TimeZone.AMERICA_LOS_ANGELES, 3);
			assertOffset(dateTime, TimeZone.AMERICA_ANCHORAGE, 4);
			assertOffset(dateTime, TimeZone.PACIFIC_HONOLULU, 5);
		} 
		
		[Test]
		public function testEstDst():void {
			
			var dateTime:DateTime = new DateTime(TimeZone.AMERICA_NEW_YORK, 2010, DateTimeConstant.AUG, 25, 12, 0, 0);
			
			assertOffset(dateTime, TimeZone.UTC, -4);
			assertOffset(dateTime, TimeZone.AMERICA_NEW_YORK, 0);
			assertOffset(dateTime, TimeZone.AMERICA_CHICAGO, 1);
			assertOffset(dateTime, TimeZone.AMERICA_DENVER, 2);
			assertOffset(dateTime, TimeZone.AMERICA_PHOENIX, 3);
			assertOffset(dateTime, TimeZone.AMERICA_LOS_ANGELES, 3);
			assertOffset(dateTime, TimeZone.AMERICA_ANCHORAGE, 4);
			assertOffset(dateTime, TimeZone.PACIFIC_HONOLULU, 6);
		}
		
		[Test]
		public function testCst():void {
			
			var dateTime:DateTime = new DateTime(TimeZone.AMERICA_CHICAGO, 2010, DateTimeConstant.DEC, 25, 12, 0, 0);
			
			assertOffset(dateTime, TimeZone.UTC, -6);
			assertOffset(dateTime, TimeZone.AMERICA_NEW_YORK, -1);
			assertOffset(dateTime, TimeZone.AMERICA_CHICAGO, 0);
			assertOffset(dateTime, TimeZone.AMERICA_DENVER, 1);
			assertOffset(dateTime, TimeZone.AMERICA_PHOENIX, 1);
			assertOffset(dateTime, TimeZone.AMERICA_LOS_ANGELES, 2);
			assertOffset(dateTime, TimeZone.AMERICA_ANCHORAGE, 3);
			assertOffset(dateTime, TimeZone.PACIFIC_HONOLULU, 4);
		} 
		
		[Test]
		public function testCstDst():void {
			
			var dateTime:DateTime = new DateTime(TimeZone.AMERICA_CHICAGO, 2010, DateTimeConstant.AUG, 25, 12, 0, 0);
			
			assertOffset(dateTime, TimeZone.UTC, -5);
			assertOffset(dateTime, TimeZone.AMERICA_NEW_YORK, -1);
			assertOffset(dateTime, TimeZone.AMERICA_CHICAGO, 0);
			assertOffset(dateTime, TimeZone.AMERICA_DENVER, 1);
			assertOffset(dateTime, TimeZone.AMERICA_PHOENIX, 2);
			assertOffset(dateTime, TimeZone.AMERICA_LOS_ANGELES, 2);
			assertOffset(dateTime, TimeZone.AMERICA_ANCHORAGE, 3);
			assertOffset(dateTime, TimeZone.PACIFIC_HONOLULU, 5);
		}
		
		[Test]
		public function testMst():void {
			
			var dateTime:DateTime = new DateTime(TimeZone.AMERICA_DENVER, 2010, DateTimeConstant.DEC, 25, 12, 0, 0);
			
			assertOffset(dateTime, TimeZone.UTC, -7);
			assertOffset(dateTime, TimeZone.AMERICA_NEW_YORK, -2);
			assertOffset(dateTime, TimeZone.AMERICA_CHICAGO, -1);
			assertOffset(dateTime, TimeZone.AMERICA_DENVER, 0);
			assertOffset(dateTime, TimeZone.AMERICA_PHOENIX, 0);
			assertOffset(dateTime, TimeZone.AMERICA_LOS_ANGELES, 1);
			assertOffset(dateTime, TimeZone.AMERICA_ANCHORAGE, 2);
			assertOffset(dateTime, TimeZone.PACIFIC_HONOLULU, 3);
		} 
		
		[Test]
		public function testMstDst():void {
			
			var dateTime:DateTime = new DateTime(TimeZone.AMERICA_DENVER, 2010, DateTimeConstant.AUG, 25, 12, 0, 0);
			
			assertOffset(dateTime, TimeZone.UTC, -6);
			assertOffset(dateTime, TimeZone.AMERICA_NEW_YORK, -2);
			assertOffset(dateTime, TimeZone.AMERICA_CHICAGO, -1);
			assertOffset(dateTime, TimeZone.AMERICA_DENVER, 0);
			assertOffset(dateTime, TimeZone.AMERICA_PHOENIX, 1);
			assertOffset(dateTime, TimeZone.AMERICA_LOS_ANGELES, 1);
			assertOffset(dateTime, TimeZone.AMERICA_ANCHORAGE, 2);
			assertOffset(dateTime, TimeZone.PACIFIC_HONOLULU, 4);
		}
		
		[Test]
		public function testPst():void {
			
			var dateTime:DateTime = new DateTime(TimeZone.AMERICA_LOS_ANGELES, 2010, DateTimeConstant.DEC, 25, 12, 0, 0);
			
			assertOffset(dateTime, TimeZone.UTC, -8);
			assertOffset(dateTime, TimeZone.AMERICA_NEW_YORK, -3);
			assertOffset(dateTime, TimeZone.AMERICA_CHICAGO, -2);
			assertOffset(dateTime, TimeZone.AMERICA_DENVER, -1);
			assertOffset(dateTime, TimeZone.AMERICA_PHOENIX, -1);
			assertOffset(dateTime, TimeZone.AMERICA_LOS_ANGELES, 0);
			assertOffset(dateTime, TimeZone.AMERICA_ANCHORAGE, 1);
			assertOffset(dateTime, TimeZone.PACIFIC_HONOLULU, 2);
		} 
		
		[Test]
		public function testPstDst():void {
			
			var dateTime:DateTime = new DateTime(TimeZone.AMERICA_LOS_ANGELES, 2010, DateTimeConstant.AUG, 25, 12, 0, 0);
			
			assertOffset(dateTime, TimeZone.UTC, -7);
			assertOffset(dateTime, TimeZone.AMERICA_NEW_YORK, -3);
			assertOffset(dateTime, TimeZone.AMERICA_CHICAGO, -2);
			assertOffset(dateTime, TimeZone.AMERICA_DENVER, -1);
			assertOffset(dateTime, TimeZone.AMERICA_PHOENIX, 0);
			assertOffset(dateTime, TimeZone.AMERICA_LOS_ANGELES, 0);
			assertOffset(dateTime, TimeZone.AMERICA_ANCHORAGE, 1);
			assertOffset(dateTime, TimeZone.PACIFIC_HONOLULU, 3);
		}
		
		[Test]
		public function testAkst():void {
			
			var dateTime:DateTime = new DateTime(TimeZone.AMERICA_ANCHORAGE, 2010, DateTimeConstant.DEC, 25, 12, 0, 0);
			
			assertOffset(dateTime, TimeZone.UTC, -9);
			assertOffset(dateTime, TimeZone.AMERICA_NEW_YORK, -4);
			assertOffset(dateTime, TimeZone.AMERICA_CHICAGO, -3);
			assertOffset(dateTime, TimeZone.AMERICA_DENVER, -2);
			assertOffset(dateTime, TimeZone.AMERICA_PHOENIX, -2);
			assertOffset(dateTime, TimeZone.AMERICA_LOS_ANGELES, -1);
			assertOffset(dateTime, TimeZone.AMERICA_ANCHORAGE, 0);
			assertOffset(dateTime, TimeZone.PACIFIC_HONOLULU, 1);
		} 
		
		[Test]
		public function testAkstDst():void {
			
			var dateTime:DateTime = new DateTime(TimeZone.AMERICA_ANCHORAGE, 2010, DateTimeConstant.AUG, 25, 12, 0, 0);
			
			assertOffset(dateTime, TimeZone.UTC, -8);
			assertOffset(dateTime, TimeZone.AMERICA_NEW_YORK, -4);
			assertOffset(dateTime, TimeZone.AMERICA_CHICAGO, -3);
			assertOffset(dateTime, TimeZone.AMERICA_DENVER, -2);
			assertOffset(dateTime, TimeZone.AMERICA_PHOENIX, -1);
			assertOffset(dateTime, TimeZone.AMERICA_LOS_ANGELES, -1);
			assertOffset(dateTime, TimeZone.AMERICA_ANCHORAGE, 0);
			assertOffset(dateTime, TimeZone.PACIFIC_HONOLULU, 2);
		}
		
		[Test]
		public function testHst():void {
			
			var dateTime:DateTime = new DateTime(TimeZone.PACIFIC_HONOLULU, 2010, DateTimeConstant.DEC, 25, 12, 0, 0);
			
			assertOffset(dateTime, TimeZone.UTC, -10);
			assertOffset(dateTime, TimeZone.AMERICA_NEW_YORK, -5);
			assertOffset(dateTime, TimeZone.AMERICA_CHICAGO, -4);
			assertOffset(dateTime, TimeZone.AMERICA_DENVER, -3);
			assertOffset(dateTime, TimeZone.AMERICA_PHOENIX, -3);
			assertOffset(dateTime, TimeZone.AMERICA_LOS_ANGELES, -2);
			assertOffset(dateTime, TimeZone.AMERICA_ANCHORAGE, -1);
			assertOffset(dateTime, TimeZone.PACIFIC_HONOLULU, 0);
		} 
		
		[Test]
		public function testHstDst():void {
			
			var dateTime:DateTime = new DateTime(TimeZone.PACIFIC_HONOLULU, 2010, DateTimeConstant.AUG, 25, 12, 0, 0);
			
			assertOffset(dateTime, TimeZone.UTC, -10);
			assertOffset(dateTime, TimeZone.AMERICA_NEW_YORK, -6);
			assertOffset(dateTime, TimeZone.AMERICA_CHICAGO, -5);
			assertOffset(dateTime, TimeZone.AMERICA_DENVER, -4);
			assertOffset(dateTime, TimeZone.AMERICA_PHOENIX, -3);
			assertOffset(dateTime, TimeZone.AMERICA_LOS_ANGELES, -3);
			assertOffset(dateTime, TimeZone.AMERICA_ANCHORAGE, -2);
			assertOffset(dateTime, TimeZone.PACIFIC_HONOLULU, 0);
		}
		
		private function assertOffset(
			dateTime:DateTime, 
			timeZone:TimeZone, 
			hourOffset:int):void {
			
			var convertedDateTime:DateTime = dateTime.changeTimeZone(timeZone);
			
			assertEquals(timeZone.id + " year", dateTime.year, convertedDateTime.year);
			assertEquals(timeZone.id + " month", dateTime.month, convertedDateTime.month);
			assertEquals(timeZone.id + " day", dateTime.day, convertedDateTime.day);
			assertEquals(timeZone.id + " hour", dateTime.hour - hourOffset, convertedDateTime.hour);
			assertEquals(timeZone.id + " minute", dateTime.minute, convertedDateTime.minute);
			assertEquals(timeZone.id + " second", dateTime.second, convertedDateTime.second);
		}
	}
}