import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qlgl_project/core/constant/color.const.dart';

import '../../widget/customDialog.wg.dart';
import '../login/controller/AuthLogin.controller.dart';
import 'profile.controller.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthLoginController auth_controller = Get.put(AuthLoginController());
  ProfileController controller = Get.find();
  final getStorage = GetStorage();
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
                    getStorage.read('username'),
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    getStorage.read('email'),
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Thông tin cá nhân', style: TextStyle(fontSize: 20),),
              onTap: () {controller.showUserInfo();},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Thay đổi mật khẩu', style: TextStyle(fontSize: 20),),
              onTap: () {},
            ),
            //Divider(),
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
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.withOpacity(0.3),
                ),
                child: ListTile(
                  leading: Icon(Icons.logout,color: Colors.blueAccent),
                  title: Text('Đăng xuất', style: TextStyle(fontSize: 20,color: Colors.blueAccent),),
                  onTap: () {
                    ConfirmDialog(
                      //context,
                      'Xác nhận',
                      'Bạn chắc chắn muốn đăng xuất?',
                      () async {
                        await auth_controller.logOut(getStorage.read('token'));
                      },
                      () {},
                    ).show();
                  },
                ),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
