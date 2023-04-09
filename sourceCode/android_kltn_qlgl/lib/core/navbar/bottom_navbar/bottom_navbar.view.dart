// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/navbar/bottom_navbar.controller.dart';
import 'package:qlgl_project/core/views/home/home.view.dart';
import 'package:qlgl_project/core/views/profile/profile.view.dart';

import '../../constant/color.const.dart';
import '../../controllers/kieuhinh_list.controller.dart';
import '../../controllers/nhomgiong_list.controller.dart';

class BottomNavbarView extends StatefulWidget {
  const BottomNavbarView({super.key});

  @override
  State<BottomNavbarView> createState() => _BottomNavbarViewState();
}

class _BottomNavbarViewState extends State<BottomNavbarView> {
  
  @override
  Widget build(BuildContext context) {
    BottomNavbarController controller = Get.find();

    return GetBuilder<BottomNavbarController>(
      builder: (context) {
        return Scaffold(
          // appBar: (controller.tabIndex != 2)
          //     ? AppBar(
          //         iconTheme: IconThemeData(
          //           color: Colors.white, //change your color here
          //         ),
          //         title: controller.tabIndex==0?appbarText('Tra cứu'):(controller.tabIndex==1?appbarText('Nhập dữ liệu đo'):null),
          //         centerTitle: true,
          //         automaticallyImplyLeading: false,
          //         actions: [
          //           GestureDetector(
          //             onTap: () {
          //               AppPages.list;
          //               Get.offAndToNamed(AppRoutes.login);
          //             },
          //             child: Padding(
          //               padding: const EdgeInsets.all(10.0),
          //               child: Icon(
          //                 Icons.logout_sharp,
          //                 size: 35,
          //               ),
          //             ),
          //           )
          //         ],
          //       )
          //     : null,
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                const HomeView(),
                Container(
                  color: Colors.blue,
                  child: const Text('OtherPage'),
                ),
                const ProfileView(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: controller.tabIndex,
            onTap: controller.changeTabIndex,
            showUnselectedLabels: false,
            selectedItemColor: secondaryDarkSelected,
            unselectedItemColor: secondaryDark,
            items: [
              BottomNavbarItem(controller, 'assets/logo/datasearch.png',
                  'assets/logo/datasearch_selected.png', 'Tra cứu', 0),
              BottomNavbarItem(controller, 'assets/logo/writing.png',
                  'assets/logo/writing_selected.png', 'Nhập liệu', 1),
              BottomNavbarItem(controller, 'assets/logo/profile.png',
                  'assets/logo/profile_selected.png', 'Thông tin cá nhân', 2),
            ],
          ),
        );
      },
    );
  }

  //custom widget method appbar text
  Text appbarText(String text) => Text(text, style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),);

  //custom widget bottomNavbarItem
  BottomNavigationBarItem BottomNavbarItem(BottomNavbarController controller,
      String selectImg, String unselectImg, String label, int i) {
    return BottomNavigationBarItem(
        icon: Image.asset(
          selectImg,
          width: 40,
          color:
              controller.tabIndex != i ? secondaryDark : secondaryDarkSelected,
        ),
        // icon: controller.tabIndex != i
        //     ? Image.asset(selectImg, width: 30,)
        //     : Image.asset(unselectImg, width: 30),
        label: label);
  }
}
