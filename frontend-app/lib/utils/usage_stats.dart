import 'package:usage_stats/usage_stats.dart';

class UsageStatistics {
  static Future<void> getMostActiveHours() async {
    DateTime now = DateTime.now();

    // Get the usage stats for the past 24 hours
    List<UsageInfo> usageStats =
        await UsageStats.queryUsageStats(now.subtract(Duration(days: 1)), now);

    // Create a map to store the start and end hours of the two-hour windows
    Map<String, List<int>> twoHourWindows = {};

    // Iterate over the usage stats
    for (int i = 0; i < usageStats.length; i++) {
      // Get the current usage info
      UsageInfo usageInfo = usageStats[i];

      // Get the timestamp of the current usage
      DateTime timestamp = DateTime.fromMillisecondsSinceEpoch(
          int.parse(usageInfo.firstTimeStamp!));

      // Get the hour of the current usage
      int hour = timestamp.hour;

      // Create a key for the two-hour window using the combination of hour and hour + 1
      String windowKey = "${hour}-${hour + 1}";

      // If this is the first usage in the two-hour window, create a new list
      if (!twoHourWindows.containsKey(windowKey)) {
        twoHourWindows[windowKey] = [];
      }

      // Add the current hour to the list
      twoHourWindows[windowKey]!.add(hour);
    }

    // Iterate over the two-hour windows
    for (String windowKey in twoHourWindows.keys) {
      // Get the start and end hours of the window from the windowKey
      List<int> hours = windowKey.split('-').map(int.parse).toList();
      int startHour = hours[0];
      int endHour = hours[1];

      // Print the two-hour window
      print("${startHour}-${endHour}");
    }
  }

  static getUsage() async {
    DateTime endDate = new DateTime.now();
    DateTime startDate =
        DateTime(endDate.year, endDate.month, endDate.day, 0, 0, 0);

    // grant usage permission - opens Usage Settings
    UsageStats.grantUsagePermission();

    // check if permission is granted
    bool? isPermission = await UsageStats.checkUsagePermission();

    // query events
    List<EventUsageInfo> events =
        await UsageStats.queryEvents(startDate, endDate);
    print("events");

    // query usage stats
    List<UsageInfo> usageStats =
        await UsageStats.queryUsageStats(startDate, endDate);
    print(usageStats);

    // query eventStats API Level two8
    List<EventInfo> eventStats =
        await UsageStats.queryEventStats(startDate, endDate);
    print(eventStats);

    // query configurations
    List<ConfigurationInfo> configurations =
        await UsageStats.queryConfiguration(startDate, endDate);
    print(configurations);

    // query aggregated usage statistics
    Map<String, UsageInfo> queryAndAggregateUsageStats =
        await UsageStats.queryAndAggregateUsageStats(startDate, endDate);
    print(queryAndAggregateUsageStats);

    // query network usage statistics
    List<NetworkInfo> networkInfos = await UsageStats.queryNetworkUsageStats(
        startDate, endDate,
        networkType: NetworkType.all);
    print(networkInfos);
  }
}
