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
	 * @private
	 * 
	 * <p>The Offset for a TimeZone at a given year, month, day, hour, minute.</p>
	 * 
	 * <p><i>This does not include a DST offset.</i></p>
	 * 
	 * @see http://en.wikipedia.org/wiki/Time_in_the_United_States#Tz_database
	 * 
	 * @author Scott Boring
	 */
	public class Offset
	{
		private static var offsets:Dictionary = new Dictionary();
		{
			offsets[TimeZone.UTC] = DateTimeConstant.UTC;
			
			offsets[TimeZone.AMERICA_NEW_YORK] = DateTimeConstant.UTC_MINUS_5;
			offsets[TimeZone.AMERICA_DETROIT] = DateTimeConstant.UTC_MINUS_5;
			offsets[TimeZone.AMERICA_KENTUCKY_LOUISVILLE] = DateTimeConstant.UTC_MINUS_5;
			offsets[TimeZone.AMERICA_KENTUCKY_MONTICELLO] = DateTimeConstant.UTC_MINUS_5;
			offsets[TimeZone.AMERICA_INDIANA_INDIANAPOLIS] = DateTimeConstant.UTC_MINUS_5;
			offsets[TimeZone.AMERICA_INDIANA_VINCENNES] = DateTimeConstant.UTC_MINUS_5;
			offsets[TimeZone.AMERICA_INDIANA_WINAMAC] = DateTimeConstant.UTC_MINUS_5;
			offsets[TimeZone.AMERICA_INDIANA_MARENGO] = DateTimeConstant.UTC_MINUS_5;
			offsets[TimeZone.AMERICA_INDIANA_PETERSBURG] = DateTimeConstant.UTC_MINUS_5;
			offsets[TimeZone.AMERICA_INDIANA_VEVAY] = DateTimeConstant.UTC_MINUS_5;
			offsets[TimeZone.AMERICA_CHICAGO] = DateTimeConstant.UTC_MINUS_6;
			offsets[TimeZone.AMERICA_INDIANA_TELL_CITY] = DateTimeConstant.UTC_MINUS_6;
			offsets[TimeZone.AMERICA_INDIANA_KNOX] = DateTimeConstant.UTC_MINUS_6;
			offsets[TimeZone.AMERICA_MENOMINEE] = DateTimeConstant.UTC_MINUS_6;
			offsets[TimeZone.AMERICA_NORTH_DAKOTA_CENTER] = DateTimeConstant.UTC_MINUS_6;
			offsets[TimeZone.AMERICA_NORTH_DAKOTA_NEW_SALEM] = DateTimeConstant.UTC_MINUS_6;
			offsets[TimeZone.AMERICA_DENVER] = DateTimeConstant.UTC_MINUS_7;
			offsets[TimeZone.AMERICA_BOISE] = DateTimeConstant.UTC_MINUS_7;
			offsets[TimeZone.AMERICA_SHIPROCK] = DateTimeConstant.UTC_MINUS_7;
			offsets[TimeZone.AMERICA_PHOENIX] = DateTimeConstant.UTC_MINUS_7;
			offsets[TimeZone.AMERICA_LOS_ANGELES] = DateTimeConstant.UTC_MINUS_8;
			offsets[TimeZone.AMERICA_ANCHORAGE] = DateTimeConstant.UTC_MINUS_9;
			offsets[TimeZone.AMERICA_JUNEAU] = DateTimeConstant.UTC_MINUS_9;
			offsets[TimeZone.AMERICA_YAKUTAT] = DateTimeConstant.UTC_MINUS_9;
			offsets[TimeZone.AMERICA_NOME] = DateTimeConstant.UTC_MINUS_9;
			offsets[TimeZone.AMERICA_ADAK] = DateTimeConstant.UTC_MINUS_10;
			offsets[TimeZone.PACIFIC_HONOLULU] = DateTimeConstant.UTC_MINUS_10;
		}
		
		private var timeZone:TimeZone;
		
		/**
		 * Creates a new Offset that will calculate the offset for the
		 * provided TimeZone.
		 * 
		 * @param timeZone The date to calc the offset for
		 */
		public function Offset(timeZone:TimeZone) {
			this.timeZone = timeZone;
		}
		
		/**
		 * Calculates the offset.
		 * 
	     * <p><i>This does not include a DST offset.</i></p>
	     * 
		 * @return The offset from UTC in milliseconds
		 */
		public function calc():int {
			
			var offset:int = offsets[timeZone];
			return offset;
		}
	}
}