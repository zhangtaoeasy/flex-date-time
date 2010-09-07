/**
 *  Copyright (c) 2010 Scott Boring
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 * 
 */
package sb.datetime
{
	import flash.utils.Dictionary;
	
	/**
	 * <p>Daylight Savings Time (DST)</p>
	 * 
	 * <p><i>This currently only supports US DST laws post 2007.</i></p>
	 * 
	 * <p>This will determine if a TimeZone at a provided date should observer DST.
	 * Most TimeZones do observer DST and in almost all cases this results in a 1 
	 * hour DST offset.</p>
	 * 
	 * <p>DST laws change periodically (US and Canada changed in 2007) and Countries
	 * (sometimes States and Counties) observe different DST laws. This makes it very 
	 * difficult to apply all current and past DST laws for even a few TimeZones.</p>
	 * 
	 * @see http://en.wikipedia.org/wiki/Daylight_saving_time
	 * 
	 * @author Scott Boring
	 */
	public class DST
	{
		/**
		 * A Set of TimeZones that do not observe DST
		 * 
		 * @private
		 */
		private static var NO_DST_SET:Dictionary = new Dictionary();
		{
			NO_DST_SET[TimeZone.UTC] = TimeZone.UTC;
			NO_DST_SET[TimeZone.AMERICA_PHOENIX] = TimeZone.AMERICA_PHOENIX;
			NO_DST_SET[TimeZone.PACIFIC_HONOLULU] = TimeZone.PACIFIC_HONOLULU;
		}
		
		private var timeZone:TimeZone;
		private var year:int;
		private var month:int;
		private var day:int;
		private var hour:int;
		private var minute:int;
		
		/**
		 * Creates a new DST for determining if Daylight Savings Time (DST) 
		 * should be observed for the provided date.
		 * 
		 * @param timeZone The TimeZone 
		 * @param year The year
		 * @param month The month (0 for January, 1 for February, and so on)
		 * @param day The day (1-31)
		 * @param hour The hour (0-23) of the day (0=midnight, 23=11pm)
		 * @param minute The minute (0-59) of the hour
		 */
		public function DST(timeZone:TimeZone, year:int, month:int, day:int, hour:int, minute:int) {
			this.timeZone = timeZone;
			this.year = year;
			this.month = month;
			this.day = day;
			this.hour = hour;
			this.minute = minute;
		}
		
		/**
		 * Determines if the TimeZone should be observing DST for the provided date.
		 * 
		 * @return True if DST should be observed by this TimeZone at the provided date.
		 */
		public function isDst():Boolean {
			
			if(null != NO_DST_SET[timeZone])
				return false;
			
			var date:Date = new Date(year, month, day, hour, minute, 0, 0);
			var dstStart:Date = dateByOccurence(year, DateTimeConstant.MAR, 2, 0, DateTimeConstant.SUNDAY, 2);
			var dstEnd:Date = dateByOccurence(year, DateTimeConstant.NOV, 2, 0, DateTimeConstant.SUNDAY, 1);
			
			return dstStart.time <= date.time && date.time < dstEnd.time;
		}
		
		/**
		 * Finds a Date by its occurence
		 * 
		 * @private
		 */
		private function dateByOccurence(year:int, month:int, hour:int, minute:int, dayOfWeek:int, occurrences:int):Date {
			
			var occurrencesFound:int = 0;
			var date:Date;
			
			if(0 < occurrences) {
				date = new Date(year, month, 1, hour, minute, 0, 0);
				
				while(occurrencesFound < occurrences) {
					
					if(date.day == dayOfWeek) {
						occurrencesFound++;
						
						if(occurrencesFound == occurrences)
							break; 
					}
					
					date.date++;
				}
			}
			else if(0 > occurrences) {
				date = new Date(year, month+1, 1, hour, minute, 0, 0);
				date.date--;
				
				while(occurrencesFound > occurrences) {
					
					if(date.day == dayOfWeek) {
						occurrencesFound--;
						
						if(occurrencesFound == occurrences)
							break; 
					}
					
					date.date--;
				}
			}
			
			return date;
		}
	}
}