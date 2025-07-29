import 'package:get/get.dart';

class PaymentController extends GetxController {
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

  var transactions = [
    {
      'id': "INV-3421",
      'applicant': "M. Gonzalez",
      'feeType': "Filing",
      'amount': "65",
      "paid": "Yes",
      "isChecked": false,
    },
    {
      'id': "INV-3422",
      'applicant': "A. Smith",
      'feeType': "Registration",
      'amount': "120",
      "paid": "No",
      "isChecked": false,
    },
    {
      'id': "INV-3423",
      'applicant': "J. Brown",
      'feeType': "Renewal",
      'amount': "80",
      "paid": "Yes",
      "isChecked": false,
    },
    {
      'id': "INV-3424",
      'applicant': "S. Johnson",
      'feeType': "Filing",
      'amount': "50",
      "paid": "No",
      "isChecked": false,
    },
    {
      'id': "INV-3425",
      'applicant': "L. Davis",
      'feeType': "Registration",
      'amount': "100",
      "paid": "Yes",
      "isChecked": false,
    },
    {
      'id': "INV-3426",
      'applicant': "B. Wilson",
      'feeType': "Renewal",
      'amount': "70",
      "paid": "No",
      "isChecked": false,
    },
    {
      'id': "INV-3427",
      'applicant': "K. Martinez",
      'feeType': "Filing",
      'amount': "60",
      "paid": "Yes",
      "isChecked": false,
    },
    {
      'id': "INV-3428",
      'applicant': "R. Anderson",
      'feeType': "Registration",
      'amount': "110",
      "paid": "Yes",
      "isChecked": false,
    },
    {
      'id': "INV-3429",
      'applicant': "T. Thomas",
      'feeType': "Renewal",
      'amount': "75",
      "paid": "No",
      "isChecked": false,
    },
    {
      'id': "INV-3430",
      'applicant': "C. Taylor",
      'feeType': "Filing",
      'amount': "55",
      "paid": "Yes",
      "isChecked": false,
    },
    {
      'id': "INV-3431",
      'applicant': "I. Moore",
      'feeType': "Registration",
      'amount': "130",
      "paid": "No",
      "isChecked": false,
    },
    {
      'id': "INV-3432",
      'applicant': "Z. Jackson",
      'feeType': "Renewal",
      'amount': "85",
      "paid": "Yes",
      "isChecked": false,
    },
    {
      'id': "INV-3433",
      'applicant': "P. Martin",
      'feeType': "Filing",
      'amount': "60",
      "paid": "Yes",
      "isChecked": false,
    },
    {
      'id': "INV-3434",
      'applicant': "N. Lee",
      'feeType': "Registration",
      'amount': "95",
      "paid": "No",
      "isChecked": false,
    },
    {
      'id': "INV-3435",
      'applicant': "F. White",
      'feeType': "Renewal",
      'amount': "78",
      "paid": "Yes",
      "isChecked": false,
    },
    {
      'id': "INV-3436",
      'applicant': "G. Harris",
      'feeType': "Filing",
      'amount': "62",
      "paid": "No",
      "isChecked": false,
    },
    {
      'id': "INV-3437",
      'applicant': "V. Clark",
      'feeType': "Registration",
      'amount': "115",
      "paid": "Yes",
      "isChecked": false,
    },
    {
      'id': "INV-3438",
      'applicant': "O. Lewis",
      'feeType': "Renewal",
      'amount': "82",
      "paid": "No",
      "isChecked": false,
    },
    {
      'id': "INV-3439",
      'applicant': "E. Hall",
      'feeType': "Filing",
      'amount': "58",
      "paid": "Yes",
      "isChecked": false,
    },
    {
      'id': "INV-3440",
      'applicant': "R. Young",
      'feeType': "Registration",
      'amount': "125",
      "paid": "No",
      "isChecked": false,
    },
  ].obs;


  var currentPage2 = 1.obs;
  final int itemsPerPage2 = 3;
  final int pagesPerGroup2 = 4;

  int get totalPages2 => (transactions.length / itemsPerPage2).ceil();

  List get pagedUsers2 {
    int start = (currentPage2.value - 1) * itemsPerPage2;
    int end = start + itemsPerPage2;
    return transactions.sublist(start, end > transactions.length ? transactions.length : end);
  }

  int get currentGroup2 => ((currentPage2.value - 1) / pagesPerGroup2).floor();

  List<int> get visiblePageNumbers2 {
    int startPage = currentGroup2 * pagesPerGroup2 + 1;
    int endPage = (startPage + pagesPerGroup2 - 1).clamp(1, totalPages2);
    return List.generate(endPage - startPage + 1, (index) => startPage + index);
  }

  void goToPage2(int page) {
    if (page >= 1 && page <= totalPages2) currentPage2.value = page;
  }

  void goToNextPage2() {
    if (currentPage2.value < totalPages2) {
      currentPage2.value++;
    }
  }

  void goToPreviousPage2() {
    if (currentPage2.value > 1) {
      currentPage2.value--;
    }
  }
}