package sb.datetime
{
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;
	import org.flexunit.asserts.fail;

	public class DateTimeTest 
	{		
        [Test]
        public function testNow():void {
            
            var now:Date = new Date();
            var nowDateTime:DateTime = DateTime.now(TimeZone.UTC);
            
            assertEquals(" year", now.fullYear, nowDateTime.year);
            assertEquals(" month", now.month, nowDateTime.month);
            assertEquals(" day", now.date, nowDateTime.day);
            assertEquals(" hour", now.hours, nowDateTime.hour);
            assertEquals(" minute", now.minutes, nowDateTime.minute);
            assertEquals(" second", now.seconds, nowDateTime.second);
        }
        
        
		[Test]
		public function testTime():void {
			
			var utcDateTime:DateTime = DateTime.byValues(TimeZone.UTC, 2010, DateTimeConstant.SEP, 6, 0, 0, 0);
			var estDateTime:DateTime = DateTime.byValues(UsTimeZone.EST, 2010, DateTimeConstant.SEP, 6, 0, 0, 0);
			var cstDateTime:DateTime = DateTime.byValues(UsTimeZone.CST, 2010, DateTimeConstant.SEP, 6, 0, 0, 0);
			var mstDateTime:DateTime = DateTime.byValues(UsTimeZone.MST, 2010, DateTimeConstant.SEP, 6, 0, 0, 0);
			var arizonaDateTime:DateTime = DateTime.byValues(UsTimeZone.ARIZONA, 2010, DateTimeConstant.SEP, 6, 0, 0, 0);
			var pstDateTime:DateTime = DateTime.byValues(UsTimeZone.PST, 2010, DateTimeConstant.SEP, 6, 0, 0, 0);
			
			assertEquals("UTC", utcDateTime.time, 1283731200000);
			assertEquals("EST", estDateTime.time, 1283731200000 - DateTimeConstant.UTC_MINUS_4);
			assertEquals("CST", cstDateTime.time, 1283731200000 - DateTimeConstant.UTC_MINUS_5);
			assertEquals("MST", mstDateTime.time, 1283731200000 - DateTimeConstant.UTC_MINUS_6);
			assertEquals("MST_NO_DST", arizonaDateTime.time, 1283731200000 - DateTimeConstant.UTC_MINUS_7);
			assertEquals("PST", pstDateTime.time, 1283731200000 - DateTimeConstant.UTC_MINUS_7);
		}
		
		[Test]
		public function testDstStart():void {
			
			var dateTime:DateTime = DateTime.byValues(TimeZone.AMERICA_NEW_YORK, 2010, DateTimeConstant.MAR, 14, 2, 0, 0);
			
			assertTrue(dateTime.dst);
			assertFalse(dateTime.addMinute(-1).dst);
			assertTrue(dateTime.addMinute(1).dst);
			
			dateTime = DateTime.byValues(TimeZone.AMERICA_PHOENIX, 2010, DateTimeConstant.MAR, 14, 2, 0, 0);
			
			assertFalse(dateTime.dst);
			assertFalse(dateTime.addMinute(-1).dst);
			assertFalse(dateTime.addMinute(1).dst);
		}
		
		public function testDstEnd():void {
			
			var dateTime:DateTime = DateTime.byValues(TimeZone.AMERICA_NEW_YORK, 2010, DateTimeConstant.NOV, 7, 2, 0, 0);
			
			assertFalse(dateTime.dst);
			assertTrue(dateTime.addMinute(-1).dst);
			assertFalse(dateTime.addMinute(1).dst);
			
			dateTime = DateTime.byValues(TimeZone.AMERICA_PHOENIX, 2010, DateTimeConstant.MAR, 14, 2, 0, 0);
			
			assertFalse(dateTime.dst);
			assertFalse(dateTime.addMinute(-1).dst);
			assertFalse(dateTime.addMinute(1).dst);
		}
		
		[Test]
		public function testEst():void {
			
			var dateTime:DateTime = DateTime.byValues(TimeZone.AMERICA_NEW_YORK, 2010, DateTimeConstant.DEC, 25, 12, 1, 1);
			
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
			
			var dateTime:DateTime = DateTime.byValues(TimeZone.AMERICA_NEW_YORK, 2010, DateTimeConstant.AUG, 25, 12, 1, 1);
			
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
			
			var dateTime:DateTime = DateTime.byValues(TimeZone.AMERICA_CHICAGO, 2010, DateTimeConstant.DEC, 25, 12, 1, 1);
			
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
			
			var dateTime:DateTime = DateTime.byValues(TimeZone.AMERICA_CHICAGO, 2010, DateTimeConstant.AUG, 25, 12, 1, 1);
			
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
			
			var dateTime:DateTime = DateTime.byValues(TimeZone.AMERICA_DENVER, 2010, DateTimeConstant.DEC, 25, 12, 1, 1);
			
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
			
			var dateTime:DateTime = DateTime.byValues(TimeZone.AMERICA_DENVER, 2010, DateTimeConstant.AUG, 25, 12, 1, 1);
			
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
			
			var dateTime:DateTime = DateTime.byValues(TimeZone.AMERICA_LOS_ANGELES, 2010, DateTimeConstant.DEC, 25, 12, 1, 1);
			
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
			
			var dateTime:DateTime = DateTime.byValues(TimeZone.AMERICA_LOS_ANGELES, 2010, DateTimeConstant.AUG, 25, 12, 1, 1);
			
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
			
			var dateTime:DateTime = DateTime.byValues(TimeZone.AMERICA_ANCHORAGE, 2010, DateTimeConstant.DEC, 25, 12, 1, 1);
			
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
			
			var dateTime:DateTime = DateTime.byValues(TimeZone.AMERICA_ANCHORAGE, 2010, DateTimeConstant.AUG, 25, 12, 1, 1);
			
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
			
			var dateTime:DateTime = DateTime.byValues(TimeZone.PACIFIC_HONOLULU, 2010, DateTimeConstant.DEC, 25, 12, 1, 1);
			
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
			
			var dateTime:DateTime = DateTime.byValues(TimeZone.PACIFIC_HONOLULU, 2010, DateTimeConstant.AUG, 25, 12, 1, 1);
			
			assertOffset(dateTime, TimeZone.UTC, -10);
			assertOffset(dateTime, TimeZone.AMERICA_NEW_YORK, -6);
			assertOffset(dateTime, TimeZone.AMERICA_CHICAGO, -5);
			assertOffset(dateTime, TimeZone.AMERICA_DENVER, -4);
			assertOffset(dateTime, TimeZone.AMERICA_PHOENIX, -3);
			assertOffset(dateTime, TimeZone.AMERICA_LOS_ANGELES, -3);
			assertOffset(dateTime, TimeZone.AMERICA_ANCHORAGE, -2);
			assertOffset(dateTime, TimeZone.PACIFIC_HONOLULU, 0);
		}
        
        [Test]
        public function testSecondsAfterChangeTimeZone():void {
            
            var dateTime:DateTime = DateTime.byValues(TimeZone.PACIFIC_HONOLULU, 2010, DateTimeConstant.AUG, 25, 12, 1, 1);
            var seconds1:int = dateTime.second;
            var seconds2:int = dateTime.changeTimeZone(TimeZone.AMERICA_LOS_ANGELES).second;
            
            assertEquals(seconds1, seconds2);
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