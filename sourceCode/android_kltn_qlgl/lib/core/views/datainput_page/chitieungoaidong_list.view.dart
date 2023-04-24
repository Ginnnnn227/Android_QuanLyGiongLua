import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:qlgl_project/core/views/datainput_page/models/chitieungoaidong.model.dart';

import '../../constant/color.const.dart';
import '../../funtion.dart';
import '../../routes.dart';
import '../widget/customDialog.wg.dart';
import 'controller/chitieungoaidong.controller.dart';

class ChitieungoaidongListView extends StatefulWidget {
  const ChitieungoaidongListView({super.key});

  @override
  State<ChitieungoaidongListView> createState() =>
      _ChitieungoaidongListViewState();
}

class _ChitieungoaidongListViewState extends State<ChitieungoaidongListView> {
  final chitieungoaidongListController CTNDlistController =
      Get.put(chitieungoaidongListController());
  @override
  void initState() {
    super.initState();
    setState(() {
      CTNDlistController.fetchData();
      CTNDlistController.search.value = '';
    });
  }

  Future<void> _loadpage() async {
    setState(() {
      CTNDlistController.fetchData();
      CTNDlistController.search.value = '';
    });
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (a, b, c) => const ChitieungoaidongListView(),
            transitionDuration: const Duration(seconds: 5)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CHỈ TIÊU NGOÀI ĐỒNG',
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
                onChanged: (value) => CTNDlistController.search.value = value,
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
                "Số lượng: ${numberCustom10(CTNDlistController.filteredData.length)}",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor),
              );
            }),
            Divider(),
            Obx(() {
              if (CTNDlistController.isLoading.value) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: CTNDlistController.filteredData.length,
                    itemBuilder: (context, index) {
                      final item = CTNDlistController.filteredData[index];
                      return Slidable(
                        key: Key('$item'),
                        // startActionPane: ActionPane(
                        //   motion: const ScrollMotion(),
                        //   children: <Widget>[
                        //     SlidableAction(
                        //       onPressed: (context) async {
                        //         // GDTTlistController.fetchDataById(item.id!);
                        //         // GDTTlistController.showUpdateProductDialog(
                        //         //     item.id!);
                        //       },
                        //       backgroundColor: Colors.blue,
                        //       icon: Icons.edit,
                        //     ),
                        //   ],
                        // ),
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: <Widget>[
                            SlidableAction(
                              onPressed: (context) {
                                ConfirmDialog("XÁC NHẬN",
                                        "Bạn có chắc chắn muốn xóa?", () async {
                                  CTNDlistController.submitDelete(item.id!);
                                  debugPrint(item.id.toString());
                                }, () {})
                                    .show();
                                //GDTTlistController.showConfirmDeleteDialog("${item.gdttTen}");
                              },
                              backgroundColor: Colors.red,
                              icon: Icons.delete,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            child: ListTile(
                              onTap: () {
                                AppPages.routes;
                                Get.to(AppPages.getChiTieuNgoaiDongEdit(),
                                    arguments: item);
                              },
                              leading: Text(
                                "${index + 1}.",
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              title: Text(
                                "${item.giongTen}".toUpperCase(),
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
                              trailing: SizedBox(
                                  height: double.infinity,
                                  child: Icon(
                                    Icons.edit,
                                    color: kPrimaryColor,
                                    size: 25,
                                  )),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }),
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.cyan,
            //       minimumSize: const Size.fromHeight(60)),
            //   onPressed: () {},
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //       Icon(
            //         Icons.add_circle_outline,
            //         size: 30,
            //       ),
            //       SizedBox(
            //         width: 10,
            //       ),
            //       Text(
            //         "Thêm mới".toUpperCase(),
            //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          CTNDlistController.makeNull();
          AppPages.routes;
          Get.to(
            AppPages.getChiTieuNgoaiDongAdd(),
          );
        },
        icon: const Icon(Icons.add_circle_outline),
        label: const Text(
          'Thêm mới',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
