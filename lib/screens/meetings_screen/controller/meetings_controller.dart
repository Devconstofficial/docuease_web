import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MeetingsController extends GetxController {
  var meetings = <Map<String, dynamic>>[].obs;
  Rx<DateTime> startDate = DateTime.now().obs;

  DateTime get endDate => startDate.value.add(const Duration(days: 6));

  @override
  void onInit() {
    super.onInit();
    _loadMeetings();
  }

  void _loadMeetings() {
    meetings.clear();
    for (int i = 0; i < 30; i++) {
      final date = DateTime.now().subtract(Duration(days: 10)).add(Duration(days: i));
      meetings.add({
        "name": "Meeting ${i + 1}",
        "time": "${9 + (i % 8)}:00 AM",
        "date": date,
        "desc": "Description for Meeting ${i + 1}.",
      });
    }
  }

  List<Map<String, dynamic>> get filteredMeetings {
    return meetings.where((meeting) {
      final DateTime meetingDate = meeting["date"];
      return meetingDate.isAfter(startDate.value.subtract(const Duration(days: 1))) &&
          meetingDate.isBefore(endDate.add(const Duration(days: 1)));
    }).toList();
  }

  void goToPreviousWeek() {
    startDate.value = startDate.value.subtract(const Duration(days: 7));
  }

  void goToNextWeek() {
    startDate.value = startDate.value.add(const Duration(days: 7));
  }

  String getFormattedDateRange() {
    final formatter = DateFormat("MMM d");
    final start = formatter.format(startDate.value);
    final end = formatter.format(endDate);
    return "$start – $end, ${endDate.year}";
  }
}
