// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:qlgl_project/core/views/datainput_page/chitieungoaidong_list.view.dart';

import 'navbar/bottom_navbar/bottom_navbar.view.dart';

import 'views/datainput_page/chitieungoaidong_add.dart';
import 'views/datainput_page/chitieungoaidong_edit.dart';
import 'views/home/home.view.dart';
import 'views/auth/login/login.view.dart';
import 'views/register/register.view.dart';

import 'views/profile/profile.view.dart';

import 'views/nhomgiong_list/nhomgiong_list.view.dart';
import 'views/giong_list/giong_detail.view.dart';
import 'views/giong_list/giong_list.view.dart';
import 'views/kieuhinh_list/kieuhinh_list.view.dart';

import 'views/tinhtrang/giaidoantruongthanh_list.view.dart';
import 'views/tinhtrang/tinhtrang_detail.view.dart';
import 'views/tinhtrang/tinhtrang_list.view.dart';


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

    GetPage(name: tinhtranglist, page: ()=>TinhTrangListView()),
    GetPage(name: tinhtrangdetail, page: ()=>TinhTrangDetailView()),

    GetPage(name: chitieungoaidonglist, page: ()=>ChitieungoaidongListView()),
    GetPage(name: chitieungoaidongedit, page: ()=>ChitieungoaidongEditView()),
    GetPage(name: chitieungoaidongadd, page: ()=>ChitieungoaidongAddView()),
  ];
  //---------------------------------------------
  static getLogin() => login;
  static getRegister() => register;

  static getNavbar() => BottomNavbarView();
  static getHome() => HomeView();
  static getProfile() => ProfileView();

  static getNhomGiongList() => NhomGiongListView();
  static getKieuHinhList() => KieuHinhListView();

  static getGiongList() => GiongListView();
  static getGiongDetail() => GiongDetailView();

  static getGDTTList() => GDTTListView();

  static getTinhTrangList() => TinhTrangListView();
  static getTinhTrangDetail() => TinhTrangDetailView();

  static getChiTieuNgoaiDongList()=> ChitieungoaidongListView();
  static getChiTieuNgoaiDongEdit()=> ChitieungoaidongEditView();
  static getChiTieuNgoaiDongAdd()=> ChitieungoaidongAddView();
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

  static String tinhtranglist = '/tinhtranglist';
  static String tinhtrangdetail = '/tinhtrangdetail';

  static String chitieungoaidonglist = '/chitieungoaidonglist';
  static String chitieungoaidongedit = '/chitieungoaidongedit';
  static String chitieungoaidongadd = '/chitieungoaidongadd';
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