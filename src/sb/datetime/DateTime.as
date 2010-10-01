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
	/**
	 * <p>An immutable DateTime object.</p>
	 * 
	 * <p>There a multiple ways to create a DateTime. Using the constructor on this object allows you
	 * to create a DateTime with explicit values.</p>
	 * 
	 * <p><b>Creational Subclasses</b></p>
	 * 
	 * <p><i>Action Script 3 (Flex) does not support multiple constructors. DateTime uses Creational 
	 * Subclasses to achieve multiple constructors.</i></p>
	 * 
	 * <ul>
	 *   <li><code>DateTimeByDate</code></li>
	 *   <li><code>DateTimeByEpoch</code></li>
	 *   <li><code>DateTimeByOccurrence</code></li>
	 *   <li><code>DateTimeByUtcDate</code></li>
	 * </ul>
	 * 
	 * <p>Several creational subclasses classes that follow the naming convention of DateTimeByXXX where XXX is some 
	 * other means to create a date by. For instance: a DateTime can be created by the unix epoch:</p>
	 * 
	 * <listing>
	 * // create a DateTime by unix epoch
	 * var dateTime:DateTime = new DateTimeByEpoch(TimeZone.AMERICA_LOS_ANGELES, 1283734140000);
	 * </listing>
	 * 
	 * <p><b>Changing TimeZone</b></p>
	 * 
	 * <p>The TimeZone part of DateTime is the primarary reason for creating it. The TimeZone can be changed
	 * easily by calling the changeTimeZone() method. Since DateTime is immutable, a new DateTime is created
	 * that has been converted to the desired TimeZone.</p>
	 * 
	 * <listing>
	 * // create a date in Eastern Standard Time
	 * var dateTime:DateTime = new DateTime(UsTimeZone.EST, 2010, DateTimeConstant.DEC, 25, 12, 0, 0);
	 * 
	 * // change to Pacific Standard Time (3 hour difference)
	 * dateTime = dateTime.changeTimeZone(UsTimeZone.PST);
	 * </listing>
	 * 
	 * <p><b>Date Comparison</b></p>
	 * 
	 * <p>The time property on DateTime is useful for comparing dates. It represents the number of milliseconds 
	 * since midnight January 1, 1970 (Unix epoch).</p>
	 * 
	 * <listing>
	 * // create a date to in Eastern Standard Time
	 * var estDateTime:DateTime = new DateTime(UsTimeZone.EST, 2010, DateTimeConstant.DEC, 25, 12, 0, 0);
	 * 
	 * // create a date to in Pacific Standard Time
	 * var pstDateTime:DateTime = new DateTime(UsTimeZone.PST, 2010, DateTimeConstant.DEC, 25, 12, 0, 0);
	 * 
	 * // estDateTime and pstDateTime have the same values for year, month, day, hour, minute, and second, 
	 * // but estDateTime is greater than pstDateTime because of the TimeZone
	 * if(estDateTime.time > pstDateTime.time) {
	 *     // this conditional evaluates to true
	 * }
	 * </listing>
	 * 
	 * <p><b>Date Math</b></p>
	 * 
	 * <p><i>DateTime is immuatable, the add methods return a new instance of DateTime with the added values.</i></p>
	 * 
	 * <ul>
	 *   <li><code>add(year, month, day, hour, minute, second)</code></li>
	 *   <li><code>addYear(year)</code></li>
	 *   <li><code>addMonth(month)</code></li>
	 *   <li><code>addDay(day)</code></li>
	 *   <li><code>addHour(hour)</code></li>
	 *   <li><code>addMinute(minute)</code></li>
	 *   <li><code>addSecond(second)</code></li>
	 * </ul>
	 * 
	 * <p>There are several add methods available. Since DateTime is immutable, the values on a
	 * DateTime cannot be changed; these add methods create a new DateTime object with added 
	 * values.</p>
	 * 
	 * <listing>
	 * // create a date to perform math on
	 * var dateTime:DateTime = new DateTime(UsTimeZone.PST, 2010, DateTimeConstant.SEP, 6, 0, 0, 0);
	 * 
	 * // add a day (DateTime is immutable, so you need to set the object again)
	 * dateTime = dateTime.addDay(1);
	 * 
	 * // subtract a year
	 * dateTime = dateTime.addYear(-1);
	 * 
	 * // add a month and subtract an hour at the same time
	 * dateTime = dateTime.add(0, 1, 0, -1, 0, 0);
	 * </listing>
	 * 
	 * @see DateTimeByDate
	 * @see DateTimeByEpoch
	 * @see DateTimeByOccurrence
	 * @see DateTimeByUtcDate
	 * @see TimeZone
	 * @see UsTimeZone
	 * 
	 * @author Scott Boring
	 */
	public class DateTime
	{
		private var _timeZone:TimeZone;
		private var _year:int;
		private var _month:int;
		private var _day:int;
		private var _hour:int;
		private var _minute:int;
		private var _second:int;
		private var _dst:Boolean;
		private var _offset:int;
		private var _time:Number;
		
		private var date:Date;
		private var dstCalculated:Boolean;
		private var offsetCalculated:Boolean;
		private var timeCalculated:Boolean;
		
		/**
		 * @Private
		 * 
		 * Private constructor, use static create 'by' methods
		 */
		public function DateTime(p:Private) {
			
			if(null == p)
				throw new Error("DateTime cannot be instantiated directly, use the static 'by' methods to create a new DateTime.");
		}
		
		/**
		 * The TimeZone
		 * 
		 * @return The TimeZone
		 */
		public function get timeZone():TimeZone {
			return _timeZone;
		}
		
		/**
		 * The year
		 * 
		 * @return The year
		 */
		public function get year():int {
			return _year;
		}
		
		/**
		 * The month (0 for January, 1 for February, and so on)
		 * 
		 * @see DateTimeConstant
		 * 
		 * @return The year
		 */
		public function get month():int {
			return _month;
		}
		
		/**
		 * The day of the month (1-31)
		 * 
		 * @return The year
		 */
		public function get day():int {
			return _day;
		}
		
		/**
		 * The day of the week (0 for Sunday, 1 for Monday, and so on)
		 * 
		 * @see DateTimeConstant
		 * 
		 * @return The day of the week
		 */
		public function get dayOfWeek():int {
			return date.day;
		}
		
		/**
		 * The hour of the day (0-23) (0=midnight, 23=11pm)
		 * 
		 * @return The hour of the day
		 */
		public function get hour():int {
			return _hour;
		}
		
		/**
		 * The minute (0-59) of the hour
		 * 
		 * @return the minute of the day
		 */
		public function get minute():int {
			return _minute;
		}
		
		/**
		 * The second (0-59) of the minute
		 * 
		 * @return the second of the minute
		 */
		public function get second():int {
			return _second;
		}
		
		/**
		 * The offset in milliseconds from UTC
		 * 
		 * @return the offset in milliseconds from UTC
		 */
		public function get offset():int {
			
			if(!offsetCalculated) {
				_offset = new Offset(timeZone).calc();
				
				if(dst)
					_offset += 3600000;
			}
			
			return _offset;
		}
		
		/**
		 * <p>The number of milliseconds since midnight January 1, 1970.</p>
		 * 
		 * <p><i>This is useful for date comparisons</i></p>
		 * 
		 * @return The number of milliseconds since midnight January 1, 1970.
		 */
		public function get time():Number {
			
			if(!timeCalculated) {
				var timeOffset:int = date.timezoneOffset * 60000;
				_time = date.time - offset - timeOffset;
				timeCalculated = true;
			}
			
			return _time;
		}
		
		/**
		 * True if in Day Light Savings (DST)
		 * 
		 * @return True if in Day Light Savings (DST)
		 * 
		 * @see http://en.wikipedia.org/wiki/Daylight_saving_time
		 */
		public function get dst():Boolean {
			
			if(!dstCalculated) {
				_dst = new DST(timeZone, year, month, day, hour, minute).isDst();
				dstCalculated = true;
			}
			
			return _dst;
		}
		
		/**
		 * Creates a new DateTime object by converting this DateTime 
		 * to the TimeZone passed in.
		 * 
		 * @see TimeZone
		 * @see UsTimeZone
		 * 
		 * @return The new DateTime converted to the TimeZone passed
		 */
		public function changeTimeZone(timeZone:TimeZone):DateTime {
			
			var newOffset:int = new Offset(timeZone).calc();
			var offset:int = newOffset - this.offset;
			var newDate:Date = new Date(year, month, day, hour, minute, 0, offset);
			
			if(new DST(timeZone, newDate.fullYear, newDate.month, newDate.date, newDate.hours, newDate.minutes).isDst()) 
				newDate.hours += 1; 
			
			return DateTime.byValues(timeZone, newDate.fullYear, newDate.month, newDate.date, newDate.hours, newDate.minutes, newDate.seconds);
		}
		
		/**
		 * <p>Creates a new DateTime object with all the values added.</p>
		 * 
		 * <p><i>This does not change the values on this object.</i></p>
		 * 
		 * @return The new DateTime with all the values added
		 */
		public function add(year:int, month:int, day:int, hour:int, minute:int, second:int):DateTime {
			return DateTime.byValues(timeZone, 
				this.year + year, 
				this.month + month, 
				this.day + day, 
				this.hour + hour, 
				this.minute + minute, 
				this.second + second);
		}
		
		/**
		 * <p>Creates a new DateTime object with year value added.</p>
		 * 
		 * <p><i>This does not change the values on this object.</i></p>
		 * 
		 * @return The new DateTime with year value added
		 */
		public function addYear(year:int):DateTime {
			return DateTime.byValues(timeZone, this.year + year, month, day, hour, minute, second);
		}
		
		/**
		 * <p>Creates a new DateTime object with month value added.</p>
		 * 
		 * <p><i>This does not change the values on this object.</i></p>
		 * 
		 * @return The new DateTime with month value added
		 */
		public function addMonth(month:int):DateTime {
			return DateTime.byValues(timeZone, year, this.month + month, day, hour, minute, second);
		}
		
		/**
		 * <p>Creates a new DateTime object with day value added.</p>
		 * 
		 * <p><i>This does not change the values on this object.</i></p>
		 * 
		 * @return The new DateTime with day value added
		 */
		public function addDay(day:int):DateTime {
			return DateTime.byValues(timeZone, year, month, this.day + day, hour, minute, second);
		}
		
		/**
		 * <p>Creates a new DateTime object with hour value added.</p>
		 * 
		 * <p><i>This does not change the values on this object.</i></p>
		 * 
		 * @return The new DateTime with hour value added
		 */
		public function addHour(hour:int):DateTime {
			return DateTime.byValues(timeZone, year, month, day, this.hour + hour, minute, second);
		}
		
		/**
		 * <p>Creates a new DateTime object with minute value added.</p>
		 * 
		 * <p><i>This does not change the values on this object.</i></p>
		 * 
		 * @return The new DateTime with minute value added
		 */
		public function addMinute(hour:int):DateTime {
			return DateTime.byValues(timeZone, year, month, day, hour, this.minute + minute, second);
		}
		
		/**
		 * <p>Creates a new DateTime object with second value added.</p>
		 * 
		 * <p><i>This does not change the values on this object.</i></p>
		 * 
		 * @return The new DateTime with second value added
		 */
		public function addSecond(second:int):DateTime {
			return DateTime.byValues(timeZone, year, month, day, hour, minute, this.second + second);
		}
		
		/**
		 * Creates a Date object from this DateTime. The values on the Date object will match
		 * the values on this DateTime with exception to the TimeZone which will not be used in
		 * any way to create the Date object. 
		 */
		public function toDate():Date {
			// copy date to make sure the original can't be changed
			return new Date(date);
		}
		
		/**
		 * <p>Creates a new DateTime by values</p>
		 *  
		 * <p>This also supports <i>rollover</i> values the same way that the Flex 
		 * Date object does. For instance: creating a DateTime for September 31 will actually 
		 * result in October 1 because September only has 30 days. This is also true for negative
		 * numbers.</p>
		 * 
		 * @see DateTimeByDate
		 * @see DateTimeByEpoch
		 * @see DateTimeByOccurrence
		 * @see DateTimeByUtcDate
		 * @see TimeZone
		 * @see UsTimeZone
		 * 
		 * @param timeZone The TimeZone 
		 * @param year The year
		 * @param month The month (0 for January, 1 for February, and so on)
		 * @param day The day (1-31)
		 * @param hour The hour (0-23) of the day (0=midnight, 23=11pm)
		 * @param minute The minute (0-59) of the hour
		 * @param second The second (0-59) of the minute
		 */
		public static function byValues(timeZone:TimeZone, year:int, month:int, day:int, hour:int, minute:int, second:int):DateTime {
			
			var dateTime:DateTime = new DateTime(new Private());
			
			// use date object to take advantage of rolling dates
			var date:Date = new Date(year, month, day, hour, minute, second, 0);
			
			dateTime._timeZone = timeZone;
			dateTime._year = date.fullYear;
			dateTime._month = date.month;
			dateTime._day = date.date;
			dateTime._hour = date.hours;
			dateTime._minute = date.minutes;
			dateTime._second = date.seconds;
			dateTime.date = date;
			
			return dateTime;
		}
		
		/**
		 * <p>Creates a new DateTime using the TimeZone and the values off the Date.</p>
		 * 
		 * <p>The timeZoneOffset and UTC values on the Date will <b>NOT</b> be used in 
		 * the creation of the DateTime.</p>
		 * 
		 * @param timeZone The TimeZone
		 * @param date The Date to get values from
		 * 
		 * @return A DateTime in the TimeZone provided using the values from the Date provided
		 */
		public static function byDate(timeZone:TimeZone, date:Date):DateTime {
			return DateTime.byValues(timeZone, date.fullYear, date.month, date.date, date.hours, date.minutes, date.seconds);
		}
		
		/**
		 * <p>Creates a new DateTime using UTC values off a Date. This is useful
		 * for dates that have serialized from the server using BlazeDS. The serialization
		 * process with BlazeDS automatically converts the Date to the clients computer
		 * timeZoneOffset which maybe unreliable. This will create a DateTime using the
		 * UTC offset values.</p>
		 * 
		 * @param date The Date to get UTC values to use for DateTime.
		 * 
		 * @return A DateTime in the UTC TimeZone using the UTC values from the Date provided
		 */
		public static function byUtcDate(date:Date):DateTime {
			
			return DateTime.byValues(TimeZone.UTC, date.fullYearUTC, date.monthUTC, date.dateUTC, date.hoursUTC, date.minutesUTC, date.secondsUTC);
		}
		
		/**
	 	 * <p>Creates a DateTime by the Unix epoch in milliseconds. The Unix
	 	 * epoch is the number of milliseconds since midnight January 1, 1970.</p>
		 * 
		 * @param epoch The number of milliseconds since midnight January 1, 1970.
		 * 
		 * @return A DateTime in UTC TimeZone representing the unix epoch
		 */
		public static function byEpoch(epoch:Number):DateTime {
			
			var date:Date = new Date(epoch);
			
			return DateTime.byValues(TimeZone.UTC, date.fullYearUTC, date.monthUTC, date.dateUTC, date.hoursUTC, date.minutesUTC, date.secondsUTC);
		}
		
		/**
		 * Creates a DateTime by an occurrence
		 * 
	     * <p>This is similar to the byValues method but instead of providing a day, a dayOfWeek
	     * and its occurence is provided. For instance, to find Thanksgiving (4th Thursday in Nov) 
	     * for the year 2010 PST, you would do the following:</p>
	     * 
	     * <listing>
    	 * // Thanksgiving 2010 at 12:00:00 p.m. pst
	     * var dateTime:DateTime = new DateTime.byOccurrence(UsTimeZone.PST,              // TimeZone
	     *                                                  2010,                         // year
	     *                                                  DateTimeConstant.NOV,         // month
	     *                                                  12,                           // hour
	     *                                                  0,                            // minute
	     *                                                  0,                            // second
	     *                                                  DateTimeConstant.THURSDAY,    // dayOfWeek
	     *                                                  4);                           // occurrences
	     * </listing>
	     * 
		 * @param timeZone The TimeZone
		 * @param year The year
		 * @param month The month (0 for January, 1 for February, and so on)
		 * @param hour The hour (0-23) of the day (0=midnight, 23=11pm)
		 * @param minute The minute (0-59) of the hour
		 * @param second The second (0-59) of the minute
		 * @param dayOfWeek The day of the week (0 for Sunday, 1 for Monday, and so on)
		 * @param occurence The occurence of the dayOfWeek to find (1 for first, 2 for second, -1 for last, and so on)
		 * 
		 * @return A DateTime in the TimeZone provided at the calculated occurence 
		 * 
		 * @throws DateTimeError The occurence must not be 0 and must fall within the provided month.
		 */
		public static function byOccurrence(timeZone:TimeZone, year:int, month:int, hour:int, minute:int, second:int, dayOfWeek:int, occurrences:int):DateTime {
			
			var occurencesFound:int = 0;
			var date:Date;
			
			if(0 < occurrences) {
				date = new Date(year, month, 1, hour, minute, second, 0);
				
				while(occurencesFound < occurrences) {
					
					if(date.day == dayOfWeek) {
						occurencesFound++;
						
						if(occurencesFound == occurrences)
							break; 
					}
					
					date.date++;
				}
			}
			else if(0 > occurrences) {
				date = new Date(year, month+1, 1, hour, minute, second, 0);
				date.date--;
				
				while(occurencesFound > occurrences) {
					
					if(date.day == dayOfWeek) {
						occurencesFound--;
						
						if(occurencesFound == occurrences)
							break; 
					}
					
					date.date--;
				}
			}
			
			if(0 != occurrences && month == date.month)
				return DateTime.byValues(timeZone, date.fullYear, date.month, date.date, date.hours, date.minutes, date.seconds);
			else if(0 == occurrences)
				throw new DateTimeError(DateTimeError.ZERO_OCCURRENCE_MESSAGE, DateTimeError.ZERO_OCCURRENCE_ID);
			else
				throw new DateTimeError(occurrences + " " + DateTimeError.OCCURRENCE_NOT_IN_MONTH_MESSAGE, DateTimeError.OCCURRENCE_NOT_IN_MONTH_ID);
		}
	}
}

internal class Private {}