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
	 * <p>An enumeration of supported Time Zones.</p>
	 * 
	 * <p>This class cannot be not instantiated directly, use the static consts or
	 * the getById(id) method.</p>
	 * 
	 * <p>The UsTimeZone class provides easier access to the 7 standard US TimeZones
	 * that are most commonly used.</p>
	 *
	 * @see UsTimeZone
	 * 
	 * @see http://en.wikipedia.org/wiki/Time_in_the_United_States#Tz_database
	 *  
	 * @author Scott Boring
	 *
	 */
	public class TimeZone
	{
		private static var creationComplete:Boolean = false;
		
			public static const UTC:TimeZone = new TimeZone("UTC", "", null);
			
			public static const AMERICA_NEW_YORK:TimeZone = new TimeZone("America/New_York", "US", null);
			public static const AMERICA_DETROIT:TimeZone = new TimeZone("America/Detroit", "US", null);
			public static const AMERICA_KENTUCKY_LOUISVILLE:TimeZone = new TimeZone("America/Kentucky/Louisville", "US", null);
			public static const AMERICA_KENTUCKY_MONTICELLO:TimeZone = new TimeZone("America/Kentucky/Monticello", "US", null);
			public static const AMERICA_INDIANA_INDIANAPOLIS:TimeZone = new TimeZone("America/Indiana/Indianapolis", "US", null);
			public static const AMERICA_INDIANA_VINCENNES:TimeZone = new TimeZone("America/Indiana/Vincennes", "US", null);
			public static const AMERICA_INDIANA_WINAMAC:TimeZone = new TimeZone("America/Indiana/Winamac", "US", null);
			public static const AMERICA_INDIANA_MARENGO:TimeZone = new TimeZone("America/Indiana/Marengo", "US", null);
			public static const AMERICA_INDIANA_PETERSBURG:TimeZone = new TimeZone("America/Indiana/Petersburg", "US", null);
			public static const AMERICA_INDIANA_VEVAY:TimeZone = new TimeZone("America/Indiana/Vevay", "US", null);
			public static const AMERICA_CHICAGO:TimeZone = new TimeZone("America/Chicago", "US", null);
			public static const AMERICA_INDIANA_TELL_CITY:TimeZone = new TimeZone("America/Indiana/Tell_City", "US", null);
			public static const AMERICA_INDIANA_KNOX:TimeZone = new TimeZone("America/Indiana/Knox", "US", null);
			public static const AMERICA_MENOMINEE:TimeZone = new TimeZone("America/Menominee", "US", null);
			public static const AMERICA_NORTH_DAKOTA_CENTER:TimeZone = new TimeZone("America/North_Dakota/Center", "US", null);
			public static const AMERICA_NORTH_DAKOTA_NEW_SALEM:TimeZone = new TimeZone("America/North_Dakota/New_Salem", "US", null);
			public static const AMERICA_DENVER:TimeZone = new TimeZone("America/Denver", "US", null);
			public static const AMERICA_BOISE:TimeZone = new TimeZone("America/Boise", "US", null);
			public static const AMERICA_SHIPROCK:TimeZone = new TimeZone("America/Shiprock", "US", null);
			public static const AMERICA_PHOENIX:TimeZone = new TimeZone("America/Pheonix", "US", null);
			public static const AMERICA_LOS_ANGELES:TimeZone = new TimeZone("America/Los_Angeles", "US", null);
			public static const AMERICA_ANCHORAGE:TimeZone = new TimeZone("America/Anchorage", "US", null);
			public static const AMERICA_JUNEAU:TimeZone = new TimeZone("America/Juneau", "US", null);
			public static const AMERICA_YAKUTAT:TimeZone = new TimeZone("America/Yakutat", "US", null);
			public static const AMERICA_NOME:TimeZone = new TimeZone("America/Nome", "US", null);
			public static const AMERICA_ADAK:TimeZone = new TimeZone("America/Adak", "US", null);
			public static const PACIFIC_HONOLULU:TimeZone = new TimeZone("Pacific/Honolulu", "US", null);
		
		{creationComplete = true}
		
		private var _id:String;
		private var _countryCode:String;
		
		/**
		 * private constructor
		 * 
		 * @private
		 */
		public function TimeZone(id:String, countryCode:String, p:Private) {
			
			if(creationComplete && null != p)
				throw new Error("Cannot instantiate TimeZone, use static consts");
			
			_id = id;
			_countryCode = countryCode;
		}
		
		/**
		 * The TimeZone ID
		 * 
		 * @return The TimeZone ID
		 */
		public function get id():String
		{
			return _id;
		}
				
		/**
		 * The 2-digit country code for this TimeZone
		 * 
		 * @return The 2-digit country code for this TimeZone
		 */
		public function get countryCode():String 
		{
			return _countryCode;
		}
			
		/**
		 * Map of TimeZones by ID for fast lookup
		 * 
		 * @private
		 */
		private static var timeZoneMap:Dictionary = new Dictionary();
		
		/**
		 * Gets a TimeZone by its ID
		 * 
		 * @param id The ID of the TimeZone
		 * 
		 * @return The TimeZone for the ID, returns null if no match was found
		 */
		public static function getById(id:String):TimeZone {
			
			var timeZone:TimeZone = timeZoneMap[id];
			
			if(null != timeZone) 
				return timeZone;
			else {
				for each(timeZone in ALL) {
					if(timeZone.id == id) {
						timeZoneMap[id] = timeZone;
						return timeZone;
					}
				}
			}
			
			return null; 
		}
		
		/**
		 * <p>Returns All the supported TimeZones.</p>
		 * 
		 * <p><i>Except UTC which isn't really a TimeZone</i></p>
		 * 
		 * @return All the TimeZones supported
		 */
		public static function get ALL():Vector.<TimeZone> {
			
			var vector:Vector.<TimeZone> = new Vector.<TimeZone>();
			vector.push(AMERICA_NEW_YORK);
			vector.push(AMERICA_DETROIT);
			vector.push(AMERICA_KENTUCKY_LOUISVILLE);
			vector.push(AMERICA_KENTUCKY_MONTICELLO);
			vector.push(AMERICA_INDIANA_INDIANAPOLIS);
			vector.push(AMERICA_INDIANA_VINCENNES);
			vector.push(AMERICA_INDIANA_WINAMAC);
			vector.push(AMERICA_INDIANA_MARENGO);
			vector.push(AMERICA_INDIANA_PETERSBURG);
			vector.push(AMERICA_INDIANA_VEVAY);
			vector.push(AMERICA_CHICAGO);
			vector.push(AMERICA_INDIANA_TELL_CITY);
			vector.push(AMERICA_INDIANA_KNOX);
			vector.push(AMERICA_MENOMINEE);
			vector.push(AMERICA_NORTH_DAKOTA_CENTER);
			vector.push(AMERICA_NORTH_DAKOTA_NEW_SALEM);
			vector.push(AMERICA_DENVER);
			vector.push(AMERICA_BOISE);
			vector.push(AMERICA_SHIPROCK);
			vector.push(AMERICA_PHOENIX);
			vector.push(AMERICA_LOS_ANGELES);
			vector.push(AMERICA_ANCHORAGE);
			vector.push(AMERICA_JUNEAU);
			vector.push(AMERICA_YAKUTAT);
			vector.push(AMERICA_NOME);
			vector.push(AMERICA_ADAK);
			vector.push(PACIFIC_HONOLULU);
			
			return vector;
		}
	}
}

/**
 * @private
 */
internal class Private {}