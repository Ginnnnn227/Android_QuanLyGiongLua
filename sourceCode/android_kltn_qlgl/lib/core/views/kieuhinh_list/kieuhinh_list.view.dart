import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/controllers/kieuhinh_list.controller.dart';

import '../../constant/color.const.dart';
import 'package:qlgl_project/core/models/kieuhinh.model.dart';

import '../../funtion.dart';

class KieuHinhListView extends StatefulWidget {
  const KieuHinhListView({super.key});

  @override
  State<KieuHinhListView> createState() => _KieuHinhListViewState();
}

class _KieuHinhListViewState extends State<KieuHinhListView> {
  final KieuHinhListController KHlistController = Get.find();

  @override
  void initState() {
    super.initState();
    setState(() {
      KHlistController.fetchData();
      KHlistController.search.value = '';
    });
  }

  Future<void> _loadpage() async {
    setState(() {
      KHlistController.fetchData();
      KHlistController.search.value = '';
    });
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (a, b, c) => const KieuHinhListView(),
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
          'DANH SÁCH KIỂU HÌNH',
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
                onChanged: (value) => KHlistController.search.value = value,
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
                "Số lượng: ${numberCustom10(KHlistController.filteredData.length)}",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              );
            }),
            Divider(),
            Obx(() {
              if (KHlistController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: KHlistController.filteredData.length,
                    itemBuilder: (context, index) {
                      final item = KHlistController.filteredData[index];
                      return cardItemKH(index, item);
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget cardItemKH(int index, kieuhinhModel item) {
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
          "${item.kieuhinhTen}".toUpperCase(),
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
                Text(
                  "Mô tả:",
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "${item.kieuhinhMota!}",
                  style: TextStyle(
                      fontSize: 20,
                      color: item.kieuhinhMota != 'Chưa cập nhật'
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

  // Widget cardRowItem(String title, String content) {
  //   return Row(
  //     children: [
  //       Text(
  //         title,
  //         style: const TextStyle(
  //             fontSize: 20, fontWeight: FontWeight.w600, color: Colors.blue),
  //       ),
  //       Text(
  //         content,
  //         style: TextStyle(
  //             fontSize: 20,
  //             fontWeight: FontWeight.w600,
  //             color: content != 'Chưa cập nhật' ? Colors.green : Colors.red),
  //       ),
  //     ],
  //   );
  // }
}
