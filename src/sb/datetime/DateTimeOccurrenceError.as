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
	 * <p>Error for creating an invalid DateTimeByOccurrence.</p>
	 * 
	 * <p>The DateTimeByOccurrence constructor will throw this error
	 * if the occurence value is 0 or the occurence does not fall with
	 * in the month combination.</p>
	 * 
	 * <ul>
	 * <li>The occurences value cannot be zero.</li>
	 * <li>The occurences of the dayOfWeek must fall within the month.</li>
	 * </ul>
	 * 
	 * @see DateTimeByOccurrence
	 * 
	 * @author Scott Boring
	 */
	public class DateTimeOccurrenceError extends Error
	{
		public static const ZERO_OCCURRENCE_ID:int = 10001;
		public static const OCCURRENCE_NOT_IN_MONTH_ID:int = 10002;
		
		public static const ZERO_OCCURRENCE_MESSAGE:String = "0 occurrence is not valid";
		public static const OCCURRENCE_NOT_IN_MONTH_MESSAGE:String = "Occurrence is not in month";
		
		/**
		 * Creates a new DateTimeOccurrenceError used by DateTimeByOccurrence.
		 * 
		 * @see DateTimeByOccurrence
		 * 
		 * @param message The message (ZERO_OCCURENCE_MESSAGE or OCCURENCE_NOT_IN_MONTH_MESSAGE)
		 * @param id The id (ZERO_OCCURENCE_ID or OCCURENCE_NOT_IN_MONTH_ID)
		 */
		public function DateTimeOccurrenceError(message:String, id:int)
		{
			super(message, id);
		}
	}
}