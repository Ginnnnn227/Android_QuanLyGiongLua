import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:qlgl_project/core/constant/apiurl.const.dart';
import 'package:qlgl_project/core/models/nhomgiong.model.dart';

class NhomGiongListController extends GetxController {
  
  RxBool isLoading = true.obs;
  RxList<nhomgiongModel> data = RxList<nhomgiongModel>([]);
  RxString search = ''.obs;

  List<nhomgiongModel> get filteredData {
    if (search.value.isEmpty) {
      return data;
    } else {
      return data.where((item) =>
          item.nhomgiongTen!.toLowerCase().contains(search.value.toLowerCase())).toList();
    }
  }

  Future<void> fetchData() async {
    try {
      final response = await Dio().get(nhomgiongURL);
      final List<dynamic> responseData = response.data['data'];
      final List<nhomgiongModel> list = [];

      for (var item in responseData) {
        final model = nhomgiongModel.fromJson(item);
        list.add(model);
      }

      data.value = list;
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      // handle error
    }
  }
}
