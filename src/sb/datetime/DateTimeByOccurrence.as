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
	 * <p>Creates a DateTime by an occurence. This class allows you to easily find the second
	 * Sunday in a month, the last Thursday, and so on.</p>
	 * 
	 * <p>This is similar to the DateTime constructor but instead of providing a day, a dayOfWeek
	 * and its occurence is provided. For instance, to find Thanksgiving (4th Thursday in Nov) 
	 * for the year 2010 PST, you would do the following:</p>
	 * 
	 * <listing>
	 * // Thanksgiving 2010 at 12:00:00 p.m. pst
	 * var dateTime:DateTime = new DateTimeByOccurrence(UsTimeZone.PST,               // TimeZone
	 *                                                  2010,                         // year
	 *                                                  DateTimeConstant.NOV,         // month
	 *                                                  12,                           // hour
	 *                                                  0,                            // minute
	 *                                                  0,                            // second
	 *                                                  DateTimeConstant.THURSDAY,    // dayOfWeek
	 *                                                  4);                           // occurrences
	 * </listing>
	 * 
	 * @author Scott Boring
	 */
	public class DateTimeByOccurrence extends DateTime {
		
		/**
		 * Creates a DateTime by an occurrence
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
		 * @throws DateTimeOccurrenceError The occurence must not be 0 and must fall within the provided month.
		 */
		public function DateTimeByOccurrence(timeZone:TimeZone, year:int, month:int, hour:int, minute:int, second:int, dayOfWeek:int, occurrences:int) {
			
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
				super(timeZone, date.fullYear, date.month, date.date, date.hours, date.minutes, date.seconds);
			else if(0 == occurrences)
				throw new DateTimeOccurrenceError(DateTimeOccurrenceError.ZERO_OCCURRENCE_MESSAGE, DateTimeOccurrenceError.ZERO_OCCURRENCE_ID);
			else
				throw new DateTimeOccurrenceError(occurrences + " " + DateTimeOccurrenceError.OCCURRENCE_NOT_IN_MONTH_MESSAGE, DateTimeOccurrenceError.OCCURRENCE_NOT_IN_MONTH_ID);
		}
	}
}