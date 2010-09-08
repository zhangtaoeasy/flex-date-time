package sb
{
	import sb.datetime.DateTimeByEpochTest;
	import sb.datetime.DateTimeByOccurrenceTest;
	import sb.datetime.DateTimeByUtcDateTest;
	import sb.datetime.DateTimeTest;
	import sb.datetime.DstTest;

	[Suite]
	[RunWith("org.flexunit.runners.Suite")]
	public class DateTimeTestSuite
	{
		public var test1:DateTimeTest;
		public var test2:DateTimeByOccurrenceTest;
		public var test3:DateTimeByEpochTest;
		public var test4:DateTimeByUtcDateTest;
		public var test5:DstTest;
	}
}