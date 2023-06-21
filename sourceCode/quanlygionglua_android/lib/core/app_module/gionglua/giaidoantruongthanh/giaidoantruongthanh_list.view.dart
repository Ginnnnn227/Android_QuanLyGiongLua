// ignore_for_file: non_constant_identifier_names, unused_local_variable, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color.const.dart';
import '../../../constant/function/funtion.dart';
import 'controller/giaidoantruongthanh.controller.dart';

class GiaiDoanTruongThanhListScreen extends StatefulWidget {
  const GiaiDoanTruongThanhListScreen({super.key});

  @override
  State<GiaiDoanTruongThanhListScreen> createState() =>
      _GiaiDoanTruongThanhListScreenState();
}

class _GiaiDoanTruongThanhListScreenState
    extends State<GiaiDoanTruongThanhListScreen> {
  GiaiDoanTruongThanhController GDTTlistController =
      Get.find<GiaiDoanTruongThanhController>();

  @override
  void initState() {
    super.initState();
    setState(() {
      GDTTlistController.onInit();
    });
  }

  Future<void> _loadpage() async {
    setState(() {
      GDTTlistController.onInit();
    });
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (a, b, c) => const GiaiDoanTruongThanhListScreen(),
            transitionDuration: const Duration(seconds: 5)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'giai đoạn trưởng thành'.toUpperCase(),
          style: TextStyle(
              color: kPrimaryColor, fontWeight: FontWeight.w600, fontSize: 18),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        //elevation: 0,

        leadingWidth: 56,
        leading: BackButton(
          color: kPrimaryColor,
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                _loadpage();
              },
              icon: const Icon(Icons.refresh_outlined, color: kPrimaryColor))
        ],
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: _loadpage,
        child: Column(
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            //   child: TextField(
            //     onChanged: (value) => GDTTlistController.search.value = value,
            //     decoration: InputDecoration(
            //       hintStyle: const TextStyle(fontSize: 20),
            //       contentPadding: const EdgeInsets.symmetric(
            //           vertical: 15.0, horizontal: 25),
            //       hintText: 'Nhập từ khóa để tìm kiếm...',
            //       suffixIcon: const Icon(
            //         Icons.search,
            //         size: 30,
            //       ),
            //       // prefix: Icon(Icons.search),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(20.0),
            //         borderSide: const BorderSide(),
            //       ),
            //     ),
            //   ),
            // ),
            Obx(() {
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Số lượng: ${numberCustom10(GDTTlistController.filteredData.length)}",
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyan),
                ),
              );
            }),
            const Divider(),
            Obx(
              () {
                if (GDTTlistController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  final item = GDTTlistController.filteredData;
                  return GDTTlistController.filteredData.length != 0
                      ? Expanded(child: TableData())
                      : Column(
                          children: [
                            Text(
                              'Chưa có dữ liệu sâu bệnh',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: kSecondaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              '${GDTTlistController.search}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                }
              },
            ),
            // Obx(() {
            //   if (GDTTlistController.isLoading.value) {
            //     return const Center(
            //       child: CircularProgressIndicator(),
            //     );
            //   } else {
            //     return Expanded(
            //       child: ListView.builder(
            //         itemCount: GDTTlistController.filteredData.length,
            //         itemBuilder: (context, index) {
            //           final item = GDTTlistController.filteredData[index];
            //           return cardItemKH(index, item);
            //         },
            //       ),
            //     );
            //   }
            // }),
          ],
        ),
      ),
    );
  }

  Widget TableData() {
    final item = GDTTlistController.filteredData;
    return DataTable(
      border: TableBorder.all(width: 1, color: Colors.cyan),
      columnSpacing: 30,
      headingRowColor:
          MaterialStateProperty.all<Color>(Colors.cyan.withOpacity(1)),
      headingTextStyle:
          const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      columns: <DataColumn>[
        DataColumn(
          label: Text(
            'Giai\nđoạn'.toUpperCase(),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
        DataColumn(label: Text('Tên'.toUpperCase())),
      ],
      rows: item
          .map(
            (i) => DataRow(
              cells: [
                DataCell(
                  Center(
                    child: Text(
                      i.gdttTen!,
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.cyan,
                          fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                DataCell(
                  Text(
                    i.gdttMota!,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
