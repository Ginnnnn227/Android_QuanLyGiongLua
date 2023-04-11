// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:qlgl_project/core/navbar/bottom_navbar/bottom_navbar.view.dart';
import 'package:qlgl_project/core/views/home/home.view.dart';
import 'package:qlgl_project/core/views/login/login.view.dart';
import 'package:qlgl_project/core/views/nhomgiong_list/nhomgiong_list.view.dart';
import 'package:qlgl_project/core/views/profile/profile.view.dart';
import 'package:qlgl_project/core/views/register/register.view.dart';

import 'views/giong_list/giong_detail.view.dart';
import 'views/giong_list/giong_list.view.dart';
import 'views/kieuhinh_list/kieuhinh_list.view.dart';
import 'views/tinhtrang/giaidoantruongthanh_list.view.dart';


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

    GetPage(name: nhomgionglist, page: ()=>NhomGiongListView()),
    GetPage(name: kieuhinhlist, page: ()=>KieuHinhListView()),

    GetPage(name: gionglist, page: ()=>GiongListView()),
    GetPage(name: giongdetail, page: ()=>GiongDetailView()),

    GetPage(name: giaidoantruongthanhlist, page: ()=>GDTTListView()),
  ];
  //---------------------------------------------
  static getLogin() => login;
  static getRegister() => register;

  static getNavbar() => BottomNavbarView();
  static getHome() => home;
  static getProfile() => profile;

  static getNhomGiongList() => NhomGiongListView();
  static getKieuHinhList() => KieuHinhListView();

  static getGiongList() => GiongListView();
  static getGiongDetail() => GiongDetailView();

  static getGDTTList() => GDTTListView();
  //----------------------------------------------
  static String login = '/login';
  static String register = '/register';

  static String bottomnavbar = '/bottomnavbar';
  static String profile = '/profile';
  static String home = '/home';
  
  static String nhomgionglist = '/nhomgionglist';
  static String kieuhinhlist = '/kieuhinhlist';

  static String gionglist = '/gionglist';
  static String giongdetail = '/giongdetail';

  static String giaidoantruongthanhlist = '/giaidoantruongthanhlist';
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