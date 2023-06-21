import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qlgl_project/core/app_module/home/controller/home.controller.dart';
import 'package:qlgl_project/core/constant/color.const.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import '../../constant/function/funtion.dart';
import '../../constant/size.const.dart';
import '../../routes/route.lib.dart';
import '../../widget/customDialog.wg.dart';
import '../login/controller/AuthLogin.controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.find();
  AuthLoginController auth_controller = Get.put(AuthLoginController());
  final getStorage = GetStorage();

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
                  'Xin chào, ${getStorage.read('username')}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: SizeConfig.screenWidth / 22,
                    fontWeight: FontWeight.w700,
                    color: kPrimaryColor,
                  ),
                ),
                subtitle: Text(
                  getStorage.read('email'),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: SizeConfig.screenWidth / 25),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    ConfirmDialog(
                      //context,
                      'Xác nhận',
                      'Bạn chắc chắn muốn đăng xuất?',
                      () async {
                        await auth_controller.logOut(getStorage.read('token'));
                        // AppPages.routes;
                        // Get.offAllNamed(AppPages.getLogin());
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
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // Bo giong lua
                    Text(
                      'Bộ giống lúa'.toUpperCase(),
                      style: TextStyle(
                          fontSize: SizeConfig.screenWidth / 20,
                          fontWeight: FontWeight.bold,
                          color: kTextColor02),
                    ),
                    // GestureDetector(
                    //   onTap: () {},
                    //   child: Text(
                    //     'Xem thêm >',
                    //     style: TextStyle(
                    //         fontSize: SizeConfig.screenWidth / 22,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.blue),
                    //   ),
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              //horizontal card item
              buildVertiCard("Giống lúa", () {
                Get.toNamed(Routes.GIONG_LIST);
              }, "assets/logo/list.png"),
              buildVertiCard("Nhóm giống lúa", () {
                Get.toNamed(Routes.NHOMGIONG_LIST);
              }, "assets/logo/list.png"),
              //-------------------
              buildVertiCard("Kiểu hình giống lúa", () {
                Get.toNamed(Routes.KIEUHINH_LIST);
              }, "assets/logo/list.png"),
              // SizedBox(
              //   height: 200,
              //   //color: Colors.blue,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: 5,
              //     itemBuilder: (context, index) => giongluaCardItem(),
              //   ),
              // ),
              // SizedBox(
              //   height: 150,
              //   //alignment: Alignment.center,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: HCItems.length,
              //     itemBuilder: (context, index) =>
              //         buildHoriCard(item: HCItems[index]),
              //   ),
              // ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Danh mục khác'.toUpperCase(),
                  style: TextStyle(
                      fontSize: SizeConfig.screenWidth / 20,
                      fontWeight: FontWeight.bold,
                      color: kTextColor02),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
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
                  //-------------------
                  buildVertiCard("Giai đoạn trưởng thành", () {
                    Get.toNamed(Routes.GIAIDOANTRUONGTHANH_LIST);
                  }, "assets/logo/growing.png"),
                  //-------------------
                  buildVertiCard("Tính trạng giống lúa", () {},
                      "assets/logo/ricestyle.png"),
                  //-------------------
                  buildVertiCard("Các loại sâu bệnh", () {
                    Get.toNamed(Routes.LOAISAUBENH_LIST);
                  }, "assets/logo/caterpillar.png"),
                  //-------------------
                  buildVertiCard("Các loại giá trị đo", () {
                    Get.toNamed(Routes.LOAIGIATRIDO_LIST);
                  }, "assets/logo/measure.png"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

// child: SingleChildScrollView(
//               child: ConstrainedBox(
//                 constraints: BoxConstraints(maxHeight: SizeConfig.screenHeight),
//                 child: Column(
//                   children: <Widget>[
//                     //Expanded(flex: 1, child: Container(color: Colors.white)),
//                     Expanded(
//                       flex: SizeConfig.screenHeight >= 1350 ? 4 : 3,
//                       child: Center(
//                         child: SizedBox(
//                           width: double.infinity,
//                           //color: Colors.red,
//                           child: ListTile(
//                             leading: Image.asset('assets/logo/profile.png'),
//                             title: Text(
//                               'Xin chào, ${getStorage.read('username')}',
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                   fontSize: SizeConfig.screenWidth / 22,
//                                   fontWeight: FontWeight.w700,
//                                   color: kPrimaryColor),
//                             ),
//                             subtitle: Text(
//                               getStorage.read('email'),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(color: kSecondaryColor),
//                             ),
//                             trailing: GestureDetector(
//                               onTap: () {
//                                 ConfirmDialog(
//                                   //context,
//                                   'Xác nhận',
//                                   'Bạn chắc chắn muốn đăng xuất?',
//                                   () async {
//                                     await auth_controller
//                                         .logOut(getStorage.read('token'));
//                                     // AppPages.routes;
//                                     // Get.offAllNamed(AppPages.getLogin());
//                                     // Get.offAndToNamed(AppPages.getLogin());
//                                     //token.remove('token');
//                                   },
//                                   () {},
//                                 ).show();
//                               },
//                               child: const Icon(
//                                 Icons.logout_outlined,
//                                 color: secondaryDark,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     //date and time
//                     Expanded(
//                       flex: SizeConfig.screenHeight >= 1350 ? 6 : 5,
//                       child: DateAndTime(),
//                     ),
//                     //giong lua item
//                     Expanded(
//                       flex: 7,
//                       child: Container(
//                         width: double.infinity,
//                         //color: Colors.green,
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Expanded(
//                               flex: 2,
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 20, right: 20),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       'Giống lúa'.toUpperCase(),
//                                       style: TextStyle(
//                                           fontSize: SizeConfig.screenWidth / 20,
//                                           fontWeight: FontWeight.bold,
//                                           color: kTextColor02),
//                                     ),
//                                     GestureDetector(
//                                       onTap: () {},
//                                       child: Text(
//                                         'Xem thêm >',
//                                         style: TextStyle(
//                                             fontSize: SizeConfig.screenWidth / 22,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.blue),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Expanded(flex: 8, child: giongluaCardItem()),
//                           ],
//                         ),
//                       ),
//                     ),
//                     // other menu:
//                     Expanded(
//                       flex: 12,
//                       child: Container(
//                         width: double.infinity,
//                         //color: Colors.blueGrey,
//                         padding: const EdgeInsets.symmetric(vertical: 0),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Expanded(
//                               flex: 1,
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.only(left: 20, bottom: 5),
//                                 child: Text(
//                                   'Danh mục khác'.toUpperCase(),
//                                   style: TextStyle(
//                                       fontSize: SizeConfig.screenWidth / 20,
//                                       fontWeight: FontWeight.bold,
//                                       color: kTextColor02),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               flex: 10,
//                               child: Column(
//                                 children: <Widget>[
//                                   buildVertiCard(
//                                     "Nhóm giống lúa",
//                                     () {},
//                                   ),
//                                   buildVertiCard(
//                                     "Các loại sâu bệnh",
//                                     () {},
//                                   ),
//                                   buildVertiCard(
//                                     "Giai đoạn trưởng thành",
//                                     () {},
//                                   ),
//                                   buildVertiCard(
//                                     "Tính trạng giống lúa",
//                                     () {},
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

  //widget build Clock and calendar
  // ignore: non_constant_identifier_names
  Widget DateAndTime() {
    return Container(
      width: double.maxFinite,
      height: SizeConfig.screenWidth / 2.7,
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.screenWidth / 40,
        //horizontal: SizeConfig.screenWidth / 30,
      ),
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
                width: SizeConfig.screenWidth / 5,
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
                    // Image.asset(
                    //   'assets/logo/calendar.png',
                    //   width: SizeConfig.screenWidth * 0.06,
                    //   fit: BoxFit.cover,
                    // ),
                    Padding(
                      padding: EdgeInsets.only(left: 5, right: 5),
                      child: Text(
                        "${weekday()},",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.screenWidth / 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      "${numberCustom10(DateTime.now().day)} / ${numberCustom10(DateTime.now().month)} / ${DateTime.now().year}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: SizeConfig.screenWidth / 22,
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

  // giong lua card item
  Widget giongluaCardItem() {
    return Container(
      width: 50,
      height: 50,
      color: Colors.yellow,
    );
  }

  Widget buildVertiCard(String title, VoidCallback funct, String image) {
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
                      image,
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
}
