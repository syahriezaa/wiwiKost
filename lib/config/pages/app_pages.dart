import 'package:get/get.dart';
import 'package:wiwikost/config/routes/app_routes.dart';
import 'package:wiwikost/modules/features/dashboard/view/ui/dashboard_view.dart';
import 'package:wiwikost/modules/features/dashboard/view/ui/home_view.dart';
import 'package:wiwikost/modules/features/login/view/ui/login_view.dart';
import 'package:wiwikost/modules/features/register/view/ui/register_view.dart';
import 'package:wiwikost/modules/features/start_screen/view/startScreen.dart';

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
      //register
      GetPage(name: AppRoutes.register, page: () => RegisterView()),
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
