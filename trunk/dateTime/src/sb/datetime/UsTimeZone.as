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
	 * <p>A convience class for easy access to the standard US TimeZones</p>
	 * 
	 * <p>Although it is technically incorrect to reference TimeZones by
	 * abbreviations, they are commonly well known by them. Users most
	 * typically will not understand or care about the Technically correct
	 * TimeZone IDs.</p>
	 * 
	 * <p>The 7 standard TimeZones listed here by abbreviations correspond to
	 * to TimeZones in the TimeZone enumeration.</p>
	 * 
	 * <ul>
	 * <li><b>EST</b> Eastern Standard Time = TimeZone.AMERICA_NEW_YORK</li>
	 * <li><b>CST</b> Central Standard Time = TimeZone.AMERICA_CHICAGO</li>
	 * <li><b>MST</b> Mountain Standard Time = TimeZone.AMERICA_DENVER</li>
	 * <li><b>ARIZONA</b> Arizona Time = TimeZone.AMERICA_PHOENIX</li>
	 * <li><b>PST</b> Pacific Standard Time = TimeZone.AMERICA_LOS_ANGELES</li>
	 * <li><b>AKST</b> Alaskan Standard Time = TimeZone.AMERICA_ANCHORAGE</li>
	 * <li><b>HST</b> Hawaiian Standard Time = TimeZone.PACIFIC_HONOLULU</li>
	 * </ul>
	 *
	 * @see TimeZone
	 * 
	 * @see http://en.wikipedia.org/wiki/Time_in_the_United_States#Tz_database
	 *  
	 * @author Scott Boring
	 *
	 */
	public class UsTimeZone
	{
		/**
		 * Eastern Standard Time
		 * 
		 * <ul>
		 * <li>id = America/New_York</li>
		 * <li>countryCode = US</li>
		 * </ul>
		 * 
		 * @see TimeZone#AMERICA_NEW_YORK
		 */
		public static const EST:TimeZone = TimeZone.AMERICA_NEW_YORK;
		
		/**
		 * Central Standard Time
		 * 
		 * <ul>
		 * <li>id = America/Chicago</li>
		 * <li>countryCode = US</li>
		 * </ul>
		 * 
		 * @see TimeZone#AMERICA_CHICAGO
		 */
		public static const CST:TimeZone = TimeZone.AMERICA_CHICAGO;
		
		/**
		 * Mountain Standard Time
		 * 
		 * <ul>
		 * <li>id = America/Denver</li>
		 * <li>countryCode = US</li>
		 * </ul>
		 * 
		 * @see TimeZone#AMERICA_DENVER
		 */
		public static const MST:TimeZone = TimeZone.AMERICA_DENVER;
		
		/**
		 * Arizona Time
		 * 
		 * <ul>
		 * <li>id = America/Phoenix</li>
		 * <li>countryCode = US</li>
		 * </ul>
		 * 
		 * @see TimeZone#AMERICA_PHOENIX
		 */
		public static const ARIZONA:TimeZone = TimeZone.AMERICA_PHOENIX;
		
		/**
		 * Pacific Standard Time
		 * 
		 * <ul>
		 * <li>id = America/Los_Angeles</li>
		 * <li>countryCode = US</li>
		 * </ul>
		 * 
		 * @see TimeZone#AMERICA_LOS_ANGELES
		 */
		public static const PST:TimeZone = TimeZone.AMERICA_LOS_ANGELES;
		
		/**
		 * Alaskan Standard Time
		 * 
		 * <ul>
		 * <li>id = America/Anchorage</li>
		 * <li>countryCode = US</li>
		 * </ul>
		 * 
		 * @see TimeZone#AMERICA_ANCHORAGE
		 */
		public static const AKST:TimeZone = TimeZone.AMERICA_ANCHORAGE;
		
		/**
		 * Hawaiian Standard Time
		 * 
		 * <ul>
		 * <li>id = Pacific/Honolulu</li>
		 * <li>countryCode = US</li>
		 * </ul>
		 * 
		 * @see TimeZone#PACIFIC_HONOLULU
		 */
		public static const HST:TimeZone = TimeZone.PACIFIC_HONOLULU;
	
		/**
		 * Returns the standard US Time Zones as a Vector
		 * 
		 * @return A vector of the 7 standard US TimeZones
		 */
		public static function get ALL_AS_VECTOR():Vector.<TimeZone> {
			
			var vector:Vector.<TimeZone> = new Vector.<TimeZone>();
			vector.push(EST);
			vector.push(CST);
			vector.push(MST);
			vector.push(ARIZONA);
			vector.push(PST);
			vector.push(AKST);
			vector.push(HST);
			
			return vector;
		}
        
        /**
         * Returns the standard US Time Zones as an Array
         * 
         * @return An array of the 7 standard US TimeZones
         */
        public static function get ALL_AS_ARRAY():Array {
            
            var array:Array = new Array();
            array.push(EST);
            array.push(CST);
            array.push(MST);
            array.push(ARIZONA);
            array.push(PST);
            array.push(AKST);
            array.push(HST);
            
            return array;
        }
	}
}