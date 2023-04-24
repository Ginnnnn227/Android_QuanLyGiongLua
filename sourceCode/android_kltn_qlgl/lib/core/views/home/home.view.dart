// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:qlgl_project/core/constant/color.const.dart';
import 'package:qlgl_project/core/constant/size.const.dart';
import 'package:qlgl_project/core/routes.dart';
import 'package:qlgl_project/core/views/widget/customDialog.wg.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import '../../controllers/giong_list.controller.dart';
import '../../controllers/kieuhinh_list.controller.dart';
import '../../controllers/nhomgiong_list.controller.dart';
import '../../funtion.dart';
import 'home.controller.dart';
import 'model/horicarditem.model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final NhomGiongListController NGlistController = Get.find();
  final KieuHinhListController KHlistController = Get.find();
  final GiongListController GlistController = Get.find();

  final HomeController homeController = Get.put(HomeController());
  var countNG;
  var countKH;
  var countG;
  int countData(String title) {
    switch (title) {
      case "Nhóm giống":
        return countNG;
      case "Giống":
        return countG;
      case "Kiểu hình":
        return countKH;
      default:
        return 0;
    }
  }

  List<HorizontalCardItem> HCItems = [
    HorizontalCardItem(
        title: 'Nhóm giống',
        funct: () {
          AppPages.routes;
          Get.to(AppPages.getNhomGiongList());
        }),
    HorizontalCardItem(
        title: 'Giống',
        funct: () {
          AppPages.routes;
          Get.to(AppPages.getGiongList());
        }),
    HorizontalCardItem(
        title: 'Kiểu hình',
        funct: () {
          AppPages.routes;
          Get.to(AppPages.getKieuHinhList());
        }),
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      NGlistController.fetchData();
      KHlistController.fetchData();
      GlistController.fetchData();
      countNG = NGlistController.allData.length;
      countKH = KHlistController.allData.length;
      countG = GlistController.allData.length;
      print("Số lượng nhóm giống: $countNG");
      print("Số lượng kiểu hình: $countKH");
      print("Số lượng giống: $countG");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
          // height: double.infinity,
          width: double.infinity,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                leading: Image.asset('assets/logo/profile.png'),
                title: Text(
                  'Xin chào, Admin!',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: kPrimaryColor),
                ),
                subtitle: Text(
                  'Admin@gmail.com',
                  style: TextStyle(color: kSecondaryColor),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    debugPrint(homeController.user.value.name);
                    var token = GetStorage();
                    debugPrint("TokenLogout: ${token.read("token")}");
                    ConfirmDialog(
                      //context,
                      'Xác nhận',
                      'Bạn chắc chắn muốn đăng xuất?',
                      () {
                        AppPages.routes;
                        Get.offAllNamed(AppPages.getLogin());
                        // Get.offAndToNamed(AppPages.getLogin());
                        //token.remove('token');
                      },
                      () {},
                    ).show();
                  },
                  child: const Icon(
                    Icons.logout_outlined,
                    color: secondaryDark,
                  ),
                ),
              ),

              //clock and calendar
              DateAndTime(),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              //Text Bộ giống lúa
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Bộ giống lúa',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kSecondaryColor),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              //horizontal card item
              SizedBox(
                height: 150,
                //alignment: Alignment.center,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: HCItems.length,
                  itemBuilder: (context, index) =>
                      buildHoriCard(item: HCItems[index]),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Danh mục khác',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kSecondaryColor),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              // Column(
              //   children: <Widget>[
              //     Expanded(
              //         child: ListView.builder(
              //             itemCount: VCItems.length,
              //             itemBuilder: (context, index) {
              //               return buildVertiCard(item: VCItems[index]);
              //             })),
              //   ],
              // ),
              //Vertical card item
              Column(
                children: <Widget>[
                  buildVertiCard("Giai đoạn trưởng thành", () {
                    AppPages.routes;
                    Get.to(AppPages.getGDTTList());
                  }),
                  buildVertiCard("Tính trạng giống lúa", () {
                    AppPages.routes;
                    Get.to(AppPages.getTinhTrangList());
                  }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

//widget build Clock and calendar
  Widget DateAndTime() {
    return Container(
      width: double.maxFinite,
      height: 150,
      padding: EdgeInsets.symmetric(
          vertical: SizeConfig.screenWidth * 0.03,
          horizontal: SizeConfig.screenWidth * 0.02),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(
              5.0,
              5.0,
            ),
            blurRadius: 5.0,
            spreadRadius: 1.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 5.0,
            spreadRadius: 0.0,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: ClipRRect(
              child: Image.asset(
                DateTime.now().hour > 12
                    ? 'assets/logo/pm.png'
                    : 'assets/logo/am.png',
                width: SizeConfig.screenWidth * 0.15,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //DIGITAL CLOCK
              DigitalClock(
                digitAnimationStyle: Curves.linearToEaseOut,
                is24HourTimeFormat: false,
                areaDecoration: const BoxDecoration(color: Colors.transparent),
                colon: Text(
                  ':',
                  style: TextStyle(
                      fontSize: SizeConfig.screenWidth * 0.08,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                amPmDigitTextStyle:
                    const TextStyle(color: kPrimaryColor, fontSize: 0
                        //fontSize: SizeConfig.screenWidth * 0.05,
                        ),
                hourMinuteDigitTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.screenWidth * 0.08,
                  fontWeight: FontWeight.w700,
                ),
                secondDigitTextStyle: TextStyle(
                  color: Colors.white60,
                  fontSize: SizeConfig.screenWidth * 0.06,
                ),
              ),
              SizedBox(height: SizeConfig.screenWidth * 0.01),
              Container(
                height: 40,
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 8.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/logo/calendar.png',
                      width: SizeConfig.screenWidth * 0.06,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        "${weekday()},",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.screenWidth * 0.04,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      "${numberCustom10(DateTime.now().day)} / ${numberCustom10(DateTime.now().month)} / ${DateTime.now().year}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.screenWidth * 0.04,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

//widget build vertical card item
  Widget buildVertiCard(String title, VoidCallback funct) {
    return InkWell(
      onTap: () => funct(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            //border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.blueGrey.withOpacity(0.5),
                offset: const Offset(
                  2.5,
                  2.5,
                ),
                blurRadius: 5.0,
                spreadRadius: 1.0,
              ),
              const BoxShadow(
                color: kPrimaryColor,
                offset: Offset(0.0, 0.0),
                blurRadius: 1.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      "assets/logo/list.png",
                      height: 50,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    title.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: secondaryDark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

//widget build horizontal card item
  Widget buildHoriCard({required HorizontalCardItem item}) {
    return GestureDetector(
      onTap: () => item.funct(),
      child: Container(
        padding: const EdgeInsets.only(top: 5),
        alignment: Alignment.center,
        height: 160,
        width: 150,
        // decoration: BoxDecoration(
        //   border: Border.all(color: Colors.black),
        //   borderRadius: BorderRadius.circular(30),
        // ),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 100,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                //border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueGrey.withOpacity(0.5),
                    offset: const Offset(
                      2.5,
                      2.5,
                    ),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                  ),
                  const BoxShadow(
                    color: kPrimaryColor,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 1.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Text(
                numberCustom10(countData(item.title)),
                style: TextStyle(
                    color: Color(RandomColor()).withOpacity(1.0),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              item.title,
              style: const TextStyle(
                  color: secondaryDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
