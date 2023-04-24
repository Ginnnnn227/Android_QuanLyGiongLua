import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qlgl_project/core/constant/apiurl.const.dart';
import 'package:qlgl_project/core/views/auth/login/login.view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../routes.dart';
import '../auth/model/user_auth.model.dart';

class HomeController extends GetxController {
  final user = UserAuthModel().obs;

  Future<void> getUserDetails() async {
    try {
      var token = GetStorage();
      String t = token.read('token');
      final response = await Dio().get(
        user_authURL,
        options: Options(
          headers: {'Authorization': 'Bearer $t'},
        ),
      );
      if (response.statusCode == 200) {
        user.value = UserAuthModel.fromJson(response.data);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> logout() async {
    AppPages.routes;
    Get.offAndToNamed(AppPages.getLogin());
  }
}
