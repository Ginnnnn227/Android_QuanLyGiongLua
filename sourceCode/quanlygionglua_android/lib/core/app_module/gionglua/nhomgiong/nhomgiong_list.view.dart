import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/app_module/gionglua/nhomgiong/nhomgiong.bingding.dart';

import '../../../constant/color.const.dart';
import '../../../constant/function/funtion.dart';
import '../../../models/nhomgiong.model.dart';
import 'controller/nhomgiong.controller.dart';

class NhomGiongListScreen extends StatefulWidget {
  const NhomGiongListScreen({super.key});

  @override
  State<NhomGiongListScreen> createState() => _NhomGiongListScreenState();
}

class _NhomGiongListScreenState extends State<NhomGiongListScreen> {
  NhomGiongController NGlistController = Get.put(NhomGiongController());
  @override
  void initState() {
    super.initState();
    setState(() {
      NGlistController.onInit();
      // NGlistController.fetchData();
      // NGlistController.search.value = '';
    });
  }

  Future<void> _loadpage() async {
    
    setState(() {
      NGlistController.onInit();
      // NGlistController.fetchData();
      // NGlistController.search.value = '';
    });
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (a, b, c) => const NhomGiongListScreen(),
            transitionDuration: const Duration(seconds: 5)));

  }

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   NGlistController.fetchData();
    // });
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DANH SÁCH NHÓM GIỐNG',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         setState(() {
        //           NGlistController.fetchData();
        //           NGlistController.search.value = '';
        //           AppPages.routes;
        //           Get.reset();
        //         });
        //       },
        //       icon: Icon(Icons.refresh_outlined))
        // ],
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _loadpage,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                onChanged: (value) => NGlistController.search.value = value,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(fontSize: 20),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 25),
                  hintText: 'Nhập từ khóa để tìm kiếm...',
                  suffixIcon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  // prefix: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
            ),
            Obx(() {
              return Text(
                "Số lượng: ${numberCustom10(NGlistController.filteredData.length)}",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              );
            }),
            Divider(),
            Obx(() {
              if (NGlistController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return NGlistController.filteredData.length != 0
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: NGlistController.filteredData.length,
                          itemBuilder: (context, index) {
                            final item = NGlistController.filteredData[index];
                            return cardItemNG(index, item);
                          },
                        ),
                      )
                    : const Text(
                        'Không có dữ liệu',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kSecondaryColor,
                        ),
                      );
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget cardItemNG(int index, nhomgiongModel item) {
    return Card(
      child: ExpansionTile(
        textColor: kPrimaryColor,
        iconColor: kPrimaryColor,
        leading: Text(
          "${index + 1}.",
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        title: Text(
          "${item.nhomgiongTen}".toUpperCase(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          "Ngày cập nhật: ${item.updatedAt}",
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: <Widget>[
                cardRowItem('Code', '${item.nhomgiongCode}'),
                cardRowItem('Ngày ngâm', '${item.nhomgiongNgayngam}'),
                cardRowItem('Ngày cấy', '${item.nhomgiongNgaycay}'),
                Text(
                  "Mô tả:",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "${item.nhomgiongMota!}",
                  style: TextStyle(
                      fontSize: 20,
                      color: item.nhomgiongMota != 'Chưa cập nhật'
                          ? Colors.black54
                          : Colors.red),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget cardRowItem(String title, String content) {
    return Row(
      children: [
        Text(
          "${title}: ",
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue),
        ),
        Text(
          content,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: content != 'Chưa cập nhật' ? Colors.green : Colors.red),
        ),
      ],
    );
  }
}
