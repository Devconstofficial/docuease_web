import 'package:docuease_admin/screens/application_screen/controller/application_controller.dart';
import 'package:docuease_admin/screens/chat_screen/controller/chat_controller.dart';
import 'package:docuease_admin/screens/clients/controller/clients_controller.dart';
import 'package:docuease_admin/screens/dashboard_screen/controller/dashboard_controller.dart';
import 'package:docuease_admin/screens/payment_screen/controller/payment_controller.dart';
import 'package:get/get.dart';
import '../screens/auth/controller/auth_controller.dart';
import '../screens/document_screen/controller/document_controller.dart';
import '../screens/meetings_screen/controller/meetings_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => PaymentController());
    Get.lazyPut(() => ChatController());
    Get.lazyPut(() => MeetingsController());
    Get.lazyPut(() => ApplicationController());
    Get.lazyPut(() => ClientsController());
    Get.lazyPut(() => DocumentController());
  }
}
