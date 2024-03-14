import 'package:get/get.dart';
import 'package:wiwikost/config/routes/app_routes.dart';
import 'package:wiwikost/modules/dashboard/view/ui/dashboard_view.dart';
import 'package:wiwikost/modules/dashboard/view/ui/home_view.dart';
import 'package:wiwikost/modules/login/view/ui/login_view.dart';
import 'package:wiwikost/modules/start_screen/view/startScreen.dart';

class AppPages {
  AppPages._();

  static List<GetPage> getPages() {
    return [
      GetPage(
        name: AppRoutes.startscreen,
        page: () => StartScreenView(),
      ),
      GetPage(
        name: AppRoutes.login,
        page: () => LoginView(),
      ),
      GetPage(
        name: AppRoutes.dashboard,
        page: () => DashboardView(),
      ),
      GetPage(
        name: AppRoutes.home,
        page: () => HomeView(),
      ),
    ];
  }
}
