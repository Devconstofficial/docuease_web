import 'package:docuease_admin/screens/dashboard_screen/dashboard_screen.dart';
import 'package:docuease_admin/utils/screen_bindings.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../screens/application_screen/application_screen.dart';
import '../screens/auth/auth_screen.dart';
import '../screens/auth/send_otp_screen.dart';
import '../screens/auth/set_new_pass.dart';
import '../screens/auth/verify_otp_screen.dart';
import '../screens/chat_screen/chat_screen.dart';
import '../screens/clients/clients_screen.dart';
import '../screens/document_screen/document_screen.dart';
import '../screens/meetings_screen/meetings_screen.dart';
import '../screens/payment_screen/payment_screen.dart';
import 'app_strings.dart';

class RouteGenerator {
  static List<GetPage> getPages() {
    return [
      GetPage(name: kAuthScreenRoute, page: () => AuthScreen(), binding: ScreenBindings(),),
      GetPage(name: kSendOtpScreenRoute, page: () => SendOtpScreen(), binding: ScreenBindings(),),
      GetPage(name: kVerifyOtpScreenRoute, page: () => VerifyOtpScreen(), binding: ScreenBindings(),),
      GetPage(name: kSetNewPassScreenRoute, page: () => SetNewPassScreen(), binding: ScreenBindings(),),
      GetPage(name: kDashboardScreenRoute, page: () => DashboardScreen(), binding: ScreenBindings(),),
      GetPage(name: kPaymentScreenRoute, page: () => PaymentScreen(), binding: ScreenBindings(),),
      GetPage(name: kChatScreenRoute, page: () => ChatScreen(), binding: ScreenBindings(),),
      GetPage(name: kMeetingScreenRoute, page: () => MeetingScreen(), binding: ScreenBindings(),),
      GetPage(name: kApplicationScreenRoute, page: () => ApplicationScreen(), binding: ScreenBindings(),),
      GetPage(name: kClientsScreenRoute, page: () => ClientsScreen(), binding: ScreenBindings(),),
      GetPage(name: kDocumentScreenRoute, page: () => DocumentScreen(), binding: ScreenBindings(),),
    ];
  }
}

