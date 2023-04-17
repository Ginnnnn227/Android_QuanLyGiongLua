import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/constant/color.const.dart';
import 'package:qlgl_project/core/controllers/dacdiemtinhtrang_list.controller.dart';
import 'package:qlgl_project/core/controllers/doituongtinhtrang_list.controller.dart';

import '../../controllers/giatritinhtrang_list.controller.dart';
import '../../models/doituongtinhtrang.model.dart';

class TinhTrangDetailView extends StatefulWidget {
  const TinhTrangDetailView({super.key});

  @override
  State<TinhTrangDetailView> createState() => _TinhTrangDetailViewState();
}

class _TinhTrangDetailViewState extends State<TinhTrangDetailView> {
  doituongtinhtrangModel data = Get.arguments;
  final DDTTListController DDTTcontroller = Get.put(DDTTListController());
  final GTTTListController GTTTcontroller = Get.put(GTTTListController());

  @override
  void initState() {
    super.initState();
    setState(() {
      DDTTcontroller.fetchData();
      GTTTcontroller.fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CHI TIẾT TÍNH TRẠNG',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 5,
                            width: 35,
                            color: Colors.black26,
                          ),
                        ],
                      ),
                    ),
                    //ten
                    Text(
                      "${data.dtttTen!.toUpperCase()}",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.green,
                      ),
                    ),
                    //updated_at
                    Text(
                      "Ngày cập nhật: ${data.updatedAt}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    //Giai đoạn
                    Text(
                      "Giai đoạn trưởng thành:",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "${data.gdttTen!}",
                      style: TextStyle(
                          fontSize: 20,
                          color: data.gdttTen != 'Chưa cập nhật'
                              ? Colors.black54
                              : Colors.red),
                      textAlign: TextAlign.justify,
                    ),
                    // mô tả
                    Text(
                      "Mô tả:",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "${data.dtttMota!}",
                      style: TextStyle(
                          fontSize: 20,
                          color: data.dtttMota != 'Chưa cập nhật'
                              ? Colors.black54
                              : Colors.red),
                      textAlign: TextAlign.justify,
                    ),
                    //đặc điểm
                    Text(
                      "Đặc điểm:",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue),
                      textAlign: TextAlign.left,
                    ),
                    Obx(() {
                      if (DDTTcontroller.isLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: DataTable(
                          headingRowColor:
                              MaterialStateProperty.all(Colors.grey),
                          border: TableBorder.all(),
                          columns: [
                            DataColumn(
                                label: Text(
                              'TÊN',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )),
                            DataColumn(
                                label: Text(
                              'GIÁ TRỊ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            )),
                          ],
                          rows: DDTTcontroller.data
                              .where((item) => item.dtttTen!
                                  .toLowerCase()
                                  .contains(data.dtttTen!.toLowerCase()))
                              .map((item) {
                            GTTTcontroller.name.value = item.ddttTen!;
                            return DataRow(
                              cells: [
                                DataCell(Text(item.ddttTen!)),
                                DataCell(Text(item.dtttTen!)),
                              ],
                            );
                          }).toList(),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
