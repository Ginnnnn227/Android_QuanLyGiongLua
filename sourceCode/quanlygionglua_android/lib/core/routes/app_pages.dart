


part of'route.lib.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),

    GetPage(
      name: _Paths.BOTTOMNAVBAR,
      page: () => const BottomNavbarView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      binding: BottomNavbarBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      binding: HomeBinding(),
    ),
     GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      binding: LoginBinding(),
    ),
    // ---------------------giong lua----------------------------
    GetPage(
      name: _Paths.NHOMGIONG_LIST,
      page: () => const NhomGiongListScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      binding: NhomGiongBinding(),
    ),
    GetPage(
      name: _Paths.KIEUHINH_LIST,
      page: () => const KieuHinhListScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      binding: KieuHinhBinding(),
    ),
    GetPage(
      name: _Paths.GIAIDOANTRUONGTHANH_LIST,
      page: () => const GiaiDoanTruongThanhListScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      binding: GiaiDoanTruongThanhBinding(),
    ),

    //------------Gia tri do-----------------------
    GetPage(
      name: _Paths.LOAIGIATRIDO_LIST,
      page: () => const LoaiGiaTriDoListScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      binding: LoaiGiaTriDoBinding(),
    ),
  ];
}