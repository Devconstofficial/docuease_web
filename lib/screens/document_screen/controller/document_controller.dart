import 'package:get/get.dart';

class DocumentController extends GetxController {

  var documents = [
    {
      'documents': "Poema_de_Luz.pdf",
      'id': "00129",
      'upload': "06/29",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "Sunset_Melody.docx",
      'id': "00130",
      'upload': "06/30",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "Dreams_of_Tomorrow.pdf",
      'id': "00131",
      'upload': "07/01",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "Whispers_in_the_Wind.txt",
      'id': "00132",
      'upload': "07/02",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "Echoes_of_Time.pdf",
      'id': "00133",
      'upload': "07/03",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "Shadows_and_Light.docx",
      'id': "00134",
      'upload': "07/04",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "Songs_of_Silence.pdf",
      'id': "00135",
      'upload': "07/05",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "Golden_Pages.docx",
      'id': "00136",
      'upload': "07/06",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "River_of_Words.pdf",
      'id': "00137",
      'upload': "07/07",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "Fragments_of_Dreams.docx",
      'id': "00138",
      'upload': "07/08",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "Voices_Unheard.pdf",
      'id': "00139",
      'upload': "07/09",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "Silent_Stories.docx",
      'id': "00140",
      'upload': "07/10",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "Waves_of_Thought.pdf",
      'id': "00141",
      'upload': "07/11",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "Infinite_Lines.docx",
      'id': "00142",
      'upload': "07/12",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "Boundless_Words.pdf",
      'id': "00143",
      'upload': "07/13",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "Canvas_of_Text.docx",
      'id': "00144",
      'upload': "07/14",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "Path_of_Poetry.pdf",
      'id': "00145",
      'upload': "07/15",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "Ink_and_Paper.docx",
      'id': "00146",
      'upload': "07/16",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "Letters_from_Sky.pdf",
      'id': "00147",
      'upload': "07/17",
      'type': "Literary",
      "status": "Verified",
    },
    {
      'documents': "Pages_of_Eternity.docx",
      'id': "00148",
      'upload': "07/18",
      'type': "Literary",
      "status": "Verified",
    },
  ].obs;

  var currentPage2 = 1.obs;
  final int itemsPerPage2 = 5;
  final int pagesPerGroup2 = 4;

  int get totalPages2 => (documents.length / itemsPerPage2).ceil();

  List get pagedUsers2 {
    int start = (currentPage2.value - 1) * itemsPerPage2;
    int end = start + itemsPerPage2;
    return documents.sublist(start, end > documents.length ? documents.length : end);
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