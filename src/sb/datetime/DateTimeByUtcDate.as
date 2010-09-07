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
	 * <p>This creates a DateTime from a Date using the UTC values. The UTC values on the Date will be used for
	 * year, month, day, hour, minute, and second. The TimeZone for the created DateTime will be TimeZone.UTC.</p>
	 * 
	 * @author Scott Boring
	 */
	public class DateTimeByUtcDate extends DateTime {
		
		/**
		 * Creates a new DateTime using UTC values off a Date.
		 * 
		 * @param date The Date to get UTC values to use for DateTime.
		 */
		public function DateTimeByUtcDate(date:Date) {
			
			super(TimeZone.UTC, date.fullYearUTC, date.monthUTC, date.dateUTC, date.hoursUTC, date.minutesUTC, date.secondsUTC);
		}
	}
}