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
	 * <p>Creational subclass for DateTime.</p>
	 * 
	 * <p>Creates a DateTime by the Unix epoch in milliseconds. The Unix
	 * epoch is the number of milliseconds since midnight January 1, 1970.</p>
	 * 
	 * @author Scott Boring
	 */
	public class DateTimeByEpoch extends DateTime
	{
		/**
		 * Creates a new DateTime using the unix epoch in milliseconds.
		 * 
		 * @param timeZone The TimeZone
		 * @param epoch The number of milliseconds since midnight January 1, 1970.
		 */
		public function DateTimeByEpoch(timeZone:TimeZone, epoch:Number)
		{
			var date:Date = new Date(epoch);
			var utcDateTime:DateTime = new DateTime(TimeZone.UTC, date.fullYearUTC, date.monthUTC, date.dateUTC, date.hoursUTC, date.minutesUTC, date.secondsUTC)
			var dateTime:DateTime = utcDateTime.changeTimeZone(timeZone);
				
			super(timeZone, dateTime.year, dateTime.month, dateTime.day, dateTime.hour, dateTime.minute, dateTime.second);
		}
	}
}