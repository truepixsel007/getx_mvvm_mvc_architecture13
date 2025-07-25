

import 'package:get/get.dart';
import 'package:getx_mvvm_mvc_architecture13/res/routes/routes_name.dart';

import '../../view/home/home_view.dart';
import '../../view/login/login_view.dart';
import '../../view/splash_screen.dart';

class AppRoutes {

  static appRoutes  () => [

    GetPage(name : RouteName.splashScreen ,page : () => SplashScreen(),
        transitionDuration: Duration(milliseconds: 250),
        transition: Transition.leftToRightWithFade,
    ),

    GetPage(name : RouteName.loginView ,page : () => LoginView(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),

    GetPage(name : RouteName.homeView ,page : () => HomeView(),
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade,
    ),

  ];

}

