
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
    GetPage(
      name: _Paths.DATAINPUT,
      page: () => const DataInputScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      binding: Binding(),
    ),
    // ---------------------giong lua----------------------------
    GetPage(
      name: _Paths.GIONG_LIST,
      page: () => const GiongListView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      binding: GiongBinding(),
    ),
    GetPage(
      name: _Paths.GIONG_DETAIL,
      page: () => const GiongDetailView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      binding: GiongBinding(),
    ),
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

    //------------LOAI Gia tri do-----------------------
    GetPage(
      name: _Paths.LOAIGIATRIDO_LIST,
      page: () => const LoaiGiaTriDoListScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      binding: LoaiGiaTriDoBinding(),
    ),
    //------------LOAI sau benh-----------------------
    GetPage(
      name: _Paths.LOAISAUBENH_LIST,
      page: () => const LoaiSauBenhListScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      binding: LoaiSauBenhBinding(),
    ),
    GetPage(
      name: _Paths.LOAISAUBENH_ADD,
      page: () => const LoaiSauBenhAddScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      binding: LoaiSauBenhBinding(),
    ),
    GetPage(
      name: _Paths.LOAISAUBENH_DETAIL,
      page: () => const LoaiSauBenhDetailScreen(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      binding: LoaiSauBenhBinding(),
    ),
    //------------Chi tieu ngoai dong-----------------------
    GetPage(
      name: _Paths.CHITIEUNGOAIDONG_LIST,
      page: () => const ChitieungoaidongListView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      binding: Binding(),
    ),
    GetPage(
      name: _Paths.CHITIEUNGOAIDONG_EDIT,
      page: () => const ChitieungoaidongEditView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      binding: Binding(),
    ),
    GetPage(
      name: _Paths.CHITIEUNGOAIDONG_ADD,
      page: () => const ChitieungoaidongAddView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(seconds: 1),
      binding: Binding(),
    ),
  ];
}