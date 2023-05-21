import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qlgl_project/core/constant/color.const.dart';

class ProfileController extends GetxController {
  final getStorage = GetStorage();

  void showUserInfo() {
    Get.bottomSheet(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: <Widget>[
            Container(
              height: 5,
              width: 35,
              color: Colors.black26,
            ),
            const SizedBox(height: 10),
            const Text(
              'Thông tin cá nhân',
              style: TextStyle(
                fontSize: 25,
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            listTile(Icons.person, getStorage.read('username')),
            listTile(Icons.email, getStorage.read('email')),
            listTile(Icons.location_on, getStorage.read('useraddress')),
            listTile(Icons.phone, getStorage.read('userphone')),
            const SizedBox(height: 10),
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(
            20,
          ),
        ),
      ),
      enterBottomSheetDuration: const Duration(milliseconds: 500),
      exitBottomSheetDuration: const Duration(milliseconds: 500),
      isDismissible: false,
      backgroundColor: Colors.white,
    );
  }

  Widget listTile(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade100,
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
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(
              icon,
              size: 20,
            ),
          ),
          title: Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
