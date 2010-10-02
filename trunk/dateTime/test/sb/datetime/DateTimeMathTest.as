package sb.datetime
{
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.fail;

	public class DateTimeMathTest
	{
		[Test]
		public function testAddYear():void { 
		
			var dateTime:DateTime = DateTime.byValues(TimeZone.UTC, 2010, DateTimeConstant.MAR, 1, 0, 0, 0);
			
			dateTime = dateTime.addYear(1);
			
			assertEquals(dateTime.year, 2011);
			
			dateTime = dateTime.addYear(-2);
			
			assertEquals(dateTime.year, 2009);
		}
        
        [Test]
        public function testAddMonth():void { 
            
            var dateTime:DateTime = DateTime.byValues(TimeZone.UTC, 2010, DateTimeConstant.MAR, 1, 0, 0, 0);
            
            dateTime = dateTime.addMonth(1);
            
            assertEquals(dateTime.month, DateTimeConstant.APR);
            
            dateTime = dateTime.addMonth(-2);
            
            assertEquals(dateTime.month, DateTimeConstant.FEB);
        }
        
        [Test]
        public function testAddDay():void { 
            
            var dateTime:DateTime = DateTime.byValues(TimeZone.UTC, 2010, DateTimeConstant.MAR, 1, 0, 0, 0);
            
            dateTime = dateTime.addDay(1);
            
            assertEquals(dateTime.day, 2);
            assertEquals(dateTime.month, DateTimeConstant.MAR);
            
            dateTime = dateTime.addDay(-2);
            
            assertEquals(dateTime.day, 28);
            assertEquals(dateTime.month, DateTimeConstant.FEB);
        }
        
        [Test]
        public function testAddHour():void { 
            
            var dateTime:DateTime = DateTime.byValues(TimeZone.UTC, 2010, DateTimeConstant.MAR, 1, 0, 0, 0);
            
            dateTime = dateTime.addHour(1);
            
            assertEquals(dateTime.hour, 1);
            assertEquals(dateTime.day, 1);
            
            dateTime = dateTime.addHour(-2);
            
            assertEquals(dateTime.hour, 23);
            assertEquals(dateTime.day, 28);
        }
        
        [Test]
        public function testAddMinute():void { 
            
            var dateTime:DateTime = DateTime.byValues(TimeZone.UTC, 2010, DateTimeConstant.MAR, 1, 0, 0, 0);
            
            dateTime = dateTime.addMinute(1);
            
            assertEquals(dateTime.minute, 1);
            assertEquals(dateTime.hour, 0);
            assertEquals(dateTime.day, 1);
            
            dateTime = dateTime.addMinute(-2);
            
            assertEquals(dateTime.minute, 59);
            assertEquals(dateTime.hour, 23);
            assertEquals(dateTime.day, 28);
        }
        
        [Test]
        public function testAddSecond():void { 
            
            var dateTime:DateTime = DateTime.byValues(TimeZone.UTC, 2010, DateTimeConstant.MAR, 1, 0, 0, 0);
            
            dateTime = dateTime.addSecond(1);
            
            assertEquals(dateTime.second, 1);
            assertEquals(dateTime.minute, 0);
            assertEquals(dateTime.hour, 0);
            assertEquals(dateTime.day, 1);
            
            dateTime = dateTime.addSecond(-2);
            
            assertEquals(dateTime.second, 59);
            assertEquals(dateTime.minute, 59);
            assertEquals(dateTime.hour, 23);
            assertEquals(dateTime.day, 28);
        }
        
        [Test]
        public function testAdd():void { 
            
            var dateTime:DateTime = DateTime.byValues(TimeZone.UTC, 2010, DateTimeConstant.MAR, 1, 0, 0, 0);
            
            dateTime = dateTime.add(1, 1, 1, 1, 1, 1);
            
            
            assertEquals(dateTime.second, 1);
            assertEquals(dateTime.minute, 1);
            assertEquals(dateTime.hour, 1);
            assertEquals(dateTime.day, 2);
            assertEquals(dateTime.month, DateTimeConstant.APR);
            assertEquals(dateTime.year, 2011);
        }
	}
}