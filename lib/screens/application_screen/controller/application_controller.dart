import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ApplicationController extends GetxController {
  var searchController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  var applicants = [
    {
      'id': "00129",
      'title': "Mehaik Fatima",
      'applicant': "M. Gonzalez",
      'status': "Submitted",
      'submitted': "06/28/2025",
      "isChecked": false,
    },
    {
      'id': "00130",
      'title': "Ali Raza",
      'applicant': "A. Smith",
      'status': "Submitted",
      'submitted': "06/29/2025",
      "isChecked": false,
    },
    {
      'id': "00131",
      'title': "Sara Khan",
      'applicant': "S. Johnson",
      'status': "Submitted",
      'submitted': "06/30/2025",
      "isChecked": false,
    },
    {
      'id': "00132",
      'title': "Usman Ahmed",
      'applicant': "U. Brown",
      'status': "Submitted",
      'submitted': "07/01/2025",
      "isChecked": false,
    },
    {
      'id': "00133",
      'title': "Ayesha Noor",
      'applicant': "A. Davis",
      'status': "Submitted",
      'submitted': "07/02/2025",
      "isChecked": false,
    },
    {
      'id': "00134",
      'title': "Bilal Saeed",
      'applicant': "B. Miller",
      'status': "Submitted",
      'submitted': "07/03/2025",
      "isChecked": false,
    },
    {
      'id': "00135",
      'title': "Hina Malik",
      'applicant': "H. Wilson",
      'status': "Submitted",
      'submitted': "07/04/2025",
      "isChecked": false,
    },
    {
      'id': "00136",
      'title': "Ahmed Khan",
      'applicant': "A. Martinez",
      'status': "Submitted",
      'submitted': "07/05/2025",
      "isChecked": false,
    },
    {
      'id': "00137",
      'title': "Maryam Tariq",
      'applicant': "M. Anderson",
      'status': "Submitted",
      'submitted': "07/06/2025",
      "isChecked": false,
    },
    {
      'id': "00138",
      'title': "Hamza Iqbal",
      'applicant': "H. Thomas",
      'status': "Approved",
      'submitted': "07/07/2025",
      "isChecked": false,
    },
    {
      'id': "00139",
      'title': "Fatima Ali",
      'applicant': "F. Taylor",
      'status': "Approved",
      'submitted': "07/08/2025",
      "isChecked": false,
    },
    {
      'id': "00140",
      'title': "Imran Qureshi",
      'applicant': "I. Moore",
      'status': "Approved",
      'submitted': "07/09/2025",
      "isChecked": false,
    },
    {
      'id': "00141",
      'title': "Zara Shah",
      'applicant': "Z. Jackson",
      'status': "Approved",
      'submitted': "07/10/2025",
      "isChecked": false,
    },
    {
      'id': "00142",
      'title': "Khalid Mahmood",
      'applicant': "K. Martin",
      'status': "Approved",
      'submitted': "07/11/2025",
      "isChecked": false,
    },
    {
      'id': "00143",
      'title': "Nimra Hassan",
      'applicant': "N. Lee",
      'status': "Approved",
      'submitted': "07/12/2025",
      "isChecked": false,
    },
  ].obs;

  var currentPage2 = 1.obs;
  final int itemsPerPage2 = 5;
  final int pagesPerGroup2 = 4;

  int get totalPages2 => (applicants.length / itemsPerPage2).ceil();

  List get pagedUsers2 {
    int start = (currentPage2.value - 1) * itemsPerPage2;
    int end = start + itemsPerPage2;
    return applicants.sublist(start, end > applicants.length ? applicants.length : end);
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

  var selectedIndexes = <int>[].obs;

  RxList<String> selectedWorkTypes = <String>[].obs;

  void clearSelection() {
    selectedWorkTypes.clear();
  }
  void toggleSelection(String type) {
    if (selectedWorkTypes.contains(type)) {
      selectedWorkTypes.remove(type);
    } else {
      selectedWorkTypes.add(type);
    }
  }

  final GlobalKey menuKey = GlobalKey();
  final GlobalKey menuKey1 = GlobalKey();
  final GlobalKey applicantMenuKey = GlobalKey();

  var selectedApplicants = [].obs;
  var filteredApplicants = [].obs;

  void selectApplicant(String name) {
    selectedApplicants.value = [name];
  }

  void updateSearch(String query) {
    if (query.isEmpty) {
      filteredApplicants.clear();
    } else {
      final allNames = applicants.map((e) => e['applicant'] as String).toSet().toList();
      filteredApplicants.value = allNames
          .where((name) => name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}