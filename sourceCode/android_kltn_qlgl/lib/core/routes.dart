import 'package:get/get.dart';
import 'package:qlgl_project/core/navbar/bottom_navbar/bottom_navbar.view.dart';
import 'package:qlgl_project/core/views/home/home.view.dart';
import 'package:qlgl_project/core/views/login/login.view.dart';
import 'package:qlgl_project/core/views/nhomgiong_list/nhomgiong_list.view.dart';
import 'package:qlgl_project/core/views/profile/profile.view.dart';
import 'package:qlgl_project/core/views/register/register.view.dart';

import 'bindings/bottom_navbar.binding.dart';

// class AppRoutes {
//   static const String login = '/login';
//   static const String register = '/register';
//   static const String bottomnavbar = '/bottomnavbar';
// }
class AppPages {

  static List<GetPage> routes = [

    GetPage(name: login, page: ()=>LoginView()),
    GetPage(name: register, page: ()=>RegisterView()),

    GetPage(name: bottomnavbar,page: ()=>BottomNavbarView()),
    GetPage(name: home, page:()=>HomeView()),
    GetPage(name: profile, page: ()=>ProfileView()),

    GetPage(name: nhomgionglist, page: ()=>NhomGiongListView())
  ];
  //---------------------------------------------
  static getLogin() => login;
  static getRegister() => register;

  static getNavbar() => bottomnavbar;
  static getHome() => home;
  static getProfile() => profile;

  static getNhomGiongList() => nhomgionglist;
  //----------------------------------------------
  static String login = '/login';
  static String register = '/register';

  static String bottomnavbar = '/bottomnavbar';
  static String profile = '/profile';
  static String home = '/home';
  
  static String nhomgionglist = '/nhomgionglist';
  // static var list = [
  //   GetPage(
  //     name: AppRoutes.login,
  //     page: () => LoginView(),
  //     //binding: DashboardBinding(),
  //   ),
  //   GetPage(
  //     name: AppRoutes.register,
  //     page: () => RegisterView(),
  //   ),
  //   GetPage(
  //     name: AppRoutes.bottomnavbar,
  //     page: () => BottomNavbarView(),
  //     binding: BottomNavbarBinding(),
  //   ),
  // ];
}