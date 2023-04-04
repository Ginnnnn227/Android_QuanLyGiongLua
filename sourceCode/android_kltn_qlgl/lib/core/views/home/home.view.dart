import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:qlgl_project/core/constant/color.const.dart';
import 'package:qlgl_project/core/constant/size.const.dart';
import 'package:qlgl_project/core/routes.dart';
import 'package:qlgl_project/core/views/nhomgiong_list/nhomgiong_list.view.dart';
import 'package:qlgl_project/core/views/widget/customDialog.wg.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

import 'model/horicarditem.model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<HorizontalCardItem> HCItems = [
    HorizontalCardItem(
        title: 'Nhóm giống',
        funct: () {
          AppPages.routes;
          Get.toNamed(AppPages.getNhomGiongList());
        }),
    HorizontalCardItem(title: 'Giống', funct: () {}),
    HorizontalCardItem(title: 'Kiểu hình', funct: () {}),
  ];
  int RandomColor() {
    return (math.Random().nextDouble() * 0xFFFFFF).toInt();
  }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Timer.periodic(const Duration(seconds: 1), (timer) {
  //     setState(() {
  //       NGcontroller.fetchNhomGiong();
  //     });
  //   });
  // }
  // Future<void> _refresh() async {
  //   // Add your refresh logic here, e.g. fetching data from an API
  //   await Future.delayed(Duration(seconds: 1));
  //   setState(() {
  //     NGcontroller.fetchNhomGiong();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        // alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
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
                  ConfirmDialog(
                    context,
                    'Xác nhận',
                    'Bạn chắc chắn muốn đăng xuất?',
                    () {
                      AppPages.routes;
                      Get.offAndToNamed(AppPages.getLogin());
                    },
                    () {},
                  ).show();
                },
                child: Icon(
                  Icons.logout_outlined,
                  color: secondaryDark,
                ),
              ),
            ),
            //clock and calendar
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0),
                height: SizeConfig.screenHeight * 0.15,
                width: SizeConfig.screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: const Offset(
                        5.0,
                        5.0,
                      ),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    ), //BoxShadow
                    BoxShadow(
                      color: Colors.white,
                      offset: const Offset(0.0, 0.0),
                      blurRadius: 5.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //DIGITAL CLOCK
                    DigitalClock(
                      digitAnimationStyle: Curves.linearToEaseOut,
                      is24HourTimeFormat: false,
                      areaDecoration: BoxDecoration(color: Colors.transparent),
                      colon: Text(
                        ':',
                        style: TextStyle(
                            fontSize: SizeConfig.screenWidth * 0.08,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      amPmDigitTextStyle: TextStyle(
                          color: secondaryDark,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.screenWidth * 0.05),
                      hourMinuteDigitTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: SizeConfig.screenWidth * 0.08),
                      secondDigitTextStyle: TextStyle(
                          color: Colors.white60,
                          fontSize: SizeConfig.screenWidth * 0.05),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: VerticalDivider(
                        color: Colors.white,
                        thickness: 3,
                      ),
                    ),
                    // day & month
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            DateTime.now().day > 10
                                ? DateTime.now().day.toString()
                                : '0${DateTime.now().day.toString()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Tháng',
                            style: TextStyle(
                                color: secondaryDark,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DateTime.now().month > 10
                                ? DateTime.now().month.toString()
                                : '0${DateTime.now().month.toString()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: SizeConfig.screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
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
            Container(
              height: 150,
              //alignment: Alignment.center,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
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
          ],
        ),
      ),
    );
  }

//widget build horizontal card item
  Widget buildHoriCard({required HorizontalCardItem item}) {
    return GestureDetector(
      onTap: () =>item.funct(),
      child: Container(
        padding: EdgeInsets.only(top: 5),
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
              child: Text(
                '00',
                style: TextStyle(
                    color: Color(RandomColor()).withOpacity(1.0),
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              height: 100,
              width: 120,
              decoration: BoxDecoration(
                  color: Colors.white,
                  //border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.5),
                      offset: Offset(
                        2.5,
                        2.5,
                      ),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                      color: kPrimaryColor,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 1.0,
                      spreadRadius: 0.0,
                    ),
                  ]),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              item.title,
              style: TextStyle(
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
