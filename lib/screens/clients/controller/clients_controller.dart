import 'package:get/get.dart';

class ClientsController extends GetxController {
  var clients = [
    {
      'name': "M. Gonzalez",
      'organization': "What a beautiful day",
      'email': "mary@email.com",
      'claims': "3",
      "status": "Active",
    },
    {
      'name': "A. Smith",
      'organization': "Creative Minds Inc.",
      'email': "asmith@email.com",
      'claims': "5",
      "status": "Active",
    },
    {
      'name': "J. Brown",
      'organization': "NextGen Solutions",
      'email': "jbrown@email.com",
      'claims': "2",
      "status": "Active",
    },
    {
      'name': "S. Johnson",
      'organization': "Bright Future Co.",
      'email': "sjohnson@email.com",
      'claims': "4",
      "status": "Active",
    },
    {
      'name': "L. Davis",
      'organization': "Visionary Group",
      'email': "ldavis@email.com",
      'claims': "6",
      "status": "Active",
    },
    {
      'name': "B. Wilson",
      'organization': "Skyline Enterprises",
      'email': "bwilson@email.com",
      'claims': "1",
      "status": "Active",
    },
    {
      'name': "K. Martinez",
      'organization': "Innovate Hub",
      'email': "kmartinez@email.com",
      'claims': "3",
      "status": "Active",
    },
    {
      'name': "R. Anderson",
      'organization': "Tech Pioneers",
      'email': "randerson@email.com",
      'claims': "7",
      "status": "Active",
    },
    {
      'name': "T. Thomas",
      'organization': "Global Reach LLC",
      'email': "tthomas@email.com",
      'claims': "2",
      "status": "Active",
    },
    {
      'name': "C. Taylor",
      'organization': "BlueWave Media",
      'email': "ctaylor@email.com",
      'claims': "4",
      "status": "Active",
    },
    {
      'name': "I. Moore",
      'organization': "Dynamic Works",
      'email': "imoore@email.com",
      'claims': "5",
      "status": "Active",
    },
    {
      'name': "Z. Jackson",
      'organization': "Golden Ideas",
      'email': "zjackson@email.com",
      'claims': "3",
      "status": "Active",
    },
    {
      'name': "P. Martin",
      'organization': "Elevate Corp.",
      'email': "pmartin@email.com",
      'claims': "6",
      "status": "Active",
    },
    {
      'name': "N. Lee",
      'organization': "Peak Performance",
      'email': "nlee@email.com",
      'claims': "1",
      "status": "Active",
    },
    {
      'name': "F. White",
      'organization': "BrightPath Agency",
      'email': "fwhite@email.com",
      'claims': "2",
      "status": "Active",
    },
    {
      'name': "G. Harris",
      'organization': "CoreVision Ltd.",
      'email': "gharris@email.com",
      'claims': "4",
      "status": "Active",
    },
    {
      'name': "V. Clark",
      'organization': "New Horizon Tech",
      'email': "vclark@email.com",
      'claims': "3",
      "status": "Active",
    },
    {
      'name': "O. Lewis",
      'organization': "Prime Dynamics",
      'email': "olewis@email.com",
      'claims': "5",
      "status": "Active",
    },
    {
      'name': "E. Hall",
      'organization': "Spark Innovation",
      'email': "ehall@email.com",
      'claims': "2",
      "status": "Active",
    },
    {
      'name': "R. Young",
      'organization': "Next Level Solutions",
      'email': "ryoung@email.com",
      'claims': "3",
      "status": "Active",
    },
  ].obs;


  var currentPage2 = 1.obs;
  final int itemsPerPage2 = 5;
  final int pagesPerGroup2 = 4;

  int get totalPages2 => (clients.length / itemsPerPage2).ceil();

  List get pagedUsers2 {
    int start = (currentPage2.value - 1) * itemsPerPage2;
    int end = start + itemsPerPage2;
    return clients.sublist(start, end > clients.length ? clients.length : end);
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