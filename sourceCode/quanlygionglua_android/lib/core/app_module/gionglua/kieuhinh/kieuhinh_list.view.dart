import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/app_module/gionglua/kieuhinh/controller/kieuhinh.controller.dart';

import '../../../constant/color.const.dart';
import '../../../constant/function/funtion.dart';
import '../../../models/kieuhinh.model.dart';

class KieuHinhListScreen extends StatefulWidget {
  const KieuHinhListScreen({super.key});

  @override
  State<KieuHinhListScreen> createState() => _KieuHinhListScreenState();
}

class _KieuHinhListScreenState extends State<KieuHinhListScreen> {
  KieuHinhController KHlistController = Get.find<KieuHinhController>();

  @override
  void initState() {
    super.initState();
    setState(() {
      KHlistController.onInit();
    });
  }

  Future<void> _loadpage() async {
    setState(() {
      KHlistController.onInit();
    });
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (a, b, c) => const KieuHinhListScreen(),
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
          'KIỂU HÌNH GIỐNG LÚA',
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
                return KHlistController.filteredData.length != 0
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: KHlistController.filteredData.length,
                          itemBuilder: (context, index) {
                            final item = KHlistController.filteredData[index];
                            return cardItemKH(index, item);
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
}
