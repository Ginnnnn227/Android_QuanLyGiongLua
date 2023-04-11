import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constant/color.const.dart';
import '../../controllers/giaidoantruongthanh_list.controller.dart';
import '../../funtion.dart';
import '../../models/giaidoantruongthanh.model.dart';

class GDTTListView extends StatefulWidget {
  const GDTTListView({super.key});

  @override
  State<GDTTListView> createState() => _GDTTListViewState();
}

class _GDTTListViewState extends State<GDTTListView> {
  final GDTTListController GDTTlistController = Get.find();

  @override
  void initState() {
    super.initState();
    setState(() {
      GDTTlistController.fetchData();
      GDTTlistController.search.value = '';
    });
  }

  Future<void> _loadpage() async {
    setState(() {
      GDTTlistController.fetchData();
      GDTTlistController.search.value = '';
    });
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (a, b, c) => const GDTTListView(),
            transitionDuration: const Duration(seconds: 5)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GIAI ĐOẠN TRƯỞNG THÀNH',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _loadpage,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextField(
                onChanged: (value) => GDTTlistController.search.value = value,
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
                "Số lượng: ${numberCustom10(GDTTlistController.filteredData.length)}",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              );
            }),
            Divider(),
            Obx(() {
              if (GDTTlistController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: GDTTlistController.filteredData.length,
                    itemBuilder: (context, index) {
                      final item = GDTTlistController.filteredData[index];
                      return cardItemGDTT(index, item);
                    },
                  ),
                );
              }
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => GDTTlistController.showCreateProductDialog(),
        child: Icon(Icons.add),
      ),
    );
  }

  

  Widget cardItemGDTT(int index, giaidoantruongthanhModel item) {
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
          "${item.gdttTen}".toUpperCase(),
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
                  "${item.gdttMota!}",
                  style: TextStyle(
                      fontSize: 20,
                      color: item.gdttMota != 'Chưa cập nhật'
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
