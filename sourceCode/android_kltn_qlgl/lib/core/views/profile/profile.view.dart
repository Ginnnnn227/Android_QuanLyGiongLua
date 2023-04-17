import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/constant/color.const.dart';
import 'package:qlgl_project/core/controllers/profile.controller.dart';

import '../../routes.dart';
import '../widget/customDialog.wg.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  //const name({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Profile'),
      //   automaticallyImplyLeading: false,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                  image: AssetImage('assets/logo/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('assets/logo/profile.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Admin',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Admin@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Thông tin cá nhân'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Thay đổi mật khẩu'),
              onTap: () {},
            ),
            Divider(),
            // ListTile(
            //   leading: Icon(Icons.language),
            //   title: Text('Ngôn ngữ'),
            //   trailing: DropdownButton(
            //     value: 'en',
            //     items: [
            //       DropdownMenuItem(
            //         value: 'en',
            //         child: Text('English'),
            //       ),
            //       DropdownMenuItem(
            //         value: 'vi',
            //         child: Text('Vietnamese'),
            //       ),
            //     ],
            //     onChanged: (value) {},
            //   ),
            // ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Đăng xuất'),
              onTap: () {
                ConfirmDialog(
                  //context,
                  'Xác nhận',
                  'Bạn chắc chắn muốn đăng xuất?',
                  () {
                    AppPages.routes;
                    Get.offAndToNamed(AppPages.getLogin());
                  },
                  () {},
                ).show();
              },
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
