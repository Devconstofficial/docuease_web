import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';

class DashboardController extends GetxController {
  RxString selectedOption = "".obs;
  List<String> options = ["Last 7 days", "Monthly", "Yearly"];

  var alerts = <String>[
    "5 applications pending for over 7 days",
    "3 new applications received today"
  ].obs;
  var recentActivities = <String>[
    "Maria Gonzalez submitted ‘Poema de Luz’ – Pending Review",
    "Document uploaded by Juan Diaz for app #239"
  ].obs;


  var readStatus = <bool>[false, false].obs;
  var readStatus1 = <bool>[false, false].obs;

  void markAsRead(int index) {
    readStatus[index] = true;
    readStatus.refresh();
  }

  void markAsRead1(int index) {
    readStatus1[index] = true;
    readStatus1.refresh();
  }

  void selectOption(String option) {
    selectedOption.value = option;
  }

  var selectedFrequency = 'Weekly'.obs;
  final selectedYear = ''.obs;
  final yInterval = 20;

  final weeklyData = <String, double>{
    "Approved": 40,
    "Pending": 35,
    "Action Required": 25,
  };

  final monthlyData = <String, double>{
    "Approved": 60,
    "Pending": 25,
    "Action Required": 15,
  };

  final yearlyData = <String, double>{
    "Approved": 80,
    "Pending": 10,
    "Action Required": 10,
  };

  var dataMap = <String, double>{}.obs;

  final colorMap = {
    "Approved": kGreenColor,
    "Pending": kPrimaryColor,
    "Action Required": kRedColor,
  };

  void updateDataMap() {
    switch (selectedFrequency.value) {
      case 'Monthly':
        dataMap.value = Map.from(monthlyData);
        break;
      case 'Yearly':
        dataMap.value = Map.from(yearlyData);
        break;
      default:
        dataMap.value = Map.from(weeklyData);
    }
  }

  var selectedFrequency1 = 'Monthly'.obs;
  var percentageChange = 1.3.obs;
  var isPositive = true.obs;

  var filingFee = <double>[80, 60, 75, 100, 80, 65, 60, 55, 60].obs;
  var serviceFee = <double>[70, 72, 73, 85, 72, 60, 68, 62, 70].obs;

  final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'];

  double get maxChartY {
    final allValues = [...filingFee, ...serviceFee];
    double maxValue = allValues.reduce((a, b) => a > b ? a : b);
    return (maxValue / 10).ceil() * 10;
  }

  void updateData(String frequency) {
    selectedFrequency1.value = frequency;

    if (frequency == 'Weekly') {
      filingFee.value = [50, 60, 40, 70, 55, 65, 45];
      serviceFee.value = [40, 55, 50, 60, 50, 60, 50];
      percentageChange.value = -2.5;
      isPositive.value = false;
    } else if (frequency == 'Yearly') {
      filingFee.value = [200, 180, 220, 250, 230, 210, 240, 260, 200];
      serviceFee.value = [190, 170, 200, 220, 210, 205, 215, 225, 195];
      percentageChange.value = 5.7;
      isPositive.value = true;
    } else {
      filingFee.value = [80, 60, 75, 100, 80, 65, 60, 55, 60];
      serviceFee.value = [70, 72, 73, 85, 72, 60, 68, 62, 70];
      percentageChange.value = 1.3;
      isPositive.value = true;
    }
  }



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    updateDataMap();

  }
}